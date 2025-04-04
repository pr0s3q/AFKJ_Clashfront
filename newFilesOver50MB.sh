RED_BOLD='\033[1;31m'  # Bold Red
NC='\033[0m'           # No color (reset)

git diff --cached --name-only --diff-filter=A | while read file; do
    size=$(stat --format="%s" "$file")
    if [[ $size -gt 52428800 ]]; then
        echo -e "${RED_BOLD}$file - $((size / 1024 / 1024))MB${NC}"
    fi
done
