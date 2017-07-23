---
date: 2014-07-18
title: Talks
menu: main
---

## Papers We Love Too (mini): HyperLogLogs

https://www.meetup.com/papers-we-love-too/events/238325973/

## [Papers We Love: Failure Detectors](/post/2017-03-27-pwl-failure-detectors/)

The problem of consensus is central to many distributed systems algorithms. Failure detectors are central to the way we think about consensus algorithms. In a fully asynchronous system, the [FLP impossibility result](https://groups.csail.mit.edu/tds/papers/Lynch/jacm85.pdf) shows that no consensus solution that can tolerate crash failures exists! This simple, stunning result imposed a hard constraint on what could be solved in an asynchronous model.

The [FLP result](http://the-paper-trail.org/blog/a-brief-tour-of-flp-impossibility/) kicked off a flurry of research into ways to circumvent the impossibility result. Failure detectors were the most compelling abstraction proposed. These augmented the asynchronous model just enough to allow consensus, while retaining most of the neat abstractions that make asynchronous systems simple to reason about.

In this talk, I'll discuss some of the history and background of [Chandra and Toueg's failure detector proposal](http://courses.csail.mit.edu/6.852/08/papers/CT96-JACM.pdf), and discuss some failure detector mechanisms that followed the paper.

## [QConSF 2016: A Dark and Stormy Night - Operational Antipatterns](/post/2016-11-07-dark-and-stormy-night/)

> "It was a dark and stormy night; the rain fell in torrents — except at occasional intervals, when it was checked by a violent gust of wind which swept up the streets (for it is in London that our scene lies), rattling along the housetops, and fiercely agitating the scanty flame of the lamps that struggled against the darkness.”

This sentence exhibits so many writing antipatterns that it's inspired an entire literary competition for terrible opening sentences. It's complicated, repetitive, and barely gets its point across. In the same vein, common distributed system antipatterns have inspired many informal competitions—ops folk telling ghost stories around a bottle of whiskey. Building a large software system without an eye to operability can lead to disaster. If your system does what you want it to do today, but upgrading software packages takes months of engineering time, it's not doing what you want it to do a year from now.

This talk will introduce some common operational antipatterns, and a few tactics to help avoid shooting your future self in the foot. From a system with completely opaque fractal queues, a multitenant system with no circuit breakers, or a piece of software that requires hours of manual operations, expect a rapid-fire succession of stories and lessons that will terrify and delight!

## [Papers We Love Too: Shannon's Mathematical Theory of Communication](/post/2016-06-23-pwl-shannons-communication-theory/)

Shannon's [“A Mathematical Theory of Communication”](http://worrydream.com/refs/Shannon%20-%20A%20Mathematical%20Theory%20of%20Communication.pdf) is one of those rare papers that defined an entire field of study. (In fact, a year later, it was republished as “THE Mathematical Theory of Communication.”) It provided a unified understanding of communication systems, pulling together work from disparate disciplines like physics, electronics and telegraphy. 

In this paper, Shannon demonstrates that information is a measurable quantity, and transmission of information can be optimized to achieve fundamental, previously unknown limits. It's one of those papers that underlies so much of modern information theory that the material feels intensely familiar to readers now. In addition, it has a bunch of fun tidbits, including the great-grandfather of ebooks Twitter accounts.

I'll provide a quick history of the field before 1948, discuss the main results of the paper, and mention some of the fun (and occasionally counter-intuitive!) implications of the paper.

## [!!Con 2016: The Tales of the Cursed Operating Systems Textbook](/post/2016-05-06-tales-of-the-cursed-os-textbook/)

I also gave this talk at Stripe's Lightning Talks and Pies event, a few months later.

I have a cursed operating systems textbook — each chapter I read unearths a new bug in the systems I work on. Come hear my tales of woe:

- the chapter on kernel data structures that conjured up memory leaks INSIDE THE KERNEL!
- the catastrophic slowdown caused by the syscalls chapter, narrowly averted by the magic of strace!
- the networking chapter and the 200ms slowdown in EVERY network call we were making!
- AND MORE!

Along our journey, we’ll acquire some fantastic operating systems tools and incantations you can use to vanquish even the scariest bugs!

## [!!Con 2015: Bending the Laws of Physics! Or, How Wi-Fi Keeps Getting Faster.](/post/2015-05-16-bending-the-laws-of-physics/)
Shannon's Law tells you how fast you can transmit information over a channel with a given bandwidth and noise level. You just can't beat the limit — until we start talking about ways you can.

Learn how adding more antennas lets you squeeze more information out of the air! (Note: this is actually the coolest!) Along the way, we'll discuss what the silly numbers and letters on your router mean, and the fantastic bag of signal processing and programming tricks that lets you carry the internet around in your pocket!