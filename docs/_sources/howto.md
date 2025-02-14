# How-to Guide

This section contains answers to common questions asked by the community. It will be periodically updated with more frequently requested information.

## Selector specification
Selecting specific isotopes or elements from the `isovec` array usually requires the use of a species selector block, either signal or entity. Enter either an element or isotope into the selector. In both cases, use the periodic letter, and if specifying an isotope, the A number (i.e., atomic mass). Examples of valid input are `u` and `u238`. The entry corresponding to the user configurable slots are `at1` and `at2` respective. F3M will also accept the value `all` which corresponds to selecting the entire array including the user configurable slots.

## Themes
F3M has both light and dark themes with support for automatically updating the models color scheme. The `MakeLibDark` and `MakeLibLight` themes specify the color updates. The F3M template assumes a dark color scheme by default. This behavior can be changes to light or removed all together by modifying the `PreSaveFcn` callback for the model. This parameter can be modified by going to `Model Explorer` > `Callbacks tab` > `PreSaveFcn Tab`.