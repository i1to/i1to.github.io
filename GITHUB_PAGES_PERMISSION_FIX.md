# GitHub Pages 权限问题修复

## 问题描述
GitHub Actions 在部署到 GitHub Pages 时遇到权限错误：
```
remote: Permission to i1to/i1to.github.io.git denied to github-actions[bot].
fatal: unable to access 'https://github.com/i1to/i1to.github.io.git/': The requested URL returned error: 403
```

## 问题原因
1. **权限不足**: GitHub Actions 默认没有写入 `gh-pages` 分支的权限
2. **过时的部署方式**: 使用了已弃用的 `peaceiris/actions-gh-pages` 方式
3. **缺少必要的权限配置**: 没有在工作流中设置正确的权限

## 解决方案

### 1. 使用官方 GitHub Pages Actions
- 替换 `peaceiris/actions-gh-pages` 为官方的 `actions/deploy-pages`
- 使用 `actions/configure-pages` 和 `actions/upload-pages-artifact`

### 2. 设置正确的权限
```yaml
permissions:
  contents: read      # 读取仓库内容
  pages: write        # 写入 GitHub Pages
  id-token: write     # 用于身份验证
```

### 3. 分离构建和部署任务
- **build 任务**: 构建 Jekyll 网站
- **deploy 任务**: 部署到 GitHub Pages

### 4. 使用 GitHub Pages 环境
- 部署任务运行在 `github-pages` 环境中
- 自动获得正确的权限和配置

## 修复后的工作流特点

### ✅ 优势
- **官方支持**: 使用 GitHub 官方维护的 Actions
- **权限安全**: 最小权限原则，只授予必要的权限
- **更稳定**: 官方 Actions 更稳定可靠
- **更好的错误处理**: 提供更清晰的错误信息

### 🔧 技术改进
- **分离关注点**: 构建和部署分离，便于调试
- **并发控制**: 防止多个部署同时进行
- **环境隔离**: 使用专门的 GitHub Pages 环境

## 配置步骤

### 1. 仓库设置
确保在 GitHub 仓库的 Settings > Pages 中：
- Source 设置为 "GitHub Actions"
- 不是 "Deploy from a branch"

### 2. 权限设置
工作流会自动请求必要的权限，无需手动配置

### 3. 环境配置
`github-pages` 环境会自动创建，无需手动设置

## 预期结果
- GitHub Actions 构建和部署应该能够成功完成
- 网站会自动部署到 GitHub Pages
- 不再出现权限相关的错误

## 注意事项
- 首次使用新的部署方式可能需要几分钟来设置环境
- 如果仍有问题，请检查仓库的 Pages 设置
- 确保仓库是公开的（GitHub Pages 免费版要求）
