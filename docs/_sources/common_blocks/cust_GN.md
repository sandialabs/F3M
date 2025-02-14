# Custom Source Generator


````{compound}
:class: only-dark
```{image} assets/cust_GN.png
:class: bg-primary
:width: 50%
:align: left
```
````

````{compound}
:class: only-light
```{image} assets/cust_GN_L.png
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
The custom source generator is a template block for creating entity sources in F3M. The user must either define a source through the mask dialog options or create a function to do so. This block expects that sources will be specified in terms of weight percent expressed as a decimal. The block generates an entitiy with two different attributes, `isovec` and `auxparams`. `isovec` is a vector with shape [1677,1]. The first 1675 entries correspond to isotopes that are trackes by F3M. The final two entries, 1676 and 1677, are unset and are available for use by the user. These entries can be accessed the same way as other isotopes and elements by referencing them as `at1` and `at2`.
 
`auxparams` is a separate scalar attribute that can also be customized by the user, but is not exposed by default via the dialog parameters. These entries may be used to carry additional information required by the user. See the overview document [here](../overview.md#isotopic-tracking) for more details on indexing and isotopic tracking. 

By default, F3M assumes mass units of kg, however, source specification generally relies on a specified concentration or mass fraction. For example, this block requires specification of source components in mass fractions that sum to 1. F3M can perform automatic conversions from specified mass fractions or source concentrations using the `F3_makeEntityIsos` function, but information regarding flow rate and item period is required. The flow rate impacts the masses contained in each entity whereas the input period determines the frequency at which entities are generated.

:::{important}
This block will not cover all use cases and serves as a basic example. Fundamentally, a source generator in F3M needs to output a signal or entity with a $[1677\times1]$ array that is scaled appropriately to model the correct facility throughput. A forthcoming tutorial will help describe building source generators. 
:::


## Mask dialog options

Input flow rate (kg) : float
: Total size of the output entity.

Input period (hr) : float
: The frequency with which entities leave the generator.

Source specification table : string, float
: The source specification table consists of pairs of isotopes or elements and mass fractions. Here, the user should specify the mass distribution amongst various elemental or isotopic components. The column containing the mass fractions should sum to 1.

Attribute 1 : float
: Unused entry is `isovec`, index 1676, that can be specified by the user.

Attribute 2 : float
: Unused entry is `isovec`, index 1677, that can be specified by the user.

## Ports

## Outputs
Out(D) : SNF output entity
