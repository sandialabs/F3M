# Signal Species Selector
````{compound}
:class: only-dark
```{image} assets/s_select.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/s_select_L.png
:class: bg-primary
:width: 50%
:align: left
```
````

<br>
<br>

**Library**:
<br>
Fissile Facility Flow Modeler/Common


<br clear="left"/>

## Description
The signal species selector extracts the specified isotope signal or element signal (multiple if several isotopes for the element are tracked). This is a convenience block to select certain species of interest from the [1677, 1] shaped signal that F3M uses for most modeling operations.


## Mask dialog options
Element or isotope : string
: Element or unhyphenated isotope with z number for species of interest.



## Ports
In\(C)  : signal
: Signal to downselect. Has shape [1677, 1] that represents the different isotopes tracked by F3M


## Outputs
Slct\(C)  : signal
: Selected signal. Shape varies; if an isotope is selected then signal is [1, 1], if an element is selected then signal is [n, 1] depending on how many isotopes are tracked for that specific element.

---

:::{seealso}
[Entity species selector](./e_select.md)
:::