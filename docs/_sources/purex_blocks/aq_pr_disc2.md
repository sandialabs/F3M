# Aqueous Process (Discrete - 2 Stage)
````{compound}
:class: only-dark
```{image} assets/aq_pr_disc2.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/aq_pr_disc2_L.png
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
This block belongs to the larger group of aqueous process blocks. Specifically, this discrete - 2 stage blocks accepts an input entity, converts it to a signal, passes the signal through a maximum of two sequential stages, and outputs a continuous signal. The user can also specify additional materials to add to the process, either using the `Feed(C)` inport or by specifying species in the additions dialog table. If the dialog table is used, material is only added when entities arrive. The `Add(C)` output provides a signal that describes material that is added by the dialog table, if used.

The stages in this block are simple sequential removal blocks. Users can specify entities or isotopes to remove from a stream, in terms of fractional removals. For example, a removal of 0.50 means that 50% of the incoming entity is removed for the specified entity or isotope. The two stages of this block are sequential, so the ultimate output of this block, `Res(C)`, has had both stages of specified removal fractions applied.

This block operates according to the specified on/off points. If the process inventory is below the off point, flow out stops. Similarly, if the inventory is above the on point, flow out proceeds. The flow rate of the block can be specified as a certain value or the output flowrate can be matched to equal the input.

:::{important}
The flow rate specified in the mask dialog option is the rate *before* any processing has occurred. Consequently, the `Res(C)` might be less than the specified rate as the flow out rate is equal to `Res(C)`+`Rmvd1(C)`+`Rmvd2(C)`. 
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

Stage 2 Efficiencies : string, float
: A table of strings specifying a species (either elemental or isotopic) and removal fraction. The signal from the prior stage will be reduced according to this table. 

:::{note}
Values in the additions and stage tables should be specified in order of descending inclusivity. For example, the user should set `all` before `c`. Similarly, `c` should be specified before `c12`. The table is processed row by row, so specifications in later rows will override earlier row specifications (if applicable). 
:::

## Ports
In(D)  : entity
: Entity to process. Expects an entity with attributes:
    * **isovec** (signal): Has shape [1677, 1] that represents the different isotopes tracked by F3M
    *  **auxparam**  (scalar): Function varies based on user implementation

Feed\(C) : signal
: Optional feed signal. Should have shape [1677, 1]. 


## Outputs
Rmvd1\(C) : signal
: The component of `In(D)`, after conversion to a continuous signal, that was removed by the first stage.

Rmvd2\(C) : signal
: The component of `Rmvd1(C)` that was removed by the second stage.

Res\(C): signal
: The final transformed signal. `In(D)` after conversion to a continuous signal and application of both user specified stages.

Add\(C): signal
: Signal that represents material that is being added by the additions dialog table. Can be used for consistency checks.

Inv : signal
: Continuous inventory signal with shape [1677, 1]. Updated when entities enter and the residual signal leaves.