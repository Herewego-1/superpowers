#!/usr/bin/env bash
# install-global-claude.sh
# vive-md/personalization/global-claude.md 를 ~/.claude/CLAUDE.md 로 설치

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SUPERPOWERS_DIR="$(dirname "$SCRIPT_DIR")"
VIVE_MD_DIR="$(dirname "$SUPERPOWERS_DIR")/vive-md"
SOURCE="$VIVE_MD_DIR/personalization/global-claude.md"
TARGET="$HOME/.claude/CLAUDE.md"

if [ ! -f "$SOURCE" ]; then
  echo "ERROR: 소스 파일을 찾을 수 없습니다: $SOURCE"
  echo "vive-md 레포가 $VIVE_MD_DIR 경로에 있는지 확인해주세요."
  exit 1
fi

mkdir -p "$HOME/.claude"

if [ -f "$TARGET" ]; then
  BACKUP="$TARGET.backup.$(date +%Y%m%d_%H%M%S)"
  cp "$TARGET" "$BACKUP"
  echo "기존 CLAUDE.md 백업: $BACKUP"
fi

cp "$SOURCE" "$TARGET"
echo "설치 완료: $TARGET"
echo ""
echo "다음 Claude Code 세션부터 개인화 설정이 자동 적용됩니다."
echo "설정 확인: cat ~/.claude/CLAUDE.md"
