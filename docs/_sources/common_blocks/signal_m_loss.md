# Signal Material Loss
````{compound}
:class: only-dark
```{image} assets/signal_m_loss.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/signal_m_loss_L.png
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
The signal material loss block is designed to simulate material loss, and optionally simultaneous replacement, of material stream represented by a signal. By default, the block removes a fraction of the signal for the specified amount of time. This behavior can be modified via the loss species override table wherein fractions can be set for individual elements or isotopes. A replacement table is available to specify replace lost material with a specified element or isotope with a certain fraction. 

Example:

**Removal Fraction: 0.25**

:::{table} Loss species override
:widths: auto
:align: center

| Species | Fraction |
| --- | --- |
| h3 | 0.10 |
| c12 | 1.00 |
:::

:::{table} Replacement material
:widths: auto
:align: center

| Species | Fraction |
| --- | --- |
| h2 | 0.75 |
| fe56 | 0.25 |
:::

In this example, a removal fraction of 0.25 is specified, so 25% of all material entering the block will be removed for the specified interval. However, the loss species override is used, so h{sup}`3` will have only 10% removed, but c{sup}`12` will have 100% removed. Additionally, the mass of material removed will be replaced at a 1:1 ratio (as the fraction in the replacement material table sums to 1) with 25% being fe{sup}`56` and 75% h{sup}`2` by mass. 

:::{note}
The replacement material fractions for individual species can anywhere between 0 and $\infty$ but the removal fraction for individual species must be between 0 and 1.
:::





## Mask dialog options
Start time (hr)  :  float
: The time to start the specified loss in hours. Expects a positive, non-zero value.

End time (hr)  : float
: The time to end the specified loss in hours. Expects a positive, non-zero value that is greater than `Start time`.

Removal fraction: float
: The percentage of material to remove during the specified interval. This value should be $\in[0,1]$. 

Loss species override table : string, float
: Species, if any, that should have a different removal fraction from that specified in the `removal fraction` option. The species should be entered as elemental or isotopic, with no hyphenation or spaces (e.g., `h` or `h2`). Fractions for each species should be $\in[0,1]$.

Replacement material table: string, float
: Species to replace removed material. The species should be entered as elemental or isotopic, with no hyphenation or spaces (e.g., `h` or `h2`). Fractions for each species should be $\in[0,\infty)$. Can be left empty with the replacement material checkbox unchecked.


## Ports
In\(C)  : signal
: Signal to modify. Has shape [1677, 1] that represents the different isotopes tracked by F3M.


## Outputs
Res\(C)  : signal
: The modified signal after the loss and replacement fractions have been applied. Has the same shape as `In(C)`.

Rmvd\(C)  : signal
: The signal that represents the component that has been removed. Satisfies the relationship `In(C) = Res(C) + Rmvd(C)`. Has the same shape as `In(C)`.

Add\(C) : signal
: The component that was added as specified by the replacement material. Has the same shape as `In(C)`. This signal is zero if no components are specified in the replacement material table.

---

:::{seealso}
[Entity Material Loss](./loss_d.md)
:::