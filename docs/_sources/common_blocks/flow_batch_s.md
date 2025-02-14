# Flow Batcher (Surge)
````{compound}
:class: only-dark
```{image} assets/flow_batch_s.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/flow_batch_s_L.png
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
The surge flow batcher creates discrete entities from an input flow according to user defined settings in the dialog (i.e., creates a batch). The surge flow batcher uses an isotope or element (or other keyword, see see [overview](../overview.md)) combined with a target size to create an entity when a surge signal is supplied. The residual size specifies the minimum amount of collected flow that is left behind. Effectively, this block outputs an entity that is `output target size` for the `batch basis` once the total inventory of `batch basis` reaches `output target size` + `residual size` and the surge signal is on.

When a new discrete entity is created, it must be removed from the block's inventory. This can be done near-instantaneously or over some period of time, depending on user specification. The speed at which the entity leaves the block is controlled by the `inventory pulse width` parameter. This parameter subtracts an integral pulse, which is equal in size to the newly created discrete entity, from the inventory to reflect that material has left the block. Simultaneously, the entity is delayed for the same duration as the `inventory pulse width` to ensure accurate process material balance.

:::{note}
This block is designed to operate on a flow. In cases of a continuous flow, the inventory after the entity leaves might be greater than the `residual size`. This is because flow is entering for the duration of the `inventory pulse width` which adds to the inventory. This effect is more pronounced at greater input flows and smaller `inventory pulse widths`. 
:::

## Mask dialog options
Batch basis : string
: This is the basis from which to from a batch. Should be a string representing an element, isotope, or keyword (see [overview](../overview.md)). 

Inventory pulse width (hr) : float
: The width of the pulse that is subtracted from the block's inventory. Represents the speed at which the entity leaves the block. 

Output target size (kg) : float
: The size of `batch basis` in the resulting entity. 

Residual size (kg) : float
: The quantity of existing inventory that should remain when the batch entity is created. Can be zero.

## Ports
In\(C) : signal
: Signal to convert to discrete. Has shape [1677, 1]. Width is dependent on mask dialog input and height is derived to ensure integration of the signal equals the original input entity.

Srg\(C): signal
: Surge signal. Should be either 0 or 1 to represent flow disabled or enabled, respectively.

## Outputs
Out(D) : entity 
: Output entity generated from signal. Has the following attributes:
    * **isovec** (signal): Has shape [1677, 1] that represents the different isotopes tracked by F3M
    *  **auxparam**  (scalar): Function varies based on user implementation

Inv : signal
: Continuous inventory signal with shape [1677, 1]. Updated when entities enter or leave the block


