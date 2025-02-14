# Entity Process and Hold
````{compound}
:class: only-dark
```{image} assets/entity_process_h.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/entity_process_h_L.png
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
 The entity process and hold block holds a discrete entity for a period of time before releasing. If reduction multipliers are specified, then the entity is changed according to the reduction multipliers _after_ any hold period has elapsed. The internal queue uses a First In First Out (FIFO) scheme. A continuous inventory term is updated when entities leave the queue. 

 :::{note}
    The inventory does **not** reflect that the original entity has been modified. This block is intended to simulate process operations, not material loss. If looking to simulate a loss, see the [Signal Material Loss](./sig_matL.md) block.
 :::

 Both the residual entity (which has reduction multipliers applied) and the removed entity (the part that was removed from the original entity) are subtracted from the inventory. This results in a consistent mass balance across the block where `In(D)` = `Res(D)` + `Rmvd(D)`. 


 ## Mask dialog options
Process time (hr) : float
: The amount of time to hold each entity that enters the block. Value should be $\in[0, \infty)$.

Reduction multipliers : float
: The fraction by which to reduce the input entity for a specific species. These can be added or removed using the buttons under the table. Species specification can are to be elemental or isotopic in nature without any hyphenation; e.g.; `h` or `cs137`. Reduction multipliers are expected to be floats $\in[0,1]$ with 1 indicating all of the species is removed and 0 that none is removed. By default, species not entered in this table will be assumed to have a value of 0. 


 Example:

| Isotope or Element | Reduction Multiplier |
| --- | --- |
| h3 | 0.10 |
| c12 | 1.00 |

Here, 10% of h{sup}`3` and 100% of c{sup}`12` is removed from incoming entities, `In(D)`, and placed into the `Rmvd(D)` entity. 

 :::{warning}
 Entries in the reduction multiplier table are processed in order. Consequently, earlier entries might be overwritten by later entries. For example the table:
 | Isotope or Element | Reduction Multiplier |
| --- | --- |
| c | 0.10 |
| c12 | 1.00 |

10% of all carbon will be removed except for c12. All of the c12 will be removed. Similar behavior occurs if specifying `all` as an entry followed by specific elements or isotopes. 

It is important to consider the order of entries in the table! Specifying `all` as the final table entry will result in overwriting all previously entered table values with the value from `all`
 :::


## Ports
In(D) : entity
: Entity to process and hold. Expects an entity with attributes:
   * **isovec** (signal): Has shape [1677, 1] that represents the different isotopes tracked by F3M
   *  **auxparam**  (scalar): Function varies based on user implementation

## Outputs
Res(D) : entity
: Residual entity after reduction multipliers have been applied. 

Rmvd(D) : entity
: Entity representing the component that was removed from the original entity.

Inv : signal
: Continuous inventory signal with shape [1677, 1]. Updated when entities enter or leave the block. Both `Res(D)` and `Rmvd(D)` is removed from inventory when leaving the block. 

