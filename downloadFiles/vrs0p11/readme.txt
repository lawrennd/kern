ReadMe file for the KERN toolbox version 0.11 Thursday, June 17, 2004 at 15:43:09
Written by Neil D. Lawrence.

This toolbox implements the different kernels. At the time of writing two toolboxes make use of KERN, IVM vs 0.3 and FBD vs 0.2.

Interaction with the toolbox is done through the interface files which are prefixed by kern. The toolbox is designed to allow linear combinations of kernels with a minimum of fuss (using the cmpnd kernel).

The toolbox was spun out of the IVM toolbox, and most of the files are based on files in IVM 0.221.

1) Kernel Types

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

ardKernCompute.m: Compute the kernel given the parameters and X.
ardKernDiagCompute.m: Compute diagonal of ard kernel.
ardKernDiagGradX.m: Gradient of ARD kernel's diagonal with respect to a point x.
ardKernDisplay.m: Display parameters of ARD kernel.
ardKernExpandParam.m: Create kernel structure from ARD parameters.
ardKernExtractParam.m: Extract parameters from ard kernel structure.
ardKernGradX.m: Gradient of ARD kernel with respect to a point x.
ardKernGradient.m: Gradient of ard kernel's parameters.
ardKernParamInit.m: ARD kernel parameter initialisation.
biasKernCompute.m: Compute the bias kernel given the parameters and X.
biasKernDiagCompute.m: Compute diagonal of bias kernel.
biasKernDiagGradX.m: Gradient of bias kernel's diagonal with respect to a point x.
biasKernDisplay.m: Display parameters of bias kernel.
biasKernExpandParam.m: Create kernel structure from bias's parameters.
biasKernExtractParam.m: Extract parameters from bias kernel structure.
biasKernGradX.m: Gradient of bias kernel with respect to a point x.
biasKernGradient.m: Gradient of bias kernel's parameters.
biasKernParamInit.m: bias kernel parameter initialisation.
cmpndKernCompute.m: Compute the kernel given the parameters and X.
cmpndKernDiagCompute.m: Compute diagonal of compound kernel.
cmpndKernDiagGradX.m: Gradient of compound kernel's diagonal with respect to a point x.
cmpndKernDisplay.m: Display the parameters of the compound kernel.
cmpndKernExpandParam.m: Create kernel structure from ARD parameters.
cmpndKernExtractParam.m: Extract parameters from compound kernel structure.
cmpndKernGradX.m: Gradient of compound kernel with respect to a point x.
cmpndKernGradient.m: Gradient of compound kernel's parameters.
cmpndKernParamInit.m: Compound kernel parameter initialisation.
computeKernel.m: Compute the kernel given the parameters and X.
kernCompute.m: Compute the kernel given the parameters and X.
kernCreate.m: Initialise a kernel structure.
kernDiagCompute.m: Compute the kernel given the parameters and X.
kernDiagGradX.m: Compute the gradient of the  kernel wrt X.
kernDisplay.m: Display the parameters of the kernel.
kernExpandParam.m: Expand parameters to form a kernel structure.
kernExtractParam.m: Extract parameters from kernel structure.
kernGradX.m: Compute the gradient of the  kernel wrt X.
kernGradient.m: Compute the gradient of the kernel's parameters.
kernParamInit.m: Kernel parameter initialisation.
kernPriorGradient.m: Compute gradient terms associated with kernel priors.
kernPriorLogProb.m: Compute penalty terms associated with kernel priors.
kernTest.m: Run some tests on the specified kernel.
kernel.m: Initialise a kernel structure.
kernelGradient.m: Gradient of likelihood approximation wrt kernel parameters.
kernelObjective.m: Likelihood approximation.
linKernCompute.m: Compute the kernel given the parameters and X.
linKernDiagCompute.m: Compute diagonal of linear kernel.
linKernDiagGradX.m: Gradient of linear kernel's diagonal with respect to a point x.
linKernDisplay.m: Display parameters of linear kernel.
linKernExpandParam.m: Create kernel structure from linear kernel parameters.
linKernExtractParam.m: Extract parameters from linear kernel structure.
linKernGradX.m: Gradient of linear kernel with respect to a point X.
linKernGradient.m: Gradient of lin kernel's parameters.
linKernParamInit.m: Linear kernel parameter initialisation.
linardKernCompute.m: Compute the linear ARD kernel given the parameters and X.
linardKernDiagCompute.m: Compute diagonal of linear ARD kernel.
linardKernDiagGradX.m: Gradient of linear ARD kernel's diagonal with respect to a point x.
linardKernDisplay.m: Display parameters of linear ARD kernel.
linardKernExpandParam.m: Create kernel structure from linear ARD's parameters.
linardKernExtractParam.m: Extract parameters from linear ARD kernel structure.
linardKernGradX.m: Gradient of linear ARD kernel with respect to a point x.
linardKernGradient.m: Gradient of linear ARD kernel's parameters.
linardKernParamInit.m: linear ARD kernel parameter initialisation.
linearKernParamInit.m: Linear kernel parameter initialisation.
mlpKernCompute.m: Compute the multi-layer perceptron kernel given the parameters and X.
mlpKernDiagCompute.m: Compute diagonal of multi-layer perceptron kernel.
mlpKernDiagGradX.m: Gradient of  multi-layer perceptron kernel's diagonal with respect to a point x.
mlpKernDisplay.m: Display parameters of multi-layer perceptron kernel.
mlpKernExpandParam.m: Create kernel structure from multi-layer perceptron's parameters.
mlpKernExtractParam.m: Extract parameters from multi-layer perceptron kernel structure.
mlpKernGradX.m: Gradient of multi-layer perceptron kernel with respect to a point X.
mlpKernGradient.m: Gradient of multi-layer perceptron kernel's parameters.
mlpKernParamInit.m: multi-layer perceptron kernel parameter initialisation.
mlpardKernCompute.m: Compute the multi-layer perceptron ARD kernel given the parameters and X.
mlpardKernDiagCompute.m: Compute diagonal of multi-layer perceptron ARD kernel.
mlpardKernDiagGradX.m: Gradient of multi-layer perceptron ARD kernel's diagonal with respect to a point x.
mlpardKernDisplay.m: Display parameters of multi-layer perceptron ARD kernel.
mlpardKernExpandParam.m: Create kernel structure from multi-layer perceptron ARD's parameters.
mlpardKernExtractParam.m: Extract parameters from multi-layer perceptron ARD kernel structure.
mlpardKernGradX.m: Gradient of multi-layer perceptron ARD kernel with respect to a point x.
mlpardKernGradient.m: Gradient of multi-layer perceptron ARD kernel's parameters.
mlpardKernParamInit.m: multi-layer perceptron ARD kernel parameter initialisation.
pskernelGradient.m: Gradient on likelihood approximation for point set IVM.
pskernelObjective.m: Likelihood approximation for point set IVM.
rbfKernCompute.m: Compute the kernel given the parameters and X.
rbfKernDiagCompute.m: Compute diagonal of rbf kernel.
rbfKernDiagGradX.m: Gradient of Radial basis function kernel's diagonal with respect to a point x.
rbfKernDisplay.m: Display parameters of radial basis function kernel.
rbfKernExpandParam.m: Create kernel structure from rbf parameters.
rbfKernExtractParam.m: Extract parameters from rbf kernel structure.
rbfKernGradX.m: Gradient of Radial basis function kernel with respect to a point X.
rbfKernGradient.m: Gradient of rbf kernel's parameters.
rbfKernParamInit.m: RBF kernel parameter initialisation.
rbfardKernCompute.m: Compute the radial basis function ARD kernel given the parameters and X.
rbfardKernDiagCompute.m: Compute diagonal of radial basis function ARD kernel.
rbfardKernDiagGradX.m: Gradient of radial basis function ARD kernel's diagonal with respect to a point x.
rbfardKernDisplay.m: Display parameters of radial basis function ARD kernel.
rbfardKernExpandParam.m: Create kernel structure from radial basis function ARD's parameters.
rbfardKernExtractParam.m: Extract parameters from radial basis function ARD kernel structure.
rbfardKernGradX.m: Gradient of radial basis function ARD kernel with respect to a point x.
rbfardKernGradient.m: Gradient of radial basis function ARD kernel's parameters.
rbfardKernParamInit.m: radial basis function ARD kernel parameter initialisation.
sqexpKernCompute.m: Compute the squared exponential kernel given the parameters and X.
sqexpKernDiagCompute.m: Compute diagonal of squared exponential kernel.
sqexpKernDiagGradX.m: Gradient of squared exponential kernel's diagonal with respect to a point x.
sqexpKernDisplay.m: Display parameters of squared exponential kernel.
sqexpKernExpandParam.m: Create kernel structure from squared exponential's parameters.
sqexpKernExtractParam.m: Extract parameters from squared exponential kernel structure.
sqexpKernGradX.m: Gradient of squared exponential kernel with respect to a point X.
sqexpKernGradient.m: Gradient of squared exponential kernel's parameters.
sqexpKernParamInit.m: squared exponential kernel parameter initialisation.
whiteKernCompute.m: Compute the white noise kernel given the parameters and X.
whiteKernDiagCompute.m: Compute diagonal of white noise kernel.
whiteKernDiagGradX.m: Gradient of white noise kernel's diagonal with respect to a point x.
whiteKernDisplay.m: Display parameters of white noise kernel.
whiteKernExpandParam.m: Create kernel structure from white noise's parameters.
whiteKernExtractParam.m: Extract parameters from white noise kernel structure.
whiteKernGradX.m: Gradient of white noise kernel with respect to a point x.
whiteKernGradient.m: Gradient of white noise kernel's parameters.
whiteKernParamInit.m: white noise kernel parameter initialisation.
