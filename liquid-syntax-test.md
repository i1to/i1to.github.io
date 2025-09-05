---
layout: default
title: Liquid语法测试
permalink: /liquid-syntax-test/
---

# Liquid语法测试页面

这个页面用于测试Liquid语法修复的效果。

## 问题描述

GitHub Actions构建出现Liquid语法错误：
```
Liquid syntax error (line 24): Expected end_of_string but found id
```

## 问题原因

在 `index.html` 第28行的Liquid表达式中使用了单引号，但Liquid语法要求使用双引号：

```liquid
<!-- 错误的语法 -->
{% assign writings_posts = site.posts | where_exp: "post", "post.categories contains '网络技术' or post.categories contains '技术文档' or post.categories contains 'Technical Documentation'" | sort: "date" | reverse %}

<!-- 正确的语法 -->
{% assign writings_posts = site.posts | where_exp: "post", "post.categories contains \"网络技术\" or post.categories contains \"技术文档\" or post.categories contains \"Technical Documentation\"" | sort: "date" | reverse %}
```

## 修复内容

### 1. 修复引号问题
- 将单引号 `'` 改为转义的双引号 `\"`
- 确保Liquid语法正确

### 2. 语法说明
```liquid
where_exp: "post", "expression"
```
- 第一个参数：变量名（用双引号）
- 第二个参数：表达式（用双引号，内部字符串用转义双引号）

## 验证方法

### 1. 本地测试
```bash
jekyll build --safe --verbose
```

### 2. GitHub Actions
检查构建是否成功

### 3. 功能验证
确认文章筛选功能正常工作

## 技术细节

### Liquid语法规则
- 字符串必须用双引号包围
- 内部字符串使用转义双引号 `\"`
- 表达式中的逻辑操作符：`or`, `and`
- 字符串比较：`contains`

### 修复前后对比
```liquid
<!-- 修复前（错误） -->
post.categories contains '网络技术'

<!-- 修复后（正确） -->
post.categories contains \"网络技术\"
```

---

*测试时间: 2024年1月*
