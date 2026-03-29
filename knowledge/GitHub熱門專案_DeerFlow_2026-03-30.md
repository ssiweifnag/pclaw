# DeerFlow（字節跳動 Multi-Agent）研究報告

**更新日期：** 2026-03-30
**研究來源：** GitHub, Official Website (deerflow.tech)
** Stars：** 52,449 ⭐（2026年3月排名第1熱門專案）

---

## 1. 專案概覽

| 項目 | 內容 |
|------|------|
| 名稱 | DeerFlow（Deep Research Flow） |
| 開發者 | ByteDance（字節跳動） |
| GitHub | https://github.com/bytedance/deer-flow |
| 官方網站 | https://deerflow.tech |
| 程式語言 | Python + Node.js |
| Stars | 52,449 ⭐ |
| 主題 | 超級代理馬車（SuperAgent Harness），用於深度研究與程式碼生成 |

---

## 2. 核心架構

DeerFlow 是一個開源的 **long-horizon SuperAgent harness**，其核心特點：

### 2.1 協調引擎（Coordinator）
- 接收用戶任務
- 將任務分解為子任務
- 調度 sub-agents、memory、tools、skills

### 2.2 核心元件

| 元件 | 功能說明 |
|------|----------|
| **Sub-agents** | 多個專業代理分工（研究、程式碼、創作等） |
| **Memory** | 跨對話記憶管理，長期知識積累 |
| **Sandboxes** | 隔離執行環境，安全運行代碼 |
| **Tools** | 擴展工具集（搜索、計算、代碼執行等） |
| **Skills** | 可插拔技能系統，擴展能力邊界 |
| **Message Gateway** | 訊息路由與代理間通信 |

### 2.3 任務執行流程
```
用戶輸入 → Coordinator 接收
    ↓ 任務分解
子任務1（Research Agent）→ 搜索文獻、網頁
子任務2（Coder Agent）→ 執行代碼、數據處理
子任務3（Creator Agent）→ 生成報告、PPT
    ↓ 結果整合
Memory 存儲 → 最終輸出
```

---

## 3. 與 OpenClaw 的整合價值

### 3.1 借鑒點
1. **多代理協調機制**：借鑒 DeerFlow 的 Coordinator 設計，強化 Pclaw 的 subagent 委派策略
2. **Sandbox 隔離執行**：為研究團隊提供安全的代碼執行環境
3. **Memory 分層管理**：短期記憶（對話）→ 長期記憶（文件）→ 知識庫

### 3.2 整合建議
在 `skills/pclaw-research-team/SKILL.md` 中加入 DeerFlow 協調層：
- 任務分類器（研究 / 程式碼 / 創作）
- 自動 subagent 委派
- 結果彙整與去重

---

## 4. 技術亮點

1. **版本 2.0 重大更新**（2026年2月發布）
   - 完全重寫，與 v1 無共享代碼
   - 支持 Doubao-Seed-Coder 2.0 和 Kimi 2.5
   - 強化多代理協作能力

2. **實際演示**
   - 官方網站提供真實 Demo 可體驗
   - 涵蓋研究報告生成、代碼開發、創意內容創作

3. **開源生態**
   - 社群維護的 awesome-deerflow 列表
   - 多語言支持（英文、中文、法文、俄文 README）

---

## 5. 對博士研究的應用場景

| 研究場景 | DeerFlow 對應能力 |
|----------|-------------------|
| 文獻回顧 | Research Agent 自動化搜索 + 整理 |
| 數據分析 | Coder Agent 執行 Python/R 統計分析 |
| 論文寫作 | Creator Agent 輔助章節生成 |
| 跨領域對比 | 多代理協作，整合不同來源資訊 |

---

## 6. 結論

DeerFlow 是當前最熱門的開源 Multi-Agent 框架之一（⭐52k），其核心價值在於：
- **系統化的代理協調**而非簡單串聯
- **可擴展的技能架構**
- **開箱即用的生產級方案**

建議 Pclaw 研究團隊技能吸收其協調層設計，提升 subagent 委派的智能化程度。
