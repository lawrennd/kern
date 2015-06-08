KERN software
Version 0.142		Friday 20 Jan 2006 at 18:52
Copyright (c) 2006 Neil D. Lawrence

Please note that this toolbox requires MATLAB 7.0 or higher to run. The toolbox relies on the optimi and ndlutil toolboxes, available at http://www.dcs.sheffield.ac.uk/~neil/optimi/downloadFiles and http://www.dcs.shef.ac.uk/~neil/ndultil/downloadFiles/.

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

ardKernCompute.m: Compute the kernel given the parameters and X.
ardKernDiagCompute.m: Compute diagonal of ard kernel.
ardKernDiagGradX.m: Gradient of ARD kernel's diagonal with respect to X.
ardKernDisplay.m: Display parameters of ARD kernel.
ardKernExpandParam.m: Create kernel structure from ARD parameters.
ardKernExtractParam.m: Extract parameters from ard kernel structure.
ardKernGradX.m: Gradient of ARD kernel with respect to X.
ardKernGradient.m: Gradient of ard kernel's parameters.
ardKernParamInit.m: ARD kernel parameter initialisation.
biasKernCompute.m: Compute the bias kernel given the parameters and X.
biasKernDiagCompute.m: Compute diagonal of bias kernel.
biasKernDiagGradX.m: Gradient of bias kernel's diagonal with respect to a point X.
biasKernDisplay.m: Display parameters of bias kernel.
biasKernExpandParam.m: Create kernel structure from bias's parameters.
biasKernExtractParam.m: Extract parameters from bias kernel structure.
biasKernGradX.m: Gradient of bias kernel with respect to a point x.
computeKernel.m: Compute the kernel given the parameters and X.
biasKernGradient.m: Gradient of bias kernel's parameters.
biasKernParamInit.m: bias kernel parameter initialisation.
cmpndKernCompute.m: Compute the kernel given the parameters and X.
cmpndKernDiagCompute.m: Compute diagonal of compound kernel.
cmpndKernDiagGradX.m: Gradient of compound kernel's diagonal with respect to X.
cmpndKernDisplay.m: Display the parameters of the compound kernel.
cmpndKernExpandParam.m: Create kernel structure from ARD parameters.
cmpndKernExtractParam.m: Extract parameters from compound kernel structure.
cmpndKernGradX.m: Gradient of compound kernel with respect to a point X.
cmpndKernGradient.m: Gradient of compound kernel's parameters.
cmpndKernParamInit.m: Compound kernel parameter initialisation.
cmpndKernReadParamsFromFID.m: Read a compound kernel from a C++ file.
kernCompute.m: Compute the kernel given the parameters and X.
kernCreate.m: Initialise a kernel structure.
kernDiagCompute.m: Compute the kernel given the parameters and X.
fileKernCompute.m: Compute the kernel given the parameters and indices.
fileKernDiagCompute.m: Load the diagonal of a kernel stored in a file.
kernDiagGradX.m: Compute the gradient of the  kernel wrt X.
kernDisplay.m: Display the parameters of the kernel.
kernExpandParam.m: Expand parameters to form a kernel structure.
kernExtractParam.m: Extract parameters from kernel structure.
kernFactors.m: Extract factors associated with transformed optimisation space.
kernGradX.m: Compute the gradient of the  kernel wrt X.
kernGradient.m: Compute the gradient of the kernel's parameters.
kernGradientK.m: Compute the gradient of the kernel wrt its parameters.
kernParamInit.m: Kernel parameter initialisation.
kernPca.m: Kernel PCA.
kernPriorGradient.m: Compute gradient terms associated with kernel priors.
kernPriorLogProb.m: Compute penalty terms associated with kernel priors.
kernReadFromFID.m: Load from an FID written by the C++ implementation.
kernReadParamsFromFID.m: Read the kernel parameters from C++ file FID.
kernTest.m: Run some tests on the specified kernel.
kernSetWhite.m: Helper function to set the white noise in a kernel if it exists.
linKernCompute.m: Compute the kernel given the parameters and X.
linKernDiagCompute.m: Compute diagonal of linear kernel.
linKernDiagGradX.m: Gradient of linear kernel's diagonal with respect to X.
linKernDisplay.m: Display parameters of linear kernel.
linKernExpandParam.m: Create kernel structure from linear kernel parameters.
linKernExtractParam.m: Extract parameters from linear kernel structure.
linKernGradX.m: Gradient of linear kernel with respect to X.
linKernGradient.m: Gradient of lin kernel's parameters.
linKernParamInit.m: Linear kernel parameter initialisation.
linardKernCompute.m: Compute the linear ARD kernel given the parameters and X.
linardKernDiagCompute.m: Compute diagonal of linear ARD kernel.
linardKernDiagGradX.m: Gradient of linear ARD kernel's diagonal with respect to X.
linardKernDisplay.m: Display parameters of linear ARD kernel.
kernGetVariance.m: Get the signal associated with a the kernel.
linardKernExpandParam.m: Create kernel structure from linear ARD's parameters.
linardKernExtractParam.m: Extract parameters from linear ARD kernel structure.
linardKernGradX.m: Gradient of linear ARD kernel with respect to X.
linardKernGradient.m: Gradient of linear ARD kernel's parameters.
linardKernParamInit.m: linear ARD kernel parameter initialisation.
linearKernParamInit.m: Linear kernel parameter initialisation.
mlpKernCompute.m: Compute the multi-layer perceptron kernel given the parameters and X.
mlpKernDiagCompute.m: Compute diagonal of multi-layer perceptron kernel.
mlpKernDiagGradX.m: Gradient of multi-layer perceptron kernel's diagonal with respect to X.
mlpKernDisplay.m: Display parameters of multi-layer perceptron kernel.
mlpKernExpandParam.m: Create kernel structure from multi-layer perceptron's parameters.
mlpKernExtractParam.m: Extract parameters from multi-layer perceptron kernel structure.
mlpKernGradX.m: Gradient of multi-layer perceptron kernel with respect to X.
mlpKernGradient.m: Gradient of multi-layer perceptron kernel's parameters.
fileKernDisplay.m: Display variance of kernel stored in a file.
mlpKernParamInit.m: multi-layer perceptron kernel parameter initialisation.
mlpardKernCompute.m: Compute the multi-layer perceptron ARD kernel given the parameters and X.
mlpardKernDiagCompute.m: Compute diagonal of multi-layer perceptron ARD kernel.
mlpardKernDiagGradX.m: Gradient of multi-layer perceptron ARD kernel's diagonal with respect to X.
mlpardKernDisplay.m: Display parameters of multi-layer perceptron ARD kernel.
mlpardKernExpandParam.m: Create kernel structure from multi-layer perceptron ARD's parameters.
mlpardKernExtractParam.m: Extract parameters from multi-layer perceptron ARD kernel structure.
mlpardKernGradX.m: Gradient of multi-layer perceptron ARD kernel with respect to a X.
mlpardKernGradient.m: Gradient of multi-layer perceptron ARD kernel's parameters.
mlpardKernParamInit.m: multi-layer perceptron ARD kernel parameter initialisation.
polyKernCompute.m: Compute the polynomial kernel given the parameters and X.
polyKernDiagCompute.m: Compute diagonal of polynomial kernel.
polyKernDiagGradX.m: Gradient of polynomial kernel's diagonal with respect to X.
polyKernDisplay.m: Display parameters of polynomial kernel.
polyKernExpandParam.m: Create kernel structure from polynomial kernel parameters.
polyKernExtractParam.m: Extract parameters from polynomial kernel structure.
polyKernGradX.m: Gradient of polynomial kernel with respect to X.
polyKernGradient.m: Gradient of polynomial kernel's parameters.
polyKernParamInit.m: Polynomial kernel parameter initialisation.
polyardKernCompute.m: Compute the polynomial ARD kernel given the parameters and X.
polyardKernDiagCompute.m: Compute diagonal of multi-layer perceptron ARD kernel.
polyardKernDiagGradX.m: Gradient of polynomial ARD kernel's diagonal with respect to X.
polyardKernDisplay.m: Display parameters of polynomial ARD kernel.
polyardKernExpandParam.m: Create kernel structure from polynomial ARD's parameters.
polyardKernExtractParam.m: Extract parameters from multi-layer perceptron ARD kernel structure.
polyardKernGradX.m: Gradient of polynomial ARD kernel with respect to X.
polyardKernGradient.m: Gradient of polynomial ARD kernel's parameters.
polyardKernParamInit.m: polynomial ARD kernel parameter initialisation.
pskernelGradient.m: Gradient on likelihood approximation for point set IVM.
pskernelObjective.m: Likelihood approximation for point set IVM.
rbfKernCompute.m: Compute the kernel given the parameters and X.
rbfKernDiagCompute.m: Compute diagonal of rbf kernel.
rbfKernDiagGradX.m: Gradient of Radial basis function kernel's diagonal with respect to X.
rbfKernDisplay.m: Display parameters of radial basis function kernel.
rbfKernExpandParam.m: Create kernel structure from rbf parameters.
rbfKernExtractParam.m: Extract parameters from rbf kernel structure.
rbfKernGradX.m: Gradient of Radial basis function kernel with respect to X.
rbfKernGradient.m: Gradient of rbf kernel's parameters.
rbfKernParamInit.m: RBF kernel parameter initialisation.
rbfardKernCompute.m: Compute the radial basis function ARD kernel given the parameters and X.
rbfardKernDiagCompute.m: Compute diagonal of radial basis function ARD kernel.
rbfardKernDiagGradX.m: Gradient of radial basis function ARD kernel's diagonal with respect to X.
rbfardKernDisplay.m: Display parameters of radial basis function ARD kernel.
rbfardKernExpandParam.m: Create kernel structure from radial basis function ARD's parameters.
rbfardKernExtractParam.m: Extract parameters from radial basis function ARD kernel structure.
rbfardKernGradX.m: Gradient of radial basis function ARD kernel with respect to a X.
rbfardKernGradient.m: Gradient of radial basis function ARD kernel's parameters.
fileKernExpandParam.m: Create kernel structure from parameter.
fileKernExtractParam.m: Extract parameter from kernel stored in a file.
fileKernGradX.m: Gradient of file stored kernel with respect to X (zeros).
rbfardKernParamInit.m: radial basis function ARD kernel parameter initialisation.
sqexpKernCompute.m: Compute the squared exponential kernel given the parameters and X.
sqexpKernDiagCompute.m: Compute diagonal of squared exponential kernel.
sqexpKernDiagGradX.m: Gradient of squared exponential kernel's diagonal with respect to a point x.
sqexpKernDisplay.m: Display parameters of squared exponential kernel.
sqexpKernExpandParam.m: Create kernel structure from squared exponential's parameters.
sqexpKernExtractParam.m: Extract parameters from squared exponential kernel structure.
sqexpKernGradX.m: Gradient of squared exponential kernel with respect to X.
sqexpKernGradient.m: Gradient of squared exponential kernel's parameters.
sqexpKernParamInit.m: squared exponential kernel parameter initialisation.
whiteKernCompute.m: Compute the white noise kernel given the parameters and X.
whiteKernDiagCompute.m: Compute diagonal of white noise kernel.
whiteKernDiagGradX.m: Gradient of white noise kernel's diagonal with respect to a X.
whiteKernDisplay.m: Display parameters of white noise kernel.
whiteKernExpandParam.m: Create kernel structure from white noise's parameters.
whiteKernExtractParam.m: Extract parameters from white noise kernel structure.
whiteKernGradX.m: Gradient of white noise kernel with respect to a point x.
whiteKernGradient.m: Gradient of white noise kernel's parameters.
whiteKernParamInit.m: white noise kernel parameter initialisation.
fileKernGradient.m: Gradient of file stored kernel's parameters.
fileKernParamInit.m: File stored kernel parameter initialisation.
fileKernRead.m: Read kernel values from file or cache.
