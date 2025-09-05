# 本地测试指南

## 🚀 快速开始

### 方法一：使用启动脚本（推荐）

#### Linux/macOS
```bash
./start-local.sh
```

#### Windows
```cmd
start-local.bat
```

### 方法二：手动命令

#### 1. 安装依赖
```bash
# 安装 Bundler（如果未安装）
gem install bundler

# 安装项目依赖
bundle install
```

#### 2. 启动服务器
```bash
# 启动 Jekyll 服务器
bundle exec jekyll serve

# 或者使用更多选项
bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload
```

## 📍 访问地址

启动成功后，可以通过以下地址访问：

- **主页**: http://localhost:4000/
- **文档首页**: http://localhost:4000/docs/
- **测试页面**: http://localhost:4000/docs-test/
- **RFC 文档**: http://localhost:4000/docs/rfc/
- **SONiC 文档**: http://localhost:4000/docs/sonic/
- **博客架构说明**: http://localhost:4000/blog-architecture.html

## 🔧 常用命令

### 构建静态网站
```bash
# 构建网站到 _site 目录
bundle exec jekyll build

# 构建并显示详细信息
bundle exec jekyll build --verbose
```

### 清理缓存
```bash
# 清理 Jekyll 缓存
bundle exec jekyll clean

# 清理并重新构建
bundle exec jekyll clean && bundle exec jekyll build
```

### 检查语法
```bash
# 检查 Markdown 语法
bundle exec jekyll doctor

# 检查配置
bundle exec jekyll doctor --config _config.yml
```

## 🐛 故障排除

### 1. Ruby 版本问题
```bash
# 检查 Ruby 版本
ruby --version

# 如果版本过低，建议使用 rbenv 或 rvm 安装新版本
# 使用 rbenv
rbenv install 3.0.0
rbenv local 3.0.0

# 使用 rvm
rvm install 3.0.0
rvm use 3.0.0
```

### 2. 依赖安装问题
```bash
# 清理并重新安装
rm -rf vendor/
bundle clean --force
bundle install

# 或者使用系统 gems
bundle install --system
```

### 3. 端口被占用
```bash
# 使用不同端口
bundle exec jekyll serve --port 4001

# 或者杀死占用端口的进程
lsof -ti:4000 | xargs kill -9
```

### 4. 权限问题
```bash
# 给脚本执行权限
chmod +x start-local.sh

# 或者直接运行
bash start-local.sh
```

## 📱 移动端测试

### 1. 局域网访问
```bash
# 启动服务器，允许局域网访问
bundle exec jekyll serve --host 0.0.0.0 --port 4000
```

然后使用手机访问：`http://你的IP地址:4000`

### 2. 获取本机 IP
```bash
# Linux/macOS
ifconfig | grep "inet " | grep -v 127.0.0.1

# Windows
ipconfig | findstr "IPv4"
```

## 🔍 调试技巧

### 1. 启用详细输出
```bash
bundle exec jekyll serve --verbose
```

### 2. 检查构建日志
```bash
bundle exec jekyll build --trace
```

### 3. 检查特定页面
```bash
# 只构建特定页面
bundle exec jekyll build --limit_posts 1
```

### 4. 实时重载
```bash
# 启用实时重载（文件变化时自动刷新）
bundle exec jekyll serve --livereload
```

## 📊 性能优化

### 1. 增量构建
```bash
# 只构建更改的文件
bundle exec jekyll serve --incremental
```

### 2. 禁用插件
```bash
# 禁用所有插件（加快构建速度）
bundle exec jekyll serve --no-plugins
```

### 3. 限制文章数量
```bash
# 只构建前 5 篇文章
bundle exec jekyll serve --limit_posts 5
```

## 🛠️ 开发工具

### 1. 代码编辑器
推荐使用支持 Jekyll 的编辑器：
- **VS Code** + Jekyll 扩展
- **Atom** + Jekyll 包
- **Sublime Text** + Jekyll 插件

### 2. 浏览器工具
- **Chrome DevTools** - 调试响应式设计
- **Firefox Developer Tools** - 检查 CSS 和 JavaScript
- **Safari Web Inspector** - 移动端调试

### 3. 命令行工具
- **httpie** - 测试 API
- **curl** - 检查页面响应
- **wget** - 下载页面内容

## 📝 注意事项

1. **文件监听**: Jekyll 会自动监听文件变化并重新构建
2. **缓存清理**: 如果样式没有更新，尝试清理缓存
3. **端口冲突**: 确保 4000 端口没有被其他程序占用
4. **路径问题**: 确保在项目根目录运行命令
5. **权限问题**: 确保有足够的文件读写权限

## 🆘 获取帮助

如果遇到问题，可以：

1. 查看 Jekyll 官方文档：https://jekyllrb.com/docs/
2. 检查 GitHub Issues：https://github.com/jekyll/jekyll/issues
3. 查看项目 README：https://github.com/i1to/i1to.github.io
4. 提交 Issue 到项目仓库

---

*最后更新：2024年1月*
