# Discrete to Continuous


````{compound}
:class: only-dark
```{image} assets/d2c.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/d2c_L.png
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
The discrete to continuous block converts a discrete entity into a continuous Simulink signal. The discrete item is represented by a square pulse with a width specified by the user. F3M will automatically scale the signal height such that the signal will integrate to the same elemental and isotopic values as the original entity.

:::{warning}
The specified signal width *must* be smaller than the frequency of arriving entities for this block to function properly. 
:::

## Mask dialog options
Pulse width : float
: The width of the resulting continuous pulse representing the input entity.

## Ports
In(D) : entity
: Entity to convert to signal. Expects an entity with attributes:
    * **isovec** (signal): Has shape [1677, 1] that represents the different isotopes tracked by F3M.
    *  **auxparam**  (scalar): Function varies based on user implementation.

## Outputs
Out\(C) : signal
: Output signal with shape [1677, 1]. Width is dependent on mask dialog input and height is derived to ensure integration of the signal equals the original input entity.


