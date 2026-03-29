# 🦞 Pclaw 設定指南 v3.0

_基於 OpenClaw + Panboo 個人化的 AI Agent_
_參考：Qclaw（極速開發框架）、Desktop-Claw（桌面悬浮球）、Multi-Agent_

---

## 什麼是 Pclaw？

**Pclaw = Panboo's Personalized OpenClaw**

以 OpenClaw 為本體，結合：
- Qclaw 的**極速啟動**理念
- Desktop-Claw 的**桌面悬浮球**概念
- 強化**本地檔處理**能力
- **持久化 Context** 記憶系統

變成「**一觸即醒、無處不在**」的個人 AI 助理。

---

## 核心定位 🏷️

```
🦞 Pclaw = 科研幫手 × 建築智能 × 每日情報士 × 論文利器 × 桌面AI小夥伴
```

| 領域 | 擅長任務 |
|------|----------|
| 📚 博士研究 | 文獻回顧、論文潤飾、數據分析、APA核查 |
| 🏢 智慧建築 | BEMS、IAQ、節能方案、商業策略 |
| 📰 每日情報 | AI 新聞、建築趨勢、科技動態 |
| 🔧 系統管理 | OpenClaw 維護、技能疊代、自動化 |
| 📱 跨設備 | 手機/桌面 無縫喚醒 |

---

## 🚀 v3.0 新增：桌面整合（參考 Desktop-Claw）

### 1. Mac 桌面快捷啟動

#### 方式一：終端機 Alias（最簡）
```bash
# 加入 ~/.zshrc
alias p="openclaw"

# 使用：輸入 p 即可喚醒
```

#### 方式二：Mac 快捷鍵（推薦）
```bash
# 設定方式：
# 系統偏好設定 → 鍵盤 → 快捷鍵 → 應用程式
# 新增捷徑 → openclaw
```

#### 方式三：Raycast / Alfred（極速）
```bash
# Raycast:
# 安裝後 → 設定 → Extensions → Shell Commands
# command: openclaw
# keyword: p

# Alfred:
# Features → Terminal → 設定為 openclaw
# keyword: p
```

#### 方式四：桌面快捷方式
```bash
# 在桌面建立 alias script
open ~/.local/share/applications/pclaw.desktop
```

### 2. 悬浮球概念（Desktop-Claw 啟發）

借鑒 Desktop-Claw 的「不干擾、隨時喚起」理念：

| 功能 | 說明 | 狀態 |
|------|------|------|
| 後台運行 | 保持 Telegram 接收 | ✅ 已設定 |
| 快速喚醒 | 輸入 p 或快捷鍵 | ✅ 可啟用 |
| 極簡介面 | 只顯示對話，不占空間 | ✅ 即有此特性 |
| 本地檔讀取 | 直接處理桌面/下載檔案 | ✅ 已有 tools |

### 3. 本地檔優先處理

參考 Qclaw 的本地檔處理能力：

```bash
# 自動識別常用路徑
~/Desktop/          # 桌面檔案
~/Downloads/         # 下載檔案  
~/Documents/         # 文件
~/Library/CloudStorage/  # Obsidian Vault

# Pclaw 自動優先讀取這些位置
```

---

## ⚡ v3.0 新增：極速啟動（參考 Qclaw）

### Qclaw 的核心理念：「定義任務 + 建立規則」

Pclaw 映射：

| Qclaw 開發框架 | Pclaw 實現 |
|----------------|-------------|
| 極速啟動 | `p` alias 一鍵喚醒 |
| 角色自動演化 | Subagent 自動分工 |
| 檔交接 | workspace 共享 |
| 交叉審核 | 主 Agent 整合 |

### 啟動速度對比

| 方式 | 喚醒時間 | 適用場景 |
|------|----------|----------|
| Telegram | ~3秒 | 隨手問、手機 |
| Terminal `p` | ~1秒 | 桌面、深度任務 |
| Raycast `p` | <0.5秒 | 極速喚醒 |

### 一鍵部署腳本

```bash
#!/bin/bash
# pclaw-install.sh — 一鍵設定 Pclaw

echo "🦞 安裝 Pclaw..."

# 1. 複製設定檔
cp IDENTITY.md ~/.openclaw/workspace/
cp USER.md ~/.openclaw/workspace/
cp SOUL.md ~/.openclaw/workspace/
cp HEARTBEAT.md ~/.openclaw/workspace/

# 2. 設定 Alias
echo "alias p='openclaw'" >> ~/.zshrc

# 3. 建立記憶目錄
mkdir -p ~/.openclaw/workspace/memory/

echo "✅ Pclaw 安裝完成！輸入 'p' 喚醒"
```

---

## 🧠 v3.0 強化：持久化 Context

