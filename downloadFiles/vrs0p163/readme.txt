KERN software
Version 0.163		Wednesday 25 Oct 2006 at 11:54
Copyright (c) 2006 Neil D. Lawrence

Please note that this toolbox requires MATLAB 7.0 or higher to run. The toolbox relies on the optimi and ndlutil toolboxes, available at http://www.dcs.sheffield.ac.uk/~neil/optimi/downloadFiles and http://www.dcs.shef.ac.uk/~neil/ndultil/downloadFiles/.

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

kernParamInit.m: Kernel parameter initialisation.
matern52KernParamInit.m: MATERN52 kernel parameter initialisation.
ratquadKernDiagGradX.m: Gradient of RATQUAD kernel's diagonal with respect to X.
simKernExtractParam.m: Extract parameters from the SIM kernel structure.
rbfKernExpandParam.m: Create kernel structure from RBF kernel's parameters.
matern52KernGradX.m: Gradient of MATERN52 kernel with respect to input locations.
pskernelGradient.m: Gradient on likelihood approximation for point set IVM.
linardKernExtractParam.m: Extract parameters from the LINARD kernel structure.
mlpardKernExtractParam.m: Extract parameters from the MLPARD kernel structure.
mlpKernExpandParam.m: Create kernel structure from MLP kernel's parameters.
rbfardKernCompute.m: Compute the RBFARD kernel given the parameters and X.
mlpardKernCompute.m: Compute the MLPARD kernel given the parameters and X.
biasKernGradient.m: Gradient of BIAS kernel's parameters.
tensorKernSetIndex.m: Set the indices in the tensor kernel.
kernGradient.m: Compute the gradient wrt the kernel's parameters.
computeKernel.m: Compute the kernel given the parameters and X.
sqexpKernDiagGradient.m: Compute the gradient of the SQEXP kernel's diagonal wrt parameters.
whitefixedKernExpandParam.m: Create kernel structure from WHITEFIXED kernel's parameters.
cmpndKernDisplay.m: Display parameters of the CMPND kernel.
rbfardKernGradient.m: Gradient of RBFARD kernel's parameters.
mlpardKernGradient.m: Gradient of MLPARD kernel's parameters.
ardKernCompute.m: Compute the ARD kernel given the parameters and X.
kernTest.m: Run some tests on the specified kernel.
fileKernParamInit.m: FILE kernel parameter initialisation.
mlpKernParamInit.m: MLP kernel parameter initialisation.
matern52KernExpandParam.m: Create kernel structure from MATERN52 kernel's parameters.
biasKernExpandParam.m: Create kernel structure from BIAS kernel's parameters.
kernDiagGradX.m: Compute the gradient of the  kernel wrt X.
matern52KernDiagGradX.m: Gradient of MATERN52 kernel's diagonal with respect to X.
multiKernExpandParam.m: Create kernel structure from MULTI kernel's parameters.
polyardKernGradX.m: Gradient of POLYARD kernel with respect to input locations.
rbfardKernExpandParam.m: Create kernel structure from RBFARD kernel's parameters.
multiKernGradient.m: Gradient of MULTI kernel's parameters.
ardKernDiagCompute.m: Compute diagonal of ARD kernel.
mlpKernCompute.m: Compute the MLP kernel given the parameters and X.
whiteKernCompute.m: Compute the WHITE kernel given the parameters and X.
simXsimKernGradient.m: Compute a cross gradient between two SIM kernels.
ardKernDiagGradient.m: Compute the gradient of the ARD kernel's diagonal wrt parameters.
polyKernDiagCompute.m: Compute diagonal of POLY kernel.
simXrbfKernCompute.m: Compute a cross kernel between the SIM and RBF kernels.
linKernExpandParam.m: Create kernel structure from LIN kernel's parameters.
mlpKernGradient.m: Gradient of MLP kernel's parameters.
pskernelObjective.m: Likelihood approximation for point set IVM.
kernGetVariance.m: Get the signal associated with a the kernel.
matern32KernExpandParam.m: Create kernel structure from MATERN32 kernel's parameters.
mlpardKernDiagCompute.m: Compute diagonal of MLPARD kernel.
linardKernExpandParam.m: Create kernel structure from LINARD kernel's parameters.
kernSetWhite.m: Helper function to set the white noise in a kernel if it exists.
cmpndKernGradient.m: Gradient of CMPND kernel's parameters.
whiteXwhiteKernGradient.m: Compute a cross gradient between two WHITE kernels.
multiKernGradX.m: Gradient of MULTI kernel with respect to a point x.
ratquadKernDiagGradient.m: Compute the gradient of the RATQUAD kernel's diagonal wrt parameters.
whiteKernGradient.m: Gradient of WHITE kernel's parameters.
tensorKernGradX.m: Gradient of TENSOR kernel with respect to a point x.
mlpKernDiagGradX.m: Gradient of MLP kernel's diagonal with respect to X.
kernSetIndex.m: Set the indices on a compound kernel.
linardKernGradient.m: Gradient of LINARD kernel's parameters.
simXsimKernCompute.m: Compute a cross kernel between two SIM kernels.
ratquadKernGradX.m: Gradient of RATQUAD kernel with respect to input locations.
cmpndKernCompute.m: Compute the CMPND kernel given the parameters and X.
gibbsKernGradient.m: Gradient of GIBBS kernel's parameters.
rbfKernGradX.m: Gradient of RBF kernel with respect to input locations.
rbfardKernParamInit.m: RBFARD kernel parameter initialisation.
tensorKernParamInit.m: TENSOR kernel parameter initialisation.
matern52KernExtractParam.m: Extract parameters from the MATERN52 kernel structure.
linardKernGradX.m: Gradient of LINARD kernel with respect to input locations.
biasKernExtractParam.m: Extract parameters from the BIAS kernel structure.
whiteKernExpandParam.m: Create kernel structure from WHITE kernel's parameters.
cmpndKernDiagCompute.m: Compute diagonal of CMPND kernel.
simKernExpandParam.m: Create kernel structure from SIM kernel's parameters.
sqexpKernParamInit.m: SQEXP kernel parameter initialisation.
sqexpKernDiagCompute.m: Compute diagonal of SQEXP kernel.
mlpardKernParamInit.m: MLPARD kernel parameter initialisation.
rbfKernDisplay.m: Display parameters of the RBF kernel.
rbfKernExtractParam.m: Extract parameters from the RBF kernel structure.
ratquadKernExpandParam.m: Create kernel structure from RATQUAD kernel's parameters.
rbfardKernDiagGradX.m: Gradient of RBFARD kernel's diagonal with respect to X.
tensorKernDiagGradX.m: Gradient of TENSOR kernel's diagonal with respect to X.
fileKernDisplay.m: Display parameters of the FILE kernel.
multiKernExtractParam.m: Extract parameters from the MULTI kernel structure.
cmpndKernSetIndex.m: Set the indices in the compound kernel.
gibbsKernDiagCompute.m: Compute diagonal of GIBBS kernel.
tensorKernExpandParam.m: Create kernel structure from TENSOR kernel's parameters.
kernDiagGradient.m: Compute the gradient of the kernel's parameters for the diagonal.
kernReadParamsFromFID.m: Read the kernel parameters from C++ file FID.
rbfardKernExtractParam.m: Extract parameters from the RBFARD kernel structure.
polyKernGradient.m: Gradient of POLY kernel's parameters.
simKernDisplay.m: Display parameters of the SIM kernel.
simComputeH.m: Helper function for comptuing part of the SIM kernel.
kernGradX.m: Compute the gradient of the kernel wrt X.
whitefixedKernGradient.m: Gradient of WHITEFIXED kernel's parameters.
sqexpKernDiagGradX.m: Gradient of SQEXP kernel's diagonal with respect to X.
matern32KernParamInit.m: MATERN32 kernel parameter initialisation.
mlpKernExtractParam.m: Extract parameters from the MLP kernel structure.
polyardKernExtractParam.m: Extract parameters from the POLYARD kernel structure.
gibbsKernSetLengthScaleFunc.m: Set the length scale function of the GIBBS kernel.
mlpardKernDiagGradX.m: Gradient of MLPARD kernel's diagonal with respect to X.
cmpndKernGradX.m: Gradient of CMPND kernel with respect to a point x.
tensorKernDisplay.m: Display parameters of the TENSOR kernel.
matern32KernDisplay.m: Display parameters of the MATERN32 kernel.
matern52KernGradient.m: Gradient of MATERN52 kernel's parameters.
cmpndKernParamInit.m: CMPND kernel parameter initialisation.
simXrbfKernGradient.m: Compute gradient between the SIM and RBF kernels.
kernExpandParam.m: Expand parameters to form a kernel structure.
tensorKernDiagGradient.m: Compute the gradient of the TENSOR kernel's diagonal wrt parameters.
multiKernTest.m: Run some tests on the multiple output block kernel.
gibbsKernDiagGradient.m: Compute the gradient of the GIBBS kernel's diagonal wrt parameters.
polyKernParamInit.m: POLY kernel parameter initialisation.
kernPca.m: performs KPCA.
rbfKernCompute.m: Compute the RBF kernel given the parameters and X.
sqexpKernExtractParam.m: Extract parameters from the SQEXP kernel structure.
simKernGradient.m: Gradient of SIM kernel's parameters.
linKernDisplay.m: Display parameters of the LIN kernel.
ardKernGradX.m: Gradient of ARD kernel with respect to a point x.
whiteKernDiagGradient.m: Compute the gradient of the WHITE kernel's diagonal wrt parameters.
fileKernCompute.m: Compute the FILE kernel given the parameters and X.
cmpndKernReadParamsFromFID.m: Read a compound kernel from a C++ file.
polyardKernDiagCompute.m: Compute diagonal of POLYARD kernel.
sqexpKernGradX.m: Gradient of SQEXP kernel with respect to a point x.
fileKernRead.m: Read kernel values from file or cache.
polyKernGradX.m: Gradient of POLY kernel with respect to input locations.
matern32KernDiagGradX.m: Gradient of MATERN32 kernel's diagonal with respect to X.
rbfardKernGradX.m: Gradient of RBFARD kernel with respect to input locations.
linKernGradient.m: Gradient of LIN kernel's parameters.
simKernGradX.m: Gradient of SIM kernel with respect to a point x.
simKernParamInit.m: SIM kernel parameter initialisation.
whitefixedKernDiagGradient.m: Compute the gradient of the WHITEFIXED kernel's diagonal wrt parameters.
biasKernDisplay.m: Display parameters of the BIASkernel.
simKernCompute.m: Compute the SIM kernel given the parameters and X.
cmpndKernDiagGradX.m: Gradient of CMPND kernel's diagonal with respect to X.
matern32KernGradX.m: Gradient of MATERN32 kernel with respect to input locations.
fileKernDiagCompute.m: Compute diagonal of FILE kernel.
gibbsKernDisplay.m: Display parameters of the GIBBS kernel.
kernPriorLogProb.m: Compute penalty terms associated with kernel priors.
ardKernExtractParam.m: Extract parameters from the ARD kernel structure.
polyKernDisplay.m: Display parameters of the POLY kernel.
polyKernDiagGradX.m: Gradient of POLY kernel's diagonal with respect to X.
tensorKernCompute.m: Compute the TENSOR kernel given the parameters and X.
matern32KernCompute.m: Compute the MATERN32 kernel given the parameters and X.
cmpndKernDiagGradient.m: Compute the gradient of the CMPND kernel's diagonal wrt parameters.
rbfKernDiagCompute.m: Compute diagonal of RBF kernel.
whiteKernParamInit.m: WHITE kernel parameter initialisation.
mlpKernDiagCompute.m: Compute diagonal of MLP kernel.
matern32KernDiagGradient.m: Compute the gradient of the MATERN32 kernel's diagonal wrt parameters.
ratquadKernExtractParam.m: Extract parameters from the RATQUAD kernel structure.
ardKernExpandParam.m: Create kernel structure from ARD kernel's parameters.
whiteKernGradX.m: Gradient of WHITE kernel with respect to input locations.
polyKernExpandParam.m: Create kernel structure from POLY kernel's parameters.
simKernDiagGradX.m: Gradient of SIM kernel's diagonal with respect to X.
linKernCompute.m: Compute the LIN kernel given the parameters and X.
multiKernDisplay.m: Display parameters of the MULTI kernel.
whitefixedKernDiagCompute.m: Compute diagonal of WHITEFIXED kernel.
ardKernParamInit.m: ARD kernel parameter initialisation.
linardKernDisplay.m: Display parameters of the LINARD kernel.
biasKernGradX.m: Gradient of BIAS kernel with respect to input locations.
simKernDiagGradient.m: Compute the gradient of the SIM kernel's diagonal wrt parameters.
mlpardKernExpandParam.m: Create kernel structure from MLPARD kernel's parameters.
linKernGradX.m: Gradient of LIN kernel with respect to input locations.
matern52KernDiagCompute.m: Compute diagonal of MATERN52 kernel.
rbfKernParamInit.m: RBF kernel parameter initialisation.
biasKernDiagCompute.m: Compute diagonal of BIAS kernel.
whitefixedKernParamInit.m: WHITEFIXED kernel parameter initialisation.
multiKernDiagCompute.m: Compute diagonal of MULTI kernel.
ardKernGradient.m: Gradient of ARD kernel's parameters.
rbfardKernDiagCompute.m: Compute diagonal of RBFARD kernel.
polyardKernGradient.m: Gradient of POLYARD kernel's parameters.
polyardKernParamInit.m: POLYARD kernel parameter initialisation.
biasKernCompute.m: Compute the BIAS kernel given the parameters and X.
whiteKernDiagGradX.m: Gradient of WHITE kernel's diagonal with respect to X.
kernPriorGradient.m: Compute gradient terms associated with kernel priors.
sqexpKernDisplay.m: Display parameters of the SQEXP kernel.
gibbsKernCompute.m: Compute the GIBBS kernel given the parameters and X.
polyKernCompute.m: Compute the POLY kernel given the parameters and X.
linKernDiagCompute.m: Compute diagonal of LIN kernel.
linardKernParamInit.m: LINARD kernel parameter initialisation.
matern32KernDiagCompute.m: Compute diagonal of MATERN32 kernel.
cmpndKernExpandParam.m: Create kernel structure from CMPND kernel's parameters.
linardKernDiagCompute.m: Compute diagonal of LINARD kernel.
ardKernDiagGradX.m: Gradient of ARD kernel's diagonal with respect to X.
multiKernParamInit.m: MULTI kernel parameter initialisation.
matern52KernDisplay.m: Display parameters of the MATERN52 kernel.
rbfKernDiagGradX.m: Gradient of RBF kernel's diagonal with respect to X.
whitefixedKernDiagGradX.m: Gradient of WHITEFIXED kernel's diagonal with respect to X.
rbfKernGradient.m: Gradient of RBF kernel's parameters.
polyKernExtractParam.m: Extract parameters from the POLY kernel structure.
kernExtractParam.m: Extract parameters from kernel structure.
polyardKernDisplay.m: Display parameters of the POLYARD kernel.
sqexpKernExpandParam.m: Create kernel structure from SQEXP kernel's parameters.
multiKernCompute.m: Compute the MULTI kernel given the parameters and X.
polyardKernDiagGradX.m: Gradient of POLYARD kernel's diagonal with respect to X.
biasKernParamInit.m: BIAS kernel parameter initialisation.
gibbsKernGradX.m: Gradient of GIBBS kernel with respect to input locations.
linardKernCompute.m: Compute the LINARD kernel given the parameters and X.
ratquadKernDisplay.m: Display parameters of the RATQUAD kernel.
whitefixedKernGradX.m: Gradient of WHITEFIXED kernel with respect to a point x.
linKernExtractParam.m: Extract parameters from the LIN kernel structure.
kernDisplay.m: Display the parameters of the kernel.
mlpKernGradX.m: Gradient of MLP kernel with respect to input locations.
whiteKernDiagCompute.m: Compute diagonal of WHITE kernel.
gibbsKernExpandParam.m: Create kernel structure from GIBBS kernel's parameters.
linardKernDiagGradX.m: Gradient of LINARD kernel's diagonal with respect to X.
simKernDiagCompute.m: Compute diagonal of SIM kernel.
sqexpKernGradient.m: Gradient of SQEXP kernel's parameters.
whitefixedKernDisplay.m: Display parameters of the WHITEFIXED kernel.
sqexpKernCompute.m: Compute the SQEXP kernel given the parameters and X.
multiKernDiagGradX.m: Gradient of MULTI kernel's diagonal with respect to X.
tensorKernExtractParam.m: Extract parameters from the TENSOR kernel structure.
matern52KernDiagGradient.m: Compute the gradient of the MATERN52 kernel's diagonal wrt parameters.
gibbsKernExtractParam.m: Extract parameters from the GIBBS kernel structure.
multiKernComputeBlock.m:
biasKernDiagGradient.m: Compute the gradient of the BIAS kernel's diagonal wrt parameters.
whiteXwhiteKernCompute.m: Compute a cross kernel between two WHITE kernels.
ratquadKernDiagCompute.m: Compute diagonal of RATQUAD kernel.
gibbsKernParamInit.m: GIBBS kernel parameter initialisation.
biasKernDiagGradX.m: Gradient of BIAS kernel's diagonal with respect to X.
whiteKernExtractParam.m: Extract parameters from the WHITE kernel structure.
tensorKernSlash.m: Tensor kernel created by removing ith component.
kernFactors.m: Extract factors associated with transformed optimisation space.
matern52KernCompute.m: Compute the MATERN52 kernel given the parameters and X.
tensorKernDiagCompute.m: Compute diagonal of TENSOR kernel.
rbfardKernDisplay.m: Display parameters of the RBFARD kernel.
mlpardKernDisplay.m: Display parameters of the MLPARD kernel.
multiKernGradientBlock.m:
tensorKernGradient.m: Gradient of TENSOR kernel's parameters.
linKernParamInit.m: LIN kernel parameter initialisation.
mlpardKernGradX.m: Gradient of MLPARD kernel with respect to input locations.
polyardKernCompute.m: Compute the POLYARD kernel given the parameters and X.
whitefixedKernExtractParam.m: Extract parameters from the WHITEFIXED kernel structure.
fileKernExtractParam.m: Extract parameters from the FILE kernel structure.
matern32KernGradient.m: Gradient of MATERN32 kernel's parameters.
ratquadKernParamInit.m: RATQUAD kernel parameter initialisation.
rbfKernDiagGradient.m: Compute the gradient of the RBF kernel's diagonal wrt parameters.
simComputeTest.m: Test the file simComputeH.
kernReadFromFID.m: Load from an FID written by the C++ implementation.
ratquadKernCompute.m: Compute the RATQUAD kernel given the parameters and X.
ardKernDisplay.m: Display parameters of the ARD kernel.
polyardKernExpandParam.m: Create kernel structure from POLYARD kernel's parameters.
multiKernDiagGradient.m: Compute the gradient of the MULTI kernel's diagonal wrt parameters.
kernCompute.m: Compute the kernel given the parameters and X.
kernCreate.m: Initialise a kernel structure.
cmpndKernExtractParam.m: Extract parameters from the CMPND kernel structure.
ratquadKernGradient.m: Gradient of RATQUAD kernel's parameters.
gibbsKernDiagGradX.m: Gradient of GIBBS kernel's diagonal with respect to X.
kernDiagCompute.m: Compute the kernel given the parameters and X.
whitefixedKernCompute.m: Compute the WHITEFIXED kernel given the parameters and X.
matern32KernExtractParam.m: Extract parameters from the MATERN32 kernel structure.
fileKernGradX.m: Gradient of FILE kernel with respect to a point x.
rbfardKernDiagGradient.m: Compute the gradient of the RBFARD kernel's diagonal wrt parameters.
fileKernGradient.m: Gradient of FILE kernel's parameters.
mlpKernDisplay.m: Display parameters of the MLP kernel.
fileKernExpandParam.m: Create kernel structure from FILE kernel's parameters.
whiteKernDisplay.m: Display parameters of the WHITEkernel.
linKernDiagGradX.m: Gradient of LIN kernel's diagonal with respect to X.
