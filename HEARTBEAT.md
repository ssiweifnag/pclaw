# HEARTBEAT.md

# Keep this file empty (or with comments only) to skip heartbeat API calls.

# Add tasks below when you want the agent to check something periodically.

---

## ⏰ 每日心跳排程（凌晨優先，任務集中於 02:00-05:00）

| 時間 | 任務 | 回報內容 |
|------|------|----------|
| **02:00** | 🤖 AI 新聞 + 大模型動態 | ai-news-zh 自動採集 → 備用：tavily-search, brave-search |
| **03:00** | 🏛️ 建築/室內設計 | Dezeen/ArchDaily/WOHA |
| **04:00** | 🎮 遊戲/科技趨勢 | TechCrunch/Gamasutra |
| **05:00** | 📰 新聞早報 + 天氣 | 天氣 + 頭條新聞 |
| 07:00 | 💹 每日財經分析 | 匯率 + 全球股市 + 期貨 + AI科技股 + 台灣通膨 |
| 08:00 | 📊 半天進度回報 | 上午摘要 + 新發現 |
| 09:00 | 🏠 Home Assistant 室內環境 | CO₂/溫度/電力回報 |
| 11:00 | 🏠 IoT/LoRa 生態 | 國外案例/ LorawanTW |
| 14:00 | 🔧 系統健康檢查 | 技能版本/知識庫/OpenClaw doctor |
| 16:00 | 🧠 記憶整理 | 今日學習摘要 |
| 18:00 | 🍜 美食/旅遊探索 | 食力/上下游/背包客棧 |
| 19:00 | 🏃 健康與運動 | 康健/運動筆記/馬拉松 |
| 20:00 | 🏠 Home Assistant 晚間摘要 | CO₂峰值/電力/溫度統計 |
| 21:00 | 📝 個人研究/論文 | 文獻/AI Agent |
| 21:30 | 🦞 Moltbook 探索 | 瀏覽/互動/搜尋 |
| 22:00+ | 🌙 夜間摘要 | 晚間重要資訊回顧 |
| 23:00+ | HEARTBEAT_OK | - |

---

## 📋 每週主題（每日輪換）

| 星期 | 主題 |
|------|------|
| 週一 | 研究：文獻搜尋 + 財經：ETF/比特幣/綠能 |
| 週二 | 報價：SOYAL/茂旭 + 博士論文進度 |
| 週三 | 商業：潛在客戶/競爭對手 + 藝術建築 |
| 週四 | 科技：AI 趨勢/开源專案 + 攝影創作 |
| 週五 | MiroFish 知識庫分析 + 記憶整理 |
| 週六 | 遊戲：Steam/獨立遊戲 + 運動健身 |
| 週日 | 旅遊：景點/美食 + 休息 |

---

## 🔄 每週 MiroFish 分析（週五）

每週五自動執行：
1. 匯總 OpenClaw 知識庫 (AGENTS.md, HEARTBEAT.md, MEMORY.md, SOUL.md)
2. 調用 MiroFish API 分析
3. 將分析結果存到 Notion/知識庫

---

## 📰 新聞知識庫

每日追蹤的新聞會存入 `knowledge/news/`：
- `INDEX.md` - 總索引與來源列表
- `ai-tech.md` - AI/科技新聞（每日 10:00）
- `finance.md` - 財經趨勢（每日 07:00）
- `smart-building.md` - 智慧建築/ESG（每日 08:00）
- 其他分類：headlines / gaming / iot / architecture / photography / food-travel / health / evening

## 📚 期刊 RSS 追蹤（每週）
- 每週一 09:00：Energy and Buildings, Building and Environment, Applied Energy
- 每週三 09:00：Sustainable Cities and Society, Journal of Building Engineering, Indoor Air
- 每週五 09:00：IEEE IoT Journal, Energy Policy, Journal of Cleaner Production

## 🔍 Google Scholar 提醒（15+1 個關鍵字）

### 額外研究主題（2026-03-23 新增）
- IoT 野生鳥獸對策：wildlife detection IoT, wild boar damage prevention, LPWAN agriculture
- 建築能源：building energy + efficiency + retrofit
- IAQ：indoor air quality + ventilation + CO2
- BEMS：BEMS + AI + machine learning
- 人員偵測：occupancy detection + building + sensor
- GEBs：grid-interactive + GEB + demand response
- LoRa：LoRa + building + monitoring
- 邊緣 AI：edge AI + energy + prediction
- 多智能體：multi-agent + research + automation
- 政策：building retrofit + policy + subsidy
- 台灣：Taiwan + energy policy + building

## 🔄 每日技能疊代檢查（16:30）

每個平日 16:30 自動執行：
1. 檢查已安裝 Skills 是否有更新版本
2. 執行 `clawhub update --all --force`（跳過仍被限流的）
3. 記錄成功升級的 Skills 到 `memory/YYYY-MM-DD.md`
4. 評估是否有新的 Skills 符合工作流需求

**原則：跑順為主，不強迫升級。**

---

## ✅ 推薦技能清單（同名重複時優先使用）

> 詳細分析：見 `knowledge/軟體知識庫/Skill-Duplicate-Analysis.md`

### 🔍 搜尋引擎
| 優先使用 | 備選 |
|---------|------|
| **brave-search** | duckduckgo-search（免費）|
| **tavily-search** | exa-web-search-free（代碼/公司研究）|

### 💻 程式開發
| 優先使用 | 互補 |
|---------|------|
| **coding-agent**（委派 Codex/Claude Code）| code（工作流）, coding（風格記憶）|

### 🧠 記憶管理
| 優先使用 | 維護 |
|---------|------|
| **elite-longterm-memory**（6層架構）| memory-hygiene（清理工具）|

