---
layout: page
title: 网络协议文档
permalink: /reading-takeaways/
---

# <img src='/images/icons/reading-takeaways.svg' alt='' class="icon"/>&nbsp;<span class='jump-effect'>网络协议文档</span>

<big>这里收集了我整理的网络协议文档，主要包括 NETCONF、YANG 等网络协议的 RFC 文档。</big>

<ul class="post-list">
  {% assign readings_posts = site.posts | where: "tags", "GitBook" | sort: "date" | reverse %}
  {% for post in readings_posts %}
    <li>
      <h2>
        <a href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
      </h2>
      <div class="post-meta">
        <span class="post-date">{{ post.date | date: "%Y-%m-%d" }}</span>
        {% if post.categories.size > 0 %}
        <span class="post-categories">
          分类：
          {% for category in post.categories %}
            <a href="/categories/#{{ category | slugify }}">{{ category }}</a>{% unless forloop.last %}, {% endunless %}
          {% endfor %}
        </span>
        {% endif %}
        {% if post.tags.size > 0 %}
        <span class="post-tags">
          标签：
          {% for tag in post.tags %}
            <a href="/tags/#{{ tag | slugify }}">{{ tag }}</a>{% unless forloop.last %}, {% endunless %}
          {% endfor %}
        </span>
        {% endif %}
      </div>
      <div class="post-excerpt">
        {{ post.excerpt }}
      </div>
      <a href="{{ post.url | relative_url }}" class="post-read-more">阅读更多 →</a>
    </li>
  {% endfor %}
</ul>

{% if readings_posts.size == 0 %}
<p>暂无文档。</p>
{% endif %}
