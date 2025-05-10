# 将博客与GitHub联动的步骤

本文档介绍如何将您的Jekyll博客与GitHub联动，实现自动部署到GitHub Pages。

## 前提条件

1. 已有GitHub账户
2. 已安装Git
3. 已有Jekyll博客项目

## 步骤1：创建GitHub仓库

如果您还没有为博客创建GitHub仓库，请按照以下步骤操作：

1. 登录您的GitHub账户
2. 点击右上角的"+"图标，选择"New repository"
3. 仓库名称设置为：`username.github.io`（将username替换为您的GitHub用户名）
4. 选择公开仓库（Public）
5. 点击"Create repository"

## 步骤2：初始化本地Git仓库并推送到GitHub

如果您的博客项目还没有初始化Git，请在博客项目根目录执行以下命令：

```bash
# 初始化Git仓库
git init

# 添加所有文件到暂存区
git add .

# 提交更改
git commit -m "Initial commit"

# 添加远程仓库
git remote add origin https://github.com/username/username.github.io.git

# 推送到GitHub
git push -u origin master
```

注意：将`username`替换为您的GitHub用户名。

## 步骤3：配置GitHub Pages

1. 在GitHub上打开您的仓库
2. 点击"Settings"选项卡
3. 在左侧菜单中找到"Pages"
4. 在"Source"部分，选择"GitHub Actions"
5. 这将使用我们已经配置好的GitHub Actions工作流来构建和部署您的博客

## 步骤4：验证部署

1. 推送更改后，GitHub Actions会自动运行工作流
2. 您可以在仓库的"Actions"选项卡中查看工作流运行状态
3. 部署完成后，您的博客将可以通过`https://username.github.io`访问

## 日常使用流程

每次您对博客进行更改后，只需执行以下命令将更改推送到GitHub：

```bash
# 添加更改的文件
git add .

# 提交更改
git commit -m "描述您的更改"

# 推送到GitHub
git push
```

推送后，GitHub Actions会自动构建和部署您的博客。

## 故障排除

如果您遇到部署问题，请检查：

1. GitHub Actions工作流日志中的错误信息
2. 确保您的Jekyll配置正确
3. 确保您的仓库名称格式为`username.github.io`
4. 检查您的`_config.yml`文件中的`url`和`baseurl`设置

## 其他提示

1. 您可以在本地使用`bundle exec jekyll serve`预览更改
2. 使用分支管理不同的功能开发
3. 考虑使用自定义域名（在GitHub Pages设置中配置）
