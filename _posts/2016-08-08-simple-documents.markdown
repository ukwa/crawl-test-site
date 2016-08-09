---
layout: post
title:  "Simple Text Documents"
categories: documents
date:   2016-08-08 17:13:53 +0000
---

This page just lists some simple documents that can be used to test document harvesting behaviours. 

<ul>
{% for file in site.static_files %}
  {% if file.path contains "/resources/documents/" %}
     <li><a href="{{ site.baseurl }}{{ file.path }}">{{ file.path }}</a></li>
  {% endif %}
{% endfor %}
</ul>

## Variatio Ipsius ##

The _lorem upsum_ documents are derived from the plain text version, imported and converted into various formats.
