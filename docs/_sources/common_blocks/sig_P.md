# Signal Process
````{compound}
:class: only-dark
```{image} assets/sig_P.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/sig_P_L.png
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
The signal process block applies user specified modification fractions to the signal to simulate a process. These values are assumed to be $\in[0,1]$, although any float can be provided.


 ## Mask dialog options 
Reduction multipliers : float
: The fraction by which to reduce the input signal for a specific species. These can be added or removed using the buttons under the table. Species specification can are to be elemental or isotopic in nature without any hyphenation; e.g.; `h` or `cs137`. Reduction multipliers are expected to be floats $\in[0,1]$ with 1 indicating all of the species is removed and 0 that none is removed. By default, species not entered in this table will be assumed to have a value of 0. 


 Example:

| Isotope or Element | Reduction Multiplier |
| --- | --- |
| h3 | 0.10 |
| c12 | 1.00 |

Here, 10% of h{sup}`3` and 100% of c{sup}`12` is removed from incoming entities, `In(C)`, and placed into the `Rmvd(C)` entity. 

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
In\(C) : signal
: Signal to modify. Has shape [1677, 1] that represents the different isotopes tracked by F3M.

## Outputs
Res(D) : signal
: Residual signal after reduction multipliers have been applied. 

Rmvd(D) : signal
: Signal representing the component that was removed from the original signal.

Inv : signal
: Continuous inventory signal with shape [1677, 1]. Updated when entities enter or leave the block. Both `Res(D)` and `Rmvd(D)` is removed from inventory when leaving the block. 
