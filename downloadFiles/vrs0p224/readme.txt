KERN software
Version 0.224		Friday 06 Nov 2009 at 15:39

Version 0.224
-------------

Added disimSample and simSample for sampling from these multioutput covariance functions. Michalis added kernel types rbfard2 and linard2 which use a slightly different formulation of the ARD parameters.

Version 0.223
-------------

Minor fix of "ard" kernel which somehow had a kernel computation bit placed in the parameter initialization --- cut and past mistake at some point..

Version 0.222
-------------

Removed division by kernel variance in kernels for computing the variance of the kernel. It causes numerical problems when the variance is small. Also changed mlp kernels so that the default variance distant from the origin is 1 instead of pi/2. 

Version 0.221
-------------

Minor changes for reading in kernels
written by C++ code into files.

Version 0.22
------------

Added Wiener kernel and various kernels for multi output kernels
including white noise being propagated through the first and second
order differential equation. 


Version 0.21
------------

Compatibility changes for NCCA and SGPLVM toolboxes.

Version 0.2
-----------

Added multiKernGradX, added new kernels for diffusion processes and
2nd order differential equations.

Version 0.172
-------------

Further minor updates to kern for working with the new gpsim code
(corrected handling of white kernel in multiKern).


Version 0.171
-------------

Minor update to kernCreate to handle block kernel with differing
number of inputs for each block.

Version 0.17
------------

Further improvements on the stability of the sim kernel. Addition of
the driven input single input motif kernel (Antti Honkela) and the
modification of the multiKern type to allow each block to have a
different number of time points (Pei Gao).

Version 0.168
-------------

Found a bug in tensor gradient which meant gradients weren't being
computed correctly with respect to X when more X and X2 are both
provided as input arguments and both have length larger than 1.

Antti Honkela improved the numerial stability of the sim kernel
through judicious use of erfc.

Version 0.167
-------------

Added 'translate' kernel which allows wrapping of other kernels with a
kernel that translates the input location. Useful for moving the
non-stationarity around the input space.

Version 0.166
-------------

Added periodic version of RBF kernel (see Rasmussen and Williams pg 92
or Mackay's introduction to GPs (1998)) and periodic version of
Gibbs's non-stationary kernel (see e.g. pg 93 of Rasmussen and
Williams).

Version 0.165
-------------

Added flag which indicates whether or not a kernel is stationary. This
can be used for speeding computations (stationary kernels have a
constant diagonal). Also replaced calls to constraining functions with
'optimiDefaultConstraint' calls which return the default constraint
(making it easier for the user to change).

Version 0.163
-------------

This release removes the stubs for several KernDiagGradX.m files,
which were confusing kernDiagGradX.m, which assumes they only exist if
the function is implemented. For the kernel types 'lin', 'poly',
'mlp', and their 'ard' counter-types, these files existed but weren't
yet implemented.


Version 0.162
-------------

Added the Gibbs's non-stationary kernel, the rational quadratic kernel
and the Matern kernel with nu = 3/2 and nu = 5/2.

Version 0.161
-------------

Updated with the Single Input Motif kernel, and improved the
documentation.

Version 0.16
------------

An intermediate release with some problems.

Version 0.151
-------------
 
Added kernDiagGradient command and versions of it for rbf, white,
bias, whitefixed and rbfard code. This command improves the speed of
the fitc approximation in the FGPLVM code a lot.

Version 0.15
------------

Added tensor kernels and white noise kernels which don't return a
parameter for optimisation: 'whitefixed'. White fixed kernels were
added by Nathaniel King.

Version 0.142 Release Notes
---------------------------

Minor changes to the kernDisplay command and each command for the
relevant sub kernels. New command allows spaces to be placed in front
of the display so that the kernel can be better formated when
displayed as part of a larger model.

Also added is the kernel 'file' which is a kernel for which values are
precomputed and stored in a file.

Version 0.141 Release Notes
---------------------------

