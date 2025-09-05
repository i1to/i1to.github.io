---
layout: default
title: Liquid语法修复测试
permalink: /liquid-syntax-fix-test/
---

# Liquid语法修复测试页面

这个页面用于测试Liquid语法修复的效果。

## 问题描述

GitHub Actions构建失败，可能是由于复杂的Liquid表达式导致的语法错误。

## 修复方案

### 1. 简化Liquid表达式
**文件**: `index.html`

```liquid
<!-- 修复前（复杂表达式） -->
{% assign writings_posts = site.posts | where_exp: "post", "post.categories contains \"网络技术\" or post.categories contains \"技术文档\" or post.categories contains \"Technical Documentation\"" | sort: "date" | reverse %}

<!-- 修复后（简化表达式） -->
{% assign writings_posts = site.posts | where: "categories", "网络技术" | sort: "date" | reverse %}
```

### 2. 修复说明
- 使用简单的 `where` 过滤器而不是复杂的 `where_exp`
- 只筛选"网络技术"分类的文章
- 避免复杂的字符串转义问题

## 当前显示的文章

现在"技术文章"部分会显示：
- **SONiC与SDNoS架构深度解析** (网络技术) ✅

## 如果需要显示其他技术文章

如果需要在"技术文章"部分显示其他分类的文章，可以：

1. **修改文章分类**: 将其他技术文章的分类改为"网络技术"
2. **添加多个筛选**: 使用多个 `assign` 语句
3. **使用标签筛选**: 为技术文章添加统一的标签

## 验证方法

### 1. 检查构建状态
- GitHub Actions 构建应该成功
- 没有 Liquid 语法错误

### 2. 检查文章显示
- SONiC 文章应该正确显示
- 页面布局正常

### 3. 检查功能
- 文章链接正常工作
- 排序正确（按日期倒序）

---

*测试时间: 2024年1月*
