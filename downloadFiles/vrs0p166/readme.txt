KERN software
Version 0.166		Sunday 04 Feb 2007 at 22:22
Copyright (c) 2007 Neil D. Lawrence

Please note that this toolbox requires MATLAB 7.0 or higher to run. The toolbox relies on the optimi and ndlutil toolboxes, available at http://www.dcs.sheffield.ac.uk/~neil/optimi/downloadFiles and http://www.dcs.shef.ac.uk/~neil/ndultil/downloadFiles/.


Version 0.166
-------------

Added periodic version of RBF kernel (see Rasmussen and Williams pg 92 or Mackay's introduction to GPs (1998)) and periodic version of Gibbs's non-statinary kernel (see e.g. pg 93 of Rasmussen and Williams).

Version 0.165
-------------

Added flag which indicates whether or not a kernel is stationary. This can be used for speeding computations (stationary kernels have a constant diagonal). Also replaced calls to constraining functions with 'optimiDefaultConstraint' calls which return the default constraint (making it easier for the user to change).

Version 0.163
-------------

This release removes the stubs for several KernDiagGradX.m files, which
were confusing kernDiagGradX.m, which assumes they only exist if the function
is implemented. For the kernel types 'lin', 'poly', 'mlp', and their 'ard'
counter-types, these files existed but weren't yet implemented.


Version 0.162
-------------

Added the Gibbs's non-stationary kernel, the rational quadratic kernel and the Matern kernel with nu = 3/2 and nu = 5/2.

Version 0.161
-------------

Updated with the Single Input Motif kernel, and improved the documentation.

Version 0.16
------------

An intermediate release with some problems.

Version 0.151
-------------
 
Added kernDiagGradient command and versions of it for rbf, white, bias, whitefixed and rbfard code. This command improves the speed of the fitc approximation in the FGPLVM code a lot.

Version 0.15
------------

Added tensor kernels and white noise kernels which don't return a parameter for optimisation: 'whitefixed'. White fixed kernels were added by Nathaniel King.

Version 0.142 Release Notes
---------------------------

Minor changes to the kernDisplay command and each command for the relevant sub kernels. New command allows spaces to be placed in front of the display so that the kernel can be better formated when displayed as part of a larger model.

Also added is the kernel 'file' which is a kernel for which values are precomputed and stored in a file.

Version 0.141 Release Notes
---------------------------

Included the kernGetVariance function for obtaining the `signal' associated with the kernel for use with the FGPLVM toolbox.

Version 0.14 Release Notes
--------------------------

Added computation of parameter gradients with respect to sub-matrices of the kernel matrix to allow for optimisation of inducing points.

Version 0.131 Release Notes
---------------------------

Added polynomial and polynomial ARD kernels for completeness (their use is not recommended in Gaussian processes). Added kernReadFromFID.m for reading in a kernel from a C++ written file.

Version 0.13 Release Notes
--------------------------

Added kernSetWhite as a helper function to set the level of white noise in the kernel.

General Overview
----------------

This toolbox implements the different kernels. At the time of writing two toolboxes make use of KERN, IVM vs 0.31 and FBD vs 0.2.

Interaction with the toolbox is done through the interface files which are prefixed by kern. The toolbox is designed to allow linear combinations of kernels with a minimum of fuss (using the cmpnd kernel).

The toolbox was spun out of the IVM toolbox, and most of the files are based on files in IVM 0.221.

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
ardKernDiagGradX.m: Gradient of ARD kernel's diagonal with respect to X.
ardKernDisplay.m: Display parameters of the ARD kernel.
ardKernExpandParam.m: Create kernel structure from ARD kernel's parameters.
ardKernExtractParam.m: Extract parameters from the ARD kernel structure.
ardKernGradient.m: Gradient of ARD kernel's parameters.
ardKernGradX.m: Gradient of ARD kernel with respect to a point x.
ardKernParamInit.m: ARD kernel parameter initialisation.
biasKernCompute.m: Compute the BIAS kernel given the parameters and X.
biasKernDiagCompute.m: Compute diagonal of BIAS kernel.
biasKernDiagGradient.m: Compute the gradient of the BIAS kernel's diagonal wrt parameters.
biasKernDiagGradX.m: Gradient of BIAS kernel's diagonal with respect to X.
biasKernDisplay.m: Display parameters of the BIASkernel.
biasKernExpandParam.m: Create kernel structure from BIAS kernel's parameters.
biasKernExtractParam.m: Extract parameters from the BIAS kernel structure.
biasKernGradient.m: Gradient of BIAS kernel's parameters.
biasKernGradX.m: Gradient of BIAS kernel with respect to input locations.
biasKernParamInit.m: BIAS kernel parameter initialisation.
cmpndKernCompute.m: Compute the CMPND kernel given the parameters and X.
cmpndKernDiagCompute.m: Compute diagonal of CMPND kernel.
cmpndKernDiagGradient.m: Compute the gradient of the CMPND kernel's diagonal wrt parameters.
cmpndKernDiagGradX.m: Gradient of CMPND kernel's diagonal with respect to X.
cmpndKernDisplay.m: Display parameters of the CMPND kernel.
cmpndKernExpandParam.m: Create kernel structure from CMPND kernel's parameters.
cmpndKernExtractParam.m: Extract parameters from the CMPND kernel structure.
cmpndKernGradient.m: Gradient of CMPND kernel's parameters.
cmpndKernGradX.m: Gradient of CMPND kernel with respect to a point x.
cmpndKernParamInit.m: CMPND kernel parameter initialisation.
cmpndKernReadParamsFromFID.m: Read a compound kernel from a C++ file.
cmpndKernSetIndex.m: Set the indices in the compound kernel.
computeKernel.m: Compute the kernel given the parameters and X.
expKernCompute.m: Compute the EXP kernel given the parameters and X.
expKernDiagCompute.m: Compute diagonal of EXP kernel.
expKernDiagGradX.m: Gradient of EXP kernel's diagonal with respect to X.
expKernDisplay.m: Display parameters of the EXP kernel.
expKernExpandParam.m: Create kernel structure from EXP kernel's parameters.
expKernExtractParam.m: Extract parameters from the EXP kernel structure.
expKernGradient.m: Gradient of EXP kernel's parameters.
expKernGradX.m: Gradient of EXP kernel with respect to a point x.
expKernParamInit.m: EXP kernel parameter initialisation.
fileKernCompute.m: Compute the FILE kernel given the parameters and X.
fileKernDiagCompute.m: Compute diagonal of FILE kernel.
fileKernDisplay.m: Display parameters of the FILE kernel.
fileKernExpandParam.m: Create kernel structure from FILE kernel's parameters.
fileKernExtractParam.m: Extract parameters from the FILE kernel structure.
fileKernGradient.m: Gradient of FILE kernel's parameters.
fileKernGradX.m: Gradient of FILE kernel with respect to a point x.
fileKernParamInit.m: FILE kernel parameter initialisation.
fileKernRead.m: Read kernel values from file or cache.
gibbsKernCompute.m: Compute the GIBBS kernel given the parameters and X.
gibbsKernDiagCompute.m: Compute diagonal of GIBBS kernel.
gibbsKernDiagGradient.m: Compute the gradient of the GIBBS kernel's diagonal wrt parameters.
gibbsKernDiagGradX.m: Gradient of GIBBS kernel's diagonal with respect to X.
gibbsKernDisplay.m: Display parameters of the GIBBS kernel.
gibbsKernExpandParam.m: Create kernel structure from GIBBS kernel's parameters.
gibbsKernExtractParam.m: Extract parameters from the GIBBS kernel structure.
gibbsKernGradient.m: Gradient of GIBBS kernel's parameters.
gibbsKernGradX.m: Gradient of GIBBS kernel with respect to input locations.
gibbsKernParamInit.m: GIBBS kernel parameter initialisation.
gibbsKernSetLengthScaleFunc.m: Set the length scale function of the GIBBS kernel.
gibbsperiodicKernCompute.m: Compute the GIBBSPERIODIC kernel given the parameters and X.
gibbsperiodicKernDiagCompute.m: Compute diagonal of GIBBSPERIODIC kernel.
gibbsperiodicKernDiagGradient.m: Compute the gradient of the GIBBSPERIODIC kernel's diagonal wrt parameters.
gibbsperiodicKernDiagGradX.m: Gradient of GIBBSPERIODIC kernel's diagonal with respect to X.
gibbsperiodicKernDisplay.m: Display parameters of the GIBBSPERIODIC kernel.
gibbsperiodicKernExpandParam.m: Create kernel structure from GIBBSPERIODIC kernel's parameters.
gibbsperiodicKernExtractParam.m: Extract parameters from the GIBBSPERIODIC kernel structure.
gibbsperiodicKernGradient.m: Gradient of GIBBSPERIODIC kernel's parameters.
gibbsperiodicKernGradX.m: Gradient of GIBBSPERIODIC kernel with respect to a point x.
gibbsperiodicKernParamInit.m: GIBBSPERIODIC kernel parameter initialisation.
kernCompute.m: Compute the kernel given the parameters and X.
kernCreate.m: Initialise a kernel structure.
kernDiagCompute.m: Compute the kernel given the parameters and X.
kernDiagGradient.m: Compute the gradient of the kernel's parameters for the diagonal.
kernDiagGradX.m: Compute the gradient of the  kernel wrt X.
kernDisplay.m: Display the parameters of the kernel.
kernExpandParam.m: Expand parameters to form a kernel structure.
kernExtractParam.m: Extract parameters from kernel structure.
kernFactors.m: Extract factors associated with transformed optimisation space.
kernGetVariance.m: Get the signal associated with a the kernel.
kernGradient.m: Compute the gradient wrt the kernel's parameters.
kernGradX.m: Compute the gradient of the kernel wrt X.
kernParamInit.m: Kernel parameter initialisation.
kernPca.m: performs KPCA.
kernPriorGradient.m: Compute gradient terms associated with kernel priors.
kernPriorLogProb.m: Compute penalty terms associated with kernel priors.
kernReadFromFID.m: Load from an FID written by the C++ implementation.
kernReadParamsFromFID.m: Read the kernel parameters from C++ file FID.
kernSetIndex.m: Set the indices on a compound kernel.
kernSetWhite.m: Helper function to set the white noise in a kernel if it exists.
kernTest.m: Run some tests on the specified kernel.
kernToolboxes.m: Load in the relevant toolboxes for kern.
linardKernCompute.m: Compute the LINARD kernel given the parameters and X.
linardKernDiagCompute.m: Compute diagonal of LINARD kernel.
linardKernDiagGradX.m: Gradient of LINARD kernel's diagonal with respect to X.
linardKernDisplay.m: Display parameters of the LINARD kernel.
linardKernExpandParam.m: Create kernel structure from LINARD kernel's parameters.
linardKernExtractParam.m: Extract parameters from the LINARD kernel structure.
linardKernGradient.m: Gradient of LINARD kernel's parameters.
linardKernGradX.m: Gradient of LINARD kernel with respect to input locations.
linardKernParamInit.m: LINARD kernel parameter initialisation.
linKernCompute.m: Compute the LIN kernel given the parameters and X.
linKernDiagCompute.m: Compute diagonal of LIN kernel.
linKernDiagGradX.m: Gradient of LIN kernel's diagonal with respect to X.
linKernDisplay.m: Display parameters of the LIN kernel.
linKernExpandParam.m: Create kernel structure from LIN kernel's parameters.
linKernExtractParam.m: Extract parameters from the LIN kernel structure.
linKernGradient.m: Gradient of LIN kernel's parameters.
linKernGradX.m: Gradient of LIN kernel with respect to input locations.
linKernParamInit.m: LIN kernel parameter initialisation.
matern32KernCompute.m: Compute the MATERN32 kernel given the parameters and X.
matern32KernDiagCompute.m: Compute diagonal of MATERN32 kernel.
matern32KernDiagGradient.m: Compute the gradient of the MATERN32 kernel's diagonal wrt parameters.
matern32KernDiagGradX.m: Gradient of MATERN32 kernel's diagonal with respect to X.
matern32KernDisplay.m: Display parameters of the MATERN32 kernel.
matern32KernExpandParam.m: Create kernel structure from MATERN32 kernel's parameters.
matern32KernExtractParam.m: Extract parameters from the MATERN32 kernel structure.
matern32KernGradient.m: Gradient of MATERN32 kernel's parameters.
matern32KernGradX.m: Gradient of MATERN32 kernel with respect to input locations.
matern32KernParamInit.m: MATERN32 kernel parameter initialisation.
matern52KernCompute.m: Compute the MATERN52 kernel given the parameters and X.
matern52KernDiagCompute.m: Compute diagonal of MATERN52 kernel.
matern52KernDiagGradient.m: Compute the gradient of the MATERN52 kernel's diagonal wrt parameters.
matern52KernDiagGradX.m: Gradient of MATERN52 kernel's diagonal with respect to X.
matern52KernDisplay.m: Display parameters of the MATERN52 kernel.
matern52KernExpandParam.m: Create kernel structure from MATERN52 kernel's parameters.
matern52KernExtractParam.m: Extract parameters from the MATERN52 kernel structure.
matern52KernGradient.m: Gradient of MATERN52 kernel's parameters.
matern52KernGradX.m: Gradient of MATERN52 kernel with respect to input locations.
matern52KernParamInit.m: MATERN52 kernel parameter initialisation.
mlpardKernCompute.m: Compute the MLPARD kernel given the parameters and X.
mlpardKernDiagCompute.m: Compute diagonal of MLPARD kernel.
mlpardKernDiagGradX.m: Gradient of MLPARD kernel's diagonal with respect to X.
mlpardKernDisplay.m: Display parameters of the MLPARD kernel.
mlpardKernExpandParam.m: Create kernel structure from MLPARD kernel's parameters.
mlpardKernExtractParam.m: Extract parameters from the MLPARD kernel structure.
mlpardKernGradient.m: Gradient of MLPARD kernel's parameters.
mlpardKernGradX.m: Gradient of MLPARD kernel with respect to input locations.
mlpardKernParamInit.m: MLPARD kernel parameter initialisation.
mlpKernCompute.m: Compute the MLP kernel given the parameters and X.
mlpKernDiagCompute.m: Compute diagonal of MLP kernel.
mlpKernDiagGradX.m: Gradient of MLP kernel's diagonal with respect to X.
mlpKernDisplay.m: Display parameters of the MLP kernel.
mlpKernExpandParam.m: Create kernel structure from MLP kernel's parameters.
mlpKernExtractParam.m: Extract parameters from the MLP kernel structure.
mlpKernGradient.m: Gradient of MLP kernel's parameters.
mlpKernGradX.m: Gradient of MLP kernel with respect to input locations.
mlpKernParamInit.m: MLP kernel parameter initialisation.
multiKernCompute.m: Compute the MULTI kernel given the parameters and X.
multiKernComputeBlock.m:
multiKernDiagCompute.m: Compute diagonal of MULTI kernel.
multiKernDiagGradient.m: Compute the gradient of the MULTI kernel's diagonal wrt parameters.
multiKernDiagGradX.m: Gradient of MULTI kernel's diagonal with respect to X.
multiKernDisplay.m: Display parameters of the MULTI kernel.
multiKernExpandParam.m: Create kernel structure from MULTI kernel's parameters.
multiKernExtractParam.m: Extract parameters from the MULTI kernel structure.
multiKernGradient.m: Gradient of MULTI kernel's parameters.
multiKernGradientBlock.m:
multiKernGradX.m: Gradient of MULTI kernel with respect to a point x.
multiKernParamInit.m: MULTI kernel parameter initialisation.
multiKernTest.m: Run some tests on the multiple output block kernel.
polyardKernCompute.m: Compute the POLYARD kernel given the parameters and X.
polyardKernDiagCompute.m: Compute diagonal of POLYARD kernel.
polyardKernDiagGradX.m: Gradient of POLYARD kernel's diagonal with respect to X.
polyardKernDisplay.m: Display parameters of the POLYARD kernel.
polyardKernExpandParam.m: Create kernel structure from POLYARD kernel's parameters.
polyardKernExtractParam.m: Extract parameters from the POLYARD kernel structure.
polyardKernGradient.m: Gradient of POLYARD kernel's parameters.
polyardKernGradX.m: Gradient of POLYARD kernel with respect to input locations.
polyardKernParamInit.m: POLYARD kernel parameter initialisation.
polyKernCompute.m: Compute the POLY kernel given the parameters and X.
polyKernDiagCompute.m: Compute diagonal of POLY kernel.
polyKernDiagGradX.m: Gradient of POLY kernel's diagonal with respect to X.
polyKernDisplay.m: Display parameters of the POLY kernel.
polyKernExpandParam.m: Create kernel structure from POLY kernel's parameters.
polyKernExtractParam.m: Extract parameters from the POLY kernel structure.
polyKernGradient.m: Gradient of POLY kernel's parameters.
polyKernGradX.m: Gradient of POLY kernel with respect to input locations.
polyKernParamInit.m: POLY kernel parameter initialisation.
pskernelGradient.m: Gradient on likelihood approximation for point set IVM.
pskernelObjective.m: Likelihood approximation for point set IVM.
ratquadKernCompute.m: Compute the RATQUAD kernel given the parameters and X.
ratquadKernDiagCompute.m: Compute diagonal of RATQUAD kernel.
ratquadKernDiagGradient.m: Compute the gradient of the RATQUAD kernel's diagonal wrt parameters.
ratquadKernDiagGradX.m: Gradient of RATQUAD kernel's diagonal with respect to X.
ratquadKernDisplay.m: Display parameters of the RATQUAD kernel.
ratquadKernExpandParam.m: Create kernel structure from RATQUAD kernel's parameters.
ratquadKernExtractParam.m: Extract parameters from the RATQUAD kernel structure.
ratquadKernGradient.m: Gradient of RATQUAD kernel's parameters.
ratquadKernGradX.m: Gradient of RATQUAD kernel with respect to input locations.
ratquadKernParamInit.m: RATQUAD kernel parameter initialisation.
rbfardKernCompute.m: Compute the RBFARD kernel given the parameters and X.
rbfardKernDiagCompute.m: Compute diagonal of RBFARD kernel.
rbfardKernDiagGradient.m: Compute the gradient of the RBFARD kernel's diagonal wrt parameters.
rbfardKernDiagGradX.m: Gradient of RBFARD kernel's diagonal with respect to X.
rbfardKernDisplay.m: Display parameters of the RBFARD kernel.
rbfardKernExpandParam.m: Create kernel structure from RBFARD kernel's parameters.
rbfardKernExtractParam.m: Extract parameters from the RBFARD kernel structure.
rbfardKernGradient.m: Gradient of RBFARD kernel's parameters.
rbfardKernGradX.m: Gradient of RBFARD kernel with respect to input locations.
rbfardKernParamInit.m: RBFARD kernel parameter initialisation.
rbfKernCompute.m: Compute the RBF kernel given the parameters and X.
rbfKernDiagCompute.m: Compute diagonal of RBF kernel.
rbfKernDiagGradient.m: Compute the gradient of the RBF kernel's diagonal wrt parameters.
rbfKernDiagGradX.m: Gradient of RBF kernel's diagonal with respect to X.
rbfKernDisplay.m: Display parameters of the RBF kernel.
rbfKernExpandParam.m: Create kernel structure from RBF kernel's parameters.
rbfKernExtractParam.m: Extract parameters from the RBF kernel structure.
rbfKernGradient.m: Gradient of RBF kernel's parameters.
rbfKernGradX.m: Gradient of RBF kernel with respect to input locations.
rbfKernParamInit.m: RBF kernel parameter initialisation.
rbfperiodicKernCompute.m: Compute the RBFPERIODIC kernel given the parameters and X.
rbfperiodicKernDiagCompute.m: Compute diagonal of RBFPERIODIC kernel.
rbfperiodicKernDiagGradient.m: Compute the gradient of the RBFPERIODIC kernel's diagonal wrt parameters.
rbfperiodicKernDiagGradX.m: Gradient of RBFPERIODIC kernel's diagonal with respect to X.
rbfperiodicKernDisplay.m: Display parameters of the RBFPERIODIC kernel.
rbfperiodicKernExpandParam.m: Create kernel structure from RBFPERIODIC kernel's parameters.
rbfperiodicKernExtractParam.m: Extract parameters from the RBFPERIODIC kernel structure.
rbfperiodicKernGradient.m: Gradient of RBFPERIODIC kernel's parameters.
rbfperiodicKernGradX.m: Gradient of RBFPERIODIC kernel with respect to a point x.
rbfperiodicKernParamInit.m: RBFPERIODIC kernel parameter initialisation.
simComputeH.m: Helper function for comptuing part of the SIM kernel.
simComputeTest.m: Test the file simComputeH.
simKernCompute.m: Compute the SIM kernel given the parameters and X.
simKernDiagCompute.m: Compute diagonal of SIM kernel.
simKernDiagGradient.m: Compute the gradient of the SIM kernel's diagonal wrt parameters.
simKernDiagGradX.m: Gradient of SIM kernel's diagonal with respect to X.
simKernDisplay.m: Display parameters of the SIM kernel.
simKernExpandParam.m: Create kernel structure from SIM kernel's parameters.
simKernExtractParam.m: Extract parameters from the SIM kernel structure.
simKernGradient.m: Gradient of SIM kernel's parameters.
simKernGradX.m: Gradient of SIM kernel with respect to a point x.
simKernParamInit.m: SIM kernel parameter initialisation.
simXrbfKernCompute.m: Compute a cross kernel between the SIM and RBF kernels.
simXrbfKernGradient.m: Compute gradient between the SIM and RBF kernels.
simXsimKernCompute.m: Compute a cross kernel between two SIM kernels.
simXsimKernGradient.m: Compute a cross gradient between two SIM kernels.
sqexpKernCompute.m: Compute the SQEXP kernel given the parameters and X.
sqexpKernDiagCompute.m: Compute diagonal of SQEXP kernel.
sqexpKernDiagGradient.m: Compute the gradient of the SQEXP kernel's diagonal wrt parameters.
sqexpKernDiagGradX.m: Gradient of SQEXP kernel's diagonal with respect to X.
sqexpKernDisplay.m: Display parameters of the SQEXP kernel.
sqexpKernExpandParam.m: Create kernel structure from SQEXP kernel's parameters.
sqexpKernExtractParam.m: Extract parameters from the SQEXP kernel structure.
sqexpKernGradient.m: Gradient of SQEXP kernel's parameters.
sqexpKernGradX.m: Gradient of SQEXP kernel with respect to a point x.
sqexpKernParamInit.m: SQEXP kernel parameter initialisation.
tensorKernCompute.m: Compute the TENSOR kernel given the parameters and X.
tensorKernDiagCompute.m: Compute diagonal of TENSOR kernel.
tensorKernDiagGradient.m: Compute the gradient of the TENSOR kernel's diagonal wrt parameters.
tensorKernDiagGradX.m: Gradient of TENSOR kernel's diagonal with respect to X.
tensorKernDisplay.m: Display parameters of the TENSOR kernel.
tensorKernExpandParam.m: Create kernel structure from TENSOR kernel's parameters.
tensorKernExtractParam.m: Extract parameters from the TENSOR kernel structure.
tensorKernGradient.m: Gradient of TENSOR kernel's parameters.
tensorKernGradX.m: Gradient of TENSOR kernel with respect to a point x.
tensorKernParamInit.m: TENSOR kernel parameter initialisation.
tensorKernSetIndex.m: Set the indices in the tensor kernel.
tensorKernSlash.m: Tensor kernel created by removing ith component.
whitefixedKernCompute.m: Compute the WHITEFIXED kernel given the parameters and X.
whitefixedKernDiagCompute.m: Compute diagonal of WHITEFIXED kernel.
whitefixedKernDiagGradient.m: Compute the gradient of the WHITEFIXED kernel's diagonal wrt parameters.
whitefixedKernDiagGradX.m: Gradient of WHITEFIXED kernel's diagonal with respect to X.
whitefixedKernDisplay.m: Display parameters of the WHITEFIXED kernel.
whitefixedKernExpandParam.m: Create kernel structure from WHITEFIXED kernel's parameters.
whitefixedKernExtractParam.m: Extract parameters from the WHITEFIXED kernel structure.
whitefixedKernGradient.m: Gradient of WHITEFIXED kernel's parameters.
whitefixedKernGradX.m: Gradient of WHITEFIXED kernel with respect to a point x.
whitefixedKernParamInit.m: WHITEFIXED kernel parameter initialisation.
whiteKernCompute.m: Compute the WHITE kernel given the parameters and X.
whiteKernDiagCompute.m: Compute diagonal of WHITE kernel.
whiteKernDiagGradient.m: Compute the gradient of the WHITE kernel's diagonal wrt parameters.
whiteKernDiagGradX.m: Gradient of WHITE kernel's diagonal with respect to X.
whiteKernDisplay.m: Display parameters of the WHITEkernel.
whiteKernExpandParam.m: Create kernel structure from WHITE kernel's parameters.
whiteKernExtractParam.m: Extract parameters from the WHITE kernel structure.
whiteKernGradient.m: Gradient of WHITE kernel's parameters.
whiteKernGradX.m: Gradient of WHITE kernel with respect to input locations.
whiteKernParamInit.m: WHITE kernel parameter initialisation.
whiteXwhiteKernCompute.m: Compute a cross kernel between two WHITE kernels.
whiteXwhiteKernGradient.m: Compute a cross gradient between two WHITE kernels.
