# MiniMax Skills 整合分析

**來源：** https://github.com/MiniMax-AI/skills  
**星數：** 7,538 ⭐  
**更新：** 2026-03-29  
**分析日期：** 2026-03-30

---

## 📦 可用 Skills 清單

| 技能 | 功能 | 與 Pclaw 的相關性 |
|------|------|-------------------|
| `minimax-docx` | Word 文件處理 | ⭐⭐⭐ 論文寫作 |
| `minimax-pdf` | PDF 讀取/處理 | ⭐⭐⭐ 文獻閱讀 |
| `minimax-xlsx` | Excel 試算表 | ⭐⭐⭐ 數據分析 |
| `pptx-generator` | PPT 生成 | ⭐⭐⭐ 學術簡報 |
| `vision-analysis` | 視覺分析 | ⭐⭐ 建築圖片分析 |
| `frontend-dev` | 前端開發 | ⭐ Web 工具開發 |
| `flutter-dev` | Flutter 開發 | ⭐ 行動 App |
| `react-native-dev` | React Native | ⭐ 行動 App |
| `android-native-dev` | Android 原生 | ⭐ 行動 App |
| `ios-application-dev` | iOS 應用 | ⭐ 行動 App |
| `fullstack-dev` | 全端開發 | ⭐ Web 服務 |
| `shader-dev` | 着色器開發 | ⭐ 視覺效果 |
| `gif-sticker-maker` | GIF 製作 | ⭐ 簡報素材 |

---

## 🎯 高價值整合（博士論文 + 智慧建築）

### 1. minimax-docx ⭐⭐⭐

**功能：**
- 讀取/創建/編輯 Word 文件
- 格式轉換（DOCX ↔ Markdown）
- 模板應用

**Pclaw 整合方式：**
```bash
# 論文章節管理
minimax-docx merge chapter1.docx chapter2.docx -o thesis_draft.docx

# APA 格式轉換
minimax-docx convert thesis.md -f apa -o thesis_apa.docx

# 追蹤修訂
minimax-docx track-changes thesis_v8.docx
```

**何時觸發：**
- 提到「論文」、「Word」、「文件」
- 需要生成報告、正式文件

---

### 2. minimax-pdf ⭐⭐⭐

**功能：**
- PDF 文字提取
- 表格轉換
- 頁面裁切/合併
- OCR 識別

**Pclaw 整合方式：**
```bash
# 從 PDF 提取文獻
minimax-pdf extract references paper.pdf -o refs.txt

# 表格轉換
minimax-pdf table-extract data.pdf -o table.csv

# 多頁合併
minimax-pdf merge chap1.pdf chap2.pdf -o thesis.pdf
```

**何時觸發：**
- 收到 PDF 檔案
- 需要提取文獻內容
- 文獻回顧章節

---

### 3. minimax-xlsx ⭐⭐⭐

**功能：**
- 讀取/創建 Excel
- 數據分析
- 圖表生成
- 公式計算

**Pclaw 整合方式：**
```bash
# CO₂ 數據分析
minimax-xlsx analyze co2_data.xlsx -o report.csv

# SenseLab 數據整理
minimax-xlsx process sensor_data.csv --stat mean,std -o stats.xlsx

# 能耗圖表
minimax-xlsx chart energy.csv -t bar -o energy_chart.png
```

**何時觸發：**
- 提到「數據」、「Excel」、「分析」
- SenseLab 監測數據出爐
- 每週數據報告

---

### 4. pptx-generator ⭐⭐⭐

**功能：**
- 生成 PowerPoint 簡報
- 模板應用
- 圖表嵌入

**Pclaw 整合方式：**
```bash
# 論文答辯簡報
pptx-generator template defense.pptx --title "博士論文答辯"

# 每週進度報告
pptx-generator weekly-progress --data week14.csv -o progress.pptx

# 會議簡報
pptx-generator meeting --agenda "逐字稿" -o meeting.pptx
```

**何時觸發：**
- 提到「簡報」、「PPT」、「答辯」
- 會議準備
- 研究進度報告

---

### 5. vision-analysis ⭐⭐

**功能：**
- 建築圖片分析
- 室內環境辨識
- 能耗視覺化

**Pclaw 整合方式：**
```bash
# 建築平面圖分析
vision-analysis floorplan.jpg --identify zones

# IAQ 視覺化
vision-analysis lab_photo.jpg --estimate IAQ

# 能耗異常偵測
vision-analysis thermal.jpg --detect hotspots
```

**何時觸發：**
- 上傳建築/室內照片
- 需要視覺化 SenseLab 數據

---

## 🔧 HEARTBEAT.md 建議新增功能

### 現有心跳時間不變，新增「空檔觸發」

| 空檔時段 | Pclaw 任務 | 說明 |
|----------|------------|------|
| 10:00 | 📊 MiniMax xlsx 分析 | 上週 SenseLab 數據分析 |
| 10:30 | 📝 MiniMax docx 生成 | 論文章節草稿生成 |
| 15:00 | 📄 MiniMax PDF 處理 | 每日新文獻處理 |
| 15:30 | 📊 PPT 生成 | 會議/答辯簡報準備 |

---

## 📋 HEARTBEAT.md 建議更新內容

```markdown
## 🔧 MiniMax Skills 整合（有空檔時執行）

### 10:00 - 📊 SenseLab 數據分析
minimax-xlsx analyze data/ha-sensor-logs/latest.csv --stat mean,std,max,min -o reports/weekly.xlsx

### 10:30 - 📝 論文草稿生成
minimax-docx draft chapter4.md --template apa -o thesis_chapter4.docx

### 15:00 - 📄 PDF 文獻處理
minimax-pdf extract ~/Downloads/*.pdf --keywords "IAQ,ventilation,BEMS" -o literature/

### 15:30 - 📊 PPT 生成
pptx-generator progress-report --data week14.csv -o presentations/week14.pptx
```

---

## 🚀 安裝方式

```bash
# 克隆 MiniMax Skills
git clone https://github.com/MiniMax-AI/skills.git ~/minimax-skills

# 安裝需要的技能
cd ~/minimax-skills/skills
npm install minimax-docx minimax-pdf minimax-xlsx pptx-generator

# 設定 PATH
export PATH="$HOME/minimax-skills/skills:$PATH"
```

---

## 🔗 與現有 Pclaw 功能的互補

| 現有 Pclaw 功能 | MiniMax Skill 互補 |
|-----------------|-------------------|
| 論文潤飾 (SOUL.md) | minimax-docx 格式處理 |
| 文獻搜尋 (Zotero) | minimax-pdf 內容提取 |
| HA 數據分析 | minimax-xlsx 數據處理 |
| 簡報生成 (PPT) | pptx-generator 自動化 |

---

## 📝 待辦事項

- [ ] 評估每個 Skill 的準確性
- [ ] 測試 minimax-xlsx 與 SenseLab 數據格式相容性
- [ ] 建立 Pclaw 專用的 prompt 模板
- [ ] 更新 HEARTBEAT.md 加入有空檔時的 MiniMax 任務

---

**License:** MIT  
**最後更新：** 2026-03-30
