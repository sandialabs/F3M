# Entity Mixing Tank
````{compound}
:class: only-dark
```{image} assets/entity_mix_tank.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/entity_mix_tank_L.png
:class: bg-primary
:width: 50%
:align: left
```
````

<br>
<br>

**Library**:
<br>
Fissile Facility Flow Modeler/Aqueous


<br clear="left"/>

## Description
This block simulates the mixing of two entities into one. A hold time can be specified to simulate processing time. 

## Mask dialog options
Processing time(hr) : float
: The amount of time to hold the combined entity before leaving the block.

## Ports
In1(D) : entity
: The first entity to be mixed. Expects an entity with attributes:
   * **isovec** (signal): Has shape [1677, 1] that represents the different isotopes tracked by F3M
   *  **auxparam**  (scalar): Function varies based on user implementation

In2(D) : entity
: The second entity to be mixed. Expects an entity with attributes:
   * **isovec** (signal): Has shape [1677, 1] that represents the different isotopes tracked by F3M
   *  **auxparam**  (scalar): Function varies based on user implementation

## Outputs
Out(D): Entity
: The combined entity. Has the attributes:
    *  **isovec** (signal): Has shape [1677, 1] that represents the different isotopes tracked by F3M
    *  **auxparam**  (scalar): Function varies based on user implementation


Inv : signal
: Continuous inventory signal with shape [1677, 1]. Updated when entities enter and the residual signal leaves.