#!/bin/bash
# 🦞 Pclaw 更新腳本
# 版本：v2026-03-30
# 用途：快速更新 Pclaw + OpenClaw

set -e

echo "🦞 Pclaw 更新精靈"
echo "===================="
echo ""

# 顏色設定
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# 當前版本
show_current_version() {
    echo "📋 當前版本："
    echo "  - Pclaw: v2026-03-30"
    
    if command -v openclaw &> /dev/null; then
        OPENCLAW_VERSION=$(openclaw --version 2>/dev/null || echo "unknown")
        echo "  - OpenClaw: $OPENCLAW_VERSION"
    else
        echo "  - OpenClaw: 未安裝"
    fi
    
    echo ""
}

# 檢查更新
check_updates() {
    echo "🔍 檢查更新..."
    
    # 檢查 OpenClaw 更新
    if command -v openclaw &> /dev/null; then
        CURRENT=$(openclaw --version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' || echo "0.0.0")
        LATEST=$(npm show openclaw version 2>/dev/null || echo "unknown")
        
        if [ "$CURRENT" != "$LATEST" ] && [ "$LATEST" != "unknown" ]; then
            echo -e "${YELLOW}⚠${NC} OpenClaw 有新版本: $LATEST (當前: $CURRENT)"
        else
            echo -e "${GREEN}✓${NC} OpenClaw 已是最新"
        fi
    fi
    
    # 檢查 Git 更新
    if [ -d ".git" ]; then
        git remote update 2>/dev/null
        LOCAL=$(git rev-parse HEAD 2>/dev/null)
        REMOTE=$(git rev-parse origin/main 2>/dev/null)
        
        if [ "$LOCAL" != "$REMOTE" ]; then
            echo -e "${YELLOW}⚠${NC} Pclaw Git 有新版本"
        else
            echo -e "${GREEN}✓${NC} Pclaw 已是最新"
        fi
    fi
    
    echo ""
}

# 更新 OpenClaw
update_openclaw() {
    echo "📦 更新 OpenClaw..."
    
    if command -v openclaw &> /dev/null; then
        npm update -g openclaw
        NEW_VERSION=$(openclaw --version 2>/dev/null || echo "updated")
        echo -e "${GREEN}✓${NC} OpenClaw 更新完成: $NEW_VERSION"
    else
        echo -e "${YELLOW}⚠${NC} OpenClaw 未安裝"
    fi
    echo ""
}

# 更新 Pclaw 檔案
update_pclaw_files() {
    echo "📁 更新 Pclaw 檔案..."
    
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
    CLAW_DIR="$HOME/.openclaw/workspace"
    
    # 從 Git 拉取最新
    if [ -d "$SCRIPT_DIR/.git" ]; then
        echo "  📥 從 Git 拉取最新..."
        git pull origin main 2>/dev/null && echo -e "${GREEN}✓${NC} Git 更新完成" || echo -e "${YELLOW}⚠${NC} Git 更新跳過"
    fi
    
    # 複製新檔案
    echo "  📋 同步檔案..."
    for skill_dir in "$SCRIPT_DIR/skills"/*/; do
        if [ -d "$skill_dir" ]; then
            skill_name=$(basename "$skill_dir")
            mkdir -p "$CLAW_DIR/skills/$skill_name"
            cp "$skill_dir"*.md "$CLAW_DIR/skills/$skill_name/" 2>/dev/null || true
        fi
    done
    
    # 複製主要檔案
    for file in PCLAW_SETUP.md PCLAW_EVOLUTION_GOVERNANCE.md HA_MONITORING.md; do
        if [ -f "$SCRIPT_DIR/$file" ]; then
            cp "$SCRIPT_DIR/$file" "$CLAW_DIR/" 2>/dev/null || true
        fi
    done
    
    echo -e "${GREEN}✓${NC} Pclaw 檔案更新完成"
    echo ""
}

# 備份
backup() {
    echo "💾 備份..."
    BACKUP_DIR="$HOME/.openclaw/backup/$(date +%Y%m%d%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    
    if [ -d "$HOME/.openclaw/workspace" ]; then
        cp -r "$HOME/.openclaw/workspace" "$BACKUP_DIR/" 2>/dev/null || true
        echo -e "${GREEN}✓${NC} 備份至: $BACKUP_DIR"
    fi
    echo ""
}

# 顯示完成
show_complete() {
    echo "🦞 Pclaw 更新完成！"
    echo "=================="
    echo ""
    echo "📌 更新內容："
    echo "  - OpenClaw 最新版本"
    echo "  - Pclaw 最新檔案"
    echo "  - 技能最新版本"
    echo ""
    echo "🔄 若要重啟 Pclaw："
    echo "  - 輸入: p"
    echo "  - 或: openclaw"
    echo ""
}

# 主程式
main() {
    show_current_version
    
    # 解析參數
    case "${1:-all}" in
        --check|-c)
            check_updates
            ;;
        --openclaw|-o)
            update_openclaw
            ;;
        --pclaw|-p)
            update_pclaw_files
            ;;
        --backup|-b)
            backup
            ;;
        --all|-a|*)
            check_updates
            read -p "是否執行完整更新？ (Y/n): " CONFIRM
            if [[ "$CONFIRM" =~ ^[Nn]$ ]]; then
                echo "取消更新"
                exit 0
            fi
            backup
            update_openclaw
            update_pclaw_files
            show_complete
            ;;
    esac
}

main "$@"
