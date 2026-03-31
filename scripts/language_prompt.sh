#!/usr/bin/env bash
source "$(dirname "$0")/common.sh"

LANGUAGES=("node" "go" "rust")

prompt_languages() {
    echo -e "\n${YELLOW}Languages to install:${NC}"

    for lang in "${LANGUAGES[@]}"; do
        read -rp "  Install $lang? [y/n/a]: " choice
        case "$choice" in
            a)
                SELECTED=("${LANGUAGES[@]}")
                echo -e "  ${GREEN}✓${NC} All languages selected"
                echo ""
                return
                ;;
            y)
                SELECTED+=("$lang")
                echo -e "  ${GREEN}✓${NC} $lang added"
                ;;
            *)
                echo "  Skipping $lang"
                ;;
        esac
        echo ""
    done
}

confirm_selections() {
    if [ ${#SELECTED[@]} -eq 0 ]; then
        echo "No languages selected, skipping language installation."
        return 1
    fi

    echo -e "\n${YELLOW}The following languages will be installed:${NC}"
    for lang in "${SELECTED[@]}"; do
        echo "  • $lang"
    done

    read -rp $'\nProceed? [y/n]: ' confirm
    [[ "$confirm" == "y" ]]
}

install_languages() {
    local dir="$(dirname "$0")/languages"
    for lang in "${SELECTED[@]}"; do
        echo -e "\n${GREEN}Installing $lang...${NC}"
        bash "$dir/$lang.sh"
    done
}

