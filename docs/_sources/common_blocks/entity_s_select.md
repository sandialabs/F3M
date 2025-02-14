# Entity Species Selector
````{compound}
:class: only-dark
```{image} assets/entity_s_select.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/entity_s_select_L.png
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
The entity species selector extracts the specified isotope or element attributes of an entity (multiple if several isotopes for the element are tracked). The full signal is also returned, which can be combined with multiple [signal selector blocks](./s_select.md) for additional species-specific signals if desired. This is a convenience block to select certain species of interest from the [1677, 1] shaped attribute that F3M uses for most modeling operations.

:::{important}
This block operates on entities and must be placed as a passthrough as entities cannot branch off like signals. That is, the original entity entering must be connected to its destination using the block's outport.
:::

## Mask dialog options
Element or isotope : string
: Element or unhyphenated isotope with A number for species of interest. Example: `h` or `h2`.



## Ports
In(D)  : entity
: Entity to read attributes from. Expects an entity with attributes:
    * **isovec** (signal): Has shape [1677, 1] that represents the different isotopes tracked by F3M
    *  **auxparam**  (scalar): Function varies based on user implementation


## Outputs
Out(D)  : entity
: Entity passthrough. Entities exiting here are identical to those entering through `In(D)`. 

Slct\(C)  : signal
: Selected entity attributes represented as a signal. Shape varies; if an isotope is selected then signal is [1, 1], if an element is selected then signal is [n, 1] depending on how many isotopes are tracked for that specific element.

Full\(C)  : signal
: The full isovec signal from entities entering the block. Can be combined with the [signal selector block](./s_select.md) to read additional elements or isotopes from the entities passing through the block.

---

:::{seealso}

[Signal species selector](./s_select.md)
:::

