@echo off
echo 🚀 启动 Jekyll 本地测试服务器...

REM 检查 Ruby 版本
echo 📋 检查 Ruby 版本...
ruby --version

REM 检查是否安装了 bundler
bundle --version >nul 2>&1
if errorlevel 1 (
    echo 📦 安装 Bundler...
    gem install bundler
)

REM 安装依赖
echo 📦 安装/更新依赖...
bundle install

REM 启动 Jekyll 服务器
echo 🌐 启动 Jekyll 服务器...
echo 📍 访问地址：
echo    主页: http://localhost:4000/
echo    文档首页: http://localhost:4000/docs/
echo    测试页面: http://localhost:4000/docs-test/
echo    RFC 文档: http://localhost:4000/docs/rfc/
echo.
echo 按 Ctrl+C 停止服务器
echo.

bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload

pause
