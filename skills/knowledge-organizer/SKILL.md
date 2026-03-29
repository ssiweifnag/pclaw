# knowledge-organizer — 知識庫自動整理技能

**版本：** v1.0  
**日期：** 2026-03-30  
**用途：** 自動整理、分類、標籤、更新 OpenClaw 知識庫  
**用戶：** Panboo（Pclaw 管理者）

---

## 觸發條件

當用戶說：
- 「整理知識庫」
- 「更新知識索引」
- 「檢查知識庫一致性」
- 「自動分類這些檔案」
- 「知識庫進化」

或自動觸發：
- 每週六 10:00 例行整理
- 知識庫寫入後被動整理

---

## 核心邏輯

### 1. 分類邏輯（自動分類引擎）

```
輸入：新檔案 / 筆記 / 文章
流程：
  1. 分析內容關鍵詞
  2. 映射到預設分類
  3. 檢查衝突（多分類歸屬）
  4. 生成分類建議
  5. 用戶確認或自動執行
輸出：
  - 建議存放分類
  - 分類理由
  - 衝突說明（如有）
```

**Panboo 知識庫分類體系：**
```
knowledge/
├── 博士論文/           # 論文研究相關
│   ├── literature/    # 文獻整理
│   ├── methodology/   # 方法論
│   ├── data/         # 數據資料
│   └── drafts/       # 草稿版本
├── 軟體知識庫/         # 軟體工具研究
│   ├── AI_Agent/     # AI Agent 生態
│   ├── IoT/          # IoT 軟體
│   ├── building_sim/ # 建築模擬工具
│   └── dev_tools/    # 開發工具
├── 硬體執事庫/         # 硬體設備資料
│   ├── sensors/      # 感測器
│   ├── controllers/ # 控制器
│   ├── protocols/    # 通訊協定
│   └── HA_integrations/ # Home Assistant
├── 商業策略/           # 商業分析
│   ├── competitors/ # 競爭對手
│   ├── clients/     # 潛在客戶
│   └── proposals/   # 提案
├── news/             # 每日情報
│   ├── ai-tech.md   # AI/科技
│   ├── finance.md   # 財經
│   ├── smart-building.md # 智慧建築
│   └── ...
└── 個人成長/           # 學習與運動
    ├── marathon/    # 馬拉松訓練
    └── reading/     # 閱讀筆記
```

**自動分類規則：**
| 關鍵詞 | 分類 | 範例檔案 |
|--------|------|----------|
| ESP32/LoRa/Sensor | `硬體執事庫/sensors/` | `LoRaWAN_node_v2.md` |
| BEMS/IAQ/節能 | `博士論文/` 或 `商業策略/` | `BEMS_proposal.md` |
| AI Agent/LLM | `軟體知識庫/AI_Agent/` | `claude_usage.md` |
| 競品/報價/SOAL | `商業策略/competitors/` | `SOYAL_price.md` |
| 天氣/頭條/趨勢 | `news/` | `2026-03-30.md` |

---

### 2. 標籤邏輯（自動標籤系統）

```
輸入：檔案內容
流程：
  1. 提取實體（人名/地名/機構名）
  2. 提取技術關鍵詞
  3. 生成標籤候選
  4. 衝突檢測（相似標籤合併）
  5. 寫入檔案標籤區（YAML frontmatter 或最後一行）
輸出：
  - 建議標籤清單
  - 標籤衝突報告
  - 建議更新位置
```

**標籤體系（層次化）：**
```yaml
# 標籤範例（YAML frontmatter）
tags:
  # 領域標籤
  - domain/智慧建築
  - domain/IoT
  - domain/AI_Agent
  
  # 技術標籤
  - tech/ESP32
  - tech/LoRa
  - tech/MQTT
  - tech/Python
  
  # 項目標籤
  - project/博士論文
  - project/BEMS
  - project/HomeAssistant
  
  # 狀態標籤
  - status/待整理
  - status/已驗證
  - status/需更新
```

**標籤衝突規則：**
| 衝突類型 | 處理方式 |
|----------|----------|
| `AI` vs `ai` | 統一小寫：`ai` |
| `IoT` vs `iot` | 統一大寫：`IoT` |
| `智慧建築` vs `Smart Building` | 並存，設定關聯 |
| `ESP32` vs `ESP-32` | 統一：`ESP32` |

---

### 3. 更新邏輯（知識庫版本維護）

