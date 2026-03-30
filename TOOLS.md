# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Examples

```markdown
### Cameras

- living-room → Main area, 180° wide angle
- front-door → Entrance, motion-triggered

### SSH

- home-server → 192.168.1.100, user: admin

### TTS

- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod
```

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

---

Add whatever helps you do your job. This is your cheat sheet.

---

## Obsidian Vault

- **活跃 Vault:** `01_學術研究`
- **路径:** `/Users/pc/Library/CloudStorage/Box-Box/01_學術研究`
- **配置:** obsidian-cli 已设定默认 vault
- **命令:** `obsidian-cli search "query"`, `obsidian-cli create "folder/note"`
- **备注:** Box雲端同步，适合与 OpenClaw knowledge/ 联动

---

## OpenClaw ↔ Obsidian 自動化橋接（雙向同步）

### 腳本位置
- **單向（新）：** `/Users/pc/.openclaw/workspace/scripts/bridge_to_obsidian.sh`
- **雙向（新）：** `/Users/pc/.openclaw/workspace/scripts/bridge_to_obsidian_bidirectional.sh`

### 同步內容（雙向）

#### OpenClaw → Obsidian
| 來源 | 目的地 |
|------|---------|
| Desktop_文件索引.md | Desktop_Index.md |
| knowledge/news/*.md | News_Summary.md |
| 軟體知識庫/B站_*.md | Tools_Research.md |
| 博士論文/*.md | 博士論文/ |
| 研究計畫 | 研究計畫.md |

#### Obsidian → OpenClaw
| 來源 | 目的地 |
|------|---------|
| Research/*.md | knowledge/從Obsidian同步/ |
| Literature/*.md | knowledge/從Obsidian同步/文獻/ |
| daily/*.md（7天內）| knowledge/從Obsidian同步/每日/ |

### 自動執行
- **Cron Job:** 每日 21:00 雙向同步
- **Job ID:** 94ac6447-9d14-4778-841d-9e4113aede2f

### 手動執行
```bash
# 雙向同步（預設）
/Users/pc/.openclaw/workspace/scripts/bridge_to_obsidian_bidirectional.sh

# 單向：OpenClaw → Obsidian
/Users/pc/.openclaw/workspace/scripts/bridge_to_obsidian_bidirectional.sh --oc-to-obs

# 單向：Obsidian → OpenClaw
/Users/pc/.openclaw/workspace/scripts/bridge_to_obsidian_bidirectional.sh --obs-to-oc
```

### Obsidian 筆記本
`OpenClaw_Knowledge/`（在 01_學術研究 Vault 內）

### 備份機制
- 自動備份至：`~/.openclaw/workspace/obsidian-backup/`
- 日誌檔案：`~/.openclaw/workspace/logs/bridge_YYYYMMDD.log`
