# 🦞 Pclaw - Personal OpenClaw Agent

> 以 OpenClaw 為本體的個人化 AI 助理，專為研究者/建築專業人士設計

**v2.0 | 基於 OpenClaw v2026.3.24**

---

## 特色

- 🎯 **身份設定** — 自訂名字、定位、擅長領域
- 👤 **用戶資料** — 研究背景、當前專案、興趣偏好  
- ⚡ **自動化任務** — 每日情報收集、系統監控
- 🧠 **強化記憶** — 三層記憶系統，越用越懂你
- 📱 **多設備對接** — Telegram 即時喚醒

---

## 適用對象

- 🎓 研究者（博士論文、學術寫作）
- 🏢 智慧建築專業人士（BEMS、IAQ）
- 📰 需要每日情報收集的知識工作者

---

## 快速開始

### 1. 複製檔案到你的 OpenClaw workspace

```bash
# 複製主要設定檔
cp IDENTITY.md ~/.openclaw/workspace/
cp USER.md ~/.openclaw/workspace/
cp SOUL.md ~/.openclaw/workspace/
cp HEARTBEAT.md ~/.openclaw/workspace/
cp PCLAW_SETUP.md ~/.openclaw/workspace/

# 複製記憶範本
cp MEMORY.md ~/.openclaw/workspace/
mkdir -p ~/.openclaw/workspace/memory/
```

### 2. 修改個人設定

編輯 `IDENTITY.md`：
```markdown
- **Name:** 你的名字
- **定位:** 你的擅長領域
```

編輯 `USER.md`：
```markdown
- **Name:** 你的名字
- **身份:** 你的專業背景
- **當前專案:** 你的研究/工作
```

### 3. 啟動 OpenClaw

```bash
openclaw
```

---

## 內建功能

### 📅 自動化排程（HEARTBEAT）

| 時間 | 任務 |
|------|------|
| 02:00 | AI 新聞採集 |
| 03:00 | 建築設計趨勢 |
| 05:00 | 新聞早報 + 天氣 |
| 07:00 | 財經分析 |
| 09:00 | 室內環境回報 |
| 14:00 | 系統健康檢查 |
| 21:00 | Obsidian 同步 |

### 🧠 三層記憶系統

```
Layer 1: 當前對話（Working Context）
Layer 2: 每日日誌（memory/YYYY-MM-DD.md）
Layer 3: 長期記憶（MEMORY.md）
```

---

## 與其他方案的比較

| 方案 | 擅長領域 | 特色 |
|------|----------|------|
| Qclaw | 開發者 | 極速開發框架 |
| Desktop-Claw | macOS 用戶 | 桌面悬浮球 |
| **Pclaw** | **研究者/建築** | **科研 + 智慧建築** |

---

## 擴展技能

在 `skills/` 目錄新增你的專屬技能：

```
skills/
├── paper-research/   # 論文研究
├── bemis-analysis/  # BEMS 分析
└── daily-intel/     # 每日情報
```

---

## License

MIT License

---

**作者：** Panboo  
**版本：** v2.0  
**更新：** 2026-03-30
