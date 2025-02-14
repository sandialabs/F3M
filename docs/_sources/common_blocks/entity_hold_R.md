# Entity Hold (Rate)
````{compound}
:class: only-dark
```{image} assets/entity_hold_R.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/entity_hold_R_L.png
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
This entity hold (rate) block simply holds a discrete entity in a queue. Entities are released at regular rate specified by the mask dialog parameters. 

 :::{note}
    Fractional entities are not created by this block. This block releases entities at a frequency of `1/rate`. For example, a rate of 0.25 item/hr will result an entity being released every 4 hours. Similarly, a rate of 2 will result in an entity being released every 0.50 hours. This block does not currently support customized release schedules (e.g., releasing two entities every four hours). 
 :::


## Mask dialog options
Rate (item/hr) : float 
: The frequency with which to release entities from the queue as described in entities/hr. 

 :::{tip}
    F3M assumes a base time unit of hour. So the time elapsed from $t=0$ and $t=1$ in the model is one hour.
 :::


## Ports
In(D) : entity
: Entity to hold. Expects an entity with attributes:
    * **isovec** (signal): Has shape [1677, 1] that represents the different isotopes tracked by F3M
    *  **auxparam**  (scalar): Function varies based on user implementation



## Outputs
Out(D) : entity
: Output entity. Outputs entity with the same attributes as specified in `In(D)` at a regular interval specified by the mask dialog parameter `Rate (item/hr)` as the queue is not empty. Uses a FIFO scheme.

Inv : signal
: Continuous inventory signal with shape [1677, 1]. Updated when entities enter or leave the block. 