```
輸入：現有檔案 / 知識庫索引
流程：
  1. 檢查索引一致性
     - INDEX.md 是否存在
     - 索引是否涵蓋所有檔案
     - orphan 檔案檢測（無索引收錄）
  2. 檢查內容時效性
     - 日期標記是否過期（>30 天未更新）
     - 外部連結是否有效
     - 資訊是否仍然正確
  3. 生成更新建議
     - 需要更新的檔案清單
     - 建議的更新內容
  4. 執行更新（可選）
輸出：
  - 一致性報告
  - 過期檔案清單
  - 更新建議清單
```

**時效性檢查規則：**
| 類型 | 更新頻率 | 超時警告 |
|------|----------|----------|
| `news/` | 每日 | 7 天 |
| `商業策略/competitors/` | 每週 | 30 天 |
| `軟體知識庫/` | 每兩週 | 90 天 |
| `博士論文/` | 每週 | 60 天 |
| `硬體執事庫/` | 每月 | 180 天 |

---

## 互動流程

### 模式 A：被動整理（用戶觸發）
```
用戶：「整理知識庫」
→ 掃描所有 knowledge/ 檔案
→ 執行分類 + 標籤 + 更新檢查
→ 產出整理報告
→ 用戶確認後執行變更
```

### 模式 B：主動整理（自動排程）
```
觸發：每週六 10:00
→ 增量掃描（只檢查過去 7 天變動的檔案）
→ 執行分類 + 標籤檢查
→ 更新 INDEX.md
→ 產出被動整理報告（不自動修改）
→ 通知用戶有興趣的更新
```

### 模式 C：寫入時整理
```
觸發：任何檔案寫入 knowledge/
→ 立即分析內容
→ 自動添加標籤（YAML frontmatter）
→ 檢查是否需要移動到其他分類
→ 通知用戶分類建議
```

---

## 輸出格式

### 整理報告
```markdown
## 📂 知識庫整理報告

### 執行時間
YYYY-MM-DD HH:MM

### 一致性檢查
| 項目 | 狀態 |
|------|------|
| INDEX.md 存在 | ✅/❌ |
| 檔案總數 | X |
| 已索引檔案 | X |
| Orphan 檔案 | X |

### 分類建議
| 檔案 | 建議分類 | 理由 |
|------|----------|------|
| xxx.md | 博士論文/literature/ | 關鍵詞匹配 |

### 標籤更新
| 檔案 | 新增標籤 | 衝突 |
|------|---------|------|
| xxx.md | [AI_Agent, LLM] | 無 |

### 時效性警告
| 檔案 | 最後更新 | 超時天數 |
|------|----------|----------|
| xxx.md | 2026-01-01 | 88 天 |

### 建議行動
1. [行動 1]
2. [行動 2]
```

### INDEX.md 更新範例
```markdown
# 知識庫索引

## 博士論文
- [literature/IAQ_ventilation_review.md](literature/)
- [methodology/BEMS_design.md](methodology/)

## 軟體知識庫
- [AI_Agent/claude_usage.md](AI_Agent/)
- [IoT/mqtt_guide.md](IoT/)

## 硬體執事庫
- [sensors/esp32_setup.md](sensors/)
- [controllers/soyal_config.md](controllers/)

---
最後更新：2026-03-30
自動生成 by knowledge-organizer
```

---

## 設定

```yaml
knowledge_organizer:
  # 分類設定
  classification:
    auto_create_dirs: false  # 不自動建立新分類
    conflict_resolution: "user_decides"  # 衝突時由用戶決定
    
  # 標籤設定
  tagging:
    frontmatter_format: "yaml"  # YAML frontmatter
    auto_tag: true              # 寫入時自動標籤
    tag_conflict_check: true   # 檢查標籤衝突
    
  # 更新設定
  update:
    check_orphans: true        # 檢查孤儿檔案
    check_stale: true          # 檢查過期檔案
    stale_threshold_days: 30   # 過期閾值（天）
    auto_update_index: true    # 自動更新 INDEX.md
    
  # 排程設定
  schedule:
    passive_cleanup: "Sat 10:00"  # 每週被動整理
    active_write: true              # 寫入時主動整理
```

---

## 搭配技能

| 技能 | 用途 |
|------|------|
| `obsidian` | Obsidian Vault 整合 |
| `clawdhub` | 知識庫發布 |
| `clawddocs` | 文件管理 |

---

**版本：** v1.0  
**維護者：** Pclaw  
**最後更新：** 2026-03-30
