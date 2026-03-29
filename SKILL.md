# 🦞 Pclaw v3.0 - Personal OpenClaw Agent

**版本：** v3.0  
**作者：** Panboo  
**基於：** OpenClaw v2026.3.24  
**參考：** Qclaw、Desktop-Claw、Multi-Agent 框架

---

## 簡介

**Pclaw = Panboo's Personalized OpenClaw**

以 OpenClaw 為本體，結合：
- Qclaw 的**極速啟動**理念
- Desktop-Claw 的**桌面悬浮球**概念
- **三層記憶系統**
- **本地檔優先處理**

---

## 核心功能

### ⚡ 極速啟動
```bash
# Mac 終端機
alias p='openclaw'

# Raycast / Alfred
keyword: p
```

### 🖥️ 桌面整合
| 方式 | 喚醒時間 |
|------|----------|
| Telegram | ~3秒 |
| `p` 終端機 | ~1秒 |
| Raycast `p` | <0.5秒 |

### 🧠 三層記憶
```
Layer 1: 當前對話（Working Context）
Layer 2: 每日日誌（memory/YYYY-MM-DD.md）
Layer 3: 長期記憶（MEMORY.md）
```

### 📁 本地檔處理
自動優先讀取：
- `~/Desktop/`
- `~/Downloads/`
- `~/Documents/`
- `~/Library/CloudStorage/`（Obsidian Vault）

---

## 擅長領域

| 領域 | 任務 |
|------|------|
| 📚 博士研究 | 文獻、論文潤飾、數據分析 |
| 🏢 智慧建築 | BEMS、IAQ、節能方案 |
| 📰 每日情報 | AI 新聞、建築趨勢 |
| 🔧 系統管理 | OpenClaw 維護、自動化 |

---

## 安裝方式

### 一鍵安裝
```bash
git clone https://github.com/ssiweifnag/pclaw.git
cd pclaw
bash pclaw-install.sh
```

### 手動設定
1. 複製 IDENTITY.md、USER.md、SOUL.md、HEARTBEAT.md 到 ~/.openclaw/workspace/
2. 設定 `alias p='openclaw'` 加入 ~/.zshrc
3. 完成！

---

## 與其他方案的比較

| 方案 | 特色 |
|------|------|
| Qclaw | 極速開發框架 |
| Desktop-Claw | macOS 桌面悬浮球 |
| **Pclaw** | **研究 + 建築 + 極速喚醒** |

---

## License

MIT License

---

**最後更新：** 2026-03-30
**版本：** v3.0
