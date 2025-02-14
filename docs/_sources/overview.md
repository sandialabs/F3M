# Overview 

The Fissile Facility Flow Modeler (F3M) is an open source series of modules intended to facilitate the development of nuclear facility models in MATLAB Simulink for safeguards research. F3M is organized into several different facility types. This library is designed for modeling material flows and operations without specific operational details. For example, consider the [generic flow batcher](./common_blocks/flow_batch_g.md). This block exposes parameters that describe the behavior of a batching operation such as batch target size and residual size, but does not describe dimensions or mechanics for *how* this process might be carried out. The most relevant details for safeguards research are material flows, quantities, and timings, which is the focus of this library. 

The authors of this repository, the Sandia Nuclear Fuel Cycle and Safeguards Group, also develops facility models from the F3M library. These models constitute the Separation and Safeguards Performance Model Library (SSPM-L) , which is not publicly available but can be requested by contacting us at [MAPIT-dev@sandia.gov](mailto:MAPIT-dev@sandia.gov).  


##  Requirements
F3M requires [MATLAB](https://www.mathworks.com/products/matlab.html), [Simulink](https://www.mathworks.com/products/simulink.html), and [Simevents](https://www.mathworks.com/products/simevents.html)  to use.


## Foundations
F3M utilizes both discrete and continuous modeling paradigms depending on the facility type that a block is designed for. Discrete modeling is accomplished using Simevents (part of Simulink) by attaching various attributes to the entity whereas continuous modeling is accomplished through signal manipulation. F3M assumes units of kg for mass, hours for time (i.e., 1 time-step = 1 hour), and liters for volume.

### Isotopic tracking
Material tracking within F3M is performed on an isotopic level. Specifically, 1675 different isotopes are tracked, which corresponds to nearly all isotopes tracked in the [SCALE code system](https://www.ornl.gov/scale). The user is responsible for generating their own source term, but the [custom source generator](/common_blocks/cust_GN.md) is provided as a template. 


:::{note}
If you have a license for SCALE, you can incorporate your own spent fuel entities into F3M. A tutorial is under development for how to accomplish this.
:::

The `isovec` array (Simulink continuous signal) or attribute (Simevents discrete entity) is the foundation for isotopic tracking in F3M. In addition to the 1675 isotopes described above, there are two options array values at index 1676 and 1677 that can be used for custom purposes. For example, a user might want to track the number of times `isovec` has been modified by a process, which could be described at index 1676 or index 1677. By default, these indices will not change the behavior of blocks in F3M and can be freely modified or ignored.  `isovec` is the signal itself in continuous material flow representations and is an entity attribute for discrete material representations. Helper functions such as `F3_getArrayPos` are available to decode the ordering of this array. Additionally, the key word `all` can be used to select all isotopes (i.e., 1-1675) whereas `at1` and `at2` can be used to select the additional slots in `isovec` at index 1676 and 1677 respectively. A mapping between the indices and the specific isotope can be found in the `IsoList.mat`.

### Discrete representations
Discrete quantities are usually represented by attaching attributes to [Simevents entities](https://www.mathworks.com/help/simevents/gs/role-of-entities-in-simevents-models.html). Entities have two attributes: `isovec` and `auxparam`. `isovec` is described in the section above and represents the material composition of the discrete item. `auxparam` is an optional parameter that can be modified by users to help customize modeling behavior. By default, `auxparam` has no function on the behavior of F3M blocks.

### Continuous representations
Bulk flows of material are often better described as Simulink signals rather than discrete entities. These signals have shape [1677, 1] corresponding to `isovec` described above. Unlike the discrete representation, there is no `auxparam` in signals, but index 1676 and 1677 can still be used to better customize block/model behavior. 

Periodic flows must sometimes be represented. For example, a tank that fills, holds, then empties, will have a periodic out flow. These flows will result in a square-like pulse with a particular height and width (i.e., signal is non-zero when flow is present, zero otherwise). The height and width can be interpreted in various ways. The most common interpretation is that the width represents the amount of time a process takes to occur. Returning to the tank example, if the resulting pulse width is 5, then that corresponds to a tank emptying period of 5 hours. 

F3M places constraints on these square-like pulses in that they must integrate to the correct total quantity of material they are representing. For example, the height and width of the pulse representing material released from a tank should equal the decrease in inventory of the tank that resulted from the material leaving the block. Some blocks expose options for setting the pulse width as it can have important modeling implications. Further details on block-specific interpretation and behavior can be found in the block documentation. 

:::{tip}
Ports on F3M blocks have either \(C) or (D) designations that indicate a port is either continuous (signal) or discrete (entity). Inventory output ports are always continuous.
:::


### Interfaces with MAPIT
F3M is designed to facilitate system-level safeguards analyses. A natural counterpart to F3M is [MAPIT](https://github.com/sandialabs/MAPIT), which can perform many common statistical analyses used in safeguards. F3M has been designed to interface with MAPIT without the need for extensive setup. The material balance area includes inputs, outputs, and inventories. Flows (usually inputs and outputs) require careful consideration as they must be correctly integrated to provide valid analyses. Inventories are provided for most F3M blocks and can be recorded using a `To Workspace` block with a sample time of 1 and a format of `Structure with Time`. However, input and output flows require the [MAPIT Input/Output Recorder](./common_blocks/mapit_IO.md) block. 

### External interfaces
Data generated from F3M-based models can be exported to other platforms for secondary analyses. It is recommended that data is saved in MATLAB's native `.mat` format as many codes have support for parsing these files. For example, Python's SciPy library has tools to navigate and extract data from `.mat` files.

## Block modification
Users can modify F3M blocks to fit their needs. Before doing so, it is recommended to unlink a block of interest from the underlying library. This can be done by right clicking the block, selection library link, and disable link.

## Install
F3M does not require any special install instructions. Simply download the repository and ensure that it is on your MATLAB path.

## Usage
F3M blocks can be accessed via Simulink's library browser. F3M blocks will also show up when searching for blocks to insert in a Simulink model (i.e., clicking on the canvas and beginning to type the name of a F3M block).

If you enjoy our color theme, you can use the included template which will automatically theme a Simulink model when saved.

---

:::{versionadded} 1.0.0
Initial release with common and aqueous blocks.
:::

