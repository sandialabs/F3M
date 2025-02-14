# Continuous to Discrete

````{compound}
:class: only-dark
```{image} assets/c2d.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/c2d_L.png
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
The continuous to discrete block converts a continuous Simulink signal into a discrete entity.

:::{warning}
This block is not intended to be used directly. In most cases, the user will want to use an inventory batcher, either the [generic](./flow_batch_g.md) or [surge](./glow_batch_s.md) variant which batches based on the inventory level rather than this block's flow basis.
:::

## Mask dialog options
Element or isotope : string
: This block requires a target size for the resulting entity. This is performed by setting an elemental or isotopic basis. 

Inventory pulse width : float
: The output for this block is a discrete entity, however, the inventory is continuous and must be updated with a continuous signal. The width of the signal used to update the inventory, derived from the newly generated entity, is specified here.

Batch threshold (kg) : float
: The batch threshold is the level that the input signal must reach before an entity can be created.

Residual size (kg) : float
: The residual size is the lower limit for entity creation.

:::{note}
Batch threshold and residual size form the upper and lower limits of a relay respectively that trigger creation of an entity. The specific behavior of this block can vary depending on the behavior of the input signal.
:::

## Ports
In\(C) : signal
: Signal to convert to discrete. Has shape [1677, 1]. Width is dependent on mask dialog input and height is derived to ensure integration of the signal equals the original input entity.


## Outputs
Out(D) : entity 
: Output entity generated from signal. Has the following attributes:
    * **isovec** (signal): Has shape [1677, 1] that represents the different isotopes tracked by F3M
    *  **auxparam**  (scalar): Function varies based on user implementation

Inv : signal
: Continuous inventory signal with shape [1677, 1]. Updated when entities enter or leave the block


