# Compute Considerations

This section contains guidance and information on computational considerations and common errors. It will be periodically updated as more information becomes available.

## Step size

Step size has an important impact on the overall simulation accuracy and behavior of individual process operations. The auto option for maximum step size is generally acceptable for discrete only models, but careful consideration must be given when continuous blocks are present. Step sizes that are too large can lead to computational errors, particularly for inventory calculations. An exact value cannot be provided as the appropriate step size changes from model to model. A future update to this section will describe diagnostics that can be perform to help determine this value. A general rule of thumb is to start with a step size of 3 and shrink from there. Values between 3 and 0.03 are usually reasonable.


## Solver
Simulink has a wide range of solvers available. F3M typically runs with a continuous solver; so either ode113 or ode45 is used. In our testing, ode45 is a bit slower but performs with better numerical consistency. This section will be updated with concrete metrics in the future. 