Included the kernGetVariance function for obtaining the `signal'
associated with the kernel for use with the FGPLVM toolbox.

Version 0.14 Release Notes
--------------------------

Added computation of parameter gradients with respect to sub-matrices
of the kernel matrix to allow for optimisation of inducing points.

Version 0.131 Release Notes
---------------------------

Added polynomial and polynomial ARD kernels for completeness (their
use is not recommended in Gaussian processes). Added kernReadFromFID.m
for reading in a kernel from a C++ written file.

Version 0.13 Release Notes
--------------------------

Added kernSetWhite as a helper function to set the level of white
noise in the kernel.

General Overview
----------------

This toolbox implements the different kernels. At the time of writing
two toolboxes make use of KERN, IVM vs 0.31 and FBD vs 0.2.

Interaction with the toolbox is done through the interface files which
are prefixed by kern. The toolbox is designed to allow linear
combinations of kernels with a minimum of fuss (using the cmpnd
kernel).

The toolbox was spun out of the IVM toolbox, and most of the files are
based on files in IVM 0.221.

Kernel Types
------------

Several example kernels are given:

     'ard' For backward compatability with the ard kernel in IVM 0.1. It combines linear and rbf ard kernels.

     'sqexp' For backwards compatability this is equivalent to the 'rbf' kernel in IVM 0.1.

     'mlp', 'mlpard' The multi-layer perceptron kernel from Williams' Computing with infinite networks paper. An ARD version is also provided.

     'rbf', 'rbfard' The standard radial basis function kernel and an ARD version.

     'lin', 'linard' A linear kernel and an ARD version.

     'white' Is just a white noise kernel. It is not designed to be used alone, but as an element in the compound kernel

     'bias' is for adding a bias variance term to the kernel (a positive offset) on it's own it is not a valid kernel.

     'cmpnd' The compound kernel is for creating new kernels which are linear combinations of other kernels.

The perl script for generating code for new kernels is kernelGenerator.pl

It is run with two arguments, the first is the short name for the noise model, e.g. rbf, the second is the long name, e.g. radial\ basis\ function.


MATLAB Files
------------

Matlab files associated with the toolbox are:

ardKernCompute.m: Compute the ARD kernel given the parameters and X.
ardKernDiagCompute.m: Compute diagonal of ARD kernel.
ardKernDiagGradient.m: Compute the gradient of the ARD kernel's diagonal wrt parameters.
ardKernGradient.m: Gradient of ARD kernel's parameters.
ardKernGradX.m: Gradient of ARD kernel with respect to a point x.
rbfard2KernCompute.m: Compute the RBFARD kernel given the parameters and X.
biasKernGradient.m: Gradient of BIAS kernel's parameters.
cmpndKernGradient.m: Gradient of CMPND kernel's parameters.
cmpndKernParamInit.m: CMPND kernel parameter initialisation.
gaussianKernCompute.m: Compute the Gaussian kernel given the parameters and X.
cmpndKernSetIndex.m: Set the indices in the compound kernel.
expKernCompute.m: Compute the EXP kernel given the parameters and X.
expKernDiagCompute.m: Compute diagonal of EXP kernel.
expKernDiagGradX.m: Gradient of EXP kernel's diagonal with respect to X.
expKernDisplay.m: Display parameters of the EXP kernel.
expKernGradient.m: Gradient of EXP kernel's parameters.
expKernParamInit.m: EXP kernel parameter initialisation.
fileKernDiagCompute.m: Compute diagonal of FILE kernel.
fileKernGradient.m: Gradient of FILE kernel's parameters.
fileKernParamInit.m: FILE kernel parameter initialisation.
fileKernRead.m: Read kernel values from file or cache.
gibbsKernCompute.m: Compute the GIBBS kernel given the parameters and X.
gibbsKernDiagCompute.m: Compute diagonal of GIBBS kernel.
gibbsKernDiagGradient.m: Compute the gradient of the GIBBS kernel's diagonal wrt parameters.
gibbsKernDiagGradX.m: Gradient of GIBBS kernel's diagonal with respect to X.
gibbsKernDisplay.m: Display parameters of the GIBBS kernel.
gibbsKernExpandParam.m: Create kernel structure from GIBBS kernel's parameters.
gibbsKernExtractParam.m: Extract parameters from the GIBBS kernel structure.
gibbsKernParamInit.m: GIBBS kernel parameter initialisation.
gibbsKernSetLengthScaleFunc.m: Set the length scale function of the GIBBS kernel.
gibbsperiodicKernCompute.m: Compute the GIBBSPERIODIC kernel given the parameters and X.
gibbsperiodicKernDiagCompute.m: Compute diagonal of GIBBSPERIODIC kernel.
gibbsperiodicKernDiagGradX.m: Gradient of GIBBSPERIODIC kernel's diagonal with respect to X.
gibbsperiodicKernDisplay.m: Display parameters of the GIBBSPERIODIC kernel.
ardKernDiagGradX.m: Gradient of ARD kernel's diagonal with respect to X.
ardKernDisplay.m: Display parameters of the ARD kernel.
ardKernExpandParam.m: Create kernel structure from ARD kernel's parameters.
gibbsperiodicKernExpandParam.m: Create kernel structure from GIBBSPERIODIC kernel's parameters.
biasKernDiagCompute.m: Compute diagonal of BIAS kernel.
biasKernDiagGradient.m: Compute the gradient of the BIAS kernel's diagonal wrt parameters.
biasKernDiagGradX.m: Gradient of BIAS kernel's diagonal with respect to X.
biasKernGradX.m: Gradient of BIAS kernel with respect to input locations.
biasKernParamInit.m: BIAS kernel parameter initialisation.
kernCompute.m: Compute the kernel given the parameters and X.
cmpndKernCompute.m: Compute the CMPND kernel given the parameters and X.
kernCreate.m: Initialise a kernel structure.
kernDiagCompute.m: Compute the kernel given the parameters and X.
kernDiagGradient.m: Compute the gradient of the kernel's parameters for the diagonal.
kernDiagGradX.m: Compute the gradient of the  kernel wrt X.
kernDisplay.m: Display the parameters of the kernel.
cmpndKernDiagCompute.m: Compute diagonal of CMPND kernel.
cmpndKernDiagGradient.m: Compute the gradient of the CMPND kernel's diagonal wrt parameters.
cmpndKernDiagGradX.m: Gradient of CMPND kernel's diagonal with respect to X.
cmpndKernDisplay.m: Display parameters of the CMPND kernel.
kernGradient.m: Compute the gradient wrt the kernel's parameters.
cmpndKernExpandParam.m: Create kernel structure from CMPND kernel's parameters.
cmpndKernExtractParam.m: Extract parameters from the CMPND kernel structure.
kernPriorLogProb.m: Compute penalty terms associated with kernel priors.
cmpndKernGradX.m: Gradient of CMPND kernel with respect to a point x.
computeKernel.m: Compute the kernel given the parameters and X.
expKernExpandParam.m: Create kernel structure from EXP kernel's parameters.
expKernExtractParam.m: Extract parameters from the EXP kernel structure.
kernSetIndex.m: Set the indices on a compound kernel.
kernSetWhite.m: Helper function to set the white noise in a kernel if it exists.
expKernGradX.m: Gradient of EXP kernel with respect to a point x.
fileKernCompute.m: Compute the FILE kernel given the parameters and X.
linardKernDiagCompute.m: Compute diagonal of LINARD kernel.
kernGradX.m: Compute the gradient of the kernel wrt X.
fileKernDisplay.m: Display parameters of the FILE kernel.
fileKernExpandParam.m: Create kernel structure from FILE kernel's parameters.
linardKernExpandParam.m: Create kernel structure from LINARD kernel's parameters.
fileKernExtractParam.m: Extract parameters from the FILE kernel structure.
fileKernGradX.m: Gradient of FILE kernel with respect to a point x.
gibbsKernGradient.m: Gradient of GIBBS kernel's parameters.
gibbsKernGradX.m: Gradient of GIBBS kernel with respect to input locations.
gibbsperiodicKernDiagGradient.m: Compute the gradient of the GIBBSPERIODIC kernel's diagonal wrt parameters.
gibbsperiodicKernExtractParam.m: Extract parameters from the GIBBSPERIODIC kernel structure.
linardKernGradX.m: Gradient of LINARD kernel with respect to input locations.
gibbsperiodicKernGradient.m: Gradient of GIBBSPERIODIC kernel's parameters.
gibbsperiodicKernGradX.m: Gradient of GIBBSPERIODIC kernel with respect to a point x.
gibbsperiodicKernParamInit.m: GIBBSPERIODIC kernel parameter initialisation.
kernExpandParam.m: Expand parameters to form a kernel structure.
kernExtractParam.m: Extract parameters from kernel structure.
kernFactors.m: Extract factors associated with transformed optimisation space.
kernGetVariance.m: Get the signal associated with a the kernel.
kernParamInit.m: Kernel parameter initialisation.
kernPca.m: performs KPCA.
kernPriorGradient.m: Compute gradient terms associated with kernel priors.
matern32KernDiagGradient.m: Compute the gradient of the MATERN32 kernel's diagonal wrt parameters.
matern32KernDiagGradX.m: Gradient of MATERN32 kernel's diagonal with respect to X.
kernReadFromFID.m: Load from an FID written by the C++ implementation.
kernReadParamsFromFID.m: Read the kernel parameters from C++ file FID.
kernTest.m: Run some tests on the specified kernel.
kernToolboxes.m: Load in the relevant toolboxes for kern.
matern32KernParamInit.m: MATERN32 kernel parameter initialisation.
matern52KernDiagGradX.m: Gradient of MATERN52 kernel's diagonal with respect to X.
linardKernCompute.m: Compute the LINARD kernel given the parameters and X.
linardKernDiagGradX.m: Gradient of LINARD kernel's diagonal with respect to X.
linardKernDisplay.m: Display parameters of the LINARD kernel.
linardKernExtractParam.m: Extract parameters from the LINARD kernel structure.
matern52KernExpandParam.m: Create kernel structure from MATERN52 kernel's parameters.
linardKernGradient.m: Gradient of LINARD kernel's parameters.
linardKernParamInit.m: LINARD kernel parameter initialisation.
linKernCompute.m: Compute the LIN kernel given the parameters and X.
linKernDiagCompute.m: Compute diagonal of LIN kernel.
mlpardKernCompute.m: Compute the MLPARD kernel given the parameters and X.
linKernDiagGradX.m: Gradient of LIN kernel's diagonal with respect to X.
linKernDisplay.m: Display parameters of the LIN kernel.
linKernExpandParam.m: Create kernel structure from LIN kernel's parameters.
linKernExtractParam.m: Extract parameters from the LIN kernel structure.
linKernGradient.m: Gradient of LIN kernel's parameters.
linKernGradX.m: Gradient of LIN kernel with respect to input locations.
linKernParamInit.m: LIN kernel parameter initialisation.
matern32KernCompute.m: Compute the MATERN32 kernel given the parameters and X.
mlpardKernGradX.m: Gradient of MLPARD kernel with respect to input locations.
matern32KernDiagCompute.m: Compute diagonal of MATERN32 kernel.
matern32KernDisplay.m: Display parameters of the MATERN32 kernel.
matern32KernExpandParam.m: Create kernel structure from MATERN32 kernel's parameters.
matern32KernExtractParam.m: Extract parameters from the MATERN32 kernel structure.
matern32KernGradient.m: Gradient of MATERN32 kernel's parameters.
mlpKernExpandParam.m: Create kernel structure from MLP kernel's parameters.
matern32KernGradX.m: Gradient of MATERN32 kernel with respect to input locations.
matern52KernCompute.m: Compute the MATERN52 kernel given the parameters and X.
matern52KernDiagCompute.m: Compute diagonal of MATERN52 kernel.
matern52KernDiagGradient.m: Compute the gradient of the MATERN52 kernel's diagonal wrt parameters.
matern52KernDisplay.m: Display parameters of the MATERN52 kernel.
matern52KernExtractParam.m: Extract parameters from the MATERN52 kernel structure.
matern52KernGradient.m: Gradient of MATERN52 kernel's parameters.
multiKernDiagGradient.m: Compute the gradient of the MULTI kernel's diagonal wrt parameters.
matern52KernGradX.m: Gradient of MATERN52 kernel with respect to input locations.
matern52KernParamInit.m: MATERN52 kernel parameter initialisation.
mlpardKernDiagCompute.m: Compute diagonal of MLPARD kernel.
multiKernGradientBlock.m:
mlpardKernDiagGradX.m: Gradient of MLPARD kernel's diagonal with respect to X.
mlpardKernDisplay.m: Display parameters of the MLPARD kernel.
polyardKernCompute.m: Compute the POLYARD kernel given the parameters and X.
mlpardKernExpandParam.m: Create kernel structure from MLPARD kernel's parameters.
mlpardKernExtractParam.m: Extract parameters from the MLPARD kernel structure.
mlpardKernGradient.m: Gradient of MLPARD kernel's parameters.
mlpardKernParamInit.m: MLPARD kernel parameter initialisation.
polyardKernDisplay.m: Display parameters of the POLYARD kernel.
mlpKernGradX.m: Gradient of MLP kernel with respect to input locations.
mlpKernCompute.m: Compute the MLP kernel given the parameters and X.
mlpKernDiagCompute.m: Compute diagonal of MLP kernel.
mlpKernDiagGradX.m: Gradient of MLP kernel's diagonal with respect to X.
mlpKernDisplay.m: Display parameters of the MLP kernel.
polyardKernParamInit.m: POLYARD kernel parameter initialisation.
mlpKernExtractParam.m: Extract parameters from the MLP kernel structure.
mlpKernGradient.m: Gradient of MLP kernel's parameters.
polyKernExpandParam.m: Create kernel structure from POLY kernel's parameters.
mlpKernParamInit.m: MLP kernel parameter initialisation.
rbfwhiteKernGradX.m: Gradient of RBF-WHITE kernel with respect to a point t.
multiKernComputeBlock.m:
polyKernParamInit.m: POLY kernel parameter initialisation.
rbfwhiteKernGradient.m: Gradient of RBF-WHITE kernel's parameters.
multiKernDiagGradX.m: Gradient of MULTI kernel's diagonal with respect to X.
multiKernDisplay.m: Display parameters of the MULTI kernel.
multiKernExpandParam.m: Create kernel structure from MULTI kernel's parameters.
multiKernExtractParam.m: Extract parameters from the MULTI kernel structure.
ratquadKernDiagCompute.m: Compute diagonal of RATQUAD kernel.
ouKernDiagGradX.m: Gradient of OU kernel's diagonal with respect to t (see
multiKernGradX.m: Gradient of MULTI kernel with respect to a point x.
multiKernParamInit.m: MULTI kernel parameter initialisation.
ratquadKernGradient.m: Gradient of RATQUAD kernel's parameters.
multiKernTest.m: Run some tests on the multiple output block kernel.
rbfardKernCompute.m: Compute the RBFARD kernel given the parameters and X.
polyardKernDiagCompute.m: Compute diagonal of POLYARD kernel.
polyardKernDiagGradX.m: Gradient of POLYARD kernel's diagonal with respect to X.
rbfardKernDisplay.m: Display parameters of the RBFARD kernel.
polyardKernExtractParam.m: Extract parameters from the POLYARD kernel structure.
polyardKernGradient.m: Gradient of POLYARD kernel's parameters.
polyardKernGradX.m: Gradient of POLYARD kernel with respect to input locations.
polyKernCompute.m: Compute the POLY kernel given the parameters and X.
rbfKernCompute.m: Compute the RBF kernel given the parameters and X.
polyKernDiagCompute.m: Compute diagonal of POLY kernel.
polyKernDiagGradX.m: Gradient of POLY kernel's diagonal with respect to X.
rbfKernDisplay.m: Display parameters of the RBF kernel.
polyKernDisplay.m: Display parameters of the POLY kernel.
polyKernExtractParam.m: Extract parameters from the POLY kernel structure.
polyKernGradient.m: Gradient of POLY kernel's parameters.
polyKernGradX.m: Gradient of POLY kernel with respect to input locations.
pskernelGradient.m: Gradient on likelihood approximation for point set IVM.
pskernelObjective.m: Likelihood approximation for point set IVM.
ratquadKernCompute.m: Compute the RATQUAD kernel given the parameters and X.
ratquadKernDiagGradient.m: Compute the gradient of the RATQUAD kernel's diagonal wrt parameters.
ratquadKernDiagGradX.m: Gradient of RATQUAD kernel's diagonal with respect to X.
ratquadKernDisplay.m: Display parameters of the RATQUAD kernel.
ratquadKernExpandParam.m: Create kernel structure from RATQUAD kernel's parameters.
rbfperiodicKernExtractParam.m: Extract parameters from the RBFPERIODIC kernel structure.
ratquadKernExtractParam.m: Extract parameters from the RATQUAD kernel structure.
ratquadKernGradX.m: Gradient of RATQUAD kernel with respect to input locations.
ratquadKernParamInit.m: RATQUAD kernel parameter initialisation.
rbfardKernDiagCompute.m: Compute diagonal of RBFARD kernel.
rbfardKernDiagGradient.m: Compute the gradient of the RBFARD kernel's diagonal wrt parameters.
rbfardKernDiagGradX.m: Gradient of RBFARD kernel's diagonal with respect to X.
rbfardKernExpandParam.m: Create kernel structure from RBFARD kernel's parameters.
rbfardKernExtractParam.m: Extract parameters from the RBFARD kernel structure.
simKernDiagGradX.m: Gradient of SIM kernel's diagonal with respect to the
rbfardKernGradient.m: Gradient of RBFARD kernel's parameters.
rbfardKernGradX.m: Gradient of RBFARD kernel with respect to input locations.
rbfardKernParamInit.m: RBFARD kernel parameter initialisation.
simKernGradient.m: Gradient of SIM kernel's parameters.
rbfKernDiagCompute.m: Compute diagonal of RBF kernel.
rbfKernDiagGradient.m: Compute the gradient of the RBF kernel's diagonal wrt parameters.
rbfKernDiagGradX.m: Gradient of RBF kernel's diagonal with respect to X.
rbfKernExpandParam.m: Create kernel structure from RBF kernel's parameters.
rbfKernExtractParam.m: Extract parameters from the RBF kernel structure.
rbfKernGradient.m: Gradient of RBF kernel's parameters.
simXrbfKernGradient.m: Compute gradient between the SIM and RBF kernels.
rbfKernGradX.m: Gradient of RBF kernel with respect to input locations.
rbfKernParamInit.m: RBF kernel parameter initialisation.
rbfperiodicKernCompute.m: Compute the RBFPERIODIC kernel given the parameters and X.
sqexpKernDiagGradX.m: Gradient of SQEXP kernel's diagonal with respect to X.
sqexpKernDisplay.m: Display parameters of the SQEXP kernel.
sqexpKernExpandParam.m: Create kernel structure from SQEXP kernel's parameters.
sqexpKernExtractParam.m: Extract parameters from the SQEXP kernel structure.
sqexpKernGradient.m: Gradient of SQEXP kernel's parameters.
rbfperiodicKernDiagCompute.m: Compute diagonal of RBFPERIODIC kernel.
rbfperiodicKernDiagGradient.m: Compute the gradient of the RBFPERIODIC kernel's diagonal wrt parameters.
rbfperiodicKernDiagGradX.m: Gradient of RBFPERIODIC kernel's diagonal with respect to X.
rbfperiodicKernDisplay.m: Display parameters of the RBFPERIODIC kernel.
sqexpKernGradX.m: Gradient of SQEXP kernel with respect to a point x.
sqexpKernParamInit.m: SQEXP kernel parameter initialisation.
rbfperiodicKernExpandParam.m: Create kernel structure from RBFPERIODIC kernel's parameters.
rbfperiodicKernGradient.m: Gradient of RBFPERIODIC kernel's parameters.
rbfperiodicKernGradX.m: Gradient of RBFPERIODIC kernel with respect to a point x.
rbfperiodicKernParamInit.m: RBFPERIODIC kernel parameter initialisation.
simComputeH.m: Helper function for comptuing part of the SIM kernel.
simComputeTest.m: Test the file simComputeH.
simKernCompute.m: Compute the SIM kernel given the parameters and X.
simKernDiagCompute.m: Compute diagonal of SIM kernel.
simKernDiagGradient.m: Compute the gradient of the SIM kernel's diagonal wrt parameters.
simKernDisplay.m: Display parameters of the SIM kernel.
tensorKernGradX.m: Gradient of TENSOR kernel with respect to a point x.
simKernExpandParam.m: Create kernel structure from SIM kernel's parameters.
simKernExtractParam.m: Extract parameters from the SIM kernel structure.
simKernGradX.m: Gradient of SIM kernel with respect to each time point in t1.
simKernParamInit.m: SIM kernel parameter initialisation.
simXrbfKernCompute.m: Compute a cross kernel between the SIM and RBF kernels.
simXsimKernCompute.m: Compute a cross kernel between two SIM kernels.
simXsimKernGradient.m: Compute a cross gradient between two SIM kernels.
whitefixedKernCompute.m: Compute the WHITEFIXED kernel given the parameters and X.
whitefixedKernDiagCompute.m: Compute diagonal of WHITEFIXED kernel.
whitefixedKernDiagGradient.m: Compute the gradient of the WHITEFIXED kernel's diagonal wrt parameters.
whitefixedKernDiagGradX.m: Gradient of WHITEFIXED kernel's diagonal with respect to X.
whitefixedKernDisplay.m: Display parameters of the WHITEFIXED kernel.
whitefixedKernExpandParam.m: Create kernel structure from WHITEFIXED kernel's parameters.
whitefixedKernExtractParam.m: Extract parameters from the WHITEFIXED kernel structure.
sqexpKernCompute.m: Compute the SQEXP kernel given the parameters and X.
sqexpKernDiagCompute.m: Compute diagonal of SQEXP kernel.
sqexpKernDiagGradient.m: Compute the gradient of the SQEXP kernel's diagonal wrt parameters.
tensorKernCompute.m: Compute the TENSOR kernel given the parameters and X.
tensorKernDiagCompute.m: Compute diagonal of TENSOR kernel.
tensorKernDiagGradient.m: Compute the gradient of the TENSOR kernel's diagonal wrt parameters.
tensorKernDiagGradX.m: Gradient of TENSOR kernel's diagonal with respect to X.
tensorKernDisplay.m: Display parameters of the TENSOR kernel.
whitefixedKernParamInit.m: WHITEFIXED kernel parameter initialisation.
tensorKernExpandParam.m: Create kernel structure from TENSOR kernel's parameters.
tensorKernExtractParam.m: Extract parameters from the TENSOR kernel structure.
tensorKernGradient.m: Gradient of TENSOR kernel's parameters.
tensorKernParamInit.m: TENSOR kernel parameter initialisation.
whiteKernGradX.m: Gradient of WHITE kernel with respect to input locations.
tensorKernSetIndex.m: Set the indices in the tensor kernel.
tensorKernSlash.m: Tensor kernel created by removing ith component.
whitefixedKernGradient.m: Gradient of WHITEFIXED kernel's parameters.
whitefixedKernGradX.m: Gradient of WHITEFIXED kernel with respect to a point x.
whiteKernCompute.m: Compute the WHITE kernel given the parameters and X.
whiteKernDiagCompute.m: Compute diagonal of WHITE kernel.
whiteKernDiagGradient.m: Compute the gradient of the WHITE kernel's diagonal wrt parameters.
whiteKernDiagGradX.m: Gradient of WHITE kernel's diagonal with respect to X.
whiteKernDisplay.m: Display parameters of the WHITE kernel.
whiteKernExpandParam.m: Create kernel structure from WHITE kernel's parameters.
whiteKernExtractParam.m: Extract parameters from the WHITE kernel structure.
whiteKernGradient.m: Gradient of WHITE kernel's parameters.
whiteKernParamInit.m: WHITE kernel parameter initialisation.
whiteXwhiteKernCompute.m: Compute a cross kernel between two WHITE kernels.
whiteXwhiteKernGradient.m: Compute a cross gradient between two WHITE kernels.
translateKernCompute.m: Compute the TRANSLATE kernel given the parameters and X.
translateKernDiagCompute.m: Compute diagonal of TRANSLATE kernel.
translateKernDiagGradX.m: Gradient of TRANSLATE kernel's diagonal with respect to X.
translateKernDisplay.m: Display parameters of the TRANSLATE kernel.
translateKernExpandParam.m: Create kernel structure from TRANSLATE kernel's parameters.
gaussianKernDiagCompute.m: Compute diagonal of gaussian kernel.
translateKernExtractParam.m: Extract parameters from the TRANSLATE kernel structure.
translateKernGradX.m: Gradient of TRANSLATE kernel with respect to a point x.
translateKernGradient.m: Gradient of TRANSLATE kernel's parameters.
translateKernParamInit.m: TRANSLATE kernel parameter initialisation.
componentKernReadParamsFromFID.m: Read a component based kernel from a C++ file.
disimXrbfKernGradient.m: Compute gradient between the DISIM and RBF kernels.
disimXsimKernCompute.m: Compute a cross kernel between DISIM and SIM kernels.
disimComputeHPrime.m: Helper function for comptuing part of the DISIM kernel.
kernCorrelation.m: Compute the correlation matrix kernel given the parameters and X.
disimKernCompute.m: Compute the DISIM kernel given the parameters and X.
disimKernDiagCompute.m: Compute diagonal of DISIM kernel.
disimKernDiagGradX.m: Gradient of DISIM kernel's diagonal with respect to X.
disimKernDiagGradient.m: Compute the gradient of the DISIM kernel's diagonal wrt parameters.
disimKernDisplay.m: Display parameters of the DISIM kernel.
disimKernExpandParam.m: Create kernel structure from DISIM kernel's parameters.
disimKernExtractParam.m: Extract parameters from the DISIM kernel structure.
rbfwhiteKernExtractParam.m: Extract parameters from the RBF-WHITE kernel
disimKernGradX.m: Gradient of DISIM kernel with respect to a point x.
disimKernGradient.m: Gradient of DISIM kernel's parameters.
disimKernParamInit.m: DISIM kernel parameter initialisation.
disimXdisimKernCompute.m: Compute a cross kernel between two DISIM kernels.
disimXrbfKernCompute.m: Compute a cross kernel between the DISIM and RBF kernels.
disimComputeH.m: Helper function for comptuing part of the DISIM kernel.
disimXdisimKernGradient.m: Compute a cross gradient between two DISIM kernels.
disimXsimKernGradient.m: Compute gradient between the DISIM and SIM kernels.
componentKernWriteParamsToFID.m: Write a component based kernel to a stream.
kernWriteParamsToFID.m: Write the kernel parameters to a stream.
kernWriteToFID.m: Load from an FID written by the C++ implementation.
gaussianKernGradX.m: Gradient of gaussian kernel with respect to input locations.
gaussianKernGradient.m: Gradient of gaussian kernel's parameters.
gaussianKernDiagGradX.m: Gradient of gaussian kernel's diagonal with respect to X.
gaussianKernDiagGradient.m: Compute the gradient of the gaussian kernel's diagonal wrt parameters.
gaussianKernParamInit.m: Gaussian kernel parameter initialisation.
ggKernCompute.m: Compute the GG kernel given the parameters and X.
ggKernDiagCompute.m: Compute diagonal of GG kernel.
ggKernExpandParam.m: Create kernel structure from GG kernel's parameters.
ggKernExtractParam.m: Extract parameters from the GG kernel structure.
ggKernGradient.m: Gradient of GG kernel's parameters.
ggKernParamInit.m: GG kernel parameter initialisation.
ggXgaussianKernCompute.m: Compute a cross kernel between the GG and GAUSSIAN kernels.
ggXgaussianKernGradX.m: Compute gradient between the GG and GAUSSIAN
ggXgaussianKernGradient.m: Compute gradient between the GG and GAUSSIAN kernels.
gaussianKernDisplay.m: Display parameters of the GAUSSIAN kernel.
ggKernDisplay.m: Display parameters of the GG kernel.
ggXggKernCompute.m: Compute a cross kernel between two GG kernels.
lfmComputeH.m: Helper function for computing part of the LFM kernel.
lfmComputeTest.m: Test the file lfmComputeH.
lfmExpandParam.m: Expand the given parameters into a LFM structure.
lfmExtractParam.m: Extract the parameters of an LFM model.
lfmGradientH.m: Gradient of the function h_i(z) with respect to some of the
gaussianKernExpandParam.m: Create kernel structure from gaussian kernel's parameters.
lfmGradientH31.m: Gradient of the function h_i(z) with respect to some of the
gaussianKernExtractParam.m: Extract parameters from the gaussian kernel structure.
ggXggKernGradient.m: Compute a cross gradient between two GG kernels.
lfmGradientSigmaH.m: Gradient of the function h_i(z) with respect \sigma.
lfmGradientUpsilon.m: Gradient of the function \upsilon(z) with respect to
lfmKernCompute.m: Compute the LFM kernel given the parameters and X.
lfmKernDiagGradX.m: Gradient of LFM kernel's diagonal with respect to X.
lfmKernParamInit.m: LFM kernel parameter initialisation. The latent force
lfmKernDiagGradient.m: Compute the gradient of the LFM kernel's diagonal wrt parameters.
lfmKernExpandParam.m: Create kernel structure from LFM kernel's parameters.
lfmKernExtractParam.m: Extract parameters from the LFM kernel structure.
lfmKernGradX.m: Gradient of LFM kernel with respect to a point x.
lfmKernGradient.m: Gradient of LFM kernel's parameters.
lfmLogLikeGradients.m: Compute the gradients of the log likelihood of a LFM model.
lfmLogLikelihood.m: Compute the log likelihood of a LFM model.
lfmSample.m: Sample from LFM kernel
lfmUpdateKernels.m: Updates the kernel representations in the LFM structure.
lfmKernDisplay.m: Display parameters of the LFM kernel.
lfmOptions.m: Creates a set of default options for a LFM model.
lfmTest.m: Test the gradients of the LFM model.
lfmwhiteComputeH.m: Helper function for computing part of the LFM-WHITE
lfmXlfmKernCompute.m: Compute a cross kernel between two LFM kernels.
lfmXlfmKernGradient.m: Compute a cross gradient between two LFM kernels.
lfmXrbfKernCompute.m: Compute a cross kernel between the LFM and RBF kernels.
lfmXrbfKernGradient.m: Compute gradient between the LFM and RBF kernels.
lfmComputeUpsilon.m: Helper function for comptuing part of the LFM kernel.
sparseKernDisplay.m: Display parameters of the SPARSE kernel.
whitefixedXwhitefixedKernGradient.m: Compute a cross gradient between two WHITEFIXED kernels.
lfmGradientH32.m: Gradient of the function h_i(z) with respect to some of the
whitefixedXwhitefixedKernCompute.m: Compute a cross kernel between two WHITEFIXED kernels.
lfmGradientH41.m: Gradient of the function h_i(z) with respect to some of the
lfmGradientH42.m: Gradient of the function h_i(z) with respect to some of the
lfmComputeH3.m: Helper function for computing part of the LFM kernel.
lfmCreate.m: Create a LFM model.
lfmGradientSigmaUpsilon.m: Gradient of the function \upsilon(z) with respect
lfmComputeH4.m: Helper function for computing part of the LFM kernel.
lfmGradientSigmaH3.m: Gradient of the function h_i(z) with respect \sigma.
lfmGradientSigmaH4.m: Gradient of the function h_i(z) with respect \sigma.
kernelCenter.m: Attempts to Center Kernel Matrix
noneKernCompute.m: Compute the NONE kernel given the parameters and X.
ggwhiteXgaussianwhiteKernGradX.m: Compute gradient between the GG white and
ouKernDiagCompute.m: Compute diagonal of OU kernel (see ouKernCompute or
ouKernDisplay.m: Display parameters of the OU kernel (see ouKernCompute or
ouKernExtractParam.m: Extract parameters from the OU kernel structure (see
rbfwhiteKernDisplay.m: Display parameters of the RBF-WHITE kernel.
noneKernDiagCompute.m: Compute diagonal of NONE kernel.
noneKernDiagGradX.m: Gradient of NONE kernel's diagonal with respect to X.
noneKernDisplay.m: Display parameters of the NONE kernel.
noneKernExpandParam.m: Create kernel structure from NONE kernel's parameters.
noneKernExtractParam.m: Extract parameters from the NONE kernel structure.
ouKernCompute.m: Compute the Ornstein-Uhlenbeck (OU) kernel arising from the
wienerKernDiagCompute.m: Compute diagonal of WIENER kernel.
ardKernExtractParam.m: Extract parameters from the ARD kernel structure.
polyardKernExpandParam.m: Create kernel structure from POLYARD kernel's parameters.
ggwhiteKernDiagCompute.m: Compute diagonal of GG WHITE kernel.
simwhiteXrbfwhiteKernCompute.m: Compute a cross kernel between a SIM-WHITE
gaussianwhiteKernCompute.m: Compute the covariance of the output samples 
ouKernExpandParam.m: Create kernel structure from OU kernel's parameters
rbfwhiteKernDiagGradX.m: Gradient of RBF-WHITE kernel's diagonal w.r.t. t.
noneKernGradX.m: Gradient of NONE kernel with respect to a point x.
noneKernGradient.m: Gradient of NONE kernel's parameters.
noneKernParamInit.m: NONE kernel parameter initialisation.  
rbfXnoneKernCompute.m: Compute a cross kernel between RBF and NONE kernels.
gaussianwhiteKernParamInit.m: Gaussian white kernel parameter initialisation.
whiteXnoneKernGradient.m: Compute a cross gradient between WHITE and DUMMY kernels.
biasKernDisplay.m: Display parameters of the BIASkernel.
gaussianwhiteKernGradient.m: Gradient of gaussian white kernel's parameters.
ggwhiteKernDisplay.m: Display parameters of the GG WHITE kernel.
simwhiteXrbfwhiteKernGradient.m: Compute a cross gradient between a SIM-WHITE
rbfwhiteKernCompute.m: Compute the RBF-WHITE kernel given the parameters, t1
ouKernGradient.m: Gradient of OU kernel's parameters (see ouKernCompute or
whiteXnoneKernCompute.m: Compute a cross kernel between WHITE and NONE kernels.
whiteXrbfKernGradient.m: Compute a cross gradient between WHITE and RBF kernels.
wienerKernDiagGradX.m: Gradient of WIENER kernel's diagonal with respect to X.
multiKernCacheBlock.m:
lfmKernDiagCompute.m: Compute diagonal of LFM kernel.
multiKernCompute.m: Compute the MULTI kernel given the parameters and X.
multiKernFixBlocks.m:
multiKernDiagCompute.m: Compute diagonal of MULTI kernel.
wienerKernDisplay.m: Display parameters of the WIENER kernel.
ouKernParamInit.m: Ornstein-Uhlenbeck (OU) kernel parameter initialisation.
rbfwhiteXrbfwhiteKernCompute.m: Compute a cross kernel between two RBF-WHITE
rbfwhiteXwhiteKernCompute.m: Compute a cross kernel between the RBF-WHITE
ouKernGradX.m: Gradient of OU kernel with respect to a point x (see
gaussianwhiteKernGradX.m: Gradient of gaussian white kernel with respect 
wienerKernExpandParam.m: Create kernel structure from WIENER kernel's parameters.
rbfwhiteKernParamInit.m: RBF-WHITE kernel parameter initialisation. The RBF-
lfmwhiteKernExtractParam.m: Extract parameters from the LFM-WHITE kernel
lfmwhiteKernGradX.m: Gradient of LFM-WHITE kernel with respect to a point t.
lfmwhiteKernGradient.m: Gradient of LFM-WHITE kernel's parameters.
lfmwhiteKernParamInit.m: LFM-WHITE kernel parameter initialisation.
simwhiteXwhiteKernGradient.m: Compute gradient between the SIM-WHITE and WHITE kernels.
dexpKernCompute.m: Compute the double exponential kernel,
gaussianwhiteKernExpandParam.m: Create kernel structure from gaussian white 
gaussianwhiteKernExtractParam.m: Extract parameters from the gaussian white 
ggwhiteKernExpandParam.m: Create kernel structure from GG white kernel's parameters.
rbfXnoneKernGradient.m: Compute a cross gradient between RBF and DUMMY
lfmwhiteComputeGradThetaH1.m: computes a portion of the LFM-WHITE kernel's gradient w.r.t. theta.
lfmwhiteComputeGradThetaH2.m: computes a portion of the LFM-WHITE kernel's gradient w.r.t. theta.
lfmwhiteKernCompute.m: Compute the LFM-WHITE kernel given the parameters, t1
lfmwhiteKernDiagCompute.m: Compute diagonal of LFM-WHITE kernel.
lfmwhiteKernDiagGradX.m: Gradient of LFM-WHITE kernel's diagonal w.r.t. t.
lfmwhiteKernDisplay.m: Display parameters of the LFM-WHITE kernel.
lfmwhiteKernExpandParam.m: Create kernel structure from LFM-WHITE kernel's
rbfwhiteXwhiteKernGradient.m: Compute gradient between the RBF-WHITE and
rbfwhiteKernDiagCompute.m: Compute diagonal of RBF-WHITE kernel.
simwhiteKernExpandParam.m: Create kernel structure from SIM-WHITE kernel's
gaussianwhiteKernDisplay.m: Display parameters of the GAUSSIAN white kernel.
ggwhiteKernExtractParam.m: Extract parameters from the GG WHITE kernel structure.
rbfwhiteXrbfwhiteKernGradient.m: Compute a cross gradient between two
biasKernCompute.m: Compute the BIAS kernel given the parameters and X.
lfmwhiteXlfmwhiteKernCompute.m: Compute a cross kernel between two LFM-WHITE
lfmwhiteXlfmwhiteKernGradient.m: Compute a cross gradient between two
lfmwhiteXwhiteKernCompute.m: Compute a cross kernel between the LFM-WHITE
lfmwhiteXwhiteKernGradient.m: Compute gradient between the LFM-WHITE and
simwhiteXsimwhiteKernCompute.m: Compute a cross kernel between two SIM-WHITE
simwhiteXsimwhiteKernGradient.m: Compute a cross gradient between two
simwhiteXwhiteKernCompute.m: Compute a cross kernel between the SIM-WHITE
gaussianwhiteKernDiagGradient.m: Compute the gradient of the gaussian white 
ggwhiteKernGradient.m: Gradient of GG WHITE kernel's parameters.
rbfwhiteKernExpandParam.m: Create kernel structure from RBF-WHITE kernel's
ardKernParamInit.m: ARD kernel parameter initialisation.
wienerKernExtractParam.m: Extract parameters from the WIENER kernel structure.
simwhiteKernCompute.m: Compute the SIM-WHITE kernel given the parameters, t1
simwhiteKernDiagCompute.m: Compute the diagonal of the SIM-WHITE kernel.
simwhiteKernDiagGradX.m: Gradient of SIM-WHITE kernel's diagonal w.r.t. t.
simwhiteKernDisplay.m: Display parameters of the SIM-WHITE kernel.
simwhiteKernExtractParam.m: Extract parameters from the SIM-WHITE kernel
simwhiteKernGradX.m: Gradient of SIM-WHITE kernel with respect to a point t.
simwhiteKernGradient.m: Gradient of SIM-WHITE kernel's parameters.
simwhiteKernParamInit.m: SIM-WHITE kernel parameter initialisation.
gaussianwhiteKernDiagCompute.m: Compute diagonal of gaussian white kernel.
gaussianwhiteKernDiagGradX.m: Gradient of gaussian white kernel's diagonal with respect to X.
ggwhiteKernParamInit.m: GG WHITE kernel parameter initialisation.
ggwhiteXgaussianwhiteKernCompute.m: Compute a cross kernel between the GG white and GAUSSIAN white kernels.
wienerKernGradX.m: Gradient of WIENER kernel with respect to a point x.
wienerKernGradient.m: Gradient of WIENER kernel's parameters.
ggwhiteXgaussianwhiteKernGradient.m: Compute gradient between the GG white
ggwhiteXggwhiteKernCompute.m: Compute a cross kernel between two GG white kernels.
ggwhiteXggwhiteKernGradient.m: Compute a cross gradient between two GG WHITE kernels.
ggwhiteXwhiteKernGradient.m: Compute gradient between the GGWHITE and WHITE kernels.
ggwhiteKernCompute.m: Compute the GG white kernel given the parameters and X.
lfmwhiteXrbfwhiteKernCompute.m: Compute a cross kernel between an LFM-WHITE
rbfard2KernParamInit.m: RBFARD2 kernel parameter initialisation.
simSample.m: Sample from SIM kernel
biasKernExpandParam.m: Create kernel structure from BIAS kernel's parameters.
wienerKernCompute.m: Compute the WIENER kernel given the parameters and X.
wienerKernParamInit.m: WIENER kernel parameter initialisation.
multiKernGradient.m: Gradient of MULTI kernel's parameters.
multiKernGradientBlockX.m:
biasKernExtractParam.m: Extract parameters from the BIAS kernel structure.
rbfard2KernGradient.m: Gradient of RBFARD2 kernel's parameters.
linard2KernParamInit.m: LINARD2 kernel parameter initialisation.
dexpKernParamInit.m: The double exponential kernel is usually called
dexpKernDiagGradX.m: Gradient of the double exponential kernel's diagonal
dexpKernExtractParam.m: Extract parameters from the double exponential's
lfmwhiteXrbfwhiteKernGradient.m: Compute a cross gradient between an LFM-WHITE
lfmwhiteComputePsi.m: Helper function for comptuing part of the LFM-WHITE
rbfinfwhiteKernDiagGradX.m: Gradient of RBF-WHITE kernel's (with integration
linard2KernDiagGradX.m: Gradient of LINARD2 kernel's diagonal with respect to X.
rbfinfwhiteKernDiagCompute.m: Compute diagonal of RBF-WHITE kernel (with
ggwhiteXwhiteKernCompute.m: Compute a cross kernel between a GG white and
whiteXwhiteKernGradX.m:
rbfinfwhiteKernDisplay.m: Display parameters of the RBF-WHITE kernel (with
rbfinfwhiteKernExpandParam.m: Create kernel structure from RBF-WHITE kernel's
rbfinfwhiteKernExtractParam.m: Extract parameters from the RBF-WHITE kernel
rbfinfwhiteKernGradX.m: Gradient of RBF-WHITE kernel (with integration limits
rbfinfwhiteKernGradient.m: Gradient of the parameters of the RBF-WHITE kernel
dexpKernGradient.m: Gradient of the double exponential kernel's parameters.
whitehKernCompute.m: Compute the WHITEH kernel given the parameters and X.
whitehKernDiagCompute.m: Compute diagonal of WHITEH kernel.
whitehKernDiagGradX.m: Gradient of WHITEH kernel's diagonal with respect to X.
whitehKernExtractParam.m: Extract parameters from the WHITEH kernel structure.
whitehKernGradX.m: Gradient of WHITEH kernel with respect to input locations.
whitehKernDiagGradient.m: Compute the gradient of the WHITEH kernel's diagonal wrt parameters.
whitehKernDisplay.m: Display parameters of the WHITEH kernel.
whitehKernExpandParam.m: Create kernel structure from WHITEH kernel's parameters.
rbfard2KernGradX.m: Gradient of RBFARD2 kernel with respect to input locations.
rbfinfwhiteKernParamInit.m: The RBF-WHITE-INF kernel is a convolutional
rbfinfwhiteXrbfinfwhiteKernCompute.m: Compute a cross kernel between two
rbfinfwhiteXrbfinfwhiteKernGradient.m: Compute a cross gradient between two
rbfinfwhiteXwhiteKernCompute.m: Compute a cross kernel between the RBF-WHITE
rbfinfwhiteXwhiteKernGradient.m: Compute gradient between the RBF-WHITE kernel
linard2KernGradient.m: Gradient of LINARD2 kernel's parameters.
rbfard2KernExpandParam.m: Create kernel structure from RBFARD2 kernel's parameters.
rbfard2KernExtractParam.m: Extract parameters from the RBFARD2 kernel structure.
dexpKernGradX.m: Gradient of the double exponential kernel with respect to a
simwhiteXrbfinfwhiteKernCompute.m: Compute a cross kernel between a SIM-WHITE
simwhiteXrbfinfwhiteKernGradient.m: Compute a cross gradient between a
whitehKernGradient.m: Gradient of WHITEH kernel's parameters.
whitehKernParamInit.m: WHITEH kernel parameter initialisation.
linard2KernCompute.m: Compute the LINARD2 kernel given the parameters and X.
linard2KernDiagCompute.m: Compute diagonal of LINARD2 kernel.
linard2KernExtractParam.m: Extract parameters from the LINARD2 kernel structure.
rbfinfwhiteKernCompute.m: Compute the RBF-WHITE kernel (with integration limits
dexpKernDisplay.m: Display parameters of the double exponential kernel.
dexpKernExpandParam.m: Create a kernel structure from the double exponential
dexpKernDiagCompute.m: Compute diagonal of the double exponential kernel.
simComputeHStat.m: Helper function for computing part of the stationary version
linard2KernDisplay.m: Display parameters of the LINARD2 kernel.
linard2KernExpandParam.m: Create kernel structure from LINARD2 kernel's parameters.
linard2KernGradX.m: Gradient of LINARD2 kernel with respect to input locations.
rbfard2KernDiagCompute.m: Compute diagonal of RBFARD2 kernel.
rbfard2KernDiagGradX.m: Gradient of RBFARD2 kernel's diagonal with respect to X.
rbfard2KernDiagGradient.m: Compute the gradient of the RBFARD2 kernel's diagonal wrt parameters.
rbfard2KernDisplay.m: Display parameters of the RBFARD2 kernel.
