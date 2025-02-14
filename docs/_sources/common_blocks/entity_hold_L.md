# Entity Hold (Level)


````{compound}
:class: only-dark
```{image} assets/entity_hold_L.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/entity_hold_L_L.png
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
 The entity hold (level) block simply holds a entities at a set level in a queue. If there are more items in queue than the level set point, then entities can leave the queue. The internal queue uses a First In First Out (FIFO) scheme. An optional process time is available which applies a time delay to an entity *after* it leaves the queue. This parameter can control how quickly entities are able to leave after the level set point has been reached. A continuous inventory term is updated whenever entities enter or leave the block.

 ## Mask dialog options
Hold level (items) : scalar
: Number of entities to hold in inventory. If more than this number of entities are in queue, then entities can leave the block. Value should be $\in [0,\infty]$ where a value of 0 results in entities leaving the block as soon as `process time (hr)` has elapsed. 

Process time (hr) : scalar
: Time in hours to delay an entity between entering the block and arriving in the queue. Value should be $\in [0,\infty)$.

## Ports
In(D) : entity
: Entity to hold. Expects an entity with attributes:
    * **isovec** (signal): Has shape [1677, 1] that represents the different isotopes tracked by F3M
    * **auxparam**  (scalar): Function varies based on user implementation

## Outputs
Out(D) : entity 
: Output entity. Outputs entity with the same attributes as specified in `In(D)` when the number of items in queue is greater than specified in `Hold level (items)` as long as the queue is not empty. Uses a FIFO scheme.

Inv : signal
: Continuous inventory signal with shape [1677, 1]. Updated when entities enter or leave the block

