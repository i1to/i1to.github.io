#!/bin/bash

# 同步GitBook文档脚本
# 此脚本用于将gitbooks目录中的文档同步到gitbook目录

set -e

echo "开始同步GitBook文档..."

# 确保目录存在
mkdir -p gitbook

# 同步文件
echo "正在同步Markdown文件..."
find gitbooks -name "*.md" -not -path "*/\.git/*" | while read file; do
  # 获取相对路径
  rel_path=${file#gitbooks/}
  # 创建目标目录
  target_dir="gitbook/$(dirname "$rel_path")"
  mkdir -p "$target_dir"
  # 复制文件
  cp "$file" "gitbook/$rel_path"
  echo "已同步: $file -> gitbook/$rel_path"
done

# 同步图片和其他资源
echo "正在同步图片和其他资源..."
find gitbooks -type f -not -name "*.md" -not -path "*/\.git/*" | while read file; do
  # 获取相对路径
  rel_path=${file#gitbooks/}
  # 创建目标目录
  target_dir="gitbook/$(dirname "$rel_path")"
  mkdir -p "$target_dir"
  # 复制文件
  cp "$file" "gitbook/$rel_path"
  echo "已同步: $file -> gitbook/$rel_path"
done

# 确保每个文档目录都有index.md
echo "正在检查index.md文件..."
find gitbook -type d -not -path "gitbook" | while read dir; do
  if [ ! -f "$dir/index.md" ] && [ ! -f "$dir/README.md" ]; then
    # 创建默认的index.md
    title=$(basename "$dir" | tr '-' ' ' | sed 's/\b\(.\)/\u\1/g')
    cat > "$dir/index.md" << EOF
---
layout: gitbook-page
title: $title
---

# $title

此页面正在建设中...

请查看目录中的其他文档。
EOF
    echo "已创建默认index.md: $dir/index.md"
  fi
done

# 更新SUMMARY.md
echo "正在更新SUMMARY.md..."
cat > gitbook/SUMMARY.md << EOF
# 目录

* [首页](README.md)
EOF

find gitbook -name "*.md" -not -path "*/\.*" -not -path "*/node_modules/*" -not -path "*/SUMMARY.md" -not -path "*/README.md" | sort | while read file; do
  rel_path=${file#gitbook/}
  title=$(grep -m 1 "^# " "$file" | sed 's/^# //' || echo $(basename "$file" .md | tr '-' ' ' | sed 's/\b\(.\)/\u\1/g'))
  echo "* [$title]($rel_path)" >> gitbook/SUMMARY.md
done

echo "GitBook文档同步完成！"
