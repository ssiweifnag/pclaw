# 🦞 Pclaw - Personal OpenClaw Agent

> 以 OpenClaw 為本體的個人化 AI 助理，專為研究者/建築專業人士設計

**最新版本：** v3.0 | **基於：** OpenClaw v2026.3.24

---

## 📜 版本歷史（時間分佈）

| 版本 | 日期 | 主要內容 |
|------|------|----------|
| [v1.0](#v10-2026-03-30) | 2026-03-30 | 基礎設定（身份、用戶、AI個性）|
| [v2.0](#v20-2026-03-30) | 2026-03-30 | 自定義技能 + 三層記憶 + 多人使用 |
| [v3.0](#v30-2026-03-30) | 2026-03-30 | 桌面整合 + 極速啟動 + 進化系統 |
| [v4.0](#v40-2026-03-30) | 2026-03-30 | Home Assistant 監控整合 |

---

## 🚀 如何架設 OpenClaw

### 前置需求

```bash
# 1. 確認 Node.js 版本
node --version  # 需要 v18+

# 2. 確認 npm 版本
npm --version

# 3. 確認 Git
git --version
```

### 安裝 OpenClaw

```bash
# 方法一：npm 全域安裝（推薦）
npm install -g openclaw

# 方法二：使用 npx 執行
npx openclaw

# 方法三：Docker 安裝
docker pull openclaw/openclaw
```

### 啟動 OpenClaw

```bash
# 首次啟動
openclaw init

# 一般啟動
openclaw

# 後台運行
openclaw daemon

# 查看狀態
openclaw status
```

### 設定 workspace

```bash
# 建立 workspace 目錄
mkdir -p ~/.openclaw/workspace

# 進入目錄
cd ~/.openclaw/workspace

# 啟動並指定 workspace
openclaw --workspace ~/.openclaw/workspace
```

---

## 📦 v1.0（2026-03-30）

### 基礎設定版

**核心檔案：**
- `IDENTITY.md` — 身份設定
- `USER.md` — 用戶資料
- `SOUL.md` — AI 個性

### 安裝方式

```bash
# 複製設定檔
cp IDENTITY.md ~/.openclaw/workspace/
cp USER.md ~/.openclaw/workspace/
cp SOUL.md ~/.openclaw/workspace/

# 啟動
openclaw
```

### 適用場景

- ✅ 初次體驗 Pclaw
- ✅ 個人基本使用
- ✅ 快速部署

---

## 📦 v2.0（2026-03-30）

### 自定義技能 + 三層記憶版

**新增檔案：**
- `HEARTBEAT.md` — 自動化任務排程
- `MEMORY.md` — 長期記憶
- `memory/` — 每日日誌目錄
- `skills/` — 自定義技能目錄

### v2.0 新功能

| 功能 | 說明 |
|------|------|
| 自定義技能 | 任何人在 skills/ 新增技能 |
| 三層記憶 | Working → Daily → Long-term |
| 多人使用 | Primary / Family / Guest 權限 |
| 手機對接 | Telegram 即時喚醒 |

### 安裝方式

```bash
# 複製所有 v1.0 檔案
cp IDENTITY.md USER.md SOUL.md ~/.openclaw/workspace/

# 複製 v2.0 新增檔案
cp HEARTBEAT.md MEMORY.md ~/.openclaw/workspace/
mkdir -p ~/.openclaw/workspace/memory/
cp -r skills/ ~/.openclaw/workspace/

# 啟動
openclaw
```

### 適用場景

- ✅ 需要自動化任務
- ✅ 需要記憶系統
- ✅ 需要多人使用

---

## 📦 v3.0（2026-03-30）

### 桌面整合 + 極速啟動版

**新增檔案：**
- `PCLAW_SETUP.md` — 完整設定指南
- `PCLAW_EVOLUTION_GOVERNANCE.md` — 進化治理架構
- `pclaw-install.sh` — 一鍵安裝腳本

### v3.0 新功能

| 功能 | 說明 |
|------|------|
| ⚡ 極速啟動 | `alias p='openclaw'` 一鍵喚醒 |
| 🖥️ 桌面整合 | Raycast / Alfred 支援 |
| 🧠 Context 內化 | 對話自動摘要 |
| 🔄 進化系統 | Level 1/2/3 自動進化 |

### 安裝方式

```bash
# 方法一：一鍵安裝
git clone https://github.com/ssiweifnag/pclaw.git
cd pclaw
bash pclaw-install.sh

# 方法二：手動安裝
cp IDENTITY.md USER.md SOUL.md HEARTBEAT.md ~/.openclaw/workspace/
cp MEMORY.md PCLAW_SETUP.md PCLAW_EVOLUTION_GOVERNANCE.md ~/.openclaw/workspace/
mkdir -p ~/.openclaw/workspace/memory/

# 設定極速啟動
echo "alias p='openclaw'" >> ~/.zshrc
source ~/.zshrc

# 啟動
p
```

### 極速喚醒選項

| 方式 | 速度 | 設定方式 |
|------|------|----------|
| 終端機 `p` | ~1秒 | `alias p='openclaw'` |
| Raycast `p` | <0.5秒 | 安裝 Raycast → 設定 keyword |
| Alfred `p` | <0.5秒 | 安裝 Alfred → 設定 keyword |

### 適用場景

- ✅ 桌面用戶
- ✅ 需要極速喚醒
- ✅ 需要自動進化
- ✅ 開源貢獻者

---

## 📦 v4.0（2026-03-30）

### Home Assistant 監控整合版

**新增檔案：**
- `HA_MONITORING.md` — Home Assistant 監控設定指南
- `skills/pclaw-ha-monitor/SKILL.md` — HA 監控技能

### v4.0 新功能

| 功能 | 說明 |
|------|------|
| 🏠 即時監控 | CO₂、溫度、濕度、電力 |
| ⏰ 定時回報 | 09:00/20:00 自動摘要 |
| 🔔 異常警報 | 數值超標時通知 |
| 📈 長期分析 | 每週/月數據統計 |

### 監控參數

| 參數 | 正常 | 警告 |
|------|------|------|
| CO₂ | < 800 ppm | > 1000 ppm |
| 溫度 | 18-26°C | < 16°C / > 28°C |
| 濕度 | 40-60% | < 30% / > 70% |
| PM2.5 | < 35 μg/m³ | > 54 μg/m³ |

### 安裝方式

```bash
# 複製 HA 監控相關檔案
cp HA_MONITORING.md ~/.openclaw/workspace/
cp -r skills/pclaw-ha-monitor/ ~/.openclaw/workspace/skills/

# 設定 Home Assistant Token
export HA_TOKEN="your_long_lived_token"

# 測試連接
curl -H "Authorization: Bearer $HA_TOKEN" \
  http://YOUR_HA_IP:8123/api/states
```

### HEARTBEAT 整合

```bash
# 09:00 室內環境回報
0 9 * * * openclaw heartbeat --task ha-morning

# 20:00 晚間摘要
0 20 * * * openclaw heartbeat --task ha-evening
```

### 適用場景

- ✅ 有 Home Assistant 系統的用戶
- ✅ 需要室內環境監控
- ✅ 智慧建築研究（BEMS/IAQ）

---

## 🔧 常用指令

```bash
# 開啟對話
openclaw
p                    # 如果設定了 alias

# 查看狀態
openclaw status

# 更新版本
openclaw update

# 查看已安裝技能
openclaw skills list

# 安裝新技能
openclaw skills install <skill-name>

# 檢視設定
openclaw config show

# 說明文件
openclaw help
```

---

## 📁 檔案結構

```
~/.openclaw/workspace/
├── IDENTITY.md              ← 身份設定
├── USER.md                  ← 用戶資料
├── SOUL.md                  ← AI 個性
├── HEARTBEAT.md             ← 自動化任務（v2.0+）
├── MEMORY.md                ← 長期記憶（v2.0+）
├── PCLAW_SETUP.md           ← 完整指南（v3.0+）
├── PCLAW_EVOLUTION_GOVERNANCE.md  ← 進化治理（v3.0+）
├── HA_MONITORING.md               ← HA 監控（v4.0+）
├── memory/                  ← 每日日誌目錄
│   └── YYYY-MM-DD.md
├── skills/                  ← 自定義技能目錄
│   ├── pclaw-ha-monitor/   ← HA 監控技能（v4.0）
│   ├── knowledge-organizer/ ← 知識庫整理技能
│   └── paper-evolution/    ← 論文進化技能
└── knowledge/               ← 知識庫（可選）
    └── ...
```

---

## 🔄 版本升級

### v1.0 → v2.0

```bash
cp HEARTBEAT.md MEMORY.md ~/.openclaw/workspace/
mkdir -p ~/.openclaw/workspace/memory/
```

### v2.0 → v3.0

```bash
cp PCLAW_SETUP.md PCLAW_EVOLUTION_GOVERNANCE.md ~/.openclaw/workspace/
echo "alias p='openclaw'" >> ~/.zshrc
source ~/.zshrc
```

### v3.0 → 未來版本

```bash
# 從 GitHub 拉取最新
git pull origin main

# 或手動複製新檔案
```

---

## 🤝 參與貢獻

### 提交 Issue

- 🐛 `[Bug]` 問題回報
- ✨ `[Feature]` 功能請求
- 📦 `[Skill]` 技能分享
- 📝 `[Docs]` 文件改進

### 提交 PR

1. Fork 此倉庫
2. 建立新分支 `git checkout -b feature/your-feature`
3. 提交改動 `git commit -m 'Add new feature'`
4. 推送分支 `git push origin feature/your-feature`
5. 提交 Pull Request

### 技能審批流程

```
提交技能 → 用戶審批 → 測試 → 發布
```

---

## 📚 學習資源

| 資源 | 連結 |
|------|------|
| OpenClaw 官網 | https://openclaw.ai |
| OpenClaw 文件 | https://docs.openclaw.ai |
| GitHub | https://github.com/openclaw/openclaw |
| Discord | https://discord.gg/clawd |

---

## 📄 License

MIT License

---

**作者：** Panboo  
**版本：** v3.0  
**更新：** 2026-03-30  
**GitHub：** https://github.com/ssiweifnag/pclaw
