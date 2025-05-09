---
layout: page
title: 归档
permalink: /archives/
---

## 按年份归档

{% assign postsByYear = site.posts | group_by_exp:"post", "post.date | date: '%Y'" %}
{% for year in postsByYear %}
<h3>{{ year.name }}年</h3>
<ul>
  {% for post in year.items %}
    <li>
      <span class="post-meta">{{ post.date | date: "%m-%d" }}</span>
      <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
{% endfor %}

## 按月份归档

{% assign postsByYearMonth = site.posts | group_by_exp:"post", "post.date | date: '%Y-%m'" %}
{% for yearMonth in postsByYearMonth %}
  {% assign ym = yearMonth.name | split: "-" %}
  <h3>{{ ym[0] }}年{{ ym[1] }}月</h3>
  <ul>
    {% for post in yearMonth.items %}
      <li>
        <span class="post-meta">{{ post.date | date: "%d日" }}</span>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      </li>
    {% endfor %}
  </ul>
{% endfor %}
