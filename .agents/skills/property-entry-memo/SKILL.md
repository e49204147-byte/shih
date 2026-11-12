---
name: property-entry-memo
description: 檢視航港建設基金工程財產新增或增值案件，將掃描決算／驗收／撥付／往返公文轉為 OCR 結構化 Markdown 表格，主動檢核基金支應資格與拆帳清晰度（提示調閱前案或擬具回文），詢問確認母文／併陳文號與必看驗收圖資，協助承辦製單並依個人偏好撰寫簽稿、產出可編輯對照圖底稿與 JPG 圖檔及審核表。
---

# 基金工程財產新增／增值入帳（Skill 1：承辦入帳確認與公文圖表打包）

適用：既有財產增值、新財產增加，以及同案含土地（`104`）、土地改良物（`111`）、動產／機械設備（`308`、`314`）或雜項設備（`405`）的混合案件。AI 提出有來源的建議與主動提醒；承辦人判斷並在產籍系統製作財產單。任何標竿案例的資產類別、分錄、金額或附件號都不是新案的預設答案。

開始時先告知正在使用 `property-entry-memo`。只讀取當次提供或授權可讀的檔案；讀不到的路徑請使用者提供，不掃描其他磁碟，也不憑檔名、舊簽或既有圖宣稱已核對。

## 核心原則：兩階段卡控

1. **第一階段（尚無財產單）**：盤點、核對、教承辦人製單。**不建整理夾、不改檔名、不寫正式簽文、不畫對照圖。**
2. **過渡（承辦人交回財產單 PDF）**：逐筆防呆驗算。
3. **第二階段（財產單無誤＋文號確認）**：整理附件、寫簽、產出總表與圖檔。
4. **改稿模式（已有簽稿）**：先核對全文與附件、指出問題；未要求改稿不覆寫；改稿只用紅字局部替換，未要求修改的段落一字不動。

## 流程與該讀的附錄（做到哪一步，翻哪一份）

| 步驟 | 做什麼 | 必讀附錄 |
| :--- | :--- | :--- |
| 開始前 | 依案型找最接近的標竿案例，打開其總表當格式範本（只學結構，不抄金額或工程名稱） | [references/local-examples.md](references/local-examples.md) |
| 1-1 盤點 | PDF 雙軌讀取（文字型直接取字／掃描型 OCR）、應備文件清單 (1)–(8)、(A)–(C) | [references/checklist.md](references/checklist.md) |
| 1-2 診斷 | 基金支應合規性、港務公司拆帳清晰度、資產定位、未完工程逐碼 `C − D ＝ E` | [references/fund-review.md](references/fund-review.md) |
| 1-3 製單指引 | 動產增加單（方案 A 按場站合併成套）vs. 不動產增減值單；步驟 0–5 製單表＋未完工程對帳表 | [references/form-guide.md](references/form-guide.md) 第一節 |
| 過渡 驗算 | `原價 ± 本次 ＝ 新價`、日期、基金代號、同財編多批驗收 | [references/form-guide.md](references/form-guide.md) 第二節 |
| 2-1 整理附件 | 建 `簽辦附件整理` 夾、檔名五大鐵律、未完工程 Excel 轉 `.jpg` 核對圖 | [references/naming-rules.md](references/naming-rules.md) |
| 2-2 總表 | 單一 `00_案件簽辦與審核總表.md` 五大區塊 | [references/summary-template.md](references/summary-template.md) |
| 2-3 寫簽 | 簽／綜簽型態、國字億萬、去 AI 感、附件標註、差額交代 | [references/writing-style.md](references/writing-style.md) |
| 2-4 對照圖 | 三欄「左對帳／中依據／右入帳」，卡對卡箭頭；先看標竿圖 | [references/diagram-spec.md](references/diagram-spec.md)、[references/diagram-benchmark-S1S3.jpg](references/diagram-benchmark-S1S3.jpg) |
| 完成後 | 詢問是否接著用 `property-entry-audit` 做送簽前三關審核 | — |

## 第一階段固定回覆結構（5 部分，依序）

1. **應備文件 Checklist（✅／❌）**：逐項列 (1)–(8) 及適用的 (A)–(C)，註明已讀來源。財產單一律標「待製單後提供（非當下缺件）」。
2. **已附公文盤點與詢問清單**：列出已附公文（機關、日期、字號、收文號），並詢問：還缺哪些附件？母文（詳來文）是哪件？唯一併陳案件是哪件？簽上還有沒有要特別交代的事？
3. **請承辦人親眼確認的資料**：哪幾份驗收證明書要看驗收合格日與總價是否含營業基金；哪幾張竣工圖／點交照片要看地號、數量、範圍。
4. **基金合規與拆帳診斷**：是否屬公共基礎設施；有疑義時附「建議調閱前案清單」或「致港務公司釐清函草稿」。
5. **產籍系統製單指引表＋未完工程逐碼對帳表**，結尾提示：請承辦人依表製單並回覆文號，收到財產單 PDF 後再進入第二階段。

## 交付前最終核對

簽稿、財產單 PDF、未完工程核對圖、三欄對照圖與 `00_案件簽辦與審核總表.md` 的標的、日期、國字億萬金額與 `附件1~N` 編號必須完全一致。

## 給人看的導讀

人類導讀手冊與總流程圖放在 Obsidian：`C:\2026aiagents\公務類指令\00_財產登帳雙Skill導讀與標準作業總流程圖.md`（AI 執行時不必讀）。本檔為唯一正本，Obsidian 只放連結。拆檔前的完整舊版已移至 `C:\Users\cwshih\.codex\skills\_backups\property-entry-memo_SKILL_1151112.md`（僅供比對，執行時不讀）。

---

## 更新紀錄

- 1151112：主檔瘦身為流程骨架，細節依步驟拆至 `references/`（checklist、fund-review、form-guide、naming-rules、summary-template、writing-style；出圖基本規格併入 diagram-spec）。內容未刪減，只搬位置。
- 1151111：新增三欄對照圖規格 `references/diagram-spec.md` 與標竿圖；SKILL.md 定為唯一正本，Obsidian 改為連結頁；修正「四大→五大」標竿／檔名鐵律數量。
- 1151110：第一階段步驟 0 新增動產增加單（方案 A 按場站合併成套）與不動產增減值單分工。
- 1151105 前：PDF 雙軌讀取、兩階段卡控、附件命名鐵律、未完工程 Excel 轉 .jpg 核對圖。
