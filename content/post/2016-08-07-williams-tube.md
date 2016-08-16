---
date: 2016-07-27
title: "A History of Storage Media: Williams Tube"
draft: true
tags: [computers, history of technology, storage]
---

Last post, we described the fairly ubiquitous punch card, a mechanical write-once mechanism for storing information. Both the [Colossus](https://en.wikipedia.org/wiki/Colossus_computer) and the [ENIAC](https://en.wikipedia.org/wiki/ENIAC) used paper tape for data input, but a complicated system of patchcords for the control programs. Reprogamming these machines was a huge undertaking, and researchers began to discuss using the same storage mechanisms for both program control and data input.

This sort of truly reprogrammable computer would require some sort of memory device to store the programs. While it's possible to build computers using mechanical memory, most mechanical memory systems are slow and fiddly. Developing electronic storage was the next big frontier in computer design.

With the stage set, let's now pick up the story in Manchester (coincidentally, a city well-known for its textiles industry.)

## Cathode ray tubes and radar

The first cathode ray tube used as display was invented just before the turn of the 20th century. They were soon used widely for oscilloscopes, and TKTK other uses. Cathode ray tubes were a common way to display electrical information.

// image of a WWII era radar screen

During the Second World War, cathode ray tubes became ubiquitous in radar systems, which kicked off research and development of more advanced CRT technology. One promising advance was adding delay lines to CRT displays to allow you to track the movement of radar targets over time. While at the Telecommunications Research Institute, Frederic C. Williams began researching using cathode ray tubes themselves as a memory storage device, instead of adding a separate delay line in. When Williams accepted a professorship at the University of Manchester, he brought his CRT research with him, along with his his colleague Tom Kilburn.

## Secondary effects

A conventional CRT displays an image by firing an electron beam at a phosphorescent screen. Two electrostatic plates (or magnets[^1]) steer the beam around, scanning across the entire screen.

{{<figure class="left" src="/images/williams-tube/cathode-ray-tube.png">}}

The brightness, color, and persistence of the scintillation depends on the type of phosphor on the screen. Depending on the phosphor and the energy of the electron beam, the bright spot lasts from microseconds to several seconds. In normal operation of a CRT, though, once written, the bright spot on the screen can't be detected again electronically.

However, if you crank up the energy of the electron beam, the beam knocks a few electrons out of the phosphor. These electrons deposit a little distance away from the bright spot, leaving a little charged bullseye. You can electronically detect the charged area the [secondary emission](https://en.wikipedia.org/wiki/Secondary_emission) leaves behind.

If you coat the surface with a poor conductor, instead of a phosphor, you get an even stronger secondary emission. (TK: check with harold) To read the data, the tube takes advantage of another secondary effect. When the electron beam hits the screen, the secondary emission of electrons induces a small voltage in any conductors near it.  If you place a thin metal surface in front of the surface, the screen and the coating together serve as a capacitor, separated by the glass of the screen. Changes in voltage on the screen induce a change in the screen, as well.

{{<figure class="left" src="/images/williams-tube/williams-tube.png">}}

To write the data, the electron beam sweeps across the face of the tube, turning on and off to represent the binary data. The little charged areas across the screen represent little capacitors that are either charged up or not.

To read the data, the electron beam again sweeps across the face of the tube, but stays on through the sweep. This writes a 1 to all the registers on the screen. If there were a 1 written there already, the point of positive charge on the screen gets neutralized, discharging the "capacitor." The pickup screen thus sends a pulse of current. If there were a 0, the screen is charged, and the pickup plate sees no pulse. By noting the pattern of current that comes through the pickup plate, you can determine what bit was stored in the register.

{{<figure class="left" src="/images/williams-tube/dot-zero.jpeg" attr="Image courtesy the Computer History Museum.">}}

Williams, on a visit to Bell Labs, saw researchers taking advantage of this effect to cancel out ground echoes in radar by moving the signal from one tube to another. When he came back to the TRE in 1946, he worked on using this method to store digital data, and succeeded storing a single bit. When he and Kilburn moved to Manchester, they worked on developing a tube with slightly more storage capacity.

## The Manchester Baby

Once they'd built the Williams tube, they wanted to ensure that it'd work as intended in a computer. To demonstrate this, they built the Small Scale Experimental Machine (colloquially known as the Manchester Baby) around the tube.

{{<figure class="left" src="/images/williams-tube/baby.JPG">}}

The Baby consisted of 4 CRTs -- 

- one for storing 32 32-bit words of RAM,
- one as an accumulator, 
- one for storing programs,
- one for displaying the output or the contents of any of the other tubes. 
 
Williams-Kilburn tubes are an unusually introspectable data storage device!

Programs were entered one word at a time, using a set of 32 switches. The first program run calculated factors for large numbers. Later, Turing later wrote a program that did long division (the Baby could only do subtraction and negation.)

## Later history

The parts of the Baby were repurposed for the Manchester Mark 1, which was a larger and more functional stored-program computer. The Mark 1 developed into the Ferranti Mark 1, which was the first commercially available general-purpose computer.

The Williams-Kilburn was used as RAM and storage in a number of other early computers. The MANIAC computer, which did hydrogen bomb design calculations at Los Alamos, used 40 Williams-Kilburn tubes to store 1024 40-bit numbers.

## Other Resources

- Tom Kilburn on the development of the tube: http://www.cs.man.ac.uk/CCS/res/res02.htm#e
- The Manchester Baby (https://www.youtube.com/watch?v=SpqayTc_Gcw)
- The Nature letter from Williams and Kilburn about the SSEM (http://www.nature.com/physics/looking-back/williams/index.html)

[^1]: Oscilloscopes and Williams tubes use electrostatic plates, since they have a better frequency response, and so operate faster. The magnetic coils used in television CRTs present an inductive load, so they're harder to drive at high frequencies. That said, televisions use magnetic deflection since the plates obstruct (and distort) the beam when the deflection angle is large, so magnetic deflection is better for large screens. [themoreyouknow.gif]
