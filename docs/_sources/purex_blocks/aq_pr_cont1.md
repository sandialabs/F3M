# Aqueous Process (Continuous - 1 Stage)
````{compound}
:class: only-dark
```{image} assets/aq_pr_cont1.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/aq_pr_cont1_L.png
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
This block belongs to the larger group of aqueous process blocks. Specifically, this continuous - 1 stage block accepts an input signal that is passed through a process stage, and outputs a continuous signal. The user can also specify additional materials to add to the process, either using the `Feed(C)` inport or by specifying species in the additions dialog table. If the dialog table is used, material is only added when entities arrive. The `Add(C)` output provides a signal that describes material that is added by the dialog table, if used.

Users can specify elements or isotopes to remove from a stream, in terms of fractional removals. For example, a removal of 0.50 means that 50% of the incoming entity is removed for the specified entity or isotope. 

This block operates according to the specified on/off points. If the process inventory is below the off point, flow out stops. Similarly, if the inventory is above the on point, flow out proceeds. The flow rate of the block can be specified as a certain value or the output flowrate can be matched to equal the input.

:::{important}
The flow rate specified in the mask dialog option is the rate *before* any processing has occurred. Consequently, the `Res(C)` might be less than the specified rate as the flow out rate is equal to `Res(C)`+`Rmvd(C)`. 
:::

## Mask dialog options
Process level basis : string
: The element or isotope used for the process level min and max.

Process off point (kg) : float
: The switch off level for the process. If the process inventory of the element or isotope specified in `Process level basis` falls below this value, then flow out from the block is prohibited.

Process on point (kg) : float
: The switch on level of the process. If the process inventory of the element or isotope specified in `Process level basis` rises above this value, then flow out from the block is permitted.

Match inflow : boolean
: If selected, then the output flow from this block will match the input flow.

Flowrate (kg/hr) : float
: The flowrate out for the process in kg/hr. 

Additions : string, float
: An optional table of strings specifying a species (either elemental or isotopic) and a flow rate. If this table is used, materials are only added when entities are arriving through `In(D)`. 

Stage 1 Efficiencies : string, float
: A table of strings specifying a species (either elemental or isotopic) and removal fraction. The signal created from entities entering `In(D)` will be reduced according to this table. 

:::{note}
Values in the additions and stage tables should be specified in order of descending inclusivity. For example, the user should set `all` before `c`. Similarly, `c` should be specified before `c12`. The table is processed row by row, so specifications in later rows will override earlier row specifications (if applicable). 
:::

## Ports
In\(C)  : signal
: Signal to modify. Has shape [1677, 1] that represents the different isotopes tracked by F3M.

Feed\(C) : signal
: Optional feed signal. Should have shape [1677, 1]. 


## Outputs
Rmvd\(C) : signal
: The component of `In(C)` that was removed.

Res\(C): signal
: The transformed signal, after the application of the specified modifications to `In(C)`.

Add\(C): signal
: Signal that represents material that is being added by the additions dialog table. Can be used for consistency checks.

Inv : signal
: Continuous inventory signal with shape [1677, 1]. Updated when entities enter and the residual signal leaves.