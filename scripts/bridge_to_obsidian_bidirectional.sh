#!/bin/bash
# ============================================================
# OpenClaw ↔ Obsidian 雙向同步橋接腳本
# 版本：v2.0 (雙向同步)
# 日期：2026-03-30
# ============================================================

# 設定
KNOWLEDGE_DIR="/Users/pc/.openclaw/workspace/knowledge"
OBSIDIAN_DIR="/Users/pc/Library/CloudStorage/Box-Box/01_學術研究"
BRIDGE_DIR="$OBSIDIAN_DIR/OpenClaw_Knowledge"
STAGING_DIR="/Users/pc/.openclaw/workspace/obsidian-staging"
BACKUP_DIR="/Users/pc/.openclaw/workspace/obsidian-backup"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M")
LOG_FILE="/Users/pc/.openclaw/workspace/logs/bridge_$(date +%Y%m%d).log"

# 創建目錄
mkdir -p "$STAGING_DIR" "$BRIDGE_DIR" "$BACKUP_DIR" "$(dirname "$LOG_FILE")"

# 日誌函數
log() {
    echo "[$(date +"%H:%M:%S")] $1" | tee -a "$LOG_FILE"
}

# 顏色輸出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# ============================================================
# 第一部分：OpenClaw → Obsidian（發布內容）
# ============================================================
openclaw_to_obsidian() {
    log "📤 OpenClaw → Obsidian 同步開始"
    
    # 1. 桌面文件索引
    if [ -f "$KNOWLEDGE_DIR/Desktop_文件索引.md" ]; then
        backup_and_copy "$KNOWLEDGE_DIR/Desktop_文件索引.md" "$BRIDGE_DIR/Desktop_Index.md" "桌面索引"
    fi
    
    # 2. 當日新聞摘要
    generate_news_summary
    backup_and_copy "$STAGING_DIR/News_Summary.md" "$BRIDGE_DIR/News_Summary.md" "新聞摘要"
    
    # 3. 工具研究精華
    generate_tools_research
    backup_and_copy "$STAGING_DIR/Tools_Research.md" "$BRIDGE_DIR/Tools_Research.md" "工具研究"
    
    # 4. 博士論文研究（新增）
    phd_dir="$KNOWLEDGE_DIR/博士論文"
    if [ -d "$phd_dir" ]; then
        mkdir -p "$BRIDGE_DIR/phd_research"
        for f in "$phd_dir"/*.md; do
            if [ -f "$f" ]; then
                backup_and_copy "$f" "$BRIDGE_DIR/phd_research/" "$(basename "$f")"
            fi
        done
    fi
    
    # 5. 每週研究報告（新增）
    plan_file="$KNOWLEDGE_DIR/研究計畫_建議實驗方向_2026-03-30.md"
    if [ -f "$plan_file" ]; then
        backup_and_copy "$plan_file" "$BRIDGE_DIR/research_plan.md" "研究計畫"
    fi
    
    log "✅ OpenClaw → Obsidian 完成"
}

# ============================================================
# 第二部分：Obsidian → OpenClaw（回收入知識庫）
# ============================================================
obsidian_to_openclaw() {
    log "📥 Obsidian → OpenClaw 同步開始"
    
    # 檢查 Obsidian 是否有新內容
    if [ ! -d "$OBSIDIAN_DIR" ]; then
        log "⚠️ Obsidian 目錄不存在，跳過"
        return
    fi
    
    # 1. 同步研究筆記
    sync_research_notes
    
    # 2. 同步文獻筆記
    syncLiterature_notes
    
    # 3. 同步個人想法/靈感
    sync_personal_notes
    
    log "✅ Obsidian → OpenClaw 完成"
}

# ============================================================
# 輔助函數
# ============================================================

# 安全複製（備份後複製）
backup_and_copy() {
    local src="$1"
    local dst="$2"
    local name="$3"
    local retries=2
    
    if [ ! -f "$src" ]; then
        log "⚠️ 來源檔案不存在: $src"
        return 1
    fi
    
    while [ $retries -gt 0 ]; do
        # 備份舊檔案
        if [ -f "$dst" ]; then
            cp "$dst" "$BACKUP_DIR/$(basename "$dst").$(date +%Y%m%d%H%M%S).bak" 2>/dev/null
        fi
        
        # 刪除並複製
        rm -f "$dst" 2>/dev/null
        sleep 0.3
        
        if cp "$src" "$dst" 2>/dev/null; then
            if [ -f "$dst" ] && [ -s "$dst" ]; then
                log "✅ $name 已同步"
                return 0
            fi
        fi
        
        sleep 1
        retries=$((retries - 1))
    done
    
    log "❌ $name 同步失敗"
    return 1
}

# 生成新聞摘要
generate_news_summary() {
    {
        echo "# 新聞摘要"
        echo "更新時間: $TIMESTAMP"
        echo ""
        echo "## AI / 科技新聞"
        grep -h "^## \|^### " "$KNOWLEDGE_DIR"/news/ai-*.md 2>/dev/null | head -10
        echo ""
        echo "## 智慧建築新聞"
        grep -h "^## \|^### " "$KNOWLEDGE_DIR"/news/smart-building-*.md 2>/dev/null | head -10
        echo ""
        echo "## 財經新聞"
        grep -h "^## \|^### " "$KNOWLEDGE_DIR"/news/finance-*.md 2>/dev/null | head -10
        echo ""
        echo "## 物聯網/LoRa 新聞"
        grep -h "^## \|^### " "$KNOWLEDGE_DIR"/news/iot-*.md 2>/dev/null | head -5
    } > "$STAGING_DIR/News_Summary.md"
}

# 生成工具研究精華
generate_tools_research() {
    {
        echo "# 軟體工具研究精華"
        echo "更新時間: $TIMESTAMP"
        echo ""
        echo "## B站影片研究"
        for f in $(ls -t "$KNOWLEDGE_DIR/軟體知識庫"/B站_*.md 2>/dev/null | head -10); do
            if [ -f "$f" ]; then
                echo "- $(basename "$f" .md)"
            fi
        done
        echo ""
        echo "## GitHub 熱門專案"
        for f in $(ls -t "$KNOWLEDGE_DIR/軟體知識庫"/GitHub熱門*.md 2>/dev/null | head -5); do
            if [ -f "$f" ]; then
                echo "- $(basename "$f" .md)"
            fi
        done
        echo ""
        echo "## AI/Multi-Agent 研究"
        for f in $(ls -t "$KNOWLEDGE_DIR/軟體知識庫"/*Agent*.md "$KNOWLEDGE_DIR/軟體知識庫"/*DeerFlow*.md 2>/dev/null | head -5); do
            if [ -f "$f" ]; then
                echo "- $(basename "$f" .md)"
            fi
        done
    } > "$STAGING_DIR/Tools_Research.md"
}

# 同步研究筆記
sync_research_notes() {
    local obsidian_research="$OBSIDIAN_DIR/Research"
    local openclaw_research="$KNOWLEDGE_DIR/從Obsidian同步"
    
    mkdir -p "$openclaw_research"
    
    if [ -d "$obsidian_research" ]; then
        # 找出較新的筆記（尚未同步的）
        find "$obsidian_research" -name "*.md" -newer "$BACKUP_DIR/last_sync" 2>/dev/null | while read -r f; do
            local filename=$(basename "$f")
            local dst="$openclaw_research/$filename"
            
            if [ ! -f "$dst" ] || [ "$f" -nt "$dst" ]; then
                cp "$f" "$dst"
                log "📥 同步研究筆記: $filename"
            fi
        done
    fi
}

# 同步文獻筆記
syncLiterature_notes() {
    local obsidian_literature="$OBSIDIAN_DIR/Literature"
    local openclaw_literature="$KNOWLEDGE_DIR/從Obsidian同步/文獻"
    
    mkdir -p "$openclaw_literature"
    
    if [ -d "$obsidian_literature" ]; then
        find "$obsidian_literature" -name "*.md" -newer "$BACKUP_DIR/last_sync" 2>/dev/null | while read -r f; do
            local filename=$(basename "$f")
            local dst="$openclaw_literature/$filename"
            
            if [ ! -f "$dst" ] || [ "$f" -nt "$dst" ]; then
                cp "$f" "$dst"
                log "📥 同步文獻筆記: $filename"
            fi
        done
    fi
}

# 同步個人想法/靈感
sync_personal_notes() {
    local obsidian_daily="$OBSIDIAN_DIR/daily"
    local openclaw_daily="$KNOWLEDGE_DIR/從Obsidian同步/每日"
    
    mkdir -p "$openclaw_daily"
    
    if [ -d "$obsidian_daily" ]; then
        # 同步過去 7 天的每日筆記
        for i in {0..7}; do
            local date=$(date -j -v-${i}d +"%Y-%m-%d")
            local src="$obsidian_daily/$date.md"
            
            if [ -f "$src" ]; then
                local dst="$openclaw_daily/$date.md"
                
                if [ ! -f "$dst" ] || [ "$src" -nt "$dst" ]; then
                    cp "$src" "$dst"
                    log "📥 同步每日筆記: $date"
                fi
            fi
        done
    fi
}

# ============================================================
# 主程式
# ============================================================
main() {
    echo ""
    echo "============================================"
    echo "🔄 OpenClaw ↔ Obsidian 雙向同步橋接"
    echo "============================================"
    echo ""
    log "============================================"
    log "雙向同步開始"
    log "============================================"
    
    # 參數處理
    case "${1:-both}" in
        --oc-to-obs|-o)
            openclaw_to_obsidian
            ;;
        --obs-to-oc|-i)
            obsidian_to_openclaw
            ;;
        --both|-b|*)
            openclaw_to_obsidian
            obsidian_to_openclaw
            ;;
        --help|-h)
            echo "用法: $0 [選項]"
            echo "  -o, --oc-to-obs    只同步 OpenClaw → Obsidian"
            echo "  -i, --obs-to-oc    只同步 Obsidian → OpenClaw"
            echo "  -b, --both         雙向同步（預設）"
            echo "  -h, --help         顯示說明"
            exit 0
            ;;
    esac
    
    # 更新最後同步時間
    touch "$BACKUP_DIR/last_sync"
    
    echo ""
    echo "============================================"
    echo "✅ 同步完成"
    echo "============================================"
    log "============================================"
    log "同步完成"
    log "============================================"
}

main "$@"
