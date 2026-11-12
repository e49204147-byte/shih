param(
    [string]$Keyword = "",
    [string]$Dept = "",
    [string]$Title = "",
    [string]$SourceDir = ""
)

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

if (-not $SourceDir) {
    # E:\下載\通訊錄 encoded safely in Unicode codepoints
    $SourceDir = "E:\$([char]0x4E0B)$([char]0x8F09)\$([char]0x901A)$([char]0x8A0A)$([char]0x9304)"
}

$latestXlsx = Get-ChildItem -Path $SourceDir -Filter "*.xlsx" |
    Where-Object { $_.Name -notmatch "^~\$" } |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 1

if (-not $latestXlsx) {
    Write-Error "No .xlsx file found in $SourceDir"
    exit 1
}

$baseName = $latestXlsx.BaseName
$csvSheet1 = Join-Path $SourceDir "$baseName-sheet1.csv"
$csvSheet2 = Join-Path $SourceDir "$baseName-sheet2.csv"
$flatCsv   = Join-Path $SourceDir "$baseName-flat.csv"

if (-not (Test-Path $flatCsv) -or ($latestXlsx.LastWriteTime -gt (Get-Item $flatCsv).LastWriteTime)) {
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $false
    $excel.DisplayAlerts = $false
    $wb = $excel.Workbooks.Open($latestXlsx.FullName)
    
    $s1 = $wb.Sheets.Item(1)
    $s1.Activate()
    $wb.SaveAs($csvSheet1, 62)

    $s2 = $wb.Sheets.Item(2)
    $s2.Activate()
    $wb.SaveAs($csvSheet2, 62)

    $wb.Close($false)
    $excel.Quit()
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null

    $headers = 1..30 | ForEach-Object { "C$_" }
    $records = New-Object System.Collections.Generic.List[PSObject]

    function Parse-GridCsv($csvPath, $sheetName, $starts) {
        $rows = Import-Csv -Path $csvPath -Header $headers -Encoding UTF8
        foreach ($st in $starts) {
            $cTitle = "C$st"
            $cName  = "C$($st + 1)"
            $cExt   = "C$($st + 2)"
            $currentDept = $sheetName

            foreach ($r in $rows) {
                $t = ($r.$cTitle -replace "\r?\n", " ").Trim()
                $n = ($r.$cName  -replace "\r?\n", " ").Trim()
                $e = ($r.$cExt   -replace "\r?\n", " ").Trim()

                if (-not $t -and -not $n -and -not $e) { continue }
                if ($t.Length -gt 20) { continue }

                # Section header detection: when name and ext are both empty
                if (-not $n -and -not $e -and $t.Length -ge 2) {
                    $currentDept = $t
                    continue
                }

                $records.Add([PSCustomObject]@{
                    Version = $baseName
                    Sheet   = $sheetName
                    Dept    = $currentDept
                    Title   = $t
                    Name    = $n
                    Ext     = $e
                })
            }
        }
    }

    Parse-GridCsv -csvPath $csvSheet1 -sheetName "Sheet1-HQ" -starts @(1,4,7,10,13,16,19,22)
    Parse-GridCsv -csvPath $csvSheet2 -sheetName "Sheet2-Center" -starts @(1,4,7,10,13,16,19,22,25)

    $records | Export-Csv -Path $flatCsv -NoTypeInformation -Encoding UTF8
}

$data = Import-Csv -Path $flatCsv -Encoding UTF8

if ($Dept) {
    $data = $data | Where-Object { $_.Dept -match $Dept -or $_.Sheet -match $Dept }
}
if ($Title) {
    $data = $data | Where-Object { $_.Title -match $Title }
}
if ($Keyword) {
    $data = $data | Where-Object {
        $_.Name -match $Keyword -or
        $_.Dept -match $Keyword -or
        $_.Title -match $Keyword -or
        $_.Ext -match $Keyword
    }
}

$data | Format-Table -AutoSize Sheet, Dept, Title, Name, Ext | Out-String -Width 4096
