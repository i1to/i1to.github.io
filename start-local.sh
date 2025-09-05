#!/bin/bash

# Jekyll 本地测试启动脚本
echo "🚀 启动 Jekyll 本地测试服务器..."

# 检查 Ruby 版本
echo "📋 检查 Ruby 版本..."
ruby --version

# 检查是否安装了 bundler
if ! command -v bundle &> /dev/null; then
    echo "📦 安装 Bundler..."
    gem install bundler
fi

# 检查 Gemfile.lock 是否存在
if [ ! -f "Gemfile.lock" ]; then
    echo "⚠️  未找到 Gemfile.lock，正在安装依赖..."
    bundle install
else
    echo "📦 更新依赖..."
    bundle update
fi

# 启动 Jekyll 服务器
echo "🌐 启动 Jekyll 服务器..."
echo "📍 访问地址："
echo "   主页: http://localhost:4000/"
echo "   文档首页: http://localhost:4000/docs/"
echo "   测试页面: http://localhost:4000/docs-test/"
echo "   RFC 文档: http://localhost:4000/docs/rfc/"
echo ""
echo "按 Ctrl+C 停止服务器"
echo ""

bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload
