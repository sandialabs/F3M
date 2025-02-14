# Inventory Batcher (Generic)
````{compound}
:class: only-dark
```{image} assets/inv_batch_g.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/inv_batch_g_L.png
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
The generic inventory batcher creates discrete entities from an input flow according to user defined settings in the dialog (i.e., creates a batch). This block is similar to the [generic flow batcher](./batch_G.md) with the key difference that this block will *not* output while flow is entering. It is designed to be used with inventories, rather than flows, and expects that there will be periodic, rather than continuous, additions to the inventory will be made. The generic inventory batcher uses a isotope or element (or other keyword, see [overview](../overview.md)) combined with a target size to create an entity. The residual size specifies the minimum amount of collected flow that is left behind when the batch entity leaves. Effectively, this block outputs an entity that is `output target size` for the `batch basis` once the total inventory of `batch basis` reaches `output target size` + `residual size`. 

When a new discrete entity is created, it must be removed from the block's inventory. This can be done near-instantaneously or over some period of time, depending on user specification. The speed at which the entity leaves the block is controlled by the `inventory pulse width` parameter. This parameter subtracts an integral pulse, which is equal in size to the newly created discrete entity, from the inventory to reflect that material has left the block. Simultaneously, the entity is delayed for the same duration as the `inventory pulse width` to ensure accurate process material balance.



 ## Mask dialog options 
Reduction multipliers : float
: The fraction by which to reduce the input signal for a specific species. These can be added or removed using the buttons under the table. Species specification can are to be elemental or isotopic in nature without any hyphenation; e.g.; `h` or `cs137`. Reduction multipliers are expected to be floats $\in[0,1]$ with 1 indicating all of the species is removed and 0 that none is removed. By default, species not entered in this table will be assumed to have a value of 0. 


 Example:

| Isotope or Element | Reduction Multiplier |
| --- | --- |
| h3 | 0.10 |
| c12 | 1.00 |

Here, 10% of h{sup}`3` and 100% of c{sup}`12` is removed from incoming entities, `In(C)`, and placed into the `Rmvd(C)` entity. 



## Ports
In\(C) : signal
: Signal to modify. Has shape [1677, 1] that represents the different isotopes tracked by F3M

## Outputs
Res(D) : signal
: Residual signal after reduction multipliers have been applied. 

Rmvd(D) : signal
: Signal representing the component that was removed from the original signal.

Inv : signal
: Continuous inventory signal with shape [1677, 1]. Updated when entities enter or leave the block. Both `Res(D)` and `Rmvd(D)` is removed from inventory when leaving the block. 
