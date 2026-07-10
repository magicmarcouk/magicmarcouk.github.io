---
layout: default
title: Testimonials
description: Read feedback from wedding, party and corporate clients about Magic Marco's close-up and event magic.
---

Clients have invited Marco to entertain at weddings, private celebrations, exhibitions, awards dinners and corporate events. Here is some of the feedback they have shared.

<div class="w3-content w3-display-container">
	{% for image in site.data.gallery.testimonialimages %}
	<img class="mySlides" src="{{ image.url | relative_url }}" alt="" loading="lazy" decoding="async" style="margin:auto; width:auto; height:500px; max-width:100%; object-fit: cover;">
	{% endfor %}
</div>
{% include gallery.html %}
<br><br>

{% for test in site.data.testimonials %}

<div class="w3-cell-row"> 
    <div class="w3-col m3 l3 w3-cell w3-mobile">
	        <img src="{{ test.image | relative_url }}" alt="{{ test.author }} with Magic Marco" loading="lazy" decoding="async" style="width:100%;padding-bottom: 16px;">
    </div>
    <div class="w3-col m9 l9 w3-cell w3-mobile" style="padding-top:0px;padding-bottom: 0px; padding-left:16px; padding-right:16px">
        <p style="margin:0px;">"{{ test.text }}"</p>
        <b>{{ test.author }}</b>{% if test.affiliation %}, <i>{{ test.affiliation }} </i>{% endif %}
    </div>
</div>
<hr>
 
{% endfor %}

[**Enquire about Marco performing at your event**](#contact-direct).
