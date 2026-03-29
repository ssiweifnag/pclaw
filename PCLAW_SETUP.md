# 🦞 Pclaw 設定指南 v2.0

_基於 OpenClaw + Panboo 個人化的 AI Agent_
_參考：Qclaw、Desktop-Claw、Multi-Agent 框架_

---

## 什麼是 Pclaw？

**Pclaw = Panboo's Personalized OpenClaw**

以 OpenClaw 為本體，加上：
- 個人身份設定
- 專業領域技能包
- 強化記憶系統
- 多人使用架構
- 手機對接（Telegram）

變成專屬的 AI 助理團隊。

---

## 核心定位 🏷️

```
🦞 Pclaw = 科研幫手 × 建築智能 × 每日情報士 × 論文利器
```

| 領域 | 擅長任務 |
|------|----------|
| 📚 博士研究 | 文獻回顧、論文潤飾、數據分析、APA核查 |
| 🏢 智慧建築 | BEMS、IAQ、節能方案、商業策略 |
| 📰 每日情報 | AI 新聞、建築趨勢、科技動態 |
| 🔧 系統管理 | OpenClaw 維護、技能疊代、自動化工作流 |
| 📱 跨設備 | 手機對接、桌面隨時喚起、多人協作 |

---

## 🚀 快速設定（已完成）

### ✅ 身份 + 用戶設定
- `IDENTITY.md` — Pclaw 身份
- `USER.md` — Panboo 用戶資料
- `SOUL.md` — AI 個性

### ✅ 自動化任務
- `HEARTBEAT.md` — 每日 cron jobs（02:00-23:00）

### ✅ 記憶系統
- `MEMORY.md` — 長期記憶
- `memory/YYYY-MM-DD.md` — 每日日誌
- `knowledge/` — 結構化知識庫

---

## 🎯 v2.0 新增功能

### 1. 自定義技能系統

#### 技能模板（任何人可新增）

```markdown
# skills/你的技能名/SKILL.md

## 你的技能名

**用途：** 一句話說明這個技能做什麼
**觸發關鍵字：** task-skill, another-trigger

## 使用方式

描述何時、如何使用這個技能

## prompt 模板

/你的技能名 [任務描述]

## 輸出範例

描述預期輸出長怎樣
```

#### 已建立的自定義技能

| 技能名 | 用途 | 觸發關鍵字 |
|--------|------|------------|
| `paper-research` | 論文文獻調研 | 論文、文獻回顧 |
| `bems-analysis` | BEMS 系統分析 | 智慧建築、節能 |
| `daily-intel` | 每日情報收集 | 新聞、趨勢 |
| `ha-monitor` | Home Assistant 監控 | 室內環境、CO₂ |

#### 如何新增自訂技能

1. 在 `~/.openclaw/workspace/skills/` 建立資料夾
2. 寫入 `SKILL.md`（按上方模板）
3. 在 HEARTBEAT.md 新增對應的定時任務
4. 完成！

---

### 2. 強化記憶系統

#### 三層記憶架構

```
┌─────────────────────────────────────────────┐
│  Layer 1: Working Context（當前對話）        │
│  → OpenClaw 對話歷史、短期變數              │
├─────────────────────────────────────────────┤
│  Layer 2: Daily Memory（每日日誌）           │
│  → memory/YYYY-MM-DD.md                    │
│  → 當日重要事件、任務、發現                │
├─────────────────────────────────────────────┤
│  Layer 3: Long-term Memory（長期記憶）      │
│  → MEMORY.md                               │
│  → 人物、偏好、專案、關鍵決定              │
└─────────────────────────────────────────────┘
```

#### 記憶召回觸發

| 觸發條件 | 自動召回 |
|---------|----------|
| 提到人名 | → MEMORY.md 搜尋該人物 |
| 提到專案 | → 該專案的過往記錄 |
| 日期相關 | → memory/YYYY-MM-DD.md |
| 偏好相關 | → USER.md + MEMORY.md |

#### 記憶寫入規則

| 情況 | 寫入位置 |
|------|----------|
| 重要決定 | MEMORY.md + 當日 memory/ |
| 新人物認識 | MEMORY.md |
| 任務進度 | memory/YYYY-MM-DD.md |
| 偏好變化 | USER.md |
| 臨時筆記 | 當日 memory/ |

---

### 3. 多人使用架構

#### 用戶等級

| 等級 | 權限 | 範例 |
|------|------|------|
| 👤 Primary（主要）| 完整權限 | Panboo |
| 👥 Family（家庭）| 基本協助、查詢 | 家人 |
| 🤝 Guest（訪客）| 限定功能、有限記憶 | 同事、客戶 |

