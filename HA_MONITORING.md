# 🏠 Home Assistant 監控設定

> Pclaw 整合 Home Assistant 室內環境監控

**版本：** v1.0  
**日期：** 2026-03-30  

---

## 功能

| 功能 | 說明 |
|------|------|
| 📊 即時監控 | CO₂、溫度、濕度、電力 |
| ⏰ 定時回報 | 09:00/20:00 自動摘要 |
| 🔔 異常警報 | 數值超標時通知 |
| 📈 長期分析 | 每週/月數據統計 |

---

## 連接方式

### 基本資訊

| 項目 | 內容 |
|------|------|
| URL | http://220.132.57.219:8123 |
| Token | （需設定）|
| 實體數 | 256（229 傳感器）|

### 環境數據

| 位置 | CO₂ | PM2.5 | 溫度 | 濕度 |
|------|-----|-------|------|------|
| 廚房 | 366-368ppm | 7-9μg/m³ | - | - |
| 客廳 | - | - | - | - |

---

## HEARTBEAT 整合

### 09:00 - 室內環境回報

```bash
# Cron job 設定
0 9 * * * openclaw heartbeat --task ha-morning
```

### 20:00 - 晚間摘要

```bash
# Cron job 設定
0 20 * * * openclaw heartbeat --task ha-evening
```

---

## 監控參數

### CO₂ 等級

| 等級 | 濃度 | 建議 |
|------|------|------|
| ✅ 良好 | < 800 ppm | 正常 |
| ⚠️ 注意 | 800-1000 ppm | 輕微通風 |
| 🔴 警告 | > 1000 ppm | 立即通風 |

### 溫度

| 等級 | 溫度 | 建議 |
|------|------|------|
| ❄️ 冷 | < 18°C | 開暖氣 |
| ✅ 舒適 | 18-26°C | 正常 |
| 🔥 熱 | > 26°C | 開冷氣 |

---

## 指令

```bash
# 查看即時狀態
pclaw ha status

# 查看今日摘要
pclaw ha today

# 查看本週數據
pclaw ha week

# 手動觸發監控
pclaw ha check
```

---

## 數據儲存

| 資料 | 位置 |
|------|------|
| 即時日誌 | `knowledge/硬體執事庫/HA_YYYYMMDD.md` |
| 每週報告 | `knowledge/硬體執事庫/HA_weekly_YYYY-MM-DD.md` |
| 原始數據 | `data/ha-sensor-logs/` |

---

## 安裝步驟

1. 確認 Home Assistant 可存取
2. 設定 long-lived access token
3. 測試連接：`curl -H "Authorization: Bearer $TOKEN" http://HA_URL/api/states`
4. 啟用監控：`pclaw ha enable`

---

**版本：** v1.0  
**最後更新：** 2026-03-30
