---
layout: page
title: GitBook - 网络协议文档
permalink: /gitbook-docs/
---

<div class="gitbook-home">
  <h1>GitBook - 网络协议文档</h1>

  <p class="gitbook-description">
    这里收集了我整理的网络协议文档，主要包括 NETCONF、YANG 等网络协议的 RFC 文档。
    这些文档经过精心翻译和注释，使原本晦涩的 RFC 规范变得更加易于理解。
  </p>

  <div class="gitbook-categories">
    <div class="category-box">
      <h2>NETCONF 协议</h2>
      <ul>
        <li><a href="{{ site.baseurl }}/gitbook/rfc6241/" target="_blank">NETCONF 配置协议 (RFC 6241)</a></li>
        <li><a href="{{ site.baseurl }}/gitbook/rfc-4742/" target="_blank">NETCONF over SSH (RFC 4742)</a></li>
        <li><a href="{{ site.baseurl }}/gitbook/rfc-5277/" target="_blank">NETCONF 事件通知 (RFC 5277)</a></li>
      </ul>
    </div>

    <div class="category-box">
      <h2>YANG 数据建模</h2>
      <ul>
        <li><a href="{{ site.baseurl }}/gitbook/rfc-6020/" target="_blank">YANG 数据建模语言 (RFC 6020)</a></li>
        <li><a href="{{ site.baseurl }}/gitbook/rfc-7950/" target="_blank">YANG 1.1 数据建模语言 (RFC 7950)</a></li>
        <li><a href="{{ site.baseurl }}/gitbook/rfc7223/" target="_blank">YANG 接口类型定义 (RFC 7223)</a></li>
      </ul>
    </div>

    <div class="category-box">
      <h2>YumaPro 相关文档</h2>
      <ul>
        <li><a href="{{ site.baseurl }}/gitbook/yumapro/" target="_blank">YumaPro 文档</a></li>
      </ul>
    </div>
  </div>

  <div class="gitbook-options">
    <div class="option-box">
      <h3>在线阅读</h3>
      <p>点击上面的链接直接在浏览器中阅读文档。每个文档都经过精心排版，适合在线阅读。</p>
      <a href="{{ site.baseurl }}/gitbook/" class="button">浏览所有文档</a>
    </div>

    <div class="option-box">
      <h3>本地阅读</h3>
      <p>您也可以克隆 GitHub 仓库在本地查看文档，适合离线阅读或进行修改。</p>
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

  <div class="gitbook-features">
    <h2>文档特点</h2>
    <ul>
      <li><strong>双语对照</strong>：原始 RFC 文本的英中翻译，方便对照理解</li>
      <li><strong>注释解释</strong>：关键概念的解释和注释，帮助理解复杂内容</li>
      <li><strong>实例说明</strong>：实际应用示例和最佳实践，便于实际操作</li>
      <li><strong>问题解答</strong>：常见问题和解决方案，解决实际应用中的困惑</li>
    </ul>
  </div>

  <div class="gitbook-contribute">
    <h2>参与贡献</h2>
    <p>
      这些文档是开源的，欢迎您参与贡献。您可以通过以下方式参与：
    </p>
    <ul>
      <li>在 GitHub 上提交 Issue 报告错误或提出建议</li>
      <li>提交 Pull Request 修改或添加内容</li>
      <li>分享这些文档给更多需要的人</li>
    </ul>
    <a href="https://github.com/i1to/gitbooks" class="button" target="_blank">GitHub 仓库</a>
  </div>
</div>

<style>
  .gitbook-home {
    max-width: 900px;
    margin: 0 auto;
    padding: 20px;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
  }

  .gitbook-description {
    font-size: 1.2em;
    line-height: 1.6;
    color: #555;
    margin-bottom: 30px;
  }

  .gitbook-categories {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    margin-bottom: 40px;
  }

  .category-box {
    flex: 1;
    min-width: 250px;
    background-color: #f8f9fa;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  }

  .category-box h2 {
    margin-top: 0;
    color: #333;
    border-bottom: 2px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 15px;
  }

  .category-box ul {
    list-style-type: none;
    padding-left: 0;
  }

  .category-box li {
    margin-bottom: 10px;
  }

  .category-box a {
    color: #0366d6;
    text-decoration: none;
    display: block;
    padding: 5px 0;
    transition: all 0.2s ease;
  }

  .category-box a:hover {
    color: #0246a2;
    transform: translateX(5px);
  }

  .gitbook-options {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    margin-bottom: 40px;
  }

  .option-box {
    flex: 1;
    min-width: 300px;
    background-color: #f8f9fa;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  }

  .option-box h3 {
    margin-top: 0;
    color: #333;
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

  .button {
    display: inline-block;
    background-color: #0366d6;
    color: white;
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none;
    margin-top: 10px;
    transition: background-color 0.2s ease;
  }

  .button:hover {
    background-color: #0246a2;
    text-decoration: none;
    color: white;
  }

  .gitbook-features, .gitbook-contribute {
    background-color: #f8f9fa;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 30px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  }

  .gitbook-features h2, .gitbook-contribute h2 {
    margin-top: 0;
    color: #333;
    border-bottom: 2px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 15px;
  }

  .gitbook-features ul, .gitbook-contribute ul {
    padding-left: 20px;
  }

  .gitbook-features li, .gitbook-contribute li {
    margin-bottom: 10px;
    line-height: 1.6;
  }
</style>
