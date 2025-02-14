# Discrete MAPIT Recorder
````{compound}
:class: only-dark
```{image} assets/mapit_ioD.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/mapit_ioD_L.png
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
F3M has been designed to work with MAPIT for downstream safeguards analyses. For a traditional material balance evaluation, flows must be integrated over the material balance period. It is important that data in F3M is collected so that, when integrated, input and output terms for the material balance is correct. Discrete items simply output their entity attribute value when present, which eliminates the need for internal logic regarding sample frequency and searching for non-zero signals. 

:::{important}
This block must be used to record input and output flows for a material balance area if analyses are performed with MAPIT. Otherwise, calculations of these quantities can become error prone.
:::

:::{seealso}
[Continuous MAPIT Recorder](./mapit_IO_continuous.md)
:::



## Mask dialog options
Output variable name : string
: The name of the recorded variable in the base MATLAB workspace.


## Ports
In(D) : entity
: Entity to hold. Expects an entity with attributes:
    * **isovec** (signal): Has shape [1677, 1] that represents the different isotopes tracked by F3M
    * **auxparam**  (scalar): Function varies based on user implementation


## Outputs
Out(D) : entity 
: Output entity. Outputs entity with the same attributes as specified in `In(D)`. The entity from `In(D)` immediately passes through this block and exits `Out(D)` with no delay.