### 對話自動歸檔（Desktop-Claw 啟發）

| 歸檔時機 | 寫入位置 |
|----------|----------|
| 每日結束 | `memory/YYYY-MM-DD.md` |
| 專案完成 | `knowledge/專案名/` |
| 重要發現 | `MEMORY.md` + 當日 memory |

### Context 內化（Qclaw 啟發）

讓 Pclaw 越用越懂你：

1. **每次對話結束**：自動摘要存入 MEMORY.md
2. **偏好學習**：記錄你的回饋（喜歡/不喜歡）
3. **專案連續性**：跨 session 記住進行中的任務

### 記憶觸發關鍵字

```
當你說：         → Pclaw 自動召回：
─────────────────────────────────
「我的論文」      → MEMORY.md 中的論文專案
「上次說的」      → 最近 memory/ 中的記錄
「建築趨勢」      → knowledge/建築/ 最新資訊
「文獻」          → 博士論文/ 相關檔案
```

---

## 📁 完整檔案結構 v3.0

```
~/.openclaw/workspace/
├── IDENTITY.md              ← 🦞 Pclaw 身份
├── USER.md                  ← 👤 Primary 用戶（Panboo）
├── SOUL.md                  ← 🎭 AI 個性
├── HEARTBEAT.md             ← ⚡ 自動化任務
├── MEMORY.md                ← 🧠 長期記憶
├── PCLAW_SETUP.md           ← 📖 本指南
│
├── memory/                  ← 📅 每日日誌
│   ├── 2026-03-30.md
│   └── 2026-03-29.md
│
├── knowledge/               ← 📚 結構化知識庫
│   ├── 博士論文/
│   ├── 軟體知識庫/
│   ├── 硬體執事庫/
│   └── news/
│
├── skills/                 ← 🛠️ 自訂技能包
│   ├── paper-research/
│   ├── bemis-analysis/
│   ├── daily-intel/
│   └── ha-monitor/
│
├── scripts/                 ← 🔧 自動化腳本
│   ├── bridge_to_obsidian.sh
│   └── pclaw-install.sh    ← ⚡ 一鍵安裝（新增）
│
└── users/                   ← 👥 多用戶設定
    ├── _family/
    └── _guest/
```

---

## 快速啟動對照

| 場景 | 喚醒方式 | 時間 |
|------|----------|------|
| 📱 手機 | Telegram 發訊息 | ~3秒 |
| 💻 桌面 | 終端機 `p` | ~1秒 |
| ⌨️ 極速 | Raycast `p` | <0.5秒 |

---

## 自訂技能（可擴展）

### 現有技能
| 技能 | 用途 |
|------|------|
| `paper-research` | 論文文獻調研 |
| `bemis-analysis` | BEMS 系統分析 |
| `daily-intel` | 每日情報收集 |
| `ha-monitor` | HA 室內環境監控 |

### 新增技能
```bash
# 在 skills/ 建立新資料夾
mkdir -p skills/你的技能名
# 寫入 SKILL.md 即可
```

---

## v3.0 vs v2.0 差異

| 功能 | v2.0 | v3.0 |
|------|-------|------|
| 桌面啟動 | ⚠️ 概念 | ✅ 完整方案 |
| 極速喚醒 | ❌ | ✅ Raycast/Alfred |
| 本地檔處理 | 基礎 | ✅ 優先路徑 |
| Context 內化 | 概念 | ✅ 自動摘要 |
| 一鍵部署 | ❌ | ✅ install.sh |

---

## 安裝方式

###方式一：一鍵安裝（推薦）
```bash
git clone https://github.com/ssiweifnag/pclaw.git
cd pclaw
bash pclaw-install.sh
```

### 方式二：手動複製
```bash
cp IDENTITY.md ~/.openclaw/workspace/
cp USER.md ~/.openclaw/workspace/
# ... 其他檔案
```

### 方式三：Fork 後自訂
1. Fork https://github.com/ssiweifnag/pclaw
2. 修改 IDENTITY.md 和 USER.md
3. 部署到你的 OpenClaw

---

## 疑難排解

| 問題 | 解法 |
|------|------|
| `p` command not found | 將 `alias p='openclaw'` 加入 ~/.zshrc |
| 想極速喚醒 | 安裝 Raycast，設定 keyword `p` |
| 想桌面快捷鍵 | 系統偏好 → 鍵盤 → 快捷鍵 |
| 想強化記憶 | 持續使用，Pclaw 會自動學習 |

---

**版本：** v3.0（桌面整合 + 極速啟動版）
**更新日期：** 2026-03-30
**參考：** Qclaw、Desktop-Claw、Multi-Agent 框架
**基礎：** OpenClaw v2026.3.24 + MiniMax-M2.7
