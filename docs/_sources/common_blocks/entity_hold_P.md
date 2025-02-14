# Entity Hold (Periodic)

````{compound}
:class: only-dark
```{image} assets/entity_hold_P.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/entity_hold_P_L.png
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
 The entity hold (periodic) block simply holds an discrete entity for a period of time before releasing. The internal queue uses a First In First Out (FIFO) scheme. A continuous inventory term is updated whenever entities enter or leave the block.

 ## Mask dialog options
Process time (hr) : scalar
:  The amount of time to hold each entity that enters the block. Value should be $\in[0, \infty)$.

## Ports
In(D) : entity
: Entity to hold. Expects an entity with attributes:
    * **isovec** (signal): Has shape [1677, 1] that represents the different isotopes tracked by F3M
    * **auxparam**  (scalar): Function varies based on user implementation

## Outputs
Out(D) : entity 
: Output entity. Outputs entity with the same attributes as specified in `In(D)` at regular interval specified by the mask dialog parameter `Process time (hr)` as long as the queue is not empty. Uses a FIFO scheme.

Inv : signal
: Continuous inventory signal with shape [1677, 1]. Updated when entities enter or leave the block

