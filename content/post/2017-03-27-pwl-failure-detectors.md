---
date: 2017-03-27
title: "Papers We Love: Failure Detectors"
layout: "post"
tags: [talks, failure detectors, distsys]
---

I gave this talk at [Papers We Love, March 2016](http://paperswelove.org/2017/video/kiran-bhattaram-failure-detectors/).

## Abstract

The problem of consensus is central to many distributed systems algorithms. Failure detectors are central to the way we think about consensus algorithms. In a fully asynchronous system, the [FLP impossibility result](https://groups.csail.mit.edu/tds/papers/Lynch/jacm85.pdf) shows that no consensus solution that can tolerate crash failures exists! This simple, stunning result imposed a hard constraint on what could be solved in an asynchronous model.

The [FLP result](http://the-paper-trail.org/blog/a-brief-tour-of-flp-impossibility/) kicked off a flurry of research into ways to circumvent the impossibility result. Failure detectors were the most compelling abstraction proposed. These augmented the asynchronous model just enough to allow consensus, while retaining most of the neat abstractions that make asynchronous systems simple to reason about.

In this talk, I'll discuss some of the history and background of [Chandra and Toueg's failure detector proposal](http://courses.csail.mit.edu/6.852/08/papers/CT96-JACM.pdf), and discuss some failure detector mechanisms that followed the paper.


### Bio

[Kiran](https://kiranbot.com) ([@kiranb](https://twitter.com/kiranb)) is a software engineer at [Stripe](https://stripe.com). At work, she's thinks a lot about [distributed systems fallacies](https://kiranbot.com/fallacies) and how we can observe what our software is doing. A normal day working with Kiran involves conversations about operating distributed systems and learning that she made that awesome space dress she's wearing.

## Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/lwgH2GEos8k?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>

## Slides

<script async class="speakerdeck-embed" data-id="d7745c52050d49e3aa604d6c05cd2233" data-ratio="1.77777777777778" src="//speakerdeck.com/assets/embed.js"></script>