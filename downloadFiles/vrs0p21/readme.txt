KERN software
Version 0.21		Saturday 11 Oct 2008 at 20:55

Version 0.21
------------

Compatibility changes for NCCA and SGPLVM toolboxes.

Version 0.2
-----------

Added multiKernGradX, added new kernels for diffusion processes and 2nd order differential equations.

Version 0.172
-------------

Further minor updates to kern for working with the new gpsim code (corrected handling of white kernel in multiKern).


Version 0.171
-------------

Minor update to kernCreate to handle block kernel with differing number of inputs for each block.

Version 0.17
------------

Further improvements on the stability of the sim kernel. Addition of the driven input single input motif kernel (Antti Honkela) and the modification of the multiKern type to allow each block to have a different number of time points (Pei Gao).

Version 0.168
-------------

Found a bug in tensor gradient which meant gradients weren't being computed correctly with respect to X when more X and X2 are both provided as input arguments and both have length larger than 1. 

Antti Honkela improved the numerial stability of the sim kernel through judicious use of erfc.

Version 0.167
-------------

Added 'translate' kernel which allows wrapping of other kernels with a kernel that translates the input location. Useful for moving the non-stationarity around the input space.

Version 0.166
-------------

Added periodic version of RBF kernel (see Rasmussen and Williams pg 92 or Mackay's introduction to GPs (1998)) and periodic version of Gibbs's non-stationary kernel (see e.g. pg 93 of Rasmussen and Williams).

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

rbfperiodicKernParamInit.m: RBFPERIODIC kernel parameter initialisation.
disimXsimKernCompute.m: Compute a cross kernel between DISIM and SIM kernels.
expKernExpandParam.m: Create kernel structure from EXP kernel's parameters.
whitefixedKernGradX.m: Gradient of WHITEFIXED kernel with respect to a point x.
disimXdisimKernGradient.m: Compute a cross gradient between two DISIM kernels.
disimKernGradient.m: Gradient of DISIM kernel's parameters.
translateKernGradX.m: Gradient of TRANSLATE kernel with respect to a point x.
ratquadKernExpandParam.m: Create kernel structure from RATQUAD kernel's parameters.
sqexpKernGradient.m: Gradient of SQEXP kernel's parameters.
matern32KernCompute.m: Compute the MATERN32 kernel given the parameters and X.
mlpKernDiagGradX.m: Gradient of MLP kernel's diagonal with respect to X.
whitefixedXwhitefixedKernCompute.m: Compute a cross kernel between two WHITEFIXED kernels.
mlpardKernGradient.m: Gradient of MLPARD kernel's parameters.
tensorKernDisplay.m: Display parameters of the TENSOR kernel.
disimKernExtractParam.m: Extract parameters from the DISIM kernel structure.
gibbsperiodicKernGradient.m: Gradient of GIBBSPERIODIC kernel's parameters.
sqexpKernDiagGradX.m: Gradient of SQEXP kernel's diagonal with respect to X.
gibbsKernDiagCompute.m: Compute diagonal of GIBBS kernel.
ggKernExpandParam.m: Create kernel structure from GG kernel's parameters.
linardKernExtractParam.m: Extract parameters from the LINARD kernel structure.
lfmGradientSigmaH3.m: Gradient of the function h_i(z) with respect \sigma.
disimKernParamInit.m: DISIM kernel parameter initialisation.
kernReadParamsFromFID.m: Read the kernel parameters from C++ file FID.
tensorKernGradX.m: Gradient of TENSOR kernel with respect to a point x.
rbfperiodicKernGradX.m: Gradient of RBFPERIODIC kernel with respect to a point x.
matern32KernDiagGradient.m: Compute the gradient of the MATERN32 kernel's diagonal wrt parameters.
matern32KernExpandParam.m: Create kernel structure from MATERN32 kernel's parameters.
simKernDiagCompute.m: Compute diagonal of SIM kernel.
translateKernDiagCompute.m: Compute diagonal of TRANSLATE kernel.
polyKernCompute.m: Compute the POLY kernel given the parameters and X.
matern32KernGradient.m: Gradient of MATERN32 kernel's parameters.
mlpKernCompute.m: Compute the MLP kernel given the parameters and X.
polyKernExpandParam.m: Create kernel structure from POLY kernel's parameters.
linKernDisplay.m: Display parameters of the LIN kernel.
kernCompute.m: Compute the kernel given the parameters and X.
tensorKernDiagGradX.m: Gradient of TENSOR kernel's diagonal with respect to X.
disimXdisimKernCompute.m: Compute a cross kernel between two DISIM kernels.
ratquadKernCompute.m: Compute the RATQUAD kernel given the parameters and X.
mlpardKernDiagGradX.m: Gradient of MLPARD kernel's diagonal with respect to X.
kernPca.m: performs KPCA.
tensorKernExtractParam.m: Extract parameters from the TENSOR kernel structure.
fileKernDiagCompute.m: Compute diagonal of FILE kernel.
expKernParamInit.m: EXP kernel parameter initialisation.
simKernExtractParam.m: Extract parameters from the SIM kernel structure.
mlpKernGradient.m: Gradient of MLP kernel's parameters.
matern32KernGradX.m: Gradient of MATERN32 kernel with respect to input locations.
expKernCompute.m: Compute the EXP kernel given the parameters and X.
whitefixedKernExtractParam.m: Extract parameters from the WHITEFIXED kernel structure.
polyardKernExtractParam.m: Extract parameters from the POLYARD kernel structure.
gibbsKernSetLengthScaleFunc.m: Set the length scale function of the GIBBS kernel.
sqexpKernGradX.m: Gradient of SQEXP kernel with respect to a point x.
kernCreate.m: Initialise a kernel structure.
mlpKernDisplay.m: Display parameters of the MLP kernel.
kernDiagGradient.m: Compute the gradient of the kernel's parameters for the diagonal.
rbfardKernGradX.m: Gradient of RBFARD kernel with respect to input locations.
whitefixedKernCompute.m: Compute the WHITEFIXED kernel given the parameters and X.
lfmXlfmKernCompute.m: Compute a cross kernel between two LFM kernels.
polyKernDiagCompute.m: Compute diagonal of POLY kernel.
cmpndKernExtractParam.m: Extract parameters from the CMPND kernel structure.
biasKernDiagGradient.m: Compute the gradient of the BIAS kernel's diagonal wrt parameters.
gibbsKernDisplay.m: Display parameters of the GIBBS kernel.
componentKernReadParamsFromFID.m: Read a component based kernel from a C++ file.
lfmUpdateKernels.m: Updates the kernel representations in the LFM structure.
polyardKernExpandParam.m: Create kernel structure from POLYARD kernel's parameters.
ratquadKernDiagGradient.m: Compute the gradient of the RATQUAD kernel's diagonal wrt parameters.
rbfardKernExtractParam.m: Extract parameters from the RBFARD kernel structure.
ardKernExtractParam.m: Extract parameters from the ARD kernel structure.
tensorKernGradient.m: Gradient of TENSOR kernel's parameters.
rbfKernDiagGradient.m: Compute the gradient of the RBF kernel's diagonal wrt parameters.
linKernExpandParam.m: Create kernel structure from LIN kernel's parameters.
biasKernGradient.m: Gradient of BIAS kernel's parameters.
ratquadKernParamInit.m: RATQUAD kernel parameter initialisation.
kernelCenter.m: Attempts to Center Kernel Matrix
ggXgaussianKernCompute.m: Compute a cross kernel between the GG and GAUSSIAN kernels.
whiteKernGradient.m: Gradient of WHITE kernel's parameters.
disimComputeHPrime.m: Helper function for comptuing part of the DISIM kernel.
ratquadKernGradient.m: Gradient of RATQUAD kernel's parameters.
lfmKernDiagCompute.m: Compute diagonal of LFM kernel.
mlpKernExtractParam.m: Extract parameters from the MLP kernel structure.
rbfKernGradient.m: Gradient of RBF kernel's parameters.
ratquadKernDiagGradX.m: Gradient of RATQUAD kernel's diagonal with respect to X.
lfmOptions.m: Creates a set of default options for a LFM model.
lfmGradientH.m: Gradient of the function h_i(z) with respect to some of the
lfmGradientSigmaH.m: Gradient of the function h_i(z) with respect \sigma.
whitefixedKernExpandParam.m: Create kernel structure from WHITEFIXED kernel's parameters.
simXsimKernCompute.m: Compute a cross kernel between two SIM kernels.
multiKernComputeBlock.m:
ardKernParamInit.m: ARD kernel parameter initialisation.
simKernDiagGradient.m: Compute the gradient of the SIM kernel's diagonal wrt parameters.
ggXgaussianKernGradient.m: Compute gradient between the GG and GAUSSIAN kernels.
kernSetWhite.m: Helper function to set the white noise in a kernel if it exists.
rbfardKernGradient.m: Gradient of RBFARD kernel's parameters.
rbfardKernDiagGradX.m: Gradient of RBFARD kernel's diagonal with respect to X.
ggKernParamInit.m: GG kernel parameter initialisation.
ardKernCompute.m: Compute the ARD kernel given the parameters and X.
biasKernDisplay.m: Display parameters of the BIASkernel.
ggKernCompute.m: Compute the GG kernel given the parameters and X.
gibbsKernGradient.m: Gradient of GIBBS kernel's parameters.
gibbsperiodicKernExpandParam.m: Create kernel structure from GIBBSPERIODIC kernel's parameters.
polyardKernDiagGradX.m: Gradient of POLYARD kernel's diagonal with respect to X.
rbfKernGradX.m: Gradient of RBF kernel with respect to input locations.
multiKernCompute.m: Compute the MULTI kernel given the parameters and X.
translateKernParamInit.m: TRANSLATE kernel parameter initialisation.
biasKernDiagCompute.m: Compute diagonal of BIAS kernel.
lfmXrbfKernGradient.m: Compute gradient between the LFM and RBF kernels.
kernDiagGradX.m: Compute the gradient of the  kernel wrt X.
disimKernExpandParam.m: Create kernel structure from DISIM kernel's parameters.
biasKernParamInit.m: BIAS kernel parameter initialisation.
biasKernDiagGradX.m: Gradient of BIAS kernel's diagonal with respect to X.
tensorKernSetIndex.m: Set the indices in the tensor kernel.
matern52KernExtractParam.m: Extract parameters from the MATERN52 kernel structure.
whitefixedKernParamInit.m: WHITEFIXED kernel parameter initialisation.
simKernDisplay.m: Display parameters of the SIM kernel.
linKernCompute.m: Compute the LIN kernel given the parameters and X.
whiteKernCompute.m: Compute the WHITE kernel given the parameters and X.
ggKernExtractParam.m: Extract parameters from the GG kernel structure.
lfmGradientH32.m: Gradient of the function h_i(z) with respect to some of the
ardKernDiagGradient.m: Compute the gradient of the ARD kernel's diagonal wrt parameters.
mlpKernParamInit.m: MLP kernel parameter initialisation.
lfmComputeUpsilon.m: Helper function for comptuing part of the LFM kernel.
lfmGradientH42.m: Gradient of the function h_i(z) with respect to some of the
fileKernExpandParam.m: Create kernel structure from FILE kernel's parameters.
fileKernParamInit.m: FILE kernel parameter initialisation.
mlpardKernExtractParam.m: Extract parameters from the MLPARD kernel structure.
simKernCompute.m: Compute the SIM kernel given the parameters and X.
ardKernDisplay.m: Display parameters of the ARD kernel.
matern52KernDisplay.m: Display parameters of the MATERN52 kernel.
cmpndKernDiagCompute.m: Compute diagonal of CMPND kernel.
multiKernExpandParam.m: Create kernel structure from MULTI kernel's parameters.
sqexpKernParamInit.m: SQEXP kernel parameter initialisation.
kernFactors.m: Extract factors associated with transformed optimisation space.
lfmKernGradX.m: Gradient of LFM kernel with respect to a point x.
ratquadKernDisplay.m: Display parameters of the RATQUAD kernel.
disimXrbfKernGradient.m: Compute gradient between the DISIM and RBF kernels.
gibbsperiodicKernDiagGradX.m: Gradient of GIBBSPERIODIC kernel's diagonal with respect to X.
ardKernExpandParam.m: Create kernel structure from ARD kernel's parameters.
kernTest.m: Run some tests on the specified kernel.
whiteKernGradX.m: Gradient of WHITE kernel with respect to input locations.
simComputeH.m: Helper function for comptuing part of the SIM kernel.
polyardKernParamInit.m: POLYARD kernel parameter initialisation.
lfmKernExpandParam.m: Create kernel structure from LFM kernel's parameters.
rbfKernExtractParam.m: Extract parameters from the RBF kernel structure.
matern52KernGradX.m: Gradient of MATERN52 kernel with respect to input locations.
kernWriteParamsToFID.m: Write the kernel parameters to a stream.
rbfperiodicKernDisplay.m: Display parameters of the RBFPERIODIC kernel.
disimKernDiagCompute.m: Compute diagonal of DISIM kernel.
polyardKernDisplay.m: Display parameters of the POLYARD kernel.
simComputeTest.m: Test the file simComputeH.
polyKernDiagGradX.m: Gradient of POLY kernel's diagonal with respect to X.
linardKernDisplay.m: Display parameters of the LINARD kernel.
tensorKernSlash.m: Tensor kernel created by removing ith component.
rbfperiodicKernExtractParam.m: Extract parameters from the RBFPERIODIC kernel structure.
kernToolboxes.m: Load in the relevant toolboxes for kern.
whitefixedKernDiagGradX.m: Gradient of WHITEFIXED kernel's diagonal with respect to X.
linKernGradient.m: Gradient of LIN kernel's parameters.
polyKernParamInit.m: POLY kernel parameter initialisation.
lfmKernGradient.m: Gradient of LFM kernel's parameters.
sqexpKernDiagGradient.m: Compute the gradient of the SQEXP kernel's diagonal wrt parameters.
gaussianKernDiagCompute.m: Compute diagonal of gaussian kernel.
multiKernGradX.m: Gradient of MULTI kernel with respect to a point x.
lfmGradientUpsilon.m: Gradient of the function \upsilon(z) with respect to
rbfardKernDiagGradient.m: Compute the gradient of the RBFARD kernel's diagonal wrt parameters.
linardKernCompute.m: Compute the LINARD kernel given the parameters and X.
sqexpKernCompute.m: Compute the SQEXP kernel given the parameters and X.
lfmKernDisplay.m: Display parameters of the LFM kernel.
lfmComputeH.m: Helper function for computing part of the LFM kernel.
lfmExtractParam.m: Extract the parameters of an LFM model.
fileKernRead.m: Read kernel values from file or cache.
simKernExpandParam.m: Create kernel structure from SIM kernel's parameters.
rbfperiodicKernDiagGradient.m: Compute the gradient of the RBFPERIODIC kernel's diagonal wrt parameters.
ggXgaussianKernGradX.m: Compute gradient between the GG and GAUSSIAN
tensorKernCompute.m: Compute the TENSOR kernel given the parameters and X.
gibbsKernCompute.m: Compute the GIBBS kernel given the parameters and X.
linKernParamInit.m: LIN kernel parameter initialisation.
whiteKernExpandParam.m: Create kernel structure from WHITE kernel's parameters.
ratquadKernDiagCompute.m: Compute diagonal of RATQUAD kernel.
sqexpKernExpandParam.m: Create kernel structure from SQEXP kernel's parameters.
disimKernDisplay.m: Display parameters of the DISIM kernel.
gaussianKernCompute.m: Compute the Gaussian kernel given the parameters and X.
matern32KernDiagGradX.m: Gradient of MATERN32 kernel's diagonal with respect to X.
kernGetVariance.m: Get the signal associated with a the kernel.
cmpndKernGradX.m: Gradient of CMPND kernel with respect to a point x.
gibbsKernExpandParam.m: Create kernel structure from GIBBS kernel's parameters.
simKernGradX.m: Gradient of SIM kernel with respect to a point x.
lfmTest.m: Test the gradients of the LFM model.
polyardKernGradient.m: Gradient of POLYARD kernel's parameters.
gibbsKernExtractParam.m: Extract parameters from the GIBBS kernel structure.
rbfperiodicKernGradient.m: Gradient of RBFPERIODIC kernel's parameters.
lfmSample.m: Sample from LFM kernel
sqexpKernDiagCompute.m: Compute diagonal of SQEXP kernel.
ggXggKernCompute.m: Compute a cross kernel between two GG kernels.
linardKernParamInit.m: LINARD kernel parameter initialisation.
polyardKernCompute.m: Compute the POLYARD kernel given the parameters and X.
lfmComputeH4.m: Helper function for computing part of the LFM kernel.
lfmGradientSigmaH4.m: Gradient of the function h_i(z) with respect \sigma.
whitefixedKernGradient.m: Gradient of WHITEFIXED kernel's parameters.
whiteKernParamInit.m: WHITE kernel parameter initialisation.
simXsimKernGradient.m: Compute a cross gradient between two SIM kernels.
lfmKernDiagGradX.m: Gradient of LFM kernel's diagonal with respect to X.
translateKernCompute.m: Compute the TRANSLATE kernel given the parameters and X.
lfmKernDiagGradient.m: Compute the gradient of the LFM kernel's diagonal wrt parameters.
rbfperiodicKernDiagGradX.m: Gradient of RBFPERIODIC kernel's diagonal with respect to X.
ardKernDiagGradX.m: Gradient of ARD kernel's diagonal with respect to X.
linardKernExpandParam.m: Create kernel structure from LINARD kernel's parameters.
whitefixedKernDisplay.m: Display parameters of the WHITEFIXED kernel.
expKernDisplay.m: Display parameters of the EXP kernel.
kernDisplay.m: Display the parameters of the kernel.
ggKernDiagCompute.m: Compute diagonal of GG kernel.
kernPriorGradient.m: Compute gradient terms associated with kernel priors.
ggXggKernGradient.m: Compute a cross gradient between two GG kernels.
kernDiagCompute.m: Compute the kernel given the parameters and X.
rbfKernDisplay.m: Display parameters of the RBF kernel.
disimXrbfKernCompute.m: Compute a cross kernel between the DISIM and RBF kernels.
sqexpKernExtractParam.m: Extract parameters from the SQEXP kernel structure.
matern32KernDisplay.m: Display parameters of the MATERN32 kernel.
sparseKernDisplay.m: Display parameters of the SPARSE kernel.
mlpardKernDiagCompute.m: Compute diagonal of MLPARD kernel.
cmpndKernExpandParam.m: Create kernel structure from CMPND kernel's parameters.
polyKernGradX.m: Gradient of POLY kernel with respect to input locations.
gibbsperiodicKernCompute.m: Compute the GIBBSPERIODIC kernel given the parameters and X.
tensorKernDiagCompute.m: Compute diagonal of TENSOR kernel.
lfmCreate.m: Create a LFM model.
lfmGradientH41.m: Gradient of the function h_i(z) with respect to some of the
polyKernDisplay.m: Display parameters of the POLY kernel.
matern32KernParamInit.m: MATERN32 kernel parameter initialisation.
lfmXrbfKernCompute.m: Compute a cross kernel between the LFM and RBF kernels.
whitefixedXwhitefixedKernGradient.m: Compute a cross gradient between two WHITEFIXED kernels.
lfmLogLikelihood.m: Compute the log likelihood of a LFM model.
matern52KernDiagCompute.m: Compute diagonal of MATERN52 kernel.
gaussianKernDiagGradient.m: Compute the gradient of the gaussian kernel's diagonal wrt parameters.
lfmKernExtractParam.m: Extract parameters from the LFM kernel structure.
gaussianKernDiagGradX.m: Gradient of gaussian kernel's diagonal with respect to X.
mlpardKernParamInit.m: MLPARD kernel parameter initialisation.
cmpndKernDisplay.m: Display parameters of the CMPND kernel.
rbfperiodicKernDiagCompute.m: Compute diagonal of RBFPERIODIC kernel.
expKernExtractParam.m: Extract parameters from the EXP kernel structure.
multiKernDiagGradient.m: Compute the gradient of the MULTI kernel's diagonal wrt parameters.
lfmLogLikeGradients.m: Compute the gradients of the log likelihood of a LFM model.
ardKernDiagCompute.m: Compute diagonal of ARD kernel.
matern52KernDiagGradient.m: Compute the gradient of the MATERN52 kernel's diagonal wrt parameters.
ardKernGradX.m: Gradient of ARD kernel with respect to a point x.
matern52KernExpandParam.m: Create kernel structure from MATERN52 kernel's parameters.
computeKernel.m: Compute the kernel given the parameters and X.
multiKernTest.m: Run some tests on the multiple output block kernel.
polyardKernDiagCompute.m: Compute diagonal of POLYARD kernel.
pskernelGradient.m: Gradient on likelihood approximation for point set IVM.
kernCorrelation.m: Compute the correlation matrix kernel given the parameters and X.
fileKernDisplay.m: Display parameters of the FILE kernel.
whiteKernDiagCompute.m: Compute diagonal of WHITE kernel.
cmpndKernDiagGradX.m: Gradient of CMPND kernel's diagonal with respect to X.
mlpardKernExpandParam.m: Create kernel structure from MLPARD kernel's parameters.
linKernDiagCompute.m: Compute diagonal of LIN kernel.
gaussianKernExtractParam.m: Extract parameters from the gaussian kernel structure.
multiKernDiagCompute.m: Compute diagonal of MULTI kernel.
mlpardKernGradX.m: Gradient of MLPARD kernel with respect to input locations.
matern52KernGradient.m: Gradient of MATERN52 kernel's parameters.
lfmKernCompute.m: Compute the LFM kernel given the parameters and X.
translateKernDiagGradX.m: Gradient of TRANSLATE kernel's diagonal with respect to X.
matern32KernDiagCompute.m: Compute diagonal of MATERN32 kernel.
gibbsperiodicKernDisplay.m: Display parameters of the GIBBSPERIODIC kernel.
biasKernGradX.m: Gradient of BIAS kernel with respect to input locations.
fileKernGradX.m: Gradient of FILE kernel with respect to a point x.
gaussianKernGradX.m: Gradient of gaussian kernel with respect to input locations.
kernPriorLogProb.m: Compute penalty terms associated with kernel priors.
gibbsperiodicKernGradX.m: Gradient of GIBBSPERIODIC kernel with respect to a point x.
linKernGradX.m: Gradient of LIN kernel with respect to input locations.
componentKernWriteParamsToFID.m: Write a component based kernel to a stream.
linardKernDiagCompute.m: Compute diagonal of LINARD kernel.
rbfperiodicKernCompute.m: Compute the RBFPERIODIC kernel given the parameters and X.
tensorKernDiagGradient.m: Compute the gradient of the TENSOR kernel's diagonal wrt parameters.
mlpKernGradX.m: Gradient of MLP kernel with respect to input locations.
cmpndKernSetIndex.m: Set the indices in the compound kernel.
expKernDiagGradX.m: Gradient of EXP kernel's diagonal with respect to X.
cmpndKernParamInit.m: CMPND kernel parameter initialisation.
disimKernDiagGradX.m: Gradient of DISIM kernel's diagonal with respect to X.
rbfKernCompute.m: Compute the RBF kernel given the parameters and X.
biasKernExpandParam.m: Create kernel structure from BIAS kernel's parameters.
matern32KernExtractParam.m: Extract parameters from the MATERN32 kernel structure.
rbfardKernDisplay.m: Display parameters of the RBFARD kernel.
polyKernExtractParam.m: Extract parameters from the POLY kernel structure.
ardKernGradient.m: Gradient of ARD kernel's parameters.
multiKernGradient.m: Gradient of MULTI kernel's parameters.
lfmKernParamInit.m: LFM kernel parameter initialisation.
cmpndKernCompute.m: Compute the CMPND kernel given the parameters and X.
multiKernParamInit.m: MULTI kernel parameter initialisation.
disimXsimKernGradient.m: Compute gradient between the DISIM and SIM kernels.
whitefixedKernDiagGradient.m: Compute the gradient of the WHITEFIXED kernel's diagonal wrt parameters.
simKernGradient.m: Gradient of SIM kernel's parameters.
disimKernGradX.m: Gradient of DISIM kernel with respect to a point x.
mlpardKernCompute.m: Compute the MLPARD kernel given the parameters and X.
whitefixedKernDiagCompute.m: Compute diagonal of WHITEFIXED kernel.
kernWriteToFID.m: Load from an FID written by the C++ implementation.
whiteKernExtractParam.m: Extract parameters from the WHITE kernel structure.
gibbsperiodicKernDiagCompute.m: Compute diagonal of GIBBSPERIODIC kernel.
disimKernCompute.m: Compute the DISIM kernel given the parameters and X.
kernGradient.m: Compute the gradient wrt the kernel's parameters.
rbfKernParamInit.m: RBF kernel parameter initialisation.
kernExtractParam.m: Extract parameters from kernel structure.
gibbsperiodicKernDiagGradient.m: Compute the gradient of the GIBBSPERIODIC kernel's diagonal wrt parameters.
simXrbfKernGradient.m: Compute gradient between the SIM and RBF kernels.
mlpardKernDisplay.m: Display parameters of the MLPARD kernel.
expKernGradient.m: Gradient of EXP kernel's parameters.
lfmComputeH3.m: Helper function for computing part of the LFM kernel.
tensorKernParamInit.m: TENSOR kernel parameter initialisation.
gaussianKernDisplay.m: Display parameters of the GAUSSIAN kernel.
lfmGradientSigmaUpsilon.m: Gradient of the function \upsilon(z) with respect
whiteXwhiteKernGradient.m: Compute a cross gradient between two WHITE kernels.
tensorKernExpandParam.m: Create kernel structure from TENSOR kernel's parameters.
ratquadKernGradX.m: Gradient of RATQUAD kernel with respect to input locations.
ggKernDisplay.m: Display parameters of the GG kernel.
rbfperiodicKernExpandParam.m: Create kernel structure from RBFPERIODIC kernel's parameters.
gibbsKernParamInit.m: GIBBS kernel parameter initialisation.
kernParamInit.m: Kernel parameter initialisation.
translateKernExpandParam.m: Create kernel structure from TRANSLATE kernel's parameters.
gaussianKernExpandParam.m: Create kernel structure from gaussian kernel's parameters.
multiKernGradientBlock.m:
translateKernGradient.m: Gradient of TRANSLATE kernel's parameters.
simXrbfKernCompute.m: Compute a cross kernel between the SIM and RBF kernels.
matern52KernParamInit.m: MATERN52 kernel parameter initialisation.
matern52KernCompute.m: Compute the MATERN52 kernel given the parameters and X.
biasKernExtractParam.m: Extract parameters from the BIAS kernel structure.
multiKernDiagGradX.m: Gradient of MULTI kernel's diagonal with respect to X.
whiteKernDiagGradX.m: Gradient of WHITE kernel's diagonal with respect to X.
translateKernDisplay.m: Display parameters of the TRANSLATE kernel.
simKernParamInit.m: SIM kernel parameter initialisation.
fileKernGradient.m: Gradient of FILE kernel's parameters.
rbfardKernCompute.m: Compute the RBFARD kernel given the parameters and X.
kernReadFromFID.m: Load from an FID written by the C++ implementation.
disimKernDiagGradient.m: Compute the gradient of the DISIM kernel's diagonal wrt parameters.
disimComputeH.m: Helper function for comptuing part of the DISIM kernel.
ggKernGradient.m: Gradient of GG kernel's parameters.
mlpKernDiagCompute.m: Compute diagonal of MLP kernel.
rbfardKernExpandParam.m: Create kernel structure from RBFARD kernel's parameters.
kernSetIndex.m: Set the indices on a compound kernel.
expKernGradX.m: Gradient of EXP kernel with respect to a point x.
gaussianKernGradient.m: Gradient of gaussian kernel's parameters.
lfmExpandParam.m: Expand the given parameters into a LFM structure.
linKernDiagGradX.m: Gradient of LIN kernel's diagonal with respect to X.
linardKernDiagGradX.m: Gradient of LINARD kernel's diagonal with respect to X.
simKernDiagGradX.m: Gradient of SIM kernel's diagonal with respect to X.
expKernDiagCompute.m: Compute diagonal of EXP kernel.
lfmComputeTest.m: Test the file lfmComputeH.
kernGradX.m: Compute the gradient of the kernel wrt X.
fileKernExtractParam.m: Extract parameters from the FILE kernel structure.
linardKernGradient.m: Gradient of LINARD kernel's parameters.
gaussianKernParamInit.m: Gaussian kernel parameter initialisation.
polyKernGradient.m: Gradient of POLY kernel's parameters.
rbfKernDiagGradX.m: Gradient of RBF kernel's diagonal with respect to X.
multiKernExtractParam.m: Extract parameters from the MULTI kernel structure.
rbfardKernParamInit.m: RBFARD kernel parameter initialisation.
whiteXwhiteKernCompute.m: Compute a cross kernel between two WHITE kernels.
ratquadKernExtractParam.m: Extract parameters from the RATQUAD kernel structure.
gibbsperiodicKernExtractParam.m: Extract parameters from the GIBBSPERIODIC kernel structure.
sqexpKernDisplay.m: Display parameters of the SQEXP kernel.
biasKernCompute.m: Compute the BIAS kernel given the parameters and X.
cmpndKernGradient.m: Gradient of CMPND kernel's parameters.
fileKernCompute.m: Compute the FILE kernel given the parameters and X.
matern52KernDiagGradX.m: Gradient of MATERN52 kernel's diagonal with respect to X.
gibbsKernGradX.m: Gradient of GIBBS kernel with respect to input locations.
cmpndKernDiagGradient.m: Compute the gradient of the CMPND kernel's diagonal wrt parameters.
gibbsKernDiagGradient.m: Compute the gradient of the GIBBS kernel's diagonal wrt parameters.
mlpKernExpandParam.m: Create kernel structure from MLP kernel's parameters.
translateKernExtractParam.m: Extract parameters from the TRANSLATE kernel structure.
gibbsperiodicKernParamInit.m: GIBBSPERIODIC kernel parameter initialisation.
lfmGradientH31.m: Gradient of the function h_i(z) with respect to some of the
lfmXlfmKernGradient.m: Compute a cross gradient between two LFM kernels.
kernExpandParam.m: Expand parameters to form a kernel structure.
whiteKernDisplay.m: Display parameters of the WHITEkernel.
rbfKernDiagCompute.m: Compute diagonal of RBF kernel.
multiKernDisplay.m: Display parameters of the MULTI kernel.
whiteKernDiagGradient.m: Compute the gradient of the WHITE kernel's diagonal wrt parameters.
gibbsKernDiagGradX.m: Gradient of GIBBS kernel's diagonal with respect to X.
pskernelObjective.m: Likelihood approximation for point set IVM.
rbfardKernDiagCompute.m: Compute diagonal of RBFARD kernel.
linKernExtractParam.m: Extract parameters from the LIN kernel structure.
rbfKernExpandParam.m: Create kernel structure from RBF kernel's parameters.
polyardKernGradX.m: Gradient of POLYARD kernel with respect to input locations.
linardKernGradX.m: Gradient of LINARD kernel with respect to input locations.
