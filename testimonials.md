---
layout: default
title: Testimonials
---

<div class="w3-content w3-display-container">
	{% for image in site.data.gallery.testimonialimages %}
	<img class="mySlides" src="{{ site.url }}/{{ image.url}}" alt="{{ image.alt}}" style="margin:auto; width:auto; height:500px; object-fit: cover;">
	{% endfor %}
</div>
{% include gallery.html %}
<br><br>

{% for test in site.data.testimonials %}

<div class="w3-cell-row"> 
    <div class="w3-col m3 l3 w3-cell w3-mobile">
        <img src="{{ site.url }}/{{ test.image }}" alt="Magic Marco" style="width:100%;padding-bottom: 16px;"/>
    </div>
    <div class="w3-col m9 l9 w3-cell w3-mobile" style="padding-top:0px;padding-bottom: 0px; padding-left:16px; padding-right:16px">
        <p style="margin:0px;">"{{ test.text }}"</p>
        <b>{{ test.author }}</b>{% if test.affiliation %}, <i>{{ test.affiliation }} </i>{% endif %}
    </div>
</div>
<hr>
 
{% endfor %}




