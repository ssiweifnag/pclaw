# 🦞 Pclaw 安裝與更新 UI

> 簡易圖形化安裝更新介面

---

## 🚀 快速安裝

### 一鍵安裝（複製貼上）

```bash
git clone https://github.com/ssiweifnag/pclaw.git && cd pclaw && bash pclaw-install.sh
```

### 或手動安裝

```bash
# 1. 複製檔案
cp IDENTITY.md USER.md SOUL.md ~/.openclaw/workspace/
cp HEARTBEAT.md MEMORY.md PCLAW_SETUP.md ~/.openclaw/workspace/

# 2. 設定捷徑
echo "alias p='openclaw'" >> ~/.zshrc && source ~/.zshrc

# 3. 啟動
p
```

---

## 🔄 更新選項

### 方式一：指令更新

```bash
# 完整更新（備份 + OpenClaw + Pclaw）
bash pclaw-update.sh

# 只檢查更新
bash pclaw-update.sh --check

# 只更新 OpenClaw
bash pclaw-update.sh --openclaw

# 只更新 Pclaw 檔案
bash pclaw-update.sh --pclaw
```

### 方式二：OpenClaw 自動更新

```bash
openclaw update
```

### 方式三：從 Git 拉取

```bash
cd ~/pclaw  # 或你的 pclaw 目錄
git pull origin main
```

---

## 📋 版本資訊

| 項目 | 版本 |
|------|------|
| Pclaw | v2026-03-30 |
| 基於 | OpenClaw v2026.3.24 |
| 模型 | MiniMax-M2.7 |

---

## 🎛️ UI 選單

### 安裝選項

```
🦞 Pclaw 安裝選單
=================
1. [完整安裝]     - 安裝 OpenClaw + Pclaw + 設定捷徑
2. [僅 Pclaw]    - 只安裝 Pclaw 檔案
3. [檢查需求]     - 檢查 Node.js/npm 是否已安裝
4. [說明]        - 顯示詳細說明
5. [離開]        - 結束安裝
```

### 更新選項

```
🔄 Pclaw 更新選單
==================
1. [完整更新]     - 備份 + OpenClaw + Pclaw
2. [檢查更新]     - 查看有何更新
3. [更新 OpenClaw] - 只更新 OpenClaw 本體
4. [更新 Pclaw]    - 只更新 Pclaw 檔案
5. [版本資訊]      - 顯示當前版本
6. [離開]          - 結束更新
```

---

## ❓ 常見問題

### Q: 安裝失敗怎麼辦？
A: 確認 Node.js v18+ 和 npm 已正確安裝

### Q: 如何確認安裝成功？
A: 輸入 `p` 或 `openclaw` 應能啟動

### Q: 如何更新到最新版本？
A: 執行 `bash pclaw-update.sh` 或 `git pull`

### Q: 安裝在哪裡？
A: 設定檔在 `~/.openclaw/workspace/`

---

## 📞 取得幫助

- GitHub: https://github.com/ssiweifnag/pclaw
- 問題回報: https://github.com/ssiweifnag/pclaw/issues

---

**版本：** v2026-03-30
**更新：** 2026-03-30
