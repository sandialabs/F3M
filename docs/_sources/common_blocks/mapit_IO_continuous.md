# Continuous MAPIT Recorder
````{compound}
:class: only-dark
```{image} assets/mapit_ioC.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/mapit_ioC_L.png
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
F3M has been designed to work with MAPIT for downstream safeguards analyses. For a traditional material balance evaluation, flows must be integrated over the material balance period. It is important that data in F3M is collected so that, when integrated, input and output terms for the material balance is correct. Sampling too infrequently compared to the flow signals can result in pulses of material that are not recorded or truncated. However, high sampling rates can create excessively large datasets. This block balances these constraints by recording data with an inherited sample rate equal to the models major step, when the signal is non-zero. If the signal is zero, then information is not recorded.

This block has internal tooling to record signal values when present while attempting to avoid recording non-signal data to save on dataset storage requirements.

:::{important}
This block must be used to record input and output flows for a material balance area if analyses are performed with MAPIT. Otherwise, calculations of these quantities can become error prone.
:::

:::{seealso}
[Discrete MAPIT Recorder](./mapit_IO_discrete.md)
:::


## Mask dialog options
Output variable name : string
: The name of the recorded variable in the base MATLAB workspace.


## Ports
In\(C)  : signal
: Signal to record. Can have any shape [n, 1], but downstream MAPIT analyses expect only a single species (i.e., single isotope or sum of all isotopes in an element where n=1). 


## Outputs