### 📚 Git 版本控制
| 優先使用 | 停用 |
|---------|------|
| **git** | git-commit, git-essentials |

### 🕷️ 網頁爬蟲
| 優先使用 | 互補 |
|---------|------|
| **firecrawl** | scrapling-official（進階 Python）|

### 🐦 Twitter/X
| 優先使用 | 停用 |
|---------|------|
| **xurl**（npm-global）| xurl（openclaw folder）|

### 🎙️ 語音轉文字
| 優先使用 | 備選 |
|---------|------|
| **openai-whisper**（本地，隱私）| openai-whisper-api（雲端，精確）|

### 📗 Excel/試算表
| 保留 | 原因 |
|------|------|
| **excel-xlsx**（本地文件）| + **microsoft-excel**（雲端/OneDrive）| 用途不同，都保留 |

### 📰 AI 新聞
| 優先使用 | 備選 |
|---------|------|
| **news-summary** | - |

### 🔍 SEO
| 優先使用 |
|---------|
| **seo-audit** |

## 📱 社群網路文章追蹤（每週三 15:00）

每週三 15:00 自動執行：
1. 搜尋 X/Twitter、LinkedIn、Telegram 熱門文章
2. 追蹤關鍵字：智慧建築、AI Agent、BEMS、IoT、LoRa
3. 整理有意義的內容存入 `knowledge/news/social-YYYY-MM-DD.md`
4. 重點帳號/專案可考慮追蹤並存入 TOOLS.md

**使用的工具：**
- `agent-reach` Skill（已安裝）用於 Twitter/LinkedIn 搜尋
- `Tavily Search`（已安裝）用於全網搜尋

---

## 📚 知識庫寫入政策（重要）

### 每次心跳後必須執行的動作

| 任務類型 | 存入位置 |
|---------|---------|
| 新聞/文章分享 | `knowledge/news/YYYY-MM-DD.md` |
| 科研工具研究 | `knowledge/軟體知識庫/` 或 `knowledge/硬體執事庫/` |
| 商業策略更新 | `knowledge/商業策略.md` |
| HA 監測數據 | `knowledge/硬體執事庫/HA_XXXXXXXX.md` |
| 每日摘要 | `memory/YYYY-MM-DD.md` |

### 寫入原則

1. **文章/研究** → 第一時間存入對應分類知識庫
2. **天氣/新聞** → 存入 `knowledge/news/`
3. **HA 監測** → 存入 `knowledge/硬體執事庫/`
4. **重要決定** → 同時存入 `MEMORY.md`
5. **每日結束** → 整理並更新 `memory/YYYY-MM-DD.md`

### 檔案命名規範

| 類型 | 命名格式 |
|------|---------|
| 每日新聞 | `knowledge/news/YYYY-MM-DD.md` |
| 每日記憶 | `memory/YYYY-MM-DD.md` |
| HA 分析 | `knowledge/硬體執事庫/HA_XXXXXXXX.md` |
| 文章 | `knowledge/軟體知識庫/標題.md` |

---

## 📚 研究關鍵字（每日追蹤）

### 智慧建築與能源
- "smart building" + "energy efficiency"
- "demand control ventilation" + "IAQ"
- "ASHRAE 90.1" + "Taiwan"
- "BEMS" + "既有建築"
- "室內空氣品質" + "通風"

### AI 與技術
- llm.c：Karpathy 簡單 LLM 訓練
- MLX：Apple Silicon 微調/量化
- OpenClaw：提示詞優化/proMPT 工程
- AI Agent：ClawTeam/多智能體協作

### IoT 與硬體
- ESP32/LoRaWAN/TinyML
- RS485/投入式液位計/超聲波
- INA228 電力監控

---

## 🎓 博士論文核心研究

### 既有建築能源檢測
| 技術 | 應用 | 效益 |
|------|------|------|
| 智慧電表 | 即時用電量測 | 5-10% 節能 |
| 子回路監測 | 區域用電分析 | 15-20% 節能 |
| BEMS | 中央監控優化 | 20-35% 節能 |
| AI 預測控制 | 負載預測/需求反應 | 25-40% 節能 |

### 人員檢測（佔員偵測）
| 方法 | 原理 | 準確度 |
|------|------|--------|
| CO₂ 質量平衡 | 濃度變化推估人數 | 中 |
| PIR 紅外線 | 人體熱輻射偵測 | 中高 |
| Wi-Fi/BLE | 設備訊號偵測 | 高 |
| 視覺影像 | AI 影像辨識 | 高 |

### 環境/空氣品質監測
| 參數 | 感測器 | 標準 |
|------|--------|------|
| CO₂ | MH-Z19B | ASHRAE 62.1 |
| PM2.5 | PMSA003I | EPA 標準 |
| 溫濕度 | DHT22/SHT31 | ASHRAE 55 |
| VOC | SGP30 | - |
| 甲醛 | ZE08C-CH2O | - |

---

## 🔌 設備報價追蹤

- SOYAL 門禁設備
- 茂旭機電設備
- 智慧建築感測器/開關/網關
- Zigbee/Z-Wave/Matter 設備

---

## 🎯 每月檢查

- 研究進度整體回顧
- 設備報價統計
- 科技趨勢月報

---

## 🔄 OpenClaw ↔ Obsidian 自動化橋接

### 同步腳本
`/Users/pc/.openclaw/workspace/scripts/bridge_to_obsidian.sh`

### 自動執行
- 每日 **21:00** 自動同步（cron job 已設定）

### 同步內容
- Desktop 檔案索引 → Obsidian Desktop_Index.md
- 每日新聞摘要 → Obsidian News_Summary.md  
- 工具研究精華 → Obsidian Tools_Research.md

### Obsidian Vault
`01_學術研究/OpenClaw_Knowledge/`
