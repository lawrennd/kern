KERN software
Version 0.162		Saturday 14 Oct 2006 at 22:35
Copyright (c) 2006 Neil D. Lawrence

Please note that this toolbox requires MATLAB 7.0 or higher to run. The toolbox relies on the optimi and ndlutil toolboxes, available at http://www.dcs.sheffield.ac.uk/~neil/optimi/downloadFiles and http://www.dcs.shef.ac.uk/~neil/ndultil/downloadFiles/.

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
ardKernDiagGradX.m: Gradient of ARD kernel's diagonal with respect to X.
ardKernDisplay.m: Display parameters of the ARD kernel.
ardKernExpandParam.m: Create kernel structure from ARD kernel's parameters.
ardKernExtractParam.m: Extract parameters from the ARD kernel structure.
ardKernGradX.m: Gradient of ARD kernel with respect to a point x.
ardKernGradient.m: Gradient of ARD kernel's parameters.
ardKernParamInit.m: ARD kernel parameter initialisation.
biasKernCompute.m: Compute the BIAS kernel given the parameters and X.
biasKernDiagCompute.m: Compute diagonal of BIAS kernel.
biasKernDiagGradX.m: Gradient of BIAS kernel's diagonal with respect to X.
biasKernDisplay.m: Display parameters of the BIASkernel.
biasKernExpandParam.m: Create kernel structure from BIAS kernel's parameters.
biasKernExtractParam.m: Extract parameters from the BIAS kernel structure.
biasKernGradX.m: Gradient of BIAS kernel with respect to a point x.
computeKernel.m: Compute the kernel given the parameters and X.
biasKernGradient.m: Gradient of BIAS kernel's parameters.
biasKernParamInit.m: BIAS kernel parameter initialisation.
cmpndKernCompute.m: Compute the CMPND kernel given the parameters and X.
cmpndKernDiagCompute.m: Compute diagonal of CMPND kernel.
cmpndKernDiagGradX.m: Gradient of CMPND kernel's diagonal with respect to X.
cmpndKernDisplay.m: Display parameters of the CMPND kernel.
cmpndKernExpandParam.m: Create kernel structure from CMPND kernel's parameters.
cmpndKernExtractParam.m: Extract parameters from the CMPND kernel structure.
cmpndKernGradX.m: Gradient of CMPND kernel with respect to a point x.
cmpndKernGradient.m: Gradient of CMPND kernel's parameters.
cmpndKernParamInit.m: CMPND kernel parameter initialisation.
cmpndKernReadParamsFromFID.m: Read a compound kernel from a C++ file.
kernCompute.m: Compute the kernel given the parameters and X.
kernCreate.m: Initialise a kernel structure.
kernDiagCompute.m: Compute the kernel given the parameters and X.
fileKernCompute.m: Compute the FILE kernel given the parameters and X.
fileKernDiagCompute.m: Compute diagonal of FILE kernel.
kernDiagGradX.m: Compute the gradient of the  kernel wrt X.
kernDisplay.m: Display the parameters of the kernel.
kernExpandParam.m: Expand parameters to form a kernel structure.
kernExtractParam.m: Extract parameters from kernel structure.
kernFactors.m: Extract factors associated with transformed optimisation space.
kernGradX.m: Compute the gradient of the kernel wrt X.
kernGradient.m: Compute the gradient wrt the kernel's parameters.
kernParamInit.m: Kernel parameter initialisation.
kernPca.m: performs KPCA.
kernPriorGradient.m: Compute gradient terms associated with kernel priors.
kernPriorLogProb.m: Compute penalty terms associated with kernel priors.
kernReadFromFID.m: Load from an FID written by the C++ implementation.
multiKernDisplay.m: Display parameters of the MULTI kernel.
kernReadParamsFromFID.m: Read the kernel parameters from C++ file FID.
kernTest.m: Run some tests on the specified kernel.
kernSetWhite.m: Helper function to set the white noise in a kernel if it exists.
linKernCompute.m: Compute the LIN kernel given the parameters and X.
linKernDiagCompute.m: Compute diagonal of LIN kernel.
linKernDiagGradX.m: Gradient of LIN kernel's diagonal with respect to X.
linKernDisplay.m: Display parameters of the LIN kernel.
linKernExpandParam.m: Create kernel structure from LIN kernel's parameters.
linKernExtractParam.m: Extract parameters from the LIN kernel structure.
linKernGradX.m: Gradient of LIN kernel with respect to a point x.
linKernGradient.m: Gradient of LIN kernel's parameters.
linKernParamInit.m: LIN kernel parameter initialisation.
linardKernCompute.m: Compute the LINARD kernel given the parameters and X.
linardKernDiagCompute.m: Compute diagonal of LINARD kernel.
linardKernDiagGradX.m: Gradient of LINARD kernel's diagonal with respect to X.
linardKernDisplay.m: Display parameters of the LINARD kernel.
kernGetVariance.m: Get the signal associated with a the kernel.
linardKernExpandParam.m: Create kernel structure from LINARD kernel's parameters.
linardKernExtractParam.m: Extract parameters from the LINARD kernel structure.
linardKernGradX.m: Gradient of LINARD kernel with respect to a point x.
linardKernGradient.m: Gradient of LINARD kernel's parameters.
linardKernParamInit.m: LINARD kernel parameter initialisation.
multiKernDiagCompute.m: Compute diagonal of MULTI kernel.
mlpKernCompute.m: Compute the MLP kernel given the parameters and X.
mlpKernDiagCompute.m: Compute diagonal of MLP kernel.
mlpKernDiagGradX.m: Gradient of MLP kernel's diagonal with respect to X.
mlpKernDisplay.m: Display parameters of the MLP kernel.
mlpKernExpandParam.m: Create kernel structure from MLP kernel's parameters.
mlpKernExtractParam.m: Extract parameters from the MLP kernel structure.
mlpKernGradX.m: Gradient of MLP kernel with respect to a point x.
mlpKernGradient.m: Gradient of MLP kernel's parameters.
fileKernDisplay.m: Display parameters of the FILE kernel.
mlpKernParamInit.m: MLP kernel parameter initialisation.
mlpardKernCompute.m: Compute the MLPARD kernel given the parameters and X.
mlpardKernDiagCompute.m: Compute diagonal of MLPARD kernel.
mlpardKernDiagGradX.m: Gradient of MLPARD kernel's diagonal with respect to X.
mlpardKernDisplay.m: Display parameters of the MLPARD kernel.
mlpardKernExpandParam.m: Create kernel structure from MLPARD kernel's parameters.
mlpardKernExtractParam.m: Extract parameters from the MLPARD kernel structure.
mlpardKernGradX.m: Gradient of MLPARD kernel with respect to a point x.
mlpardKernGradient.m: Gradient of MLPARD kernel's parameters.
mlpardKernParamInit.m: MLPARD kernel parameter initialisation.
polyKernCompute.m: Compute the POLY kernel given the parameters and X.
polyKernDiagCompute.m: Compute diagonal of POLY kernel.
polyKernDiagGradX.m: Gradient of POLY kernel's diagonal with respect to X.
polyKernDisplay.m: Display parameters of the POLY kernel.
polyKernExpandParam.m: Create kernel structure from POLY kernel's parameters.
polyKernExtractParam.m: Extract parameters from the POLY kernel structure.
polyKernGradX.m: Gradient of POLY kernel with respect to a point x.
polyKernGradient.m: Gradient of POLY kernel's parameters.
polyKernParamInit.m: POLY kernel parameter initialisation.
polyardKernCompute.m: Compute the POLYARD kernel given the parameters and X.
polyardKernDiagCompute.m: Compute diagonal of POLYARD kernel.
polyardKernDiagGradX.m: Gradient of POLYARD kernel's diagonal with respect to X.
polyardKernDisplay.m: Display parameters of the POLYARD kernel.
polyardKernExpandParam.m: Create kernel structure from POLYARD kernel's parameters.
polyardKernExtractParam.m: Extract parameters from the POLYARD kernel structure.
polyardKernGradX.m: Gradient of POLYARD kernel with respect to a point x.
polyardKernGradient.m: Gradient of POLYARD kernel's parameters.
polyardKernParamInit.m: POLYARD kernel parameter initialisation.
pskernelGradient.m: Gradient on likelihood approximation for point set IVM.
pskernelObjective.m: Likelihood approximation for point set IVM.
rbfKernCompute.m: Compute the RBF kernel given the parameters and X.
rbfKernDiagCompute.m: Compute diagonal of RBF kernel.
rbfKernDiagGradX.m: Gradient of RBF kernel's diagonal with respect to X.
rbfKernDisplay.m: Display parameters of the RBF kernel.
rbfKernExpandParam.m: Create kernel structure from RBF kernel's parameters.
rbfKernExtractParam.m: Extract parameters from the RBF kernel structure.
rbfKernGradX.m: Gradient of RBF kernel with respect to a point x.
rbfKernGradient.m: Gradient of RBF kernel's parameters.
rbfKernParamInit.m: RBF kernel parameter initialisation.
rbfardKernCompute.m: Compute the RBFARD kernel given the parameters and X.
rbfardKernDiagCompute.m: Compute diagonal of RBFARD kernel.
rbfardKernDiagGradX.m: Gradient of RBFARD kernel's diagonal with respect to X.
rbfardKernDisplay.m: Display parameters of the RBFARD kernel.
rbfardKernExpandParam.m: Create kernel structure from RBFARD kernel's parameters.
rbfardKernExtractParam.m: Extract parameters from the RBFARD kernel structure.
rbfardKernGradX.m: Gradient of RBFARD kernel with respect to a point x.
rbfardKernGradient.m: Gradient of RBFARD kernel's parameters.
fileKernExpandParam.m: Create kernel structure from FILE kernel's parameters.
fileKernExtractParam.m: Extract parameters from the FILE kernel structure.
fileKernGradX.m: Gradient of FILE kernel with respect to a point x.
rbfardKernParamInit.m: RBFARD kernel parameter initialisation.
sqexpKernCompute.m: Compute the SQEXP kernel given the parameters and X.
sqexpKernDiagCompute.m: Compute diagonal of SQEXP kernel.
sqexpKernDiagGradX.m: Gradient of SQEXP kernel's diagonal with respect to X.
sqexpKernDisplay.m: Display parameters of the SQEXP kernel.
sqexpKernExpandParam.m: Create kernel structure from SQEXP kernel's parameters.
sqexpKernExtractParam.m: Extract parameters from the SQEXP kernel structure.
sqexpKernGradX.m: Gradient of SQEXP kernel with respect to a point x.
sqexpKernGradient.m: Gradient of SQEXP kernel's parameters.
sqexpKernParamInit.m: SQEXP kernel parameter initialisation.
whiteKernCompute.m: Compute the WHITE kernel given the parameters and X.
whiteKernDiagCompute.m: Compute diagonal of WHITE kernel.
whiteKernDiagGradX.m: Gradient of WHITE kernel's diagonal with respect to X.
whiteKernDisplay.m: Display parameters of the WHITEkernel.
whiteKernExpandParam.m: Create kernel structure from WHITE kernel's parameters.
whiteKernExtractParam.m: Extract parameters from the WHITE kernel structure.
whiteKernGradX.m: Gradient of WHITE kernel with respect to a point x.
whiteKernGradient.m: Gradient of WHITE kernel's parameters.
whiteKernParamInit.m: WHITE kernel parameter initialisation.
tensorKernCompute.m: Compute the TENSOR kernel given the parameters and X.
tensorKernParamInit.m: TENSOR kernel parameter initialisation.
multiKernComputeBlock.m:
multiKernParamInit.m: MULTI kernel parameter initialisation.
fileKernGradient.m: Gradient of FILE kernel's parameters.
fileKernParamInit.m: FILE kernel parameter initialisation.
fileKernRead.m: Read kernel values from file or cache.
tensorKernExpandParam.m: Create kernel structure from TENSOR kernel's parameters.
tensorKernExtractParam.m: Extract parameters from the TENSOR kernel structure.
tensorKernDiagCompute.m: Compute diagonal of TENSOR kernel.
tensorKernDisplay.m: Display parameters of the TENSOR kernel.
linKernDiagGradient.m: Compute the gradient of the LIN kernel's diagonal wrt parameters.
tensorKernGradient.m: Gradient of TENSOR kernel's parameters.
tensorKernGradX.m: Gradient of TENSOR kernel with respect to a point x.
ardKernDiagGradient.m: Compute the gradient of the ARD kernel's diagonal wrt parameters.
linardKernDiagGradient.m: Compute the gradient of the LINARD kernel's diagonal wrt parameters.
mlpKernDiagGradient.m: Compute the gradient of the MLP kernel's diagonal wrt parameters.
mlpardKernDiagGradient.m: Compute the gradient of the MLPARD kernel's diagonal wrt parameters.
tensorKernDiagGradX.m: Gradient of TENSOR kernel's diagonal with respect to X.
cmpndKernSetIndex.m: Set the indices in the compound kernel.
tensorKernSlash.m: Tensor kernel created by removing ith component.
polyKernDiagGradient.m: Compute the gradient of the POLY kernel's diagonal wrt parameters.
whitefixedKernCompute.m: Compute the WHITEFIXED kernel given the parameters and X.
tensorKernSetIndex.m: Set the indices in the tensor kernel.
polyardKernDiagGradient.m: Compute the gradient of the POLYARD kernel's diagonal wrt parameters.
simComputeH.m: Helper function for comptuing part of the SIM kernel.
simKernCompute.m: Compute the SIM kernel given the parameters and X.
simKernDiagCompute.m: Compute diagonal of SIM kernel.
kernSetIndex.m: Set the indices on a compound kernel.
whitefixedKernDiagCompute.m: Compute diagonal of WHITEFIXED kernel.
whitefixedKernDiagGradX.m: Gradient of WHITEFIXED kernel's diagonal with respect to X.
whitefixedKernDisplay.m: Display parameters of the WHITEFIXED kernel.
whitefixedKernExpandParam.m: Create kernel structure from WHITEFIXED kernel's parameters.
whitefixedKernExtractParam.m: Extract parameters from the WHITEFIXED kernel structure.
whitefixedKernGradX.m: Gradient of WHITEFIXED kernel with respect to a point x.
whitefixedKernGradient.m: Gradient of WHITEFIXED kernel's parameters.
whitefixedKernParamInit.m: WHITEFIXED kernel parameter initialisation.
simKernDiagGradX.m: Gradient of SIM kernel's diagonal with respect to X.
simKernDisplay.m: Display parameters of the SIM kernel.
simKernExpandParam.m: Create kernel structure from SIM kernel's parameters.
cmpndKernDiagGradient.m: Compute the gradient of the CMPND kernel's diagonal wrt parameters.
kernDiagGradient.m: Compute the gradient of the kernel's parameters for the diagonal.
rbfKernDiagGradient.m: Compute the gradient of the RBF kernel's diagonal wrt parameters.
rbfardKernDiagGradient.m: Compute the gradient of the RBFARD kernel's diagonal wrt parameters.
whiteKernDiagGradient.m: Compute the gradient of the WHITE kernel's diagonal wrt parameters.
simKernExtractParam.m: Extract parameters from the SIM kernel structure.
simKernGradX.m: Gradient of SIM kernel with respect to a point x.
whitefixedKernDiagGradient.m: Compute the gradient of the WHITEFIXED kernel's diagonal wrt parameters.
simKernGradient.m: Gradient of SIM kernel's parameters.
simKernParamInit.m: SIM kernel parameter initialisation.
simXrbfKernCompute.m: Compute a cross kernel between the SIM and RBF kernels.
simXsimKernCompute.m: Compute a cross kernel between two SIM kernels.
biasKernDiagGradient.m: Compute the gradient of the BIAS kernel's diagonal wrt parameters.
sqexpKernDiagGradient.m: Compute the gradient of the SQEXP kernel's diagonal wrt parameters.
tensorKernDiagGradient.m: Compute the gradient of the TENSOR kernel's diagonal wrt parameters.
multiKernGradient.m: Gradient of MULTI kernel's parameters.
multiKernExtractParam.m: Extract parameters from the MULTI kernel structure.
multiKernDiagGradient.m: Compute the gradient of the MULTI kernel's diagonal wrt parameters.
multiKernExpandParam.m: Create kernel structure from MULTI kernel's parameters.
multiKernDiagGradX.m: Gradient of MULTI kernel's diagonal with respect to X.
multiKernGradX.m: Gradient of MULTI kernel with respect to a point x.
multiKernTest.m: Run some tests on the multiple output block kernel.
multiKernCompute.m: Compute the MULTI kernel given the parameters and X.
multiKernGradientBlock.m:
simXsimKernGradient.m: Compute a cross gradient between two SIM kernels.
simKernDiagGradient.m: Compute the gradient of the SIM kernel's diagonal wrt parameters.
simXrbfKernGradient.m: Compute gradient between the SIM and RBF kernels.
simComputeTest.m: Test the file simComputeH.
whiteXwhiteKernCompute.m: Compute a cross kernel between two WHITE kernels.
whiteXwhiteKernGradient.m: Compute a cross gradient between two WHITE kernels.
matern32KernCompute.m: Compute the MATERN32 kernel given the parameters and X.
matern32KernDiagCompute.m: Compute diagonal of MATERN32 kernel.
matern32KernDiagGradX.m: Gradient of MATERN32 kernel's diagonal with respect to X.
matern32KernDiagGradient.m: Compute the gradient of the MATERN32 kernel's diagonal wrt parameters.
matern32KernDisplay.m: Display parameters of the MATERN32 kernel.
matern32KernExpandParam.m: Create kernel structure from MATERN32 kernel's parameters.
matern32KernExtractParam.m: Extract parameters from the MATERN32 kernel structure.
matern32KernGradX.m: Gradient of MATERN32 kernel with respect to a point x.
matern32KernGradient.m: Gradient of MATERN32 kernel's parameters.
matern32KernParamInit.m: MATERN32 kernel parameter initialisation.
matern52KernCompute.m: Compute the MATERN52 kernel given the parameters and X.
matern52KernDiagCompute.m: Compute diagonal of MATERN52 kernel.
matern52KernDiagGradient.m: Compute the gradient of the MATERN52 kernel's diagonal wrt parameters.
matern52KernDisplay.m: Display parameters of the MATERN52 kernel.
ratquadKernGradient.m: Gradient of RATQUAD kernel's parameters.
ratquadKernParamInit.m: RATQUAD kernel parameter initialisation.
gibbsKernExtractParam.m: Extract parameters from the GIBBS kernel structure.
gibbsKernParamInit.m: GIBBS kernel parameter initialisation.
matern52KernExpandParam.m: Create kernel structure from MATERN52 kernel's parameters.
matern52KernExtractParam.m: Extract parameters from the MATERN52 kernel structure.
matern52KernGradX.m: Gradient of MATERN52 kernel with respect to a point x.
matern52KernGradient.m: Gradient of MATERN52 kernel's parameters.
matern52KernParamInit.m: MATERN52 kernel parameter initialisation.
ratquadKernCompute.m: Compute the RATQUAD kernel given the parameters and X.
ratquadKernDiagCompute.m: Compute diagonal of RATQUAD kernel.
ratquadKernDiagGradX.m: Gradient of RATQUAD kernel's diagonal with respect to X.
ratquadKernDiagGradient.m: Compute the gradient of the RATQUAD kernel's diagonal wrt parameters.
ratquadKernDisplay.m: Display parameters of the RATQUAD kernel.
ratquadKernExpandParam.m: Create kernel structure from RATQUAD kernel's parameters.
ratquadKernExtractParam.m: Extract parameters from the RATQUAD kernel structure.
ratquadKernGradX.m: Gradient of RATQUAD kernel with respect to a point x.
gibbsKernDiagCompute.m: Compute diagonal of GIBBS kernel.
matern52KernDiagGradX.m: Gradient of MATERN52 kernel's diagonal with respect to X.
gibbsKernGradient.m: Gradient of GIBBS kernel's parameters.
gibbsKernDiagGradient.m: Compute the gradient of the GIBBS kernel's diagonal wrt parameters.
gibbsKernGradX.m: Gradient of GIBBS kernel with respect to a point x.
gibbsKernExpandParam.m: Create kernel structure from GIBBS kernel's parameters.
gibbsKernDiagGradX.m: Gradient of GIBBS kernel's diagonal with respect to X.
gibbsKernDisplay.m: Display parameters of the GIBBS kernel.
gibbsKernCompute.m: Compute the GIBBS kernel given the parameters and X.
gibbsKernSetLengthScaleFunc.m: Set the length scale function of the GIBBS kernel.
