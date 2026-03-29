# 🦞 Pclaw - Personal OpenClaw Agent

**版本：** v2.0  
**作者：** Panboo  
**基於：** OpenClaw  

---

## 簡介

**Pclaw = Panboo's Personalized OpenClaw**

以 OpenClaw 為本體的個人化 AI 助理技能包，專為研究者/建築專業人士設計。

---

## 功能

### 身份設定
- 自動載入 `IDENTITY.md` 中的身份設定
- 定位：科研幫手 × 建築智能 × 每日情報士

### 用戶資料
- 自動載入 `USER.md` 中的用戶背景
- 包括：專業領域、當前專案、興趣偏好

### 自動化任務
- 內建 HEARTBEAT.md 每日排程
- 02:00 AI 新聞採集
- 07:00 財經分析
- 09:00 HA 室內環境回報
- 21:00 Obsidian 同步

### 記憶系統
- 三層記憶架構
- 自動召回個人偏好

---

## 安裝方式

### 方式一：複製檔案（推薦）

```bash
# 複製主要設定檔
cp IDENTITY.md ~/.openclaw/workspace/
cp USER.md ~/.openclaw/workspace/
cp SOUL.md ~/.openclaw/workspace/
cp HEARTBEAT.md ~/.openclaw/workspace/

# 複製記憶範本
cp -r memory/ ~/.openclaw/workspace/
cp MEMORY.md ~/.openclaw/workspace/
```

### 方式二：Fork 此 Repo

1. Fork `pclaw` 倉庫
2. 修改 `IDENTITY.md` 和 `USER.md` 為你的資料
3. 設定 GitHub Codespaces 或本地 OpenClaw

---

## 自訂修改

### 修改身份
編輯 `IDENTITY.md`：
- 名字
- 定位領域
- Emoji 標誌

### 修改用戶資料
編輯 `USER.md`：
- 背景專業
- 當前專案
- 興趣偏好

### 新增技能
在 `skills/` 目錄新增資料夾和 `SKILL.md`

---

## 與其他技能的差異

| 技能 | 擅長領域 |
|------|----------|
| Qclaw | 通用開發者助手 |
| Desktop-Claw | macOS 桌面悬浮球 |
| Pclaw | 研究者 + 智慧建築 |

---

## 授權

MIT License

---

**最後更新：** 2026-03-30
