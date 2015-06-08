KERN software
Version 0.167		Tuesday 22 May 2007 at 22:46
Copyright (c) 2007 Neil D. Lawrence

Please note that this toolbox requires MATLAB 7.0 or higher to run. The toolbox relies on the optimi and ndlutil toolboxes, available at http://www.dcs.sheffield.ac.uk/~neil/optimi/downloadFiles and http://www.dcs.shef.ac.uk/~neil/ndultil/downloadFiles/.


Version 0.167
-------------

Added 'translate' kernel which allows wrapping of other kernels with a kernel that translates the input location. Useful for moving the non-stationarity around the input space.

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

simXrbfKernCompute.m: Compute a cross kernel between the SIM and RBF kernels.
ardKernDiagGradX.m: Gradient of ARD kernel's diagonal with respect to X.
kernDiagCompute.m: Compute the kernel given the parameters and X.
translateKernGradient.m: Gradient of TRANSLATE kernel's parameters.
linKernExpandParam.m: Create kernel structure from LIN kernel's parameters.
linKernDiagGradX.m: Gradient of LIN kernel's diagonal with respect to X.
rbfperiodicKernParamInit.m: RBFPERIODIC kernel parameter initialisation.
polyardKernExtractParam.m: Extract parameters from the POLYARD kernel structure.
whitefixedKernCompute.m: Compute the WHITEFIXED kernel given the parameters and X.
matern32KernDiagGradient.m: Compute the gradient of the MATERN32 kernel's diagonal wrt parameters.
biasKernDisplay.m: Display parameters of the BIASkernel.
polyKernExtractParam.m: Extract parameters from the POLY kernel structure.
kernReadParamsFromFID.m: Read the kernel parameters from C++ file FID.
polyKernDisplay.m: Display parameters of the POLY kernel.
kernCompute.m: Compute the kernel given the parameters and X.
matern32KernGradX.m: Gradient of MATERN32 kernel with respect to input locations.
expKernExpandParam.m: Create kernel structure from EXP kernel's parameters.
kernCreate.m: Initialise a kernel structure.
rbfperiodicKernExtractParam.m: Extract parameters from the RBFPERIODIC kernel structure.
matern52KernDisplay.m: Display parameters of the MATERN52 kernel.
rbfKernExtractParam.m: Extract parameters from the RBF kernel structure.
simKernGradX.m: Gradient of SIM kernel with respect to a point x.
linardKernGradX.m: Gradient of LINARD kernel with respect to input locations.
simXsimKernCompute.m: Compute a cross kernel between two SIM kernels.
ardKernDiagCompute.m: Compute diagonal of ARD kernel.
linKernParamInit.m: LIN kernel parameter initialisation.
kernExtractParam.m: Extract parameters from kernel structure.
whiteKernExtractParam.m: Extract parameters from the WHITE kernel structure.
rbfardKernDiagCompute.m: Compute diagonal of RBFARD kernel.
expKernDisplay.m: Display parameters of the EXP kernel.
ratquadKernExpandParam.m: Create kernel structure from RATQUAD kernel's parameters.
polyardKernGradX.m: Gradient of POLYARD kernel with respect to input locations.
fileKernGradX.m: Gradient of FILE kernel with respect to a point x.
mlpKernDisplay.m: Display parameters of the MLP kernel.
gibbsKernDiagGradX.m: Gradient of GIBBS kernel's diagonal with respect to X.
polyardKernExpandParam.m: Create kernel structure from POLYARD kernel's parameters.
gibbsKernDiagGradient.m: Compute the gradient of the GIBBS kernel's diagonal wrt parameters.
rbfKernParamInit.m: RBF kernel parameter initialisation.
polyardKernParamInit.m: POLYARD kernel parameter initialisation.
fileKernGradient.m: Gradient of FILE kernel's parameters.
matern52KernDiagGradient.m: Compute the gradient of the MATERN52 kernel's diagonal wrt parameters.
multiKernExpandParam.m: Create kernel structure from MULTI kernel's parameters.
tensorKernExtractParam.m: Extract parameters from the TENSOR kernel structure.
rbfperiodicKernExpandParam.m: Create kernel structure from RBFPERIODIC kernel's parameters.
biasKernDiagCompute.m: Compute diagonal of BIAS kernel.
tensorKernSetIndex.m: Set the indices in the tensor kernel.
matern32KernDisplay.m: Display parameters of the MATERN32 kernel.
rbfardKernCompute.m: Compute the RBFARD kernel given the parameters and X.
ratquadKernGradX.m: Gradient of RATQUAD kernel with respect to input locations.
tensorKernExpandParam.m: Create kernel structure from TENSOR kernel's parameters.
linKernDiagCompute.m: Compute diagonal of LIN kernel.
cmpndKernDiagGradX.m: Gradient of CMPND kernel's diagonal with respect to X.
simKernExtractParam.m: Extract parameters from the SIM kernel structure.
linKernGradX.m: Gradient of LIN kernel with respect to input locations.
multiKernDisplay.m: Display parameters of the MULTI kernel.
mlpardKernCompute.m: Compute the MLPARD kernel given the parameters and X.
matern52KernExpandParam.m: Create kernel structure from MATERN52 kernel's parameters.
polyKernCompute.m: Compute the POLY kernel given the parameters and X.
gibbsKernGradX.m: Gradient of GIBBS kernel with respect to input locations.
polyardKernCompute.m: Compute the POLYARD kernel given the parameters and X.
biasKernExpandParam.m: Create kernel structure from BIAS kernel's parameters.
simKernCompute.m: Compute the SIM kernel given the parameters and X.
biasKernCompute.m: Compute the BIAS kernel given the parameters and X.
expKernGradient.m: Gradient of EXP kernel's parameters.
mlpardKernGradient.m: Gradient of MLPARD kernel's parameters.
kernGetVariance.m: Get the signal associated with a the kernel.
expKernParamInit.m: EXP kernel parameter initialisation.
whiteKernGradient.m: Gradient of WHITE kernel's parameters.
matern52KernParamInit.m: MATERN52 kernel parameter initialisation.
kernDiagGradX.m: Compute the gradient of the  kernel wrt X.
rbfperiodicKernGradient.m: Gradient of RBFPERIODIC kernel's parameters.
mlpardKernDiagCompute.m: Compute diagonal of MLPARD kernel.
biasKernGradX.m: Gradient of BIAS kernel with respect to input locations.
simKernDiagGradient.m: Compute the gradient of the SIM kernel's diagonal wrt parameters.
whiteKernExpandParam.m: Create kernel structure from WHITE kernel's parameters.
linKernCompute.m: Compute the LIN kernel given the parameters and X.
gibbsperiodicKernGradient.m: Gradient of GIBBSPERIODIC kernel's parameters.
rbfKernDisplay.m: Display parameters of the RBF kernel.
kernDiagGradient.m: Compute the gradient of the kernel's parameters for the diagonal.
tensorKernGradX.m: Gradient of TENSOR kernel with respect to a point x.
mlpKernCompute.m: Compute the MLP kernel given the parameters and X.
matern52KernDiagCompute.m: Compute diagonal of MATERN52 kernel.
expKernCompute.m: Compute the EXP kernel given the parameters and X.
rbfKernGradX.m: Gradient of RBF kernel with respect to input locations.
sqexpKernDiagGradX.m: Gradient of SQEXP kernel's diagonal with respect to X.
matern32KernExpandParam.m: Create kernel structure from MATERN32 kernel's parameters.
multiKernDiagCompute.m: Compute diagonal of MULTI kernel.
whiteKernParamInit.m: WHITE kernel parameter initialisation.
ratquadKernDiagGradX.m: Gradient of RATQUAD kernel's diagonal with respect to X.
polyardKernDisplay.m: Display parameters of the POLYARD kernel.
gibbsperiodicKernParamInit.m: GIBBSPERIODIC kernel parameter initialisation.
tensorKernParamInit.m: TENSOR kernel parameter initialisation.
gibbsKernExpandParam.m: Create kernel structure from GIBBS kernel's parameters.
tensorKernSlash.m: Tensor kernel created by removing ith component.
biasKernExtractParam.m: Extract parameters from the BIAS kernel structure.
simKernExpandParam.m: Create kernel structure from SIM kernel's parameters.
expKernGradX.m: Gradient of EXP kernel with respect to a point x.
simKernParamInit.m: SIM kernel parameter initialisation.
rbfardKernGradX.m: Gradient of RBFARD kernel with respect to input locations.
sqexpKernCompute.m: Compute the SQEXP kernel given the parameters and X.
whitefixedKernGradX.m: Gradient of WHITEFIXED kernel with respect to a point x.
mlpKernDiagCompute.m: Compute diagonal of MLP kernel.
mlpKernParamInit.m: MLP kernel parameter initialisation.
rbfKernExpandParam.m: Create kernel structure from RBF kernel's parameters.
mlpKernGradient.m: Gradient of MLP kernel's parameters.
translateKernDisplay.m: Display parameters of the TRANSLATE kernel.
rbfperiodicKernGradX.m: Gradient of RBFPERIODIC kernel with respect to a point x.
rbfperiodicKernDisplay.m: Display parameters of the RBFPERIODIC kernel.
ratquadKernDisplay.m: Display parameters of the RATQUAD kernel.
gibbsperiodicKernExpandParam.m: Create kernel structure from GIBBSPERIODIC kernel's parameters.
gibbsKernDisplay.m: Display parameters of the GIBBS kernel.
sqexpKernGradient.m: Gradient of SQEXP kernel's parameters.
multiKernGradient.m: Gradient of MULTI kernel's parameters.
kernDisplay.m: Display the parameters of the kernel.
cmpndKernDiagGradient.m: Compute the gradient of the CMPND kernel's diagonal wrt parameters.
multiKernGradX.m: Gradient of MULTI kernel with respect to a point x.
kernPriorLogProb.m: Compute penalty terms associated with kernel priors.
whiteXwhiteKernCompute.m: Compute a cross kernel between two WHITE kernels.
kernSetWhite.m: Helper function to set the white noise in a kernel if it exists.
cmpndKernDisplay.m: Display parameters of the CMPND kernel.
rbfKernCompute.m: Compute the RBF kernel given the parameters and X.
kernPca.m: performs KPCA.
ardKernParamInit.m: ARD kernel parameter initialisation.
ardKernExtractParam.m: Extract parameters from the ARD kernel structure.
whiteKernCompute.m: Compute the WHITE kernel given the parameters and X.
matern52KernGradient.m: Gradient of MATERN52 kernel's parameters.
ardKernCompute.m: Compute the ARD kernel given the parameters and X.
whiteKernDiagCompute.m: Compute diagonal of WHITE kernel.
linardKernParamInit.m: LINARD kernel parameter initialisation.
ratquadKernGradient.m: Gradient of RATQUAD kernel's parameters.
pskernelObjective.m: Likelihood approximation for point set IVM.
kernPriorGradient.m: Compute gradient terms associated with kernel priors.
kernParamInit.m: Kernel parameter initialisation.
polyardKernDiagCompute.m: Compute diagonal of POLYARD kernel.
sqexpKernGradX.m: Gradient of SQEXP kernel with respect to a point x.
fileKernDiagCompute.m: Compute diagonal of FILE kernel.
whiteKernGradX.m: Gradient of WHITE kernel with respect to input locations.
polyardKernDiagGradX.m: Gradient of POLYARD kernel's diagonal with respect to X.
mlpKernExtractParam.m: Extract parameters from the MLP kernel structure.
polyKernParamInit.m: POLY kernel parameter initialisation.
kernReadFromFID.m: Load from an FID written by the C++ implementation.
gibbsKernExtractParam.m: Extract parameters from the GIBBS kernel structure.
whiteKernDiagGradX.m: Gradient of WHITE kernel's diagonal with respect to X.
rbfKernDiagCompute.m: Compute diagonal of RBF kernel.
whitefixedKernDiagCompute.m: Compute diagonal of WHITEFIXED kernel.
ratquadKernParamInit.m: RATQUAD kernel parameter initialisation.
rbfKernGradient.m: Gradient of RBF kernel's parameters.
multiKernDiagGradient.m: Compute the gradient of the MULTI kernel's diagonal wrt parameters.
simKernDisplay.m: Display parameters of the SIM kernel.
polyKernExpandParam.m: Create kernel structure from POLY kernel's parameters.
translateKernCompute.m: Compute the TRANSLATE kernel given the parameters and X.
kernSetIndex.m: Set the indices on a compound kernel.
kernExpandParam.m: Expand parameters to form a kernel structure.
matern32KernDiagCompute.m: Compute diagonal of MATERN32 kernel.
computeKernel.m: Compute the kernel given the parameters and X.
simKernGradient.m: Gradient of SIM kernel's parameters.
sqexpKernDiagGradient.m: Compute the gradient of the SQEXP kernel's diagonal wrt parameters.
matern52KernDiagGradX.m: Gradient of MATERN52 kernel's diagonal with respect to X.
gibbsKernGradient.m: Gradient of GIBBS kernel's parameters.
sqexpKernExtractParam.m: Extract parameters from the SQEXP kernel structure.
gibbsperiodicKernExtractParam.m: Extract parameters from the GIBBSPERIODIC kernel structure.
matern32KernDiagGradX.m: Gradient of MATERN32 kernel's diagonal with respect to X.
simXsimKernGradient.m: Compute a cross gradient between two SIM kernels.
fileKernExtractParam.m: Extract parameters from the FILE kernel structure.
biasKernDiagGradX.m: Gradient of BIAS kernel's diagonal with respect to X.
kernTest.m: Run some tests on the specified kernel.
sqexpKernDisplay.m: Display parameters of the SQEXP kernel.
linardKernCompute.m: Compute the LINARD kernel given the parameters and X.
simKernDiagCompute.m: Compute diagonal of SIM kernel.
gibbsKernDiagCompute.m: Compute diagonal of GIBBS kernel.
pskernelGradient.m: Gradient on likelihood approximation for point set IVM.
gibbsperiodicKernDisplay.m: Display parameters of the GIBBSPERIODIC kernel.
whiteXwhiteKernGradient.m: Compute a cross gradient between two WHITE kernels.
rbfardKernParamInit.m: RBFARD kernel parameter initialisation.
simComputeTest.m: Test the file simComputeH.
matern32KernGradient.m: Gradient of MATERN32 kernel's parameters.
linardKernGradient.m: Gradient of LINARD kernel's parameters.
whitefixedKernParamInit.m: WHITEFIXED kernel parameter initialisation.
mlpKernDiagGradX.m: Gradient of MLP kernel's diagonal with respect to X.
tensorKernCompute.m: Compute the TENSOR kernel given the parameters and X.
whitefixedKernExpandParam.m: Create kernel structure from WHITEFIXED kernel's parameters.
translateKernGradX.m: Gradient of TRANSLATE kernel with respect to a point x.
linKernGradient.m: Gradient of LIN kernel's parameters.
gibbsperiodicKernCompute.m: Compute the GIBBSPERIODIC kernel given the parameters and X.
mlpKernExpandParam.m: Create kernel structure from MLP kernel's parameters.
cmpndKernCompute.m: Compute the CMPND kernel given the parameters and X.
translateKernExpandParam.m: Create kernel structure from TRANSLATE kernel's parameters.
multiKernCompute.m: Compute the MULTI kernel given the parameters and X.
translateKernExtractParam.m: Extract parameters from the TRANSLATE kernel structure.
kernFactors.m: Extract factors associated with transformed optimisation space.
polyKernDiagGradX.m: Gradient of POLY kernel's diagonal with respect to X.
rbfardKernGradient.m: Gradient of RBFARD kernel's parameters.
whitefixedKernDisplay.m: Display parameters of the WHITEFIXED kernel.
biasKernParamInit.m: BIAS kernel parameter initialisation.
simKernDiagGradX.m: Gradient of SIM kernel's diagonal with respect to X.
cmpndKernExtractParam.m: Extract parameters from the CMPND kernel structure.
fileKernDisplay.m: Display parameters of the FILE kernel.
linardKernDiagCompute.m: Compute diagonal of LINARD kernel.
mlpardKernDisplay.m: Display parameters of the MLPARD kernel.
multiKernDiagGradX.m: Gradient of MULTI kernel's diagonal with respect to X.
linardKernExtractParam.m: Extract parameters from the LINARD kernel structure.
whiteKernDisplay.m: Display parameters of the WHITEkernel.
translateKernParamInit.m: TRANSLATE kernel parameter initialisation.
whitefixedKernDiagGradient.m: Compute the gradient of the WHITEFIXED kernel's diagonal wrt parameters.
multiKernGradientBlock.m:
kernToolboxes.m: Load in the relevant toolboxes for kern.
rbfardKernExtractParam.m: Extract parameters from the RBFARD kernel structure.
tensorKernDiagGradX.m: Gradient of TENSOR kernel's diagonal with respect to X.
whiteKernDiagGradient.m: Compute the gradient of the WHITE kernel's diagonal wrt parameters.
gibbsperiodicKernDiagCompute.m: Compute diagonal of GIBBSPERIODIC kernel.
linKernExtractParam.m: Extract parameters from the LIN kernel structure.
linardKernDiagGradX.m: Gradient of LINARD kernel's diagonal with respect to X.
gibbsKernSetLengthScaleFunc.m: Set the length scale function of the GIBBS kernel.
tensorKernDiagCompute.m: Compute diagonal of TENSOR kernel.
mlpardKernParamInit.m: MLPARD kernel parameter initialisation.
whitefixedKernDiagGradX.m: Gradient of WHITEFIXED kernel's diagonal with respect to X.
matern32KernParamInit.m: MATERN32 kernel parameter initialisation.
ratquadKernCompute.m: Compute the RATQUAD kernel given the parameters and X.
rbfKernDiagGradX.m: Gradient of RBF kernel's diagonal with respect to X.
rbfperiodicKernDiagGradX.m: Gradient of RBFPERIODIC kernel's diagonal with respect to X.
ratquadKernExtractParam.m: Extract parameters from the RATQUAD kernel structure.
rbfperiodicKernDiagCompute.m: Compute diagonal of RBFPERIODIC kernel.
cmpndKernDiagCompute.m: Compute diagonal of CMPND kernel.
polyardKernGradient.m: Gradient of POLYARD kernel's parameters.
whitefixedKernExtractParam.m: Extract parameters from the WHITEFIXED kernel structure.
multiKernParamInit.m: MULTI kernel parameter initialisation.
ratquadKernDiagCompute.m: Compute diagonal of RATQUAD kernel.
gibbsperiodicKernDiagGradient.m: Compute the gradient of the GIBBSPERIODIC kernel's diagonal wrt parameters.
tensorKernGradient.m: Gradient of TENSOR kernel's parameters.
translateKernDiagCompute.m: Compute diagonal of TRANSLATE kernel.
mlpKernGradX.m: Gradient of MLP kernel with respect to input locations.
sqexpKernExpandParam.m: Create kernel structure from SQEXP kernel's parameters.
cmpndKernGradX.m: Gradient of CMPND kernel with respect to a point x.
gibbsKernParamInit.m: GIBBS kernel parameter initialisation.
linKernDisplay.m: Display parameters of the LIN kernel.
fileKernRead.m: Read kernel values from file or cache.
whitefixedKernGradient.m: Gradient of WHITEFIXED kernel's parameters.
biasKernDiagGradient.m: Compute the gradient of the BIAS kernel's diagonal wrt parameters.
ardKernDiagGradient.m: Compute the gradient of the ARD kernel's diagonal wrt parameters.
fileKernExpandParam.m: Create kernel structure from FILE kernel's parameters.
cmpndKernExpandParam.m: Create kernel structure from CMPND kernel's parameters.
multiKernExtractParam.m: Extract parameters from the MULTI kernel structure.
rbfperiodicKernCompute.m: Compute the RBFPERIODIC kernel given the parameters and X.
ratquadKernDiagGradient.m: Compute the gradient of the RATQUAD kernel's diagonal wrt parameters.
cmpndKernParamInit.m: CMPND kernel parameter initialisation.
multiKernTest.m: Run some tests on the multiple output block kernel.
rbfardKernExpandParam.m: Create kernel structure from RBFARD kernel's parameters.
tensorKernDisplay.m: Display parameters of the TENSOR kernel.
multiKernComputeBlock.m:
polyKernDiagCompute.m: Compute diagonal of POLY kernel.
sqexpKernDiagCompute.m: Compute diagonal of SQEXP kernel.
gibbsperiodicKernDiagGradX.m: Gradient of GIBBSPERIODIC kernel's diagonal with respect to X.
kernGradX.m: Compute the gradient of the kernel wrt X.
rbfardKernDiagGradX.m: Gradient of RBFARD kernel's diagonal with respect to X.
linardKernDisplay.m: Display parameters of the LINARD kernel.
kernGradient.m: Compute the gradient wrt the kernel's parameters.
simXrbfKernGradient.m: Compute gradient between the SIM and RBF kernels.
rbfperiodicKernDiagGradient.m: Compute the gradient of the RBFPERIODIC kernel's diagonal wrt parameters.
mlpardKernDiagGradX.m: Gradient of MLPARD kernel's diagonal with respect to X.
translateKernDiagGradX.m: Gradient of TRANSLATE kernel's diagonal with respect to X.
expKernDiagGradX.m: Gradient of EXP kernel's diagonal with respect to X.
matern52KernExtractParam.m: Extract parameters from the MATERN52 kernel structure.
rbfardKernDisplay.m: Display parameters of the RBFARD kernel.
cmpndKernGradient.m: Gradient of CMPND kernel's parameters.
gibbsKernCompute.m: Compute the GIBBS kernel given the parameters and X.
matern32KernExtractParam.m: Extract parameters from the MATERN32 kernel structure.
fileKernCompute.m: Compute the FILE kernel given the parameters and X.
ardKernGradient.m: Gradient of ARD kernel's parameters.
rbfardKernDiagGradient.m: Compute the gradient of the RBFARD kernel's diagonal wrt parameters.
mlpardKernExtractParam.m: Extract parameters from the MLPARD kernel structure.
simComputeH.m: Helper function for comptuing part of the SIM kernel.
polyKernGradient.m: Gradient of POLY kernel's parameters.
matern32KernCompute.m: Compute the MATERN32 kernel given the parameters and X.
polyKernGradX.m: Gradient of POLY kernel with respect to input locations.
rbfKernDiagGradient.m: Compute the gradient of the RBF kernel's diagonal wrt parameters.
sqexpKernParamInit.m: SQEXP kernel parameter initialisation.
cmpndKernSetIndex.m: Set the indices in the compound kernel.
fileKernParamInit.m: FILE kernel parameter initialisation.
expKernExtractParam.m: Extract parameters from the EXP kernel structure.
mlpardKernExpandParam.m: Create kernel structure from MLPARD kernel's parameters.
tensorKernDiagGradient.m: Compute the gradient of the TENSOR kernel's diagonal wrt parameters.
expKernDiagCompute.m: Compute diagonal of EXP kernel.
biasKernGradient.m: Gradient of BIAS kernel's parameters.
ardKernGradX.m: Gradient of ARD kernel with respect to a point x.
matern52KernGradX.m: Gradient of MATERN52 kernel with respect to input locations.
cmpndKernReadParamsFromFID.m: Read a compound kernel from a C++ file.
gibbsperiodicKernGradX.m: Gradient of GIBBSPERIODIC kernel with respect to a point x.
ardKernExpandParam.m: Create kernel structure from ARD kernel's parameters.
ardKernDisplay.m: Display parameters of the ARD kernel.
linardKernExpandParam.m: Create kernel structure from LINARD kernel's parameters.
mlpardKernGradX.m: Gradient of MLPARD kernel with respect to input locations.
matern52KernCompute.m: Compute the MATERN52 kernel given the parameters and X.
