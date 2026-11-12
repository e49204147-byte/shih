---
name: shutdown
description: 收工技能。用於對話結束前，將工作成果整理並更新至 Obsidian 筆記，隨後自動 commit 並 push 到 GitHub。
---

# 收工技能 (Shutdown/Handoff Runbook)

本技能的本質是 **「寫」**，會修改工作筆記並推送到 GitHub。當使用者輸入以下觸發詞時，請執行此技能：
* **觸發詞**：`收工`、`下班`、`同步`、`換電腦繼續做`、`shutdown`

### 執行步驟：

1. **盤點今日工作成果**：
   * 回顧本次會話中所有完成的檔案修改、編寫的程式碼，以及測試驗證的狀況。

2. **更新 Obsidian 駕駛艙與工作筆記**：
   * 修改 [公務測試/handoff.md](file:///C:/2026aiagents/公務測試/handoff.md) 檔案，記錄：
     *   **本次完成進度**（今天做了什麼）
     *   **下次待辦事項**（下一步接續的任務）
     *   **備註與提示**（提醒自己或別的 Agent 的事項）
   * 根據今天的變更，適度更新根目錄下的專案藍圖 [agents.md](file:///C:/2026aiagents/agents.md)。

3. **自動同步至 GitHub 雲端**：
   * 在本機執行以下 Git 指令來備份與推送到 GitHub 私人倉庫：
     * `git add .`
     * `git commit -m "Handoff: 整理今日進度並撰寫交接報告"`
     * `git push`

4. **完成確認與道別**：
   * 向使用者回報：
     * 📁 **已更新的 Obsidian 筆記檔案**。
     * ☁️ **GitHub 推送狀態**（確認已經 Push 成功）。
   * 提醒使用者下次開工時只需打「開工」即可繼續，最後祝使用者下班愉快！
