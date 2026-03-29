#!/bin/bash
# 🦞 Pclaw 安裝腳本
# 版本：v2026-03-30
# 用途：快速安裝/更新 Pclaw

set -e

echo "🦞 Pclaw 安裝精靈"
echo "=================="
echo ""

# 顏色設定
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 檢查前置需求
check_requirements() {
    echo "📋 檢查前置需求..."
    
    # Node.js
    if command -v node &> /dev/null; then
        NODE_VERSION=$(node --version)
        echo -e "${GREEN}✓${NC} Node.js: $NODE_VERSION"
    else
        echo -e "${RED}✗${NC} Node.js 未安裝"
        echo "  請至 https://nodejs.org 安裝"
        exit 1
    fi
    
    # npm
    if command -v npm &> /dev/null; then
        NPM_VERSION=$(npm --version)
        echo -e "${GREEN}✓${NC} npm: $NPM_VERSION"
    else
        echo -e "${RED}✗${NC} npm 未安裝"
        exit 1
    fi
    
    # Git
    if command -v git &> /dev/null; then
        GIT_VERSION=$(git --version)
        echo -e "${GREEN}✓${NC} Git: $GIT_VERSION"
    else
        echo -e "${YELLOW}⚠${NC} Git 未安裝（可選）"
    fi
    
    echo ""
}

# 安裝 OpenClaw
install_openclaw() {
    echo "📦 安裝 OpenClaw..."
    
    if command -v openclaw &> /dev/null; then
        CURRENT_VERSION=$(openclaw --version 2>/dev/null || echo "unknown")
        echo -e "${GREEN}✓${NC} OpenClaw 已安裝: $CURRENT_VERSION"
        
        read -p "是否更新至最新版本？ (y/N): " UPDATE
        if [[ "$UPDATE" =~ ^[Yy]$ ]]; then
            echo "🔄 更新 OpenClaw..."
            npm update -g openclaw
        fi
    else
        echo "⏳ 安裝 OpenClaw..."
        npm install -g openclaw
        echo -e "${GREEN}✓${NC} OpenClaw 安裝完成"
    fi
    echo ""
}

# 複製 Pclaw 檔案
install_pclaw_files() {
    echo "📁 複製 Pclaw 檔案..."
    
    CLAW_DIR="$HOME/.openclaw/workspace"
    
    # 建立目錄
    mkdir -p "$CLAW_DIR"
    mkdir -p "$CLAW_DIR/memory"
    mkdir -p "$CLAW_DIR/skills"
    mkdir -p "$CLAW_DIR/knowledge"
    
    # 複製主要檔案
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
    
    echo "  複製設定檔..."
    cp "$SCRIPT_DIR/IDENTITY.md" "$CLAW_DIR/" 2>/dev/null || true
    cp "$SCRIPT_DIR/USER.md" "$CLAW_DIR/" 2>/dev/null || true
    cp "$SCRIPT_DIR/SOUL.md" "$CLAW_DIR/" 2>/dev/null || true
    cp "$SCRIPT_DIR/HEARTBEAT.md" "$CLAW_DIR/" 2>/dev/null || true
    cp "$SCRIPT_DIR/MEMORY.md" "$CLAW_DIR/" 2>/dev/null || true
    
    echo "  複製指南..."
    cp "$SCRIPT_DIR/PCLAW_SETUP.md" "$CLAW_DIR/" 2>/dev/null || true
    cp "$SCRIPT_DIR/PCLAW_EVOLUTION_GOVERNANCE.md" "$CLAW_DIR/" 2>/dev/null || true
    cp "$SCRIPT_DIR/HA_MONITORING.md" "$CLAW_DIR/" 2>/dev/null || true
    
    echo "  複製技能..."
    for skill_dir in "$SCRIPT_DIR/skills"/*/; do
        if [ -d "$skill_dir" ]; then
            skill_name=$(basename "$skill_dir")
            mkdir -p "$CLAW_DIR/skills/$skill_name"
            cp "$skill_dir"*.md "$CLAW_DIR/skills/$skill_name/" 2>/dev/null || true
            echo "    ✓ $skill_name"
        fi
    done
    
    echo -e "${GREEN}✓${NC} Pclaw 檔案複製完成"
    echo ""
}

# 設定捷徑
setup_shortcuts() {
    echo "⚡ 設定捷徑..."
    
    SHORTCUT_LINE="alias p='openclaw'"
    RC_FILE="$HOME/.zshrc"
    
    if [ -f "$RC_FILE" ]; then
        if ! grep -q "alias p=" "$RC_FILE" 2>/dev/null; then
            echo "$SHORTCUT_LINE" >> "$RC_FILE"
            echo -e "${GREEN}✓${NC} 已加入 'p' 捷徑至 ~/.zshrc"
        else
            echo -e "${YELLOW}⚠${NC} 'p' 捷徑已存在"
        fi
    else
        echo "$SHORTCUT_LINE" > "$RC_FILE"
        echo -e "${GREEN}✓${NC} 已建立 'p' 捷徑"
    fi
    
    echo ""
}

# 顯示完成資訊
show_complete() {
    echo "🦞 Pclaw 安裝完成！"
    echo "=================="
    echo ""
    echo "📌 下一步："
    echo "  1. 重新載入終端機或執行: source ~/.zshrc"
    echo "  2. 修改設定檔:"
    echo "     - IDENTITY.md（你的名字、定位）"
    echo "     - USER.md（你的背景、專案）"
    echo "  3. 啟動 Pclaw:"
    echo "     - 輸入: p"
    echo "     - 或: openclaw"
    echo ""
    echo "🔧 常用指令："
    echo "  pclaw update    - 更新 Pclaw"
    echo "  pclaw status    - 查看狀態"
    echo "  pclaw help      - 說明"
    echo ""
    echo "📚 文件："
    echo "  - PCLAW_SETUP.md（完整設定指南）"
    echo "  - PCLAW_EVOLUTION_GOVERNANCE.md（進化治理）"
    echo ""
}

# 主程式
main() {
    check_requirements
    install_openclaw
    install_pclaw_files
    setup_shortcuts
    show_complete
}

main "$@"
