#!/bin/bash

# Using this as a reference for frequencies:
# https://pages.mtu.edu/~suits/notefreqs.html

CS4=277
D4=294
E4=330
FS4=370
G4=392
A4=440
B4=494
CS5=554
D5=587
E5=659

# TODO:
# - Might need sleep after some of the long notes

verse1() {
  beep -f $B4 -l 700 -n -f $FS4 -l 200 -n \
    -f $B4 -l 200 -n -f $CS5 -l 200 -n \
    -f $D5 -l 200 -n -f $E5 -l 200 -n \
    -f $D5 -l 200 -n -f $CS5 -l 300 -n \
    -f $B4 -l 200 -n -f $A4 -l 200 -n \
    -f $G4 -l 400 -n -f $D5 -l 400 -n \
    -f $D5 -l 600
  sleep .5
  beep -f $D5 -l 300 -n -f $A4 -l 200 -n \
    -f $D5 -l 300 -n -f $A4 -l 200 -n \
    -f $D5 -l 300 -n -f $A4 -l 200 -n \
    -f $D5 -l 300 -n -f $E5 -l 200 -n \
    -f $CS5 -l 600
}

chorus() {
  sleep .9
  beep -f $D5 -l 600
  sleep .3
  beep -f $CS5 -l 600
  sleep .2
  beep -f $B4 -l 400 -n -f $FS4 -l 300
  sleep .2
  beep -f $FS4 -l 200 -n -f $FS4 -l 200 -n \
    -f $FS4 -l 200 -n -f $FS4 -l 200 -n \
    -f $FS4 -l 600 -n -f $FS4 -l 200 -n \
    -f $B4 -l 400 -n -f $A4 -l 200 -n \
    -f $B4 -l 450 -n -f $G4 -l 200
  sleep .2
  beep -f $G4 -l 200 -n -f $G4 -l 200 -n \
    -f $G4 -l 200 -n -f $G4 -l 200 -n \
    -f $B4 -l 400 -n -f $A4 -l 200 -n \
    -f $B4 -l 400 -n -f $CS5 -l 200 -n \
    -f $D5 -l 400 -n -f $A4 -l 200
  sleep .15
  beep -f $A4 -l 200 -n -f $A4 -l 200 -n \
    -f $A4 -l 200 -n -f $A4 -l 200 -n \
    -f $D5 -l 400 -n -f $A4 -l 200 -n \
    -f $D5 -l 400 -n -f $E5 -l 200 -n \
    -f $E5 -l 400 -n -f $CS5 -l 600
}

verse1
verse1
sleep .9

# Verse 2

beep -f $B4 -l 650; sleep .2
beep -f $B4 -l 200 -n -f $B4 -l 200 -n \
 -f $CS5 -l 200 -n -f $D5 -l 200 -n \
 -f $D5 -l 400 -n -f $CS5 -l 200 -n \
 -f $D5 -l 400 -n -f $CS5 -l 200

beep -f $B4 -l 600; sleep .4
beep -f $B4 -l 100 -n -f $A4 -l 100 -n \
 -f $B4 -l 100 -n -f $CS5 -l 100 -n \
 -f $D5 -l 200 -n -f $D5 -l 400 -n \
 -f $CS5 -l 200 -n -f $D5 -l 200 -n \
 -f $D5 -l 400 -n -f $E5 -l 200
beep -f $A4 -l 600; sleep .2
beep -f $A4 -l 100 -n -f $A4 -l 100 -n \
 -f $A4 -l 100 -n -f $A4 -l 100 -n \
 -f $D5 -l 200 -n -f $A4 -l 200 -n \
 -f $D5 -l 200 -n -f $A4 -l 200 -n \
 -f $D5 -l 300 -n -f $E5 -l 200 -n \
 -f $E5 -l 400 -n -f $CS5 -l 600

# Would've been funny but disables 
# My PC speaker for reasons I have
# no time to investigate.
#sleep .2
#festival --tts <<< "Oh yeah"
sleep .4

# Verse 3

beep -f $B4 -l 600; sleep .4
beep -f $B4 -l 200 -n -f $FS4 -l 200 -n \
  -f $B4 -l 200 -n -f $CS5 -l 200 -n \
  -f $D5 -l 400 -n -f $CS5 -l 200 -n \
  -f $D5 -l 400 -n -f $CS5 -l 200 -n \
  -f $D5 -l 150 -n -f $CS5 -l 100
beep -f $B4 -l 600; sleep .4
beep -f $B4 -l 100 -n -f $B4 -l 100 -n \
  -f $B4 -l 100 -n -f $CS5 -l 200 -n \
  -f $D5 -l 200 -n -f $CS5 -l 150 -n \
  -f $D5 -l 200 -n -f $CS5 -l 200 -n \
  -f $D5 -l 200
sleep .2
beep -f $E5 -l 200 -n -f $A4 -l 600
sleep .4
beep -f $A4 -l 100 -n -f $A4 -l 100 -n \
  -f $A4 -l 100 -n -f $A4 -l 100 -n \
  -f $D5 -l 200 -n -f $A4 -l 200 -n \
  -f $D5 -l 800 -n -f $E5 -l 800 -n \
  -f $CS5 -l 700

# Chorus
chorus
chorus

