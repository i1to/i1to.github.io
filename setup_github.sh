#!/bin/bash

# 博客与GitHub联动设置脚本

echo "欢迎使用博客与GitHub联动设置脚本！"
echo "本脚本将帮助您初始化Git仓库并推送到GitHub。"
echo ""

# 检查是否已安装Git
if ! command -v git &> /dev/null; then
    echo "错误：未安装Git。请先安装Git后再运行此脚本。"
    exit 1
fi

# 检查是否已初始化Git仓库
if [ ! -d ".git" ]; then
    echo "正在初始化Git仓库..."
    git init
    echo "Git仓库初始化完成。"
else
    echo "Git仓库已存在。"
fi

# 询问GitHub用户名
read -p "请输入您的GitHub用户名: " username
if [ -z "$username" ]; then
    echo "错误：GitHub用户名不能为空。"
    exit 1
fi

# 检查远程仓库是否已配置
if git remote -v | grep -q "origin"; then
    echo "远程仓库已配置。"
    read -p "是否要重新配置远程仓库？(y/n): " reconfigure
    if [ "$reconfigure" = "y" ]; then
        git remote remove origin
        git remote add origin "https://github.com/$username/$username.github.io.git"
        echo "远程仓库已重新配置为 https://github.com/$username/$username.github.io.git"
    fi
else
    echo "正在配置远程仓库..."
    git remote add origin "https://github.com/$username/$username.github.io.git"
    echo "远程仓库已配置为 https://github.com/$username/$username.github.io.git"
fi

# 添加所有文件到暂存区
echo "正在添加文件到Git..."
git add .

# 提交更改
read -p "请输入提交信息（默认：'Initial commit'）: " commit_message
if [ -z "$commit_message" ]; then
    commit_message="Initial commit"
fi
git commit -m "$commit_message"

# 推送到GitHub
echo "正在推送到GitHub..."
git push -u origin master

if [ $? -eq 0 ]; then
    echo ""
    echo "成功！您的博客已推送到GitHub。"
    echo "请访问 https://github.com/$username/$username.github.io 查看您的仓库。"
    echo "您的博客将在几分钟后可通过 https://$username.github.io 访问。"
    echo ""
    echo "请确保在GitHub仓库的Settings > Pages中将部署源设置为GitHub Actions。"
else
    echo ""
    echo "推送失败。请检查您的GitHub凭据和网络连接。"
    echo "您也可以手动推送："
    echo "git push -u origin master"
fi
