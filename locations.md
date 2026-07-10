---
layout: default
title: Areas Covered
description: Magic Marco is based in London and performs close-up, table and stand-up magic for events across the UK and abroad.
---

Marco is based in London and regularly performs at weddings, private parties, corporate functions and special events across the UK and abroad. The location guides below highlight some of his core service areas, with wider UK and international bookings welcomed by arrangement. If your event is elsewhere, include the venue or postcode when you enquire so Marco can confirm availability, travel arrangements and timings.

## Location guides

{% assign areas = site.location | sort: "title" %}
{% for area in areas %}
- [{{ area.title }}]({{ area.url | relative_url }}) — {{ area.summary }}
{% endfor %}

These pages explain how Marco's close-up, table and stand-up magic can fit different kinds of events in each area. For exact availability, UK-wide travel or international bookings, [enquire about your date](#contact-direct).
