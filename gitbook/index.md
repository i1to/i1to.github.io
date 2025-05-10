---
layout: default
title: GitBook - 网络协议文档
permalink: /gitbook/
---

<div class="gitbook-index">
  <div class="gitbook-header">
    <h1>GitBook - 网络协议文档</h1>
    <p class="description">这里收集了我整理的网络协议文档，主要包括 NETCONF、YANG 等网络协议的 RFC 文档。</p>
  </div>

  <div class="gitbook-categories">
    {% for category in site.data.gitbook_config.categories %}
      <div class="category">
        <h2>{{ category.name }}</h2>
        <p>{{ category.description }}</p>
        <ul class="document-list">
          {% for doc in category.documents %}
            <li>
              <a href="{{ site.baseurl }}/gitbook/{{ doc.path }}" class="document-link">
                <span class="document-title">{{ doc.title }}</span>
                <span class="document-description">{{ doc.description }}</span>
              </a>
            </li>
          {% endfor %}
        </ul>
      </div>
    {% endfor %}
  </div>

  <div class="gitbook-features">
    <h2>文档特点</h2>
    <div class="features-grid">
      {% for feature in site.data.gitbook_config.features %}
        <div class="feature">
          <h3>{{ feature.name }}</h3>
          <p>{{ feature.description }}</p>
        </div>
      {% endfor %}
    </div>
  </div>

  <div class="gitbook-usage">
    <h2>如何使用</h2>
    <div class="usage-options">
      <div class="usage-option">
        <h3>在线阅读</h3>
        <p>直接点击上面的链接，在浏览器中阅读文档。</p>
      </div>

      <div class="usage-option">
        <h3>本地阅读</h3>
        <p>克隆 GitHub 仓库在本地查看：</p>
        <div class="code-block">
          <pre><code>git clone https://github.com/i1to/gitbooks.git
cd gitbooks
# 安装 GitBook CLI（如果尚未安装）
npm install -g gitbook-cli
# 启动 GitBook 服务器
gitbook serve</code></pre>
        </div>
      </div>
    </div>
  </div>

  <div class="gitbook-contribute">
    <h2>参与贡献</h2>
    <p>这些文档是开源的，欢迎您参与贡献：</p>
    <ul>
      <li>在 <a href="{{ site.data.gitbook_config.info.github_repo }}" target="_blank">GitHub</a> 上提交 Issue 报告错误或提出建议</li>
      <li>提交 Pull Request 修改或添加内容</li>
      <li>分享这些文档给更多需要的人</li>
    </ul>
  </div>
</div>

<style>
  .gitbook-index {
    max-width: 900px;
    margin: 0 auto;
    padding: 20px;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
  }

  .gitbook-header {
    text-align: center;
    margin-bottom: 40px;
  }

  .gitbook-header h1 {
    margin-bottom: 10px;
    color: #1a202c;
  }

  .gitbook-header .description {
    font-size: 1.2em;
    color: #4a5568;
    max-width: 700px;
    margin: 0 auto;
  }

  .gitbook-categories {
    margin-bottom: 40px;
  }

  .category {
    background-color: #f8f9fa;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  }

  .category h2 {
    margin-top: 0;
    color: #1a202c;
    border-bottom: 2px solid #e6ecf1;
    padding-bottom: 10px;
    margin-bottom: 15px;
  }

  .document-list {
    list-style-type: none;
    padding-left: 0;
  }

  .document-link {
    display: block;
    padding: 12px 15px;
    margin-bottom: 10px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    color: #1a202c;
    text-decoration: none;
    transition: all 0.2s ease;
  }

  .document-link:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    text-decoration: none;
  }

  .document-title {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
    color: #0366d6;
  }

  .document-description {
    display: block;
    font-size: 0.9em;
    color: #4a5568;
  }

  .gitbook-features {
    background-color: #f8f9fa;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 40px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  }

  .gitbook-features h2 {
    margin-top: 0;
    color: #1a202c;
    border-bottom: 2px solid #e6ecf1;
    padding-bottom: 10px;
    margin-bottom: 20px;
  }

  .features-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 20px;
  }

  .feature {
    background-color: #fff;
    border-radius: 5px;
    padding: 15px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
  }

  .feature h3 {
    margin-top: 0;
    color: #1a202c;
    font-size: 1.1em;
  }

  .feature p {
    margin-bottom: 0;
    color: #4a5568;
    font-size: 0.9em;
  }

  .gitbook-usage {
    background-color: #f8f9fa;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 40px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  }

  .gitbook-usage h2 {
    margin-top: 0;
    color: #1a202c;
    border-bottom: 2px solid #e6ecf1;
    padding-bottom: 10px;
    margin-bottom: 20px;
  }

  .usage-options {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 20px;
  }

  .usage-option {
    background-color: #fff;
    border-radius: 5px;
    padding: 15px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
  }

  .usage-option h3 {
    margin-top: 0;
    color: #1a202c;
  }

  .code-block {
    background-color: #272822;
    border-radius: 5px;
    padding: 15px;
    overflow-x: auto;
  }

  .code-block pre {
    margin: 0;
  }

  .code-block code {
    color: #f8f8f2;
    font-family: "SFMono-Regular", Consolas, "Liberation Mono", Menlo, monospace;
    font-size: 14px;
  }

  .gitbook-contribute {
    background-color: #f8f9fa;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  }

  .gitbook-contribute h2 {
    margin-top: 0;
    color: #1a202c;
    border-bottom: 2px solid #e6ecf1;
    padding-bottom: 10px;
    margin-bottom: 15px;
  }

  .gitbook-contribute ul {
    padding-left: 20px;
  }

  .gitbook-contribute li {
    margin-bottom: 10px;
  }

  .gitbook-contribute a {
    color: #0366d6;
    text-decoration: none;
  }

  .gitbook-contribute a:hover {
    text-decoration: underline;
  }

  @media (max-width: 768px) {
    .features-grid, .usage-options {
      grid-template-columns: 1fr;
    }
  }
</style>
