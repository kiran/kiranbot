---
date: 2017-10-27
title: "A brief tour of sketching data structures"
layout: "post"
draft: true
tags: [talks, sketches, data structures, distsys]
---

This is a cleaned-up and edited version of a talk I gave at Velocity London and Forge.

## Abstract

## Table of Contents

1. Motivation: the system model, and three motivating problems
1. Statistical trickery
1. Solving problems: bloom filter, heavy hitters, hlls, t-digests
1. Two large-scale production systems at Stripe
1. Where to go from here

## Motivation

Keeping counts about things is one of the most essential parts of computing. At heart, every computer system boils down to counts and calculations -- whether the system's counting payments, current users, error counts, or searches. 

> While new technologies allow the scale and granularity of events being monitored to increase by orders of magnitude, the capacity of computing elements (processors, memory, and disks) to make sense of these is barely increasing.

I'll illustrate the utility of sketches with three quick motivating problems:

1. determining whether a URL is malicious
1. counting how many unique ??? a ??? contains
1. determining the top IP addresses the system's seeing traffic from
1. reporting the 99th percentile of latency from across 1k servers

-- a note about exact counts here:
Each of these three problems has a fairly intuitive algorithm for producing exact counts -- you tally up the total number of IP addresses in a histogram, and pick off the top 3, for example. These problems become interesting when they start to hit scale issues: when the number of IP addresses becomes to large to hold in memory, or when the computational load of adding the numbers up together results in an unacceptable latency. Sketches enable us to build systems that are otherwise unrealistic.

A note about reading these papers -- depends on your tolerance for statistics.

But also! It's not just that these are performant algorithms. The little statistical tricks these algorithms use are truly delightful -- working through the math is like watching a little magic trick unfold!

-- introduce trading off accuracy for performance

## Statistical trickery: what is a sketch

Sketches are part of a family of probabilistic algorithms, which trade off performance for a bounded error rate. Sketching data structures specifically store a summary of a data set, in order to calculate a particular summary statistic about the data.

There are several types sketches, but here, I'll focus on algorithms that are linear transforms on the input. This feature means that they parallelize neatly -- they're commutative, so they can be combined in arbitrary orders, and associative, so they can be recombined.

This lends itself well to tiered aggregation layers.

> “Sketching” data structures store a summary of a data set in situations where the whole data would be prohibitively costly to store (at least in a fast-access place like the memory as opposed to the hard disk). 

> The main feature of sketching data structures is that they can answer certain questions about the data extremely efficiently, at the price of the occasional error. The best part is that the probability of an error can be quantified and the programmer can trade off the expected error rate with the amount of resources (storage, time) afforded. At the limit of this trade-off (when no error is allowed) these sketching structures collapse into traditional data structures.

### an aside: why not just sample?

### statistical properties

At heart, every probabilistic algorithm exploits the underlying statistical properties of the data stream to infer some qualities about the stream itself. People in the audience familiar with statistical mechanics are probably nodding vigorously right now. :)

Successful applications of sketching involve a mixture of algorithmic tricks, systems know-how, and mathematical insight.

-- talk about randomness and hashing

Most probabilistic algorithms require a uniformly distributed input, which hashing enables.

Now that we know that this family of algorithms exists, let's dig into how a few specific ones work.

## Bloom Filters and Routing

I'm going to start this by talking about the most widely known probabilistic data structure -- the Bloom filter. I'll be going a little fast here, since this is one that's fairly well-known.

Burton Bloom introduced Bloom filters in the 1970s, and they've been used for a variety of different applications for databases. 

ex: "is this URL malicious?"
ex: "have we seen this data before?"
> e. Many large distributed databases (Google's Bigtable, Apache's Cassandra and HBase) use Bloom filters as indexes on distributed chunks of data. They use the filter to keep track of which rows or columns of the database are stored on disk, thus avoiding a (costly) disk access for nonexistent attributes.
ex: speeding up joins (send a bloom filter of the data to join, then have the second table return the list that satisfies that filter)

"is this URL malicious" -- how wide of a bitmap/hash table would you need to list all malicious URLs?

Let's say that we have a database of 100k malicious URLs. The most naive solution to handle this would be to put all the URLs in a list, and iterate over the list every time we're checking a URL. This is kind of excessively naive.

We don't particularly care about the order of the elements here -- this data could be stored in a hash-set instead. The system would instantiate a bitmap of a certain size, then hash the URL, then set the bit to 1 if the URL is in the member. This runs the risk of hash collisions, leading to false positives, but that's a mostly acceptable/mitigatable risk. If you end up with a positive result, the system could make a quick RTT to the server to determine for sure that the URL is in the database. The vast majority of URLs people visit fall into the non-malicious category, so performance isn't really affected much.

This general technique could be extended more -- storing a hash-set of about 10MB (TK: double-check the size) is a heavy memory overhead. Bloom's unique insight was multiply hashing the entry: instead of setting a single bit, the Bloom filter hashes the entry k times, and sets all k bits to 1.

During lookup, you're looking for all the k bits to be set to 1 for a positive result.

> The Bloom filter principle: Wherever a list or set is used, and space is at a premium, consider using a Bloom filter if the effect of false positives can be mitigated.

## Heavy Hitters and DDoS


## HyperLogLogs and ??

## t-digests and histograms

Error rates don't have to be consistent across the distribution, also. T-digests have an error function that looks like an arctangent, so error rates are much lower at the ends of the distribution, which is often what you care about. So the 95th & 99th percentile are fairly accurate, but the 64th might be somewhat off.

## Putting this together: Veneur

Statsd --> Veneur
My team runs the metrics pipeline for monitoring our services. We started by setting up statsd, which runs a single node process that aggregates all of the sources in a single node thread. Unsurprisingly, this started hitting scaling issues, so we moved to a system where each node forwards data directly to the metrics storage servers.

We needed global histograms, but were running enough metrics through that aggregating metrics across all the servers wouldn't be easily managed. Unfortunately, histogram calculation also isn't a linear transformation, so you can't process parts of the data for a single key down.

Enter t-digests!
Also Hlls

Building a performant metrics pipeline

## Putting it together: Summingbird/machine learning infrastructure

Counting: count-min sketches
Hyperloglogs, etc

## Where to go from here

### Evaluating sketches

- performance
- error rate
- distortion

### implementing sketches

### Conclusion

In conclusion, sketches and probabilistic algorithms are a very powerful building block for robust and performant distributed systems. Understanding tolerances and performance tradeoffs is one of the core skills of engineering systems, etc etc.

When designing systems, if exact answers aren't strictly required (and they often aren't!), consider hunting around for a sketch that might solve the same problems.

The impressively sublinear performance improvement that some sketches provide is breathtaking. They interact well with classic distributed system patterns -- parallelism, tiered aggregation, etc. They can be easily plugged into existing distributed computation tools -- you could write a map-reduce job that computes a sketch, instead, and have a job that runs 100s of times faster, using fewer resources.

## Bibliography

- Graham Cormode's article for ACM Queue: http://queue.acm.org/detail.cfm?id=3104030
- Andrei Broder and Michael Mitzenmacher's survey of Bloom Filters and their uses in network systems
- Kiip's overview of sketching systems: http://blog.kiip.me/engineering/sketching-scaling-part-1-what-the-is-sketching/