#### 多用戶設定檔

```
~/.openclaw/workspace/users/
├── _primary/          ← 主要用戶（Panboo）
│   ├── USER.md        ← 完整資料
│   └── MEMORY.md      ← 完整記憶
├── _family/           ← 家庭成員（可選）
│   └── USER.md        ← 簡化資料
└── _guest/            ← 訪客（可選）
    └── USER.md        ← 極簡資料
```

#### 多人隔離原則

- ✅ Primary 用戶：完整存取所有檔案
- ⚠️ Family 用戶：僅存取家庭共用知識庫
- ⚠️ Guest 用戶：僅存取公開技能，不觸及 MEMORY.md

---

### 4. 手機對接（Telegram）

#### 現有整合 ✅

| 功能 | 狀態 |
|------|------|
| Telegram 接收指令 | ✅ 已設定 |
| 主動回報（heartbeat）| ✅ 已啟用 |
| 檔案處理 | ✅ 支援 |
| 多媒體（圖片/語音）| ✅ 支援 |

#### 手機使用情境

| 情境 | 操作 |
|------|------|
| 隨手問問題 | 直接發 Telegram 訊息 |
| 查看每日情報 | 等待 07:00/21:00 主動推送 |
| 緊急任務 | 發「緊急：XXX」觸發優先處理 |
| 論文輔助 | 發文獻關鍵字 → 自動回傳摘要 |

#### 桌面喚醒（Desktop-Claw 概念）

```bash
# Mac 捷徑：用 AppleScript 唤起 Pclaw
osascript -e 'tell application "Terminal" to do script "openclaw"'
```

---

## 📁 完整檔案結構 v2.0

```
~/.openclaw/workspace/
├── IDENTITY.md           ← 🦞 Pclaw 身份
├── USER.md              ← 👤 Primary 用戶（Panboo）
├── SOUL.md              ← 🎭 AI 個性
├── HEARTBEAT.md         ← ⚡ 自動化任務
├── MEMORY.md            ← 🧠 長期記憶
├── PCLAW_SETUP.md       ← 📖 本指南
│
├── memory/              ← 📅 每日日誌
│   ├── 2026-03-30.md
│   └── 2026-03-29.md
│
├── knowledge/           ← 📚 結構化知識庫
│   ├── 博士論文/
│   ├── 軟體知識庫/
│   ├── 硬體執事庫/
│   └── news/
│
├── skills/             ← 🛠️ 自訂技能包
│   ├── paper-research/
│   ├── bemis-analysis/
│   ├── daily-intel/
│   └── ha-monitor/
│
├── scripts/             ← 🔧 自動化腳本
│   └── bridge_to_obsidian.sh
│
└── users/               ← 👥 多用戶設定（可選）
    ├── _family/
    └── _guest/
```

---

## 個人化程度對照 v2.0

| 層次 | 內容 | 狀態 |
|------|------|------|
| 🟢 身份 | 名字、定位、emoji | ✅ 已設定 |
| 🟢 用戶 | 背景、專案、偏好 | ✅ 已設定 |
| 🟢 技能 | 自訂 Skill 包 | ✅ 可新增 |
| 🟢 記憶 | 三層記憶系統 | ✅ 已建立 |
| 🟢 手機 | Telegram 對接 | ✅ 已啟用 |
| 🟡 多人 | 多用戶架構 | ⚠️ 可擴展 |
| 🔴 桌面 | Desktop-Claw 悬浮球 | 🔜 未來規劃 |

---

## 🔜 v3.0 規劃方向

| 功能 | 說明 | 優先度 |
|------|------|--------|
| Desktop-Claw 悬浮球 | Mac 桌面隨時喚起 | 🔜 |
| 家庭成員設定 | 爸妈的簡化版 Pclaw | 🔜 |
| 語音輸入/輸出 | 手機語音對話 | 🔜 |
| Zotero 自動同步 | 文獻+PDF 自動歸檔 | 🔜 |

---

## 疑難排解

| 問題 | 解法 |
|------|------|
| 想新增功能 | 在 `skills/` 新增 Skill |
| 想改變風格 | 修改 `SOUL.md` |
| 想記住新偏好 | 自然對話教我，或更新 `MEMORY.md` |
| 想多人使用 | 在 `users/` 建立新資料夾 |
| 想強化記憶 | 觸發 recall 或直接更新 MEMORY.md |
| 想手機喚醒 | 已有 Telegram，隨時可用 |

---

**版本：** v2.0（深度個人化版）
**更新日期：** 2026-03-30
**基礎：** OpenClaw v2026.3.24 + MiniMax-M2.7
