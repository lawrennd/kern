KERN software
Version 0.151		Friday 24 Feb 2006 at 19:21
Copyright (c) 2006 Neil D. Lawrence and Nathaniel J. King

Please note that this toolbox requires MATLAB 7.0 or higher to run. The toolbox relies on the optimi and ndlutil toolboxes, available at http://www.dcs.sheffield.ac.uk/~neil/optimi/downloadFiles and http://www.dcs.shef.ac.uk/~neil/ndultil/downloadFiles/.

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

ardKernCompute.m: Compute the kernel given the parameters and X.
ardKernDiagCompute.m: Compute diagonal of ard kernel.
ardKernDiagGradX.m: Gradient of ARD kernel's diagonal with respect to X.
ardKernDisplay.m: Display parameters of ARD kernel.
ardKernExpandParam.m: Create kernel structure from ARD parameters.
ardKernExtractParam.m: Extract parameters from ard kernel structure.
ardKernGradient.m: Gradient of ard kernel's parameters.
ardKernGradX.m: Gradient of ARD kernel with respect to X.
ardKernParamInit.m: ARD kernel parameter initialisation.
biasKernCompute.m: Compute the bias kernel given the parameters and X.
biasKernDiagCompute.m: Compute diagonal of bias kernel.
biasKernDiagGradient.m: Compute the gradient of the bias kernel's diagonal wrt to parameters.
biasKernDiagGradX.m: Gradient of bias kernel's diagonal with respect to a point X.
biasKernDisplay.m: Display parameters of bias kernel.
biasKernExpandParam.m: Create kernel structure from bias's parameters.
biasKernExtractParam.m: Extract parameters from bias kernel structure.
biasKernGradient.m: Gradient of bias kernel's parameters.
biasKernGradX.m: Gradient of bias kernel with respect to a point x.
biasKernParamInit.m: bias kernel parameter initialisation.
cmpndKernCompute.m: Compute the kernel given the parameters and X.
cmpndKernDiagCompute.m: Compute diagonal of compound kernel.
cmpndKernDiagGradient.m: Gradient of compound kernel's parameters.
cmpndKernDiagGradX.m: Gradient of compound kernel's diagonal with respect to X.
cmpndKernDisplay.m: Display the parameters of the compound kernel.
cmpndKernExpandParam.m: Create kernel structure from parameters.
cmpndKernExtractParam.m: Extract parameters from compound kernel structure.
cmpndKernGradient.m: Gradient of compound kernel's parameters.
cmpndKernGradX.m: Gradient of compound kernel with respect to a point X.
cmpndKernParamInit.m: Compound kernel parameter initialisation.
cmpndKernReadParamsFromFID.m: Read a compound kernel from a C++ file.
cmpndKernSetIndex.m: Set the indices in the compound kernel.
computeKernel.m: Compute the kernel given the parameters and X.
fileKernCompute.m: Compute the kernel given the parameters and indices.
fileKernDiagCompute.m: Load the diagonal of a kernel stored in a file.
fileKernDisplay.m: Display variance of kernel stored in a file.
fileKernExpandParam.m: Create kernel structure from parameter.
fileKernExtractParam.m: Extract parameter from kernel stored in a file.
fileKernGradient.m: Gradient of file stored kernel's parameters.
fileKernGradX.m: Gradient of file stored kernel with respect to X (zeros).
fileKernParamInit.m: File stored kernel parameter initialisation.
fileKernRead.m: Read kernel values from file or cache.
kernCompute.m: Compute the kernel given the parameters and X.
kernCreate.m: Initialise a kernel structure.
kernDiagCompute.m: Compute the kernel given the parameters and X.
kernDiagGradient.m: Compute the gradient of the kernel's parameters for the diagonal..
kernDiagGradX.m: Compute the gradient of the  kernel wrt X.
kernDisplay.m: Display the parameters of the kernel.
kernExpandParam.m: Expand parameters to form a kernel structure.
kernExtractParam.m: Extract parameters from kernel structure.
kernFactors.m: Extract factors associated with transformed optimisation space.
kernGetVariance.m: Get the signal associated with a the kernel.
kernGradient.m: Compute the gradient of the kernel's parameters.
kernGradientK.m: Compute the gradient of the kernel wrt its parameters.
kernGradX.m: Compute the gradient of the  kernel wrt X.
kernParamInit.m: Kernel parameter initialisation.
kernPca.m: Kernel PCA.
kernPriorGradient.m: Compute gradient terms associated with kernel priors.
kernPriorLogProb.m: Compute penalty terms associated with kernel priors.
kernReadFromFID.m: Load from an FID written by the C++ implementation.
kernReadParamsFromFID.m: Read the kernel parameters from C++ file FID.
kernSetIndex.m: Set the indices on a compound kernel.
kernSetWhite.m: Helper function to set the white noise in a kernel if it exists.
kernTest.m: Run some tests on the specified kernel.
linardKernCompute.m: Compute the linear ARD kernel given the parameters and X.
linardKernDiagCompute.m: Compute diagonal of linear ARD kernel.
linardKernDiagGradX.m: Gradient of linear ARD kernel's diagonal with respect to X.
linardKernDisplay.m: Display parameters of linear ARD kernel.
linardKernExpandParam.m: Create kernel structure from linear ARD's parameters.
linardKernExtractParam.m: Extract parameters from linear ARD kernel structure.
linardKernGradient.m: Gradient of linear ARD kernel's parameters.
linardKernGradX.m: Gradient of linear ARD kernel with respect to X.
linardKernParamInit.m: linear ARD kernel parameter initialisation.
linearKernParamInit.m: Linear kernel parameter initialisation.
linKernCompute.m: Compute the kernel given the parameters and X.
linKernDiagCompute.m: Compute diagonal of linear kernel.
linKernDiagGradX.m: Gradient of linear kernel's diagonal with respect to X.
linKernDisplay.m: Display parameters of linear kernel.
linKernExpandParam.m: Create kernel structure from linear kernel parameters.
linKernExtractParam.m: Extract parameters from linear kernel structure.
linKernGradient.m: Gradient of lin kernel's parameters.
linKernGradX.m: Gradient of linear kernel with respect to X.
linKernParamInit.m: Linear kernel parameter initialisation.
mlpardKernCompute.m: Compute the multi-layer perceptron ARD kernel given the parameters and X.
mlpardKernDiagCompute.m: Compute diagonal of multi-layer perceptron ARD kernel.
mlpardKernDiagGradX.m: Gradient of multi-layer perceptron ARD kernel's diagonal with respect to X.
mlpardKernDisplay.m: Display parameters of multi-layer perceptron ARD kernel.
mlpardKernExpandParam.m: Create kernel structure from multi-layer perceptron ARD's parameters.
mlpardKernExtractParam.m: Extract parameters from multi-layer perceptron ARD kernel structure.
mlpardKernGradient.m: Gradient of multi-layer perceptron ARD kernel's parameters.
mlpardKernGradX.m: Gradient of multi-layer perceptron ARD kernel with respect to a X.
mlpardKernParamInit.m: multi-layer perceptron ARD kernel parameter initialisation.
mlpKernCompute.m: Compute the multi-layer perceptron kernel given the parameters and X.
mlpKernDiagCompute.m: Compute diagonal of multi-layer perceptron kernel.
mlpKernDiagGradX.m: Gradient of multi-layer perceptron kernel's diagonal with respect to X.
mlpKernDisplay.m: Display parameters of multi-layer perceptron kernel.
mlpKernExpandParam.m: Create kernel structure from multi-layer perceptron's parameters.
mlpKernExtractParam.m: Extract parameters from multi-layer perceptron kernel structure.
mlpKernGradient.m: Gradient of multi-layer perceptron kernel's parameters.
mlpKernGradX.m: Gradient of multi-layer perceptron kernel with respect to X.
mlpKernParamInit.m: multi-layer perceptron kernel parameter initialisation.
polyardKernCompute.m: Compute the polynomial ARD kernel given the parameters and X.
polyardKernDiagCompute.m: Compute diagonal of multi-layer perceptron ARD kernel.
polyardKernDiagGradX.m: Gradient of polynomial ARD kernel's diagonal with respect to X.
polyardKernDisplay.m: Display parameters of polynomial ARD kernel.
polyardKernExpandParam.m: Create kernel structure from polynomial ARD's parameters.
polyardKernExtractParam.m: Extract parameters from multi-layer perceptron ARD kernel structure.
polyardKernGradient.m: Gradient of polynomial ARD kernel's parameters.
polyardKernGradX.m: Gradient of polynomial ARD kernel with respect to X.
polyardKernParamInit.m: polynomial ARD kernel parameter initialisation.
polyKernCompute.m: Compute the polynomial kernel given the parameters and X.
polyKernDiagCompute.m: Compute diagonal of polynomial kernel.
polyKernDiagGradX.m: Gradient of polynomial kernel's diagonal with respect to X.
polyKernDisplay.m: Display parameters of polynomial kernel.
polyKernExpandParam.m: Create kernel structure from polynomial kernel parameters.
polyKernExtractParam.m: Extract parameters from polynomial kernel structure.
polyKernGradient.m: Gradient of polynomial kernel's parameters.
polyKernGradX.m: Gradient of polynomial kernel with respect to X.
polyKernParamInit.m: Polynomial kernel parameter initialisation.
pskernelGradient.m: Gradient on likelihood approximation for point set IVM.
pskernelObjective.m: Likelihood approximation for point set IVM.
rbfardKernCompute.m: Compute the radial basis function ARD kernel given the parameters and X.
rbfardKernDiagCompute.m: Compute diagonal of radial basis function ARD kernel.
rbfardKernDiagGradient.m: Compute the gradient of the RBFARD kernel's diagonal wrt to parameters.
rbfardKernDiagGradX.m: Gradient of radial basis function ARD kernel's diagonal with respect to X.
rbfardKernDisplay.m: Display parameters of radial basis function ARD kernel.
rbfardKernExpandParam.m: Create kernel structure from radial basis function ARD's parameters.
rbfardKernExtractParam.m: Extract parameters from radial basis function ARD kernel structure.
rbfardKernGradient.m: Gradient of radial basis function ARD kernel's parameters.
rbfardKernGradX.m: Gradient of radial basis function ARD kernel with respect to a X.
rbfardKernParamInit.m: radial basis function ARD kernel parameter initialisation.
rbfKernCompute.m: Compute the kernel given the parameters and X.
rbfKernDiagCompute.m: Compute diagonal of rbf kernel.
rbfKernDiagGradient.m: Compute the gradient of the RBF kernel's diagonal wrt to parameters.
rbfKernDiagGradX.m: Gradient of Radial basis function kernel's diagonal with respect to X.
rbfKernDisplay.m: Display parameters of radial basis function kernel.
rbfKernExpandParam.m: Create kernel structure from rbf parameters.
rbfKernExtractParam.m: Extract parameters from rbf kernel structure.
rbfKernGradient.m: Gradient of rbf kernel's parameters.
rbfKernGradX.m: Gradient of Radial basis function kernel with respect to X.
rbfKernParamInit.m: RBF kernel parameter initialisation.
sqexpKernCompute.m: Compute the squared exponential kernel given the parameters and X.
sqexpKernDiagCompute.m: Compute diagonal of squared exponential kernel.
sqexpKernDiagGradX.m: Gradient of squared exponential kernel's diagonal with respect to a point x.
sqexpKernDisplay.m: Display parameters of squared exponential kernel.
sqexpKernExpandParam.m: Create kernel structure from squared exponential's parameters.
sqexpKernExtractParam.m: Extract parameters from squared exponential kernel structure.
sqexpKernGradient.m: Gradient of squared exponential kernel's parameters.
sqexpKernGradX.m: Gradient of squared exponential kernel with respect to X.
sqexpKernParamInit.m: squared exponential kernel parameter initialisation.
tensorKernCompute.m: Compute the tensor kernel given the parameters and X.
tensorKernDiagCompute.m: Compute diagonal of tensor kernel.
tensorKernDiagGradX.m: Gradient of tensor kernel's diagonal with respect to X.
tensorKernDisplay.m: Display the parameters of the compound kernel.
tensorKernExpandParam.m: Create kernel structure from parameters.
tensorKernExtractParam.m: Extract parameters from compound kernel structure.
tensorKernGradient.m: Gradient of compound kernel's parameters.
tensorKernGradX.m: Gradient of compound kernel with respect to a point X.
tensorKernParamInit.m: Tensor kernel parameter initialisation.
tensorKernSetIndex.m: Set the indices in the tensor kernel.
tensorKernSlash.m: Tensor kernel created by removing ith component.
whitefixedKernCompute.m: Compute the white fixed noise kernel given the parameters and X.
whitefixedKernDiagCompute.m: Compute diagonal of white fixed noise kernel.
whitefixedKernDiagGradient.m: Compute the gradient of the whitefixed kernel's diagonal wrt to parameters.
whitefixedKernDiagGradX.m: Gradient of white fixed noise kernel's diagonal with respect to a X.
whitefixedKernDisplay.m: Display parameters of white fixed noise kernel.
whitefixedKernExpandParam.m: Create kernel structure from white fixed noise's parameters.
whitefixedKernExtractParam.m: Extract parameters from white fixed noise kernel structure.
whitefixedKernGradient.m: Gradient of white fixed noise kernel's parameters.
whitefixedKernGradX.m: Gradient of white fixed noise kernel with respect to a point x.
whitefixedKernParamInit.m: white noise kernel parameter initialisation.
whiteKernCompute.m: Compute the white noise kernel given the parameters and X.
whiteKernDiagCompute.m: Compute diagonal of white noise kernel.
whiteKernDiagGradient.m: Compute the gradient of the white kernel's diagonal wrt to parameters.
whiteKernDiagGradX.m: Gradient of white noise kernel's diagonal with respect to a X.
whiteKernDisplay.m: Display parameters of white noise kernel.
whiteKernExpandParam.m: Create kernel structure from white noise's parameters.
whiteKernExtractParam.m: Extract parameters from white noise kernel structure.
whiteKernGradient.m: Gradient of white noise kernel's parameters.
whiteKernGradX.m: Gradient of white noise kernel with respect to a point x.
whiteKernParamInit.m: white noise kernel parameter initialisation.
