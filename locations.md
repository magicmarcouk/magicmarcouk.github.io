---
layout: default
title: Areas Covered
description: Magic Marco performs close-up, table and stand-up magic for events across London and the South East.
---

Marco performs at weddings, private parties, corporate functions and special events across London and the South East. He regularly discusses travel, timings and venue practicalities as part of each enquiry, so include your event location or postcode when you get in touch.

## Location guides

{% assign areas = site.location | sort: "title" %}
{% for area in areas %}
- [{{ area.title }}]({{ area.url | relative_url }}) — {{ area.summary }}
{% endfor %}

These pages explain how Marco's close-up, table and stand-up magic can fit different kinds of events in each area. For exact availability and travel arrangements, [enquire about your date](#contact-direct).
