# Entity Hold (Surge)
````{compound}
:class: only-dark
```{image} assets/entity_hold_S.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/entity_hold_S_L.png
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
The entity hold (surge) block places input entities into a queue with a First In First Out (FIFO) scheme. Entities are only released when a surge signal is received. 


## Mask dialog options
Process time (hr) : float
:  The amount of time to hold each entity that enters the block before placing the entity into a queue. Value should be $\in[0, \infty)$.


## Ports
In(D) : entity 
: Entity to hold. Expects an entity with attributes:
    * **isovec** (signal): Has shape [1677, 1] that represents the different isotopes tracked by F3M
    *  **auxparam**  (scalar): Function varies based on user implementation

Srg(D) : message
: Discrete message containing a postive value. One entity is released from the queue for each positive valued message received on this port.

## Outputs
Out(D) : entity
: Output entity. Outputs entity with the same attributes as specified in `In(D)` each time a surge message `Srg(D)` is received as long as the queue is not empty. Uses a FIFO scheme.

Inv : signal
: Continuous inventory signal with shape [1677, 1]. Updated when entities enter or leave the block. 
