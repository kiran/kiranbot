---
date: 2016-07-27
title: "A History of Storage Media: Williams Tube"
draft: true
tags: [computers, history of technology, storage]
---

Last post, we described the fairly ubiquitous punch card. That was a write-once mechanical mechanism for storing information data. While mechanical memory worked well, it's a fairly slow mechanism.

We'll pick up the story in Manchester, which was a The Williams-Kilburn tube was the first entirely electriconic memory mechanism.

The Manchester Baby (https://www.youtube.com/watch?v=SpqayTc_Gcw)

## Williams tube

The first cathode ray tube with a scanning device was invented just before the turn of the 20th century. They were soon used widely for oscilloscopes, and became ubiquitous in radar systems during the Second World War. Cathode ray tubes became a common way to display electrical information.

The Williams-Kilburn tube was a cathode ray tube used as computer memory. The electrostatic tube could store from 512 to 2048 bits of data as dots on the screen. It's a very introspectable data storage mechanism!

> this early random-access memory was used in several early computers.

It was the first entirely electronic memory -- no mechanical structures here!


## how it works

> It used a cathode ray tube (similar to older televisions!) to store a bit as a dot on the screen's surface. Each dot lasted a fraction of a second before fading, so the information was constantly refreshed.

> Information was read by a metal pickup plate that would detect a change in electrical charge.

The Williams-Kilburn tube had a metal pickup plate that stood in front of the phosphorescent screen. The electron beam would write a 1 to all the registers on the screen. If there was a 1 written there already, it would do nothing. If there was a 0 there, it would induce a small current in the pickup plate.

After this destructive read, the beam would rewrite the data back to the screen.

## uses

> The MANIAC computer, which did hydrogen bomb design calculations, used 40 of these tubes to store 1024 40-bit numbers.

## Punch cards

All right, this was a bit of a bait and switch. Punch cards aren't really a strange storage medium, but they are among the earliest, and have had some fantastic historical applications!

### Jacquard looms

Many early ancestors of computers were controlled by punchcards, or similar mechanisms.
The ancestor of these machines, in turn, was the Jacqard loom. This loom, which automated the production of elaborately woven textiles, was the first machine to use punch cards as an automated instruction sequence.

First -- a bit of background information about weaving patterns and how it can be automated.

{{<figure class="right medium" src="/images/punch-cards/Warp-and-Weft.gif">}}[^4]

Most fabric is woven with 2 sets of yarn that are perpendicular to each other. The first set of threads, the warp, is stretched out over a loom, and the second set, the weft, is passed either over or under the threads of the warp to form the fabric. This over-under means that the operation is easily represented by binary information. Changing the order of the over-under produces different kinds of designs.

In the following example of a woven design, the warp is white, and the weft is blue. To weave in a zigzag pattern, the loom raises the first 2 threads, drops the second 2, raises the next 2, and so on, across the warp. Then, the weft is passed through the warp, weaving in the first thread. This is repeated across the next few rows, until we start to see a zigzag pattern appear. (Fun fact -- this diagonal weave is called a twill weave, which is what most denims and chinos are!)

Although weaving can be very intricate, this particular kind has 2 simple operations, repeated according to very specific patterns. Computers excel at simple and repetitive work!

{{<figure class="left" src="/images/punch-cards/weaving.png">}}

Before the Jacquard loom, this process of raising and lowering threads was done by hand, on a drawloom. One person ran by and positioned all the threads for the warp, and another person passed the weft through. This was an incredibly slow and labor-intensive process. A warp might be about 2000 threads wide, so drawing out a detailed pattern in fabric would require making decisions about raising or lowering thousands of threads, thousands of times. A very experienced weaving team might get through a couple of rows every minute, so an inch of fabric would take about a day to produce. For context, a ball gown might take up to 3 yards of fabric, which represents about 100 working days of brocade weaving!

{{<figure src="/images/punch-cards/portrait.jpg" caption="A portrait of Jacquard woven on a loom." class="medium right">}}

Around 1803, Joseph-Marie Jacquard -- who lived in Lyons, France, a city with a huge silk weaving industry -- started building a prototype for a loom that could automate the production of decorated cloth. The Jacquard loom wove elaborate silk patterns by reading patterns off a series of replaceable punched cards. The cards that controlled the mechanism could be chained together, so complex patterns of any length could be programmed in.

Twill weaves, like the one above, are fairly easy and repeatable patterns, and it's a trivial example of what you could weave on an automated loom. The special power of the Jacquard loom comes from its ability to independently control almost every warp end.[^2] This is pretty insane! You could weave all sorts of very detailed images with a Jacquard loom. The portrait of Joseph-Marie Jacquard is a vivid demonstration of the intricacy of the loom; the image is woven using tens of thousands of punch cards.

{{% figure src="/images/punch-cards/punchcards.jpg" attr="Image courtesy the McCarl Gallery." attrlink="https://mccarlgallery.wordpress.com/2013/03/11/punch-cards-19th-century-coverlet-technology/" %}}

The ability to change the pattern of the loom's weave simply by changing cards was a conceptual precursor to programmable machines. Instead of a looped, unchanging pattern, any arbitrary design could be woven into the fabric, and the same machine could be used for an infinite set of patterns.

This mechanism inspired many other programmable automatons. Charles Babbage's Analytical engine borrowed the idea. (Babbage himself was rumored to have the woven portrait of Jacquard in his house!) Player pianos use punch cards (or punched drums) to produce music. That said, the first commercial use of punch cards for information processing didn't appear until almost 100 years later.

### The 1890 United States Census

In the late 19th century, the U.S. Census Bureau found itself collecting more information than it could manually process. The 1880 census took over 7 years to process, and it was estimated that the 1890 census would take almost twice as long![^3] Spending a decade processing census information meant that the data were obsolete almost immediately after they've been produced!

To cope with the growing population, the census bureau held a competition for a more efficient method to count and process the data. Herman Hollerith produced a punched card tabulating machine for this competition. The tabulating machine enabled much faster processing, and provided many more statistics than were available for earlier years.

{{% figure src="/images/punch-cards/tabulator.jpg" attr="The Hollerith Tabulator." %}}

After the success of the tabulator in the 1890 census, other countries began adopting the technology. Soon, Hollerith's Tabulating Machine Company produced machines for many other industries.

After his death, the Computer Tabulating Recording Company renamed itself to the International Business Machines Corporation, or IBM.

[^1]: sorry for the forced metaphor :/
[^2]: A nitpick: not all automated looms allow independent control of every warp end. Dobby looms, which appeared about 40 years after the Jacquard device, control groups of threads attached to shafts. Jacquard devices have more shafts than Dobby looms, but don't always allow for control of _every_ thread. [This explanation](http://blog.guilfordofmaine.com/dobby-vs.-jacquard.-a-tale-of-two-looms) differentiates between Dobby looms and Jacquard looms, and includes pretty gifs!
[^3]: The U.S. Census Bureau describes the [tabulation and processing of the 1880s census](https://www.census.gov/history/www/innovations/technology/tabulation_and_processing.html)
