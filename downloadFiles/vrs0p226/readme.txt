KERN software
Version 0.226		Friday 22 Jul 2011 at 15:57

Version 0.226
-------------

Added velotrans covariance function which allows a moving field type covariance function with a constant velocity. Added rbfperiodic2 for periodic covariances with learnable period. Added various multioutput covariance functions for switched latent force models.

Version 0.225
-------------

Updates for latest version of MULTIGP toolbox associated with MULTIGP tech report.

Version 0.224
-------------

Added disimSample and simSample for sampling from these multioutput covariance functions. Michalis added kernel types rbfard2 and linard2 which use a slightly different formulation of the ARD parameters.

Version 0.223
-------------

Minor fix of "ard" kernel which somehow had a kernel computation bit placed in the parameter initialization --- cut and past mistake at some point.

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

kernReadParamsFromFID.m: Read the kernel parameters from C++ file FID.
sdlfmKernGradientConstant.m: Gradients for constants for the SDLFM kernel
rbfard2KernDiagGradX.m: Gradient of RBFARD2 kernel's diagonal with respect to X.
lfmaXrbfKernGradient.m: Compute gradient between the LFMA and RBF kernels.
sdrbfKernExtractParam.m: Extract parameters from the SDRBF kernel structure.
gaussianKernGradX.m: Gradient of gaussian kernel with respect to input locations.
matern52KernExpandParam.m: Create kernel structure from MATERN52 kernel's parameters.
rbfKernGradient.m: Gradient of RBF kernel's parameters.
sqexpKernDiagCompute.m: Compute diagonal of SQEXP kernel.
gibbsperiodicKernDiagCompute.m: Compute diagonal of GIBBSPERIODIC kernel.
lfmXrbfKernGradient.m: Compute gradient between the LFM and RBF kernels.
polyardKernDisplay.m: Display parameters of the POLYARD kernel.
ratquadKernExtractParam.m: Extract parameters from the RATQUAD kernel structure.
tensorKernCompute.m: Compute the TENSOR kernel given the parameters and X.
ratquadKernDisplay.m: Display parameters of the RATQUAD kernel.
linKernDiagGradX.m: Gradient of LIN kernel's diagonal with respect to X.
lfmGradientH.m: Gradient of the function h_i(z) with respect to some of the
lfmXrbfKernCompute.m: Compute a cross kernel between the LFM and RBF kernels.
whiteblockKernGradient.m: Gradient of WHITEBLOCK kernel's parameters.
sdlfmaXsdlfmvKernComputeBlock.m: Computes SDLFM kernel matrix for block i,j
gibbsKernExpandParam.m: Create kernel structure from GIBBS kernel's parameters.
ratquadKernGradient.m: Gradient of RATQUAD kernel's parameters.
matern52KernExtractParam.m: Extract parameters from the MATERN52 kernel structure.
linKernExpandParam.m: Create kernel structure from LIN kernel's parameters.
kernGradX.m: Compute the gradient of the kernel wrt X.
rbfwhiteKernExtractParam.m: Extract parameters from the RBF-WHITE kernel
whiteblockKernExpandParam.m: Fill WHITEBLOCK kernel structure with params.
kernTest.m: Run some tests on the specified kernel.
ggwhiteXgaussianwhiteKernGradX.m: Compute gradient between the GG white and
rbfwhiteKernGradX.m: Gradient of RBF-WHITE kernel with respect to a point t.
ardKernDisplay.m: Display parameters of the ARD kernel.
sdlfmjMeanCompute.m: Jolt mean for the switching dynamical LFM model.
fileKernDiagCompute.m: Compute diagonal of FILE kernel.
kernFactors.m: Extract factors associated with transformed optimisation space.
simXsimKernDiagGradient.m: Gradient for the diagonal between two SIM kernels.
noneKernParamInit.m: NONE kernel parameter initialisation.  
rbfardKernParamInit.m: RBFARD kernel parameter initialisation.
disimXrbfKernCompute.m: Compute a cross kernel between the DISIM and RBF kernels.
sqexpKernDisplay.m: Display parameters of the SQEXP kernel.
simwhiteKernExtractParam.m: Extract parameters from the SIM-WHITE kernel
rbfperiodic2KernExpandParam.m: Create kernel structure from RBFPERIODIC2 kernel's parameters.
whitehKernDiagGradient.m: Compute the gradient of the WHITEH kernel's diagonal wrt parameters.
lfmSample.m: Sample from LFM kernel
simKernParamInit.m: SIM kernel parameter initialisation.
noneKernDiagCompute.m: Compute diagonal of NONE kernel.
heatKernDiagGradient.m: Gradient of the HEAT kernel's diagonal wrt parameters.
whiteXnoneKernCompute.m: Compute a cross kernel between WHITE and NONE kernels.
gibbsperiodicKernDisplay.m: Display parameters of the GIBBSPERIODIC kernel.
lfmwhiteKernExpandParam.m: Create kernel structure from LFM-WHITE kernel's
translateKernDiagGradX.m: Gradient of TRANSLATE kernel's diagonal with respect to X.
lfmavComputeUpsilonMatrix.m: Upsilon matrix acce. vel. with t1, t2 limits
ggKernGradient.m: Gradient of GG kernel's parameters.
whitehKernGradX.m: Gradient of WHITEH kernel with respect to input locations.
simwhiteKernParamInit.m: SIM-WHITE kernel parameter initialisation.
sdlfmaXsdlfmvKernGradientBlock.m: Gradients of the parameters in block i,j
simKernDiagGradient.m: Compute the gradient of the SIM kernel's diagonal wrt parameters.
sdlfmaXsdlfmKernGradientBlockIEJ.m: 
rbfardKernGradX.m: Gradient of RBFARD kernel with respect to input locations.
sheatKernDiagGradient.m: Gradient of the parameters of diagonal of a SHEAT kernel.
kernPriorLogProb.m: Compute penalty terms associated with kernel priors.
matern52KernDisplay.m: Display parameters of the MATERN52 kernel.
simXrbfKernGradient.m: Compute gradient between the SIM and RBF kernels.
simXsimKernGradient.m: Compute a cross gradient between two SIM kernels.
lfmapComputeUpsilonMatrix.m: Upsilon matrix acce. pos. with t1, t2 limits
rbfwhiteXwhiteKernCompute.m: Compute a cross kernel between the RBF-WHITE
mlpardKernCompute.m: Compute the MLPARD kernel given the parameters and X.
cmpndKernSetIndex.m: Set the indices in the compound kernel.
whiteblockKernGradX.m: Gradient of WHITEBLOCK kernel wrt input locations.
simComputeH.m: Helper function for comptuing part of the SIM kernel.
ardKernGradX.m: Gradient of ARD kernel with respect to a point x.
gaussianKernCompute.m: Compute the Gaussian kernel given the parameters and X.
simXsimComputeDiagH.m: Helper function for comptuing part of the SIM kernel.
mlpardKernParamInit.m: MLPARD kernel parameter initialisation.
lfmComputeH3JV.m: Helper function for computing part of the LFMJV kernel.
lfmwhiteXrbfwhiteKernGradient.m: Compute a cross gradient between an LFM-WHITE
rbfperiodicKernGradient.m: Gradient of RBFPERIODIC kernel's parameters.
multiKernExtractParam.m: Extract parameters from the MULTI kernel structure.
mlpardKernGradX.m: Gradient of MLPARD kernel with respect to input locations.
sdlfmXsdlfmKernGradientBlockIEJ.m: 
ggwhiteXgaussianwhiteKernGradient.m: Compute gradient between the GG white
translateKernGradient.m: Gradient of TRANSLATE kernel's parameters.
simXsimComputeDiagHStat.m: Helper function for computing part of the stationary version
mlpardKernDiagGradX.m: Gradient of MLPARD kernel's diagonal with respect to X.
wienerKernExpandParam.m: Create kernel structure from WIENER kernel's parameters.
rbfKernDiagCompute.m: Compute diagonal of RBF kernel.
pskernelObjective.m: Likelihood approximation for point set IVM.
cmpndKernGradX.m: Gradient of CMPND kernel with respect to a point x.
rbfinfwhiteXrbfinfwhiteKernGradient.m: Compute a cross gradient between two
mlpKernExpandParam.m: Create kernel structure from MLP kernel's parameters.
rbfardKernExpandParam.m: Create kernel structure from RBFARD kernel's parameters.
sparseKernDisplay.m: Display parameters of the SPARSE kernel.
matern52KernCompute.m: Compute the MATERN52 kernel given the parameters and X.
whitefixedKernDiagGradX.m: Gradient of WHITEFIXED kernel's diagonal with respect to X.
kernCreate.m: Initialise a kernel structure.
biasKernCompute.m: Compute the BIAS kernel given the parameters and X.
polyardKernExpandParam.m: Create kernel structure from POLYARD kernel's parameters.
mlpKernDiagCompute.m: Compute diagonal of MLP kernel.
disimSample.m: Sample from SIM kernel
sdlfmaXsdlfmKernComputeBlock.m: Computes SDLFM kernel matrix for block i,j
lfmwhiteXlfmwhiteKernCompute.m: Compute a cross kernel between two LFM-WHITE
whiteXnoneKernGradient.m: Compute a cross gradient between WHITE and DUMMY kernels.
whitehKernCompute.m: Compute the WHITEH kernel given the parameters and X.
kernPriorGradient.m: Compute gradient terms associated with kernel priors.
sqexpKernGradX.m: Gradient of SQEXP kernel with respect to a point x.
dexpKernDiagCompute.m: Compute diagonal of the double exponential kernel.
rbfardKernCompute.m: Compute the RBFARD kernel given the parameters and X.
ggKernExtractParam.m: Extract parameters from the GG kernel structure.
rbfperiodicKernGradX.m: Gradient of RBFPERIODIC kernel with respect to a point x.
tensorKernSlash.m: Tensor kernel created by removing ith component.
simwhiteKernDisplay.m: Display parameters of the SIM-WHITE kernel.
whiteblockKernExtractParam.m: Extract parameters from WHITEBLOCK kernel str.
rbfperiodicKernParamInit.m: RBFPERIODIC kernel parameter initialisation.
rbfard2KernCompute.m: Compute the RBFARD kernel given the parameters and X.
gibbsperiodicKernExpandParam.m: Create kernel structure from GIBBSPERIODIC kernel's parameters.
ggXggKernCompute.m: Compute a cross kernel between two GG kernels.
rbfwhiteKernParamInit.m: RBF-WHITE kernel parameter initialisation. The RBF-
gibbsperiodicKernGradX.m: Gradient of GIBBSPERIODIC kernel with respect to a point x.
disimXsimKernGradient.m: Compute gradient between the DISIM and SIM kernels.
linard2KernGradX.m: Gradient of LINARD2 kernel with respect to input locations.
matern52KernDiagGradX.m: Gradient of MATERN52 kernel's diagonal with respect to X.
simSample.m: Sample from SIM kernel
sdlfmXsdlfmKernGradientICBlock.m: Partial derivatives initial conditions
disimKernExtractParam.m: Extract parameters from the DISIM kernel structure.
cmpndKernExtractParam.m: Extract parameters from the CMPND kernel structure.
sqexpKernCompute.m: Compute the SQEXP kernel given the parameters and X.
whiteXrbfKernGradient.m: Compute a cross gradient between WHITE and RBF kernels.
sdlfmvXsdrbfKernCompute.m: Cross kernel between a SDLFMV and a SDRBF kernels.
whitefixedXwhitefixedKernGradient.m: Compute a cross gradient between two WHITEFIXED kernels.
ardKernExtractParam.m: Extract parameters from the ARD kernel structure.
multiKernDiagGradientBlock.m:
translateKernCompute.m: Compute the TRANSLATE kernel given the parameters and X.
ratquadKernGradX.m: Gradient of RATQUAD kernel with respect to input locations.
ardKernParamInit.m: ARD kernel parameter initialisation.
lfmjXlfmvKernCompute.m: Jolt and velocity LFM kernel  
rbfperiodic2KernExtractParam.m: Extract parameters from the RBFPERIODIC2 kernel structure.
gaussianwhiteKernDiagGradX.m: Gradient of gaussian white kernel's diagonal with respect to X.
rbfperiodicKernDiagGradX.m: Gradient of RBFPERIODIC kernel's diagonal with respect to X.
whiteKernExpandParam.m: Create kernel structure from WHITE kernel's parameters.
lfmExpandParam.m: Expand the given parameters into a LFM structure.
gibbsKernDiagGradient.m: Compute the gradient of the GIBBS kernel's diagonal wrt parameters.
cmpndKernDisplay.m: Display parameters of the CMPND kernel.
sdlfmvXsdlfmvKernComputeBlock.m: Computes SDLFM kernel matrix for block i,j
sdlfmaXsdlfmvKernGradient.m: Gradients of cross kernel between 2 SDLFM kernels.
lfmapGradientUpsilonVector.m: Gradient upsilon vector accel. pos.
multiKernTest.m: Run some tests on the multiple output block kernel.
lfmjXlfmaKernCompute.m: Jolt and acceleration LFM kernel  
gaussianKernDiagGradient.m: Compute the gradient of the gaussian kernel's diagonal wrt parameters.
wienerKernCompute.m: Compute the WIENER kernel given the parameters and X.
rbfhKernDiagGradX.m: Gradient of RBFH kernel's diagonal with respect to X.
ggwhiteKernGradient.m: Gradient of GG WHITE kernel's parameters.
rbfinfwhiteXrbfinfwhiteKernCompute.m: Compute a cross kernel between two
sqexpKernGradient.m: Gradient of SQEXP kernel's parameters.
lfmwhiteKernCompute.m: Compute the LFM-WHITE kernel given the parameters, t1
rbfhKernCompute.m: Compute the RBFH kernel given the parameters and X.
lfmGradientSigmaH.m: Gradient of the function h_i(z) with respect \sigma.
biasKernExtractParam.m: Extract parameters from the BIAS kernel structure.
lfmComputeH3VV.m: Helper function for computing part of the LFMVXLFMV kernel.
polyKernGradient.m: Gradient of POLY kernel's parameters.
rbfardKernGradient.m: Gradient of RBFARD kernel's parameters.
lfmComputeH4.m: Helper function for computing part of the LFM kernel.
rbfperiodicKernExpandParam.m: Create kernel structure from RBFPERIODIC kernel's parameters.
matern52KernGradX.m: Gradient of MATERN52 kernel with respect to input locations.
disimKernDiagGradX.m: Gradient of DISIM kernel's diagonal with respect to X.
multiKernGradientBlockX.m:
whitehKernExpandParam.m: Create kernel structure from WHITEH kernel's parameters.
lfmGradientSigmaH4AV.m: Gradient of the function h_i(z) with respect \sigma.
linard2KernExtractParam.m: Extract parameters from the LINARD2 kernel structure.
lfmGradientUpsilon.m: Gradient of the function \upsilon(z) with respect to
sdlfmvKernGradient.m: Gradient of SDLFM kernel's parameters.
disimKernParamInit.m: DISIM kernel parameter initialisation.
lfmvvGradientUpsilonMatrix.m: Gradient upsilon matrix vel. vel.
fileKernGradient.m: Gradient of FILE kernel's parameters.
lmcKernDiagCompute.m: Compute the diagonal of the LMC kernel.
lfmvXrbfKernGradient.m: Compute gradient between the LFMV and RBF kernels.
gibbsperiodicKernDiagGradX.m: Gradient of GIBBSPERIODIC kernel's diagonal with respect to X.
rbfardjitKernDiagGradX.m: Gradient of RBFARDJIT kernel's diagonal with respect to X.
ouKernGradX.m: Gradient of OU kernel with respect to a point x (see
lfmGradientH42AP.m: Gradient of the function h_i(z) with respect to some of the
lfmjXlfmKernCompute.m: Jolt and position LFM kernel  
sdlfmKernGradientMean.m: Gradients of the parameters of mean function cov.
simKernGradient.m: Gradient of SIM kernel's parameters.
rbfardKernDiagGradient.m: Compute the gradient of the RBFARD kernel's diagonal wrt parameters.
disimXdisimKernGradient.m: Compute a cross gradient between two DISIM kernels.
simXrbfKernCompute.m: Compute a cross kernel between the SIM and RBF kernels.
lfmvKernParamInit.m: LFMV kernel parameter initialisation. 
ardKernCompute.m: Compute the ARD kernel given the parameters and X.
sdlfmaXsdrbfKernGradientBlock.m: Gradients of the parameters in block i,j
kernDiagCompute.m: Compute the kernel given the parameters and X.
rbfard2KernDiagGradient.m: Compute the gradient of the RBFARD2 kernel's diagonal wrt parameters.
lfmComputeH3JA.m: Helper function for computing part of the LFMJA kernel.
tensorKernGradX.m: Gradient of TENSOR kernel with respect to a point x.
ratquadKernDiagGradX.m: Gradient of RATQUAD kernel's diagonal with respect to X.
wienerKernExtractParam.m: Extract parameters from the WIENER kernel structure.
lfmwhiteKernExtractParam.m: Extract parameters from the LFM-WHITE kernel
cmpndKernGradient.m: Gradient of CMPND kernel's parameters.
sdlfmXsdlfmKernComputeBlock.m: Computes SDLFM kernel matrix for block i,j
sdlfmKernParamInit.m: SDLFM kernel initialization
noneKernDiagGradX.m: Gradient of NONE kernel's diagonal with respect to X.
sdlfmvXsdlfmKernCompute.m: Cross kernel between a SDLFMV and a SDLFM kernels.
biasKernGradX.m: Gradient of BIAS kernel with respect to input locations.
tensorKernParamInit.m: TENSOR kernel parameter initialisation.
sdlfmvKernExpandParam.m: Pass parameters from params to SDLFMV kernel
wienerKernDiagCompute.m: Compute diagonal of WIENER kernel.
gibbsperiodicKernExtractParam.m: Extract parameters from the GIBBSPERIODIC kernel structure.
lfmLogLikelihood.m: Compute the log likelihood of a LFM model.
lmcKernCompute.m: Compute the LMC kernel given the parameters and X.
rbfinfwhiteKernGradient.m: Gradient of the parameters of the RBF-WHITE kernel
disimComputeH.m: Helper function for comptuing part of the DISIM kernel.
lfmGradientH31.m: Gradient of the function h_i(z) with respect to some of the
rbfardjitKernGradX.m: Gradient of RBFARDJIT kernel with respect to input locations.
lfmKernDiagGradient.m: Compute the gradient of the LFM kernel's diagonal wrt parameters.
lfmaXlfmaKernGradient.m: Compute a cross gradient between a LFMA and a LFMA.
polyardKernGradX.m: Gradient of POLYARD kernel with respect to input locations.
expKernDisplay.m: Display parameters of the EXP kernel.
tensorKernDiagGradX.m: Gradient of TENSOR kernel's diagonal with respect to X.
rbfardjitKernDiagCompute.m: Compute diagonal of RBFARDJIT kernel.
lfmvXlfmvKernGradient.m: Compute a cross gradient between a LFMV and a LFMV.
lfmvpComputeUpsilonMatrix.m: Upsilon matrix vel. pos. with t1, t2 limits
rbfwhiteKernDiagGradX.m: Gradient of RBF-WHITE kernel's diagonal w.r.t. t.
sdlfmvXsdlfmvKernGradientICBlock.m: Partial derivatives initial conditions
lfmvvComputeUpsilonMatrix.m: Upsilon matrix vel. vel. with t1, t2 limits
ggwhiteXggwhiteKernGradient.m: Compute a cross gradient between two GG WHITE kernels.
rbfinfwhiteKernParamInit.m: The RBF-WHITE-INF kernel is a convolutional
simKernCompute.m: Compute the SIM kernel given the parameters and X.
rbfwhiteKernExpandParam.m: Create kernel structure from RBF-WHITE kernel's
whiteblockKernDiagCompute.m: Compute diagonal of WHITEBLOCK kernel.
whiteKernParamInit.m: WHITE kernel parameter initialisation.
lfmComputeH4VP.m: Helper function for computing part of the LFMVXLFM kernel.
rbfhKernDisplay.m: Display parameters of the RBFH kernel.
multiKernDiagGradX.m: Gradient of MULTI kernel's diagonal with respect to X.
sdlfmXsdrbfKernGradient.m: Cross gradient between a SDLFM and a SDRBF kernels.
rbfard2KernParamInit.m: RBFARD2 kernel parameter initialisation.
rbfardjitKernDiagGradient.m: Compute the gradient of the RBFARD2 kernel's diagonal wrt parameters.
rbfwhiteKernGradient.m: Gradient of RBF-WHITE kernel's parameters.
whitefixedKernDiagGradient.m: Compute the gradient of the WHITEFIXED kernel's diagonal wrt parameters.
gibbsKernDiagCompute.m: Compute diagonal of GIBBS kernel.
sdlfmvXsdrbfKernGradient.m: Gradients cross kernel between a SDLFM and SDRBF
computeKernel.m: Compute the kernel given the parameters and X.
biasKernParamInit.m: BIAS kernel parameter initialisation.
ggKernDiagCompute.m: Compute diagonal of GG kernel.
ardKernGradient.m: Gradient of ARD kernel's parameters.
matern52KernParamInit.m: MATERN52 kernel parameter initialisation.
lfmwhiteXwhiteKernCompute.m: Compute a cross kernel between the LFM-WHITE
lfmComputeH3AV.m: Helper function for computing part of the LFMAV kernel.
multiKernGradientBlock.m:
whiteKernExtractParam.m: Extract parameters from the WHITE kernel structure.
ratquadKernParamInit.m: RATQUAD kernel parameter initialisation.
polyKernDiagGradX.m: Gradient of POLY kernel's diagonal with respect to X.
linKernGradX.m: Gradient of LIN kernel with respect to input locations.
expKernParamInit.m: EXP kernel parameter initialisation.
fileKernExtractParam.m: Extract parameters from the FILE kernel structure.
polyardKernParamInit.m: POLYARD kernel parameter initialisation.
rbfardKernDiagCompute.m: Compute diagonal of RBFARD kernel.
gibbsperiodicKernCompute.m: Compute the GIBBSPERIODIC kernel given the parameters and X.
wienerKernDiagGradX.m: Gradient of WIENER kernel's diagonal with respect to X.
heatKernGradient.m: Gradient of HEAT kernel's parameters.
lfmOptions.m: Creates a set of default options for a LFM model.
sdlfmXsdlfmvKernGradientICBlock.m: Partial derivatives initial conditions
sdlfmvKernDisplay.m: Display parameters of the SDLFMV kernel.
lfmjpComputeUpsilonVector.m: Upsilon vector jolt. pos. with t1, t2 limits
lfmwhiteXlfmwhiteKernGradient.m: Compute a cross gradient between two
sdrbfKernCompute.m: Compute the SDRBF kernel given the parameters and t1.
disimKernCompute.m: Compute the DISIM kernel given the parameters and X.
translateKernExtractParam.m: Extract parameters from the TRANSLATE kernel structure.
lmcKernDisplay.m: Display parameters of the LMC kernel.
rbfKernGradX.m: Gradient of RBF kernel with respect to input locations.
simwhiteXwhiteKernGradient.m: Compute gradient between the SIM-WHITE and WHITE kernels.
heatXheatKernGradient.m: Gradient wrt parameters between two HEAT kernels.
rbfperiodicKernDiagGradient.m: Compute the gradient of the RBFPERIODIC kernel's diagonal wrt parameters.
lfmvXlfmKernGradient.m: Compute a cross gradient for a LFMVXLFM.
lfmaKernCompute.m: Compute the LFMA kernel given the parameters and X.
lfmKernDiagCompute.m: Compute diagonal of LFM kernel.
linardKernCompute.m: Compute the LINARD kernel given the parameters and X.
dexpKernExpandParam.m: Create a kernel structure from the double exponential
sdlfmXsdlfmvKernComputeBlock.m: Computes SDLFM kernel matrix for block i,j
ggwhiteKernExpandParam.m: Create kernel structure from GG white kernel's parameters.
rbfardKernDiagGradX.m: Gradient of RBFARD kernel's diagonal with respect to X.
whiteblockKernDisplay.m: Display parameters of the WHITEBLOCK kernel.
heatXrbfhKernCompute.m: Cross kernel between a HEAT and a RBF kernels.
lfmwhiteKernParamInit.m: LFM-WHITE kernel parameter initialisation.
expKernGradient.m: Gradient of EXP kernel's parameters.
rbfinfwhiteKernDisplay.m: Display parameters of the RBF-WHITE kernel (with
sdlfmaXsdlfmaKernGradientBlockIGJ.m: 
linardKernDiagCompute.m: Compute diagonal of LINARD kernel.
sdrbfKernDisplay.m: Display parameters of the SDRBF kernel.
lfmvpGradientSigmaUpsilonMatrix.m: Gradient of upsilon matrix vp wrt sigma
matern32KernDiagGradX.m: Gradient of MATERN32 kernel's diagonal with respect to X.
linKernParamInit.m: LIN kernel parameter initialisation.
lfmGradientH41.m: Gradient of the function h_i(z) with respect to some of the
whitefixedKernGradX.m: Gradient of WHITEFIXED kernel with respect to a point x.
sdlfmXsdlfmvKernGradientBlockIGJ.m: 
linKernCompute.m: Compute the LIN kernel given the parameters and X.
fileKernGradX.m: Gradient of FILE kernel with respect to a point x.
simwhiteXrbfinfwhiteKernGradient.m: Compute a cross gradient between a
polyardKernDiagCompute.m: Compute diagonal of POLYARD kernel.
disimKernDisplay.m: Display parameters of the DISIM kernel.
lfmjXrbfKernCompute.m: Compute cross kernel between the LFMJ and RBF kernels.
whitehKernDisplay.m: Display parameters of the WHITEH kernel.
dexpKernCompute.m: Compute the double exponential kernel,
multiKernFixBlocks.m:
rbfard2KernGradient.m: Gradient of RBFARD2 kernel's parameters.
cmpndKernExpandParam.m: Create kernel structure from CMPND kernel's parameters.
simKernGradX.m: Gradient of SIM kernel with respect to each time point in t1.
sdlfmvKernExtractParam.m: Extract parameters from the SDLFMV kernel structure.
sdlfmaXsdlfmaKernGradientBlock.m: Gradients of the parameters in block i,j
tensorKernDisplay.m: Display parameters of the TENSOR kernel.
rbfardjitKernDisplay.m: Display parameters of the RBFARDJIT kernel.
polyKernDiagCompute.m: Compute diagonal of POLY kernel.
lfmwhiteKernGradient.m: Gradient of LFM-WHITE kernel's parameters.
lmcKernParamInit.m: LMC kernel parameter initialisation.
disimKernExpandParam.m: Create kernel structure from DISIM kernel's parameters.
sdlfmvKernDiagCompute.m: Compute diagonal of a SDLFMV kernel.
gaussianKernExtractParam.m: Extract parameters from the gaussian kernel structure.
sdlfmKernComputeConstant.m: Compute constants for the SDLFM kernel
noneKernCompute.m: Compute the NONE kernel given the parameters and X.
lfmGradientSigmaH3AA.m: Gradient of the function h_i(z) with respect \sigma.
whiteXwhiteKernGradX.m:
simComputeTest.m: Test the file simComputeH.
sdlfmKernCompute.m: Compute the SDLFM kernel given the parameters and X.
lfmwhiteComputeGradThetaH1.m: computes a portion of the LFM-WHITE kernel's gradient w.r.t. theta.
sdlfmXsdrbfKernGradientBlockIGJ.m: 
lfmvKernExpandParam.m: Create kernel structure from LFMV kernel's parameters.
kernSetIndex.m: Set the indices on a compound kernel.
disimXdisimKernCompute.m: Compute a cross kernel between two DISIM kernels.
whiteKernCompute.m: Compute the WHITE kernel given the parameters and X.
lfmvpGradientUpsilonVector.m: Gradient upsilon vector vel. pos.
whitehKernParamInit.m: WHITEH kernel parameter initialisation.
gaussianwhiteKernDisplay.m: Display parameters of the GAUSSIAN white kernel.
sqexpKernParamInit.m: SQEXP kernel parameter initialisation.
whiteblockKernParamInit.m: WHITE BLOCK kernel parameter initialisation.
lfmaaComputeUpsilonDiagVector.m: Diag. of Upsilon matrix acce. accel. 
simwhiteKernExpandParam.m: Create kernel structure from SIM-WHITE kernel's
sdlfmXsdlfmvKernGradientBlock.m: Gradients of the parameters in block i,j
sdlfmaXsdrbfKernComputeBlock.m: Cross kernel between SDLFM and SDRBF for i,j
translateKernDisplay.m: Display parameters of the TRANSLATE kernel.
lfmavGradientUpsilonMatrix.m: Gradient upsilon matrix accel. vel.
lfmComputeH4JV.m: Helper function for computing part of the LFMJV kernel.
kernSetWhite.m: Helper function to set the white noise in a kernel if it exists.
lfmaXlfmvKernCompute.m: Acceleration and velocity LFM kernel  
rbfhKernGradient.m: Gradient of RBFH kernel's parameters.
rbfperiodicKernCompute.m: Compute the RBFPERIODIC kernel given the parameters and X.
fileKernRead.m: Read kernel values from file or cache.
simwhiteXwhiteKernCompute.m: Compute a cross kernel between the SIM-WHITE
disimKernGradient.m: Gradient of DISIM kernel's parameters.
ouKernDisplay.m: Display parameters of the OU kernel (see ouKernCompute or
gibbsKernSetLengthScaleFunc.m: Set the length scale function of the GIBBS kernel.
noneKernGradX.m: Gradient of NONE kernel with respect to a point x.
disimComputeHPrime.m: Helper function for comptuing part of the DISIM kernel.
sdlfmvXsdlfmKernGradientICBlock.m: Partial derivatives initial conditions
polyKernCompute.m: Compute the POLY kernel given the parameters and X.
rbfKernCompute.m: Compute the RBF kernel given the parameters and X.
lfmvXrbfvKernCompute.m: Compute a cross kernel between the LFMV and RBFV kernels.
linKernDiagCompute.m: Compute diagonal of LIN kernel.
lfmvKernDisplay.m: Display parameters of the LFMV kernel.
linard2KernExpandParam.m: Create kernel structure from LINARD2 kernel's parameters.
tensorKernGradient.m: Gradient of TENSOR kernel's parameters.
lfmGradientH32.m: Gradient of the function h_i(z) with respect to some of the
lfmComputeH4JP.m: Helper function for computing part of the LFMJP kernel.
sdlfmXsdrbfKernGradientBlock.m: Gradients of the parameters in block i,j
polyKernDisplay.m: Display parameters of the POLY kernel.
gaussianKernExpandParam.m: Create kernel structure from gaussian kernel's parameters.
sdlfmaXsdlfmKernGradientBlockILJ.m: 
rbfXnoneKernGradient.m: Compute a cross gradient between RBF and DUMMY
rbfard2KernDisplay.m: Display parameters of the RBFARD2 kernel.
linard2KernParamInit.m: LINARD2 kernel parameter initialisation.
lmcKernGradient.m: Gradient of LMC kernel's parameters.
cmpndKernDiagCompute.m: Compute diagonal of CMPND kernel.
gibbsKernDiagGradX.m: Gradient of GIBBS kernel's diagonal with respect to X.
simKernDiagCompute.m: Compute diagonal of SIM kernel.
ardKernDiagCompute.m: Compute diagonal of ARD kernel.
wienerKernParamInit.m: WIENER kernel parameter initialisation.
lfmKernGradX.m: Gradient of LFM kernel with respect to a point x.
lfmGradientSigmaH4AA.m: Gradient of the function h_i(z) with respect \sigma.
gibbsKernGradX.m: Gradient of GIBBS kernel with respect to input locations.
lfmXrbfvKernCompute.m: Compute a cross kernel between the LFM and RBFV kernels.
multiKernGradient.m: Gradient of MULTI kernel's parameters.
gaussianKernGradient.m: Gradient of gaussian kernel's parameters.
linardKernGradX.m: Gradient of LINARD kernel with respect to input locations.
translateKernDiagCompute.m: Compute diagonal of TRANSLATE kernel.
lfmGradientSigmaH3AV.m: Gradient of the function h_i(z) with respect \sigma.
lfmComputeH.m: Helper function for computing part of the LFM kernel.
sdlfmvXsdlfmKernGradient.m: Gradients of cross kernel between 2 SDLFM kernels.
sdlfmvXsdrbfKernComputeBlock.m: Cross kernel between SDLFM and SDRBF for i,j
expKernCompute.m: Compute the EXP kernel given the parameters and X.
ouKernExpandParam.m: Create kernel structure from OU kernel's parameters
disimKernDiagCompute.m: Compute diagonal of DISIM kernel.
lfmvpGradientSigmaUpsilonVector.m: Gradient of upsilon vector vp wrt sigma
rbfKernDiagGradient.m: Compute the gradient of the RBF kernel's diagonal wrt parameters.
matern52KernGradient.m: Gradient of MATERN52 kernel's parameters.
tensorKernDiagCompute.m: Compute diagonal of TENSOR kernel.
velotransKernDiagGradX.m: Gradient of VELOTRANS kernel's diagonal with respect to X.
lfmTest.m: Test the gradients of the LFM model.
sdlfmKernDiagComputeBlock.m: Diagonal of a SDLFM kernel matrix for block i
lfmaXlfmvKernGradient.m: Compute a cross gradient between a LFMA and a LFMV.
whiteKernDiagCompute.m: Compute diagonal of WHITE kernel.
getLocalGradAlphaOmega.m: Gradients of parameters in alpha and omega
heatXheatKernCompute.m: Compute a cross kernel between two HEAT kernels.
sdlfmaXsdlfmKernGradient.m: Gradients of cross kernel between 2 SDLFM kernels.
gaussianwhiteKernCompute.m: Compute the covariance of the output samples 
gaussianwhiteKernGradX.m: Gradient of gaussian white kernel with respect 
lfmComputeUpsilonDiagVector.m: 
rbfwhiteKernDiagCompute.m: Compute diagonal of RBF-WHITE kernel.
lfmGradientSigmaH4VV.m: Gradient of the function h_i(z) with respect \sigma.
sdlfmvXsdrbfKernGradientBlock.m: Gradients of the parameters in block i,j
velotransKernDisplay.m: Display parameters of the VELOTRANS kernel.
gaussianKernParamInit.m: Gaussian kernel parameter initialisation.
rbfard2KernDiagCompute.m: Compute diagonal of RBFARD2 kernel.
lfmvXlfmvKernCompute.m: Velocity and velocity LFM kernel  
whiteKernGradient.m: Gradient of WHITE kernel's parameters.
dexpKernExtractParam.m: Extract parameters from the double exponential's
disimXsimKernCompute.m: Compute a cross kernel between DISIM and SIM kernels.
rbfKernExtractParam.m: Extract parameters from the RBF kernel structure.
expKernExtractParam.m: Extract parameters from the EXP kernel structure.
gaussianwhiteKernParamInit.m: Gaussian white kernel parameter initialisation.
mlpKernGradient.m: Gradient of MLP kernel's parameters.
rbfhKernExpandParam.m: Create kernel structure from RBFH kernel's parameters.
polyardKernGradient.m: Gradient of POLYARD kernel's parameters.
sdlfmXsdlfmKernGradientBlockILJ.m: 
kernCorrelation.m: Compute the correlation matrix kernel given the parameters and X.
dexpKernDiagGradX.m: Gradient of the double exponential kernel's diagonal
srbfhKernCompute.m: Compute an SRBFH kernel.
multiKernDiagGradient.m: Compute the gradient of the MULTI kernel's diagonal wrt parameters.
lfmwhiteKernDisplay.m: Display parameters of the LFM-WHITE kernel.
lfmGradientSigmaH3AP.m: Gradient of the function h_i(z) with respect \sigma.
noneKernExtractParam.m: Extract parameters from the NONE kernel structure.
lfmComputeH3AP.m: Helper function for computing part of the LFMAP kernel.
lfmaaGradientUpsilonMatrix.m: Gradient upsilon matrix accel. accel.
ggXgaussianKernGradient.m: Compute gradient between the GG and GAUSSIAN kernels.
fileKernExpandParam.m: Create kernel structure from FILE kernel's parameters.
rbfinfwhiteKernDiagCompute.m: Compute diagonal of RBF-WHITE kernel (with
polyKernExtractParam.m: Extract parameters from the POLY kernel structure.
linardKernDisplay.m: Display parameters of the LINARD kernel.
simXsimKernCompute.m: Compute a cross kernel between two SIM kernels.
biasKernDiagGradient.m: Compute the gradient of the BIAS kernel's diagonal wrt parameters.
mlpKernExtractParam.m: Extract parameters from the MLP kernel structure.
lfmComputeH4VV.m: Helper function for computing part of the LFMVXLFMV kernel.
linard2KernGradient.m: Gradient of LINARD2 kernel's parameters.
multiKernDisplay.m: Display parameters of the MULTI kernel.
disimKernGradX.m: Gradient of DISIM kernel with respect to a point x.
gibbsKernGradient.m: Gradient of GIBBS kernel's parameters.
mlpKernCompute.m: Compute the MLP kernel given the parameters and X.
matern32KernParamInit.m: MATERN32 kernel parameter initialisation.
sdlfmvXsdlfmvKernCompute.m: Compute a cross kernel between two SDLFMV kernels.
sdlfmvXsdlfmvKernGradient.m: Gradients of cross kernel between 2 SDLFM kernels.
lfmvpComputeUpsilonDiagVector.m: Upsilon diag vector vel. pos. with t1, t2 limits
rbfhKernParamInit.m: RBFH kernel parameter initialisation.
sdlfmvKernCompute.m: Compute the SDLFMV kernel given the parameters and X.
noneKernGradient.m: Gradient of NONE kernel's parameters.
lfmKernParamInit.m: LFM kernel parameter initialisation. The latent force
ratquadKernDiagCompute.m: Compute diagonal of RATQUAD kernel.
lfmwhiteXwhiteKernGradient.m: Compute gradient between the LFM-WHITE and
simwhiteKernGradX.m: Gradient of SIM-WHITE kernel with respect to a point t.
sheatKernCompute.m: Compute a cross kernel between two SHEAT kernels.
matern32KernDiagCompute.m: Compute diagonal of MATERN32 kernel.
linard2KernDiagGradX.m: Gradient of LINARD2 kernel's diagonal with respect to X.
lfmComputeH4AA.m: Helper function for computing part of the LFMAA kernel.
polyardKernDiagGradX.m: Gradient of POLYARD kernel's diagonal with respect to X.
ratquadKernDiagGradient.m: Compute the gradient of the RATQUAD kernel's diagonal wrt parameters.
sdlfmXsdlfmKernGradientBlockIGJ.m: 
expKernDiagCompute.m: Compute diagonal of EXP kernel.
rbfard2KernGradX.m: Gradient of RBFARD2 kernel with respect to input locations.
mlpKernGradX.m: Gradient of MLP kernel with respect to input locations.
rbfardjitKernParamInit.m: RBFARD2 kernel parameter initialisation.
rbfinfwhiteKernGradX.m: Gradient of RBF-WHITE kernel (with integration limits
sdlfmXsdrbfKernCompute.m: Cross kernel between a SDLFM and a SDRBF kernels.
sdlfmvXsdlfmvKernGradientBlock.m: Gradients of the parameters in block i,j
polyardKernCompute.m: Compute the POLYARD kernel given the parameters and X.
sdlfmaXsdlfmaKernCompute.m: Cross kernel between a SDLFMA and a SDLFMA kernels.
heatXrbfhKernGradient.m: Gradient wrt parameters between a HEAT and a RBFH.
rbfwhiteXrbfwhiteKernCompute.m: Compute a cross kernel between two RBF-WHITE
rbfardjitKernCompute.m: Compute the RBFARD kernel given the parameters and X.
lfmGradientH41VP.m: Gradient of the function h_i(z) with respect to some of the
lfmvvGradientSigmaUpsilonMatrix.m: Gradient of upsilon matrix vv wrt sigma
sdlfmXsdlfmKernGradient.m: Gradients of cross kernel between 2 SDLFM kernels.
lfmaXlfmKernCompute.m: Acceleration and position LFM kernel  
simwhiteXrbfwhiteKernGradient.m: Compute a cross gradient between a SIM-WHITE
linardKernGradient.m: Gradient of LINARD kernel's parameters.
whiteblockKernDiagGradX.m: Gradient of WHITEBLOCK kernel's diagonal wrt X.
sdlfmvKernDiagComputeBlock.m: Diagonal of a SDLFM kernel matrix for block i
multiKernComputeBlock.m:
tensorKernExpandParam.m: Create kernel structure from TENSOR kernel's parameters.
lfmvXrbfKernCompute.m: Compute a cross kernel between the LFMV and RBF kernels.
lfmGradientH42VP.m: Gradient of the function h_i(z) with respect to some of the
lfmComputeH3VP.m: Helper function for computing part of the LFMVXLFM kernel.
ggKernExpandParam.m: Create kernel structure from GG kernel's parameters.
expKernDiagGradX.m: Gradient of EXP kernel's diagonal with respect to X.
wienerKernGradient.m: Gradient of WIENER kernel's parameters.
rbfperiodic2KernParamInit.m: RBFPERIODIC2 kernel parameter initialisation.
noneKernExpandParam.m: Create kernel structure from NONE kernel's parameters.
kernDiagGradient.m: Compute the gradient of the kernel's parameters for the diagonal.
rbfardjitKernExtractParam.m: Extract parameters from the RBFARD2 kernel structure.
lfmapGradientSigmaUpsilonVector.m: Gradient of upsilon vector ap wrt sigma
lfmComputeH3AA.m: Helper function for computing part of the LFMAA kernel.
rbfhKernExtractParam.m: Extract parameters from the RBFH kernel structure.
lfmGradientSigmaH4.m: Gradient of the function h_i(z) with respect \sigma.
sdlfmaXsdlfmaKernGradient.m: Gradients of cross kernel between 2 SDLFM kernels.
lfmjvComputeUpsilonMatrix.m: Upsilon matrix jolt. vel. with t1, t2 limits
lfmKernDiagGradX.m: Gradient of LFM kernel's diagonal with respect to X.
lfmapComputeUpsilonVector.m: Upsilon vector for acce. pos. with t1 limit
expKernExpandParam.m: Create kernel structure from EXP kernel's parameters.
rbfinfwhiteKernDiagGradX.m: Gradient of RBF-WHITE kernel's (with integration
rbfKernExpandParam.m: Create kernel structure from RBF kernel's parameters.
gibbsKernDisplay.m: Display parameters of the GIBBS kernel.
ouKernGradient.m: Gradient of OU kernel's parameters (see ouKernCompute or
sdlfmKernDiagCompute.m: Compute diagonal of a SDLFM kernel.
sheatKernGradient.m: Gradient of the parameters of a SHEAT kernel.
lfmwhiteXrbfwhiteKernCompute.m: Compute a cross kernel between an LFM-WHITE
sdlfmaXsdlfmvKernCompute.m: Cross kernel between a SDLFMA and a SDLFMV kernels.
rbfardjitKernExpandParam.m: Create kernel structure from RBFARDJIT kernel's parameters.
kernExtractParam.m: Extract parameters from kernel structure.
ggwhiteKernExtractParam.m: Extract parameters from the GG WHITE kernel structure.
sdlfmvKernParamInit.m: SDLFMV kernel initialization
kernDisplay.m: Display the parameters of the kernel.
lfmvpGradientUpsilonMatrix.m: Gradient upsilon matrix vel. pos.
whitefixedKernGradient.m: Gradient of WHITEFIXED kernel's parameters.
rbfwhiteKernCompute.m: Compute the RBF-WHITE kernel given the parameters, t1
velotransKernCompute.m: Compute the VELOTRANS kernel given the parameters and X.
cmpndKernDiagGradient.m: Compute the gradient of the CMPND kernel's diagonal wrt parameters.
kernPca.m: performs KPCA.
lfmComputeH4AV.m: Helper function for computing part of the LFMAV kernel.
sdrbfKernParamInit.m: SDRBF kernel initialization
simComputeHStat.m: Helper function for computing part of the stationary version
rbfperiodicKernDiagCompute.m: Compute diagonal of RBFPERIODIC kernel.
sdlfmXsdlfmKernGradientBlock.m: Gradients of the parameters in block i,j
ggwhiteXgaussianwhiteKernCompute.m: Compute a cross kernel between the GG white and GAUSSIAN white kernels.
disimKernDiagGradient.m: Compute the gradient of the DISIM kernel's diagonal wrt parameters.
lfmvKernExtractParam.m: Extract parameters from the LFMV kernel structure.
lfmwhiteComputeGradThetaH2.m: computes a portion of the LFM-WHITE kernel's gradient w.r.t. theta.
whitehKernGradient.m: Gradient of WHITEH kernel's parameters.
kernReadFromFID.m: Load from an FID written by the C++ implementation.
sdlfmKernMeanCovPartial.m: Helper function for derivatives in SDLFM kernel
velotransKernGradX.m: Gradient of VELOTRANS kernel with respect to a point x.
rbfardjitKernGradient.m: Gradient of RBFARD2 kernel's parameters.
lfmwhiteComputeH.m: Helper function for computing part of the LFM-WHITE
kernCompute.m: Compute the kernel given the parameters and X.
mlpKernParamInit.m: MLP kernel parameter initialisation.
simKernExtractParam.m: Extract parameters from the SIM kernel structure.
sqexpKernDiagGradX.m: Gradient of SQEXP kernel's diagonal with respect to X.
heatKernExtractParam.m: Extract parameters from the HEAT kernel structure.
rbfwhiteXrbfwhiteKernGradient.m: Compute a cross gradient between two
simwhiteKernCompute.m: Compute the SIM-WHITE kernel given the parameters, t1
mlpardKernDisplay.m: Display parameters of the MLPARD kernel.
rbfinfwhiteXwhiteKernGradient.m: Compute gradient between the RBF-WHITE kernel
lfmLogLikeGradients.m: Compute the gradients of the log likelihood of a LFM model.
gibbsKernParamInit.m: GIBBS kernel parameter initialisation.
sdlfmXsdlfmKernCompute.m: Compute a cross kernel between two SDLFM kernels.
ouKernExtractParam.m: Extract parameters from the OU kernel structure (see
matern32KernDisplay.m: Display parameters of the MATERN32 kernel.
matern32KernGradient.m: Gradient of MATERN32 kernel's parameters.
dexpKernParamInit.m: The double exponential kernel is usually called
whitefixedKernExpandParam.m: Create kernel structure from WHITEFIXED kernel's parameters.
sdlfmKernDisplay.m: Display parameters of the SDLFM kernel.
lfmXlfmKernGradient.m: Compute a cross gradient between two LFM kernels.
mlpardKernGradient.m: Gradient of MLPARD kernel's parameters.
lfmaKernParamInit.m: LFMA kernel parameter initialisation. 
polyardKernExtractParam.m: Extract parameters from the POLYARD kernel structure.
tensorKernSetIndex.m: Set the indices in the tensor kernel.
linard2KernCompute.m: Compute the LINARD2 kernel given the parameters and X.
simwhiteXrbfwhiteKernCompute.m: Compute a cross kernel between a SIM-WHITE
rbfardKernDisplay.m: Display parameters of the RBFARD kernel.
lfmComputeH3.m: Helper function for computing part of the LFM kernel.
matern32KernGradX.m: Gradient of MATERN32 kernel with respect to input locations.
gaussianKernDiagCompute.m: Compute diagonal of gaussian kernel.
kernDiagGradX.m: Compute the gradient of the  kernel wrt X.
lfmExtractParam.m: Extract the parameters of an LFM model.
ratquadKernCompute.m: Compute the RATQUAD kernel given the parameters and X.
sqexpKernExpandParam.m: Create kernel structure from SQEXP kernel's parameters.
lfmapGradientUpsilonMatrix.m: Gradient upsilon matrix accel. pos.
simXsimKernDiagCompute.m: Diagonal of a cross kernel between two SIM kernels.
rbfwhiteKernDisplay.m: Display parameters of the RBF-WHITE kernel.
ggwhiteKernCompute.m: Compute the GG white kernel given the parameters and X.
whitefixedKernExtractParam.m: Extract parameters from the WHITEFIXED kernel structure.
sqexpKernExtractParam.m: Extract parameters from the SQEXP kernel structure.
kernGetVariance.m: Get the signal associated with a the kernel.
lfmKernExpandParam.m: Create kernel structure from LFM kernel's parameters.
velotransKernExpandParam.m: Create kernel structure from VELOTRANS kernel's parameters.
lfmKernExtractParam.m: Extract parameters from the LFM kernel structure.
polyKernExpandParam.m: Create kernel structure from POLY kernel's parameters.
gaussianKernDiagGradX.m: Gradient of gaussian kernel's diagonal with respect to X.
matern32KernCompute.m: Compute the MATERN32 kernel given the parameters and X.
biasKernGradient.m: Gradient of BIAS kernel's parameters.
lfmComputeH3JP.m: Helper function for computing part of the LFMJP kernel.
rbfinfwhiteKernExpandParam.m: Create kernel structure from RBF-WHITE kernel's
rbfperiodic2KernDisplay.m: Display parameters of the RBFPERIODIC2 kernel.
rbfardKernExtractParam.m: Extract parameters from the RBFARD kernel structure.
gibbsKernCompute.m: Compute the GIBBS kernel given the parameters and X.
velotransKernGradient.m: Gradient of VELOTRANS kernel's parameters.
translateKernGradX.m: Gradient of TRANSLATE kernel with respect to a point x.
gaussianwhiteKernExpandParam.m: Create kernel structure from gaussian white 
rbfperiodic2KernDiagCompute.m: Compute diagonal of RBFPERIODIC2 kernel.
ggwhiteKernParamInit.m: GG WHITE kernel parameter initialisation.
sdlfmKernGradient.m: Gradient of SDLFM kernel's parameters.
ggKernCompute.m: Compute the GG kernel given the parameters and X.
rbfKernParamInit.m: RBF kernel parameter initialisation.
whiteKernGradX.m: Gradient of WHITE kernel with respect to input locations.
rbfard2KernExtractParam.m: Extract parameters from the RBFARD2 kernel structure.
matern32KernExtractParam.m: Extract parameters from the MATERN32 kernel structure.
lfmwhiteKernGradX.m: Gradient of LFM-WHITE kernel with respect to a point t.
lfmKernDisplay.m: Display parameters of the LFM kernel.
sdlfmXsdrbfKernComputeBlock.m: Cross kernel between SDLFM and SDRBF for i,j
rbfperiodic2KernDiagGradX.m: Gradient of RBFPERIODIC2 kernel's diagonal with respect to X.
lfmvKernDiagCompute.m: Compute diagonal of LFMV kernel.
multiKernDiagCompute.m: Compute diagonal of MULTI kernel.
whiteKernDiagGradient.m: Compute the gradient of the WHITE kernel's diagonal wrt parameters.
lfmvvComputeUpsilonDiagVector.m: Upsilon vector vel. vel. with t1 = t2
simKernExpandParam.m: Create kernel structure from SIM kernel's parameters.
lfmUpdateKernels.m: Updates the kernel representations in the LFM structure.
ggwhiteXwhiteKernGradient.m: Compute gradient between the GGWHITE and WHITE kernels.
lfmjaComputeUpsilonMatrix.m: Upsilon matrix jolt. accel. with t1, t2 limits
sdlfmKernExpandParam.m: Pass parameters from params to SDLFM kernel
componentKernWriteParamsToFID.m: Write a component based kernel to a stream.
gaussianwhiteKernDiagGradient.m: Compute the gradient of the gaussian white 
gibbsperiodicKernGradient.m: Gradient of GIBBSPERIODIC kernel's parameters.
rbfinfwhiteXwhiteKernCompute.m: Compute a cross kernel between the RBF-WHITE
lfmGradientSigmaH3VP.m: Gradient of the function h_i(z) with respect \sigma.
whitehKernDiagGradX.m: Gradient of WHITEH kernel's diagonal with respect to X.
dexpKernGradX.m: Gradient of the double exponential kernel with respect to a
gaussianwhiteKernExtractParam.m: Extract parameters from the gaussian white 
heatKernDiagCompute.m: Diagonal of a kernel matrix for a HEAT kernel.
sdlfmaXsdrbfKernGradient.m: Gradients cross kernel between a SDLFM and SDRBF
simwhiteXrbfinfwhiteKernCompute.m: Compute a cross kernel between a SIM-WHITE
linKernDisplay.m: Display parameters of the LIN kernel.
sdlfmaXsdlfmaKernComputeBlock.m: Computes SDLFM kernel matrix for block i,j
lfmComputeH4JA.m: Helper function for computing part of the LFMJA kernel.
dexpKernDisplay.m: Display parameters of the double exponential kernel.
multiKernCacheBlock.m:
rbfard2KernExpandParam.m: Create kernel structure from RBFARD2 kernel's parameters.
simwhiteKernGradient.m: Gradient of SIM-WHITE kernel's parameters.
lfmaaGradientSigmaUpsilonMatrix.m: Gradient of upsilon matrix aa wrt sigma
matern32KernExpandParam.m: Create kernel structure from MATERN32 kernel's parameters.
polyKernParamInit.m: POLY kernel parameter initialisation.
ggwhiteXggwhiteKernCompute.m: Compute a cross kernel between two GG white kernels.
rbfperiodicKernDisplay.m: Display parameters of the RBFPERIODIC kernel.
ggwhiteXwhiteKernCompute.m: Compute a cross kernel between a GG white and
kernParamInit.m: Kernel parameter initialisation.
lfmaXrbfKernCompute.m: Compute cross kernel between the LFMA and RBF kernels.
linardKernExtractParam.m: Extract parameters from the LINARD kernel structure.
ouKernParamInit.m: Ornstein-Uhlenbeck (OU) kernel parameter initialisation.
rbfperiodic2KernCompute.m: Compute the RBFPERIODIC2 kernel given the parameters and X.
whitehKernDiagCompute.m: Compute diagonal of WHITEH kernel.
kernExpandParam.m: Expand parameters to form a kernel structure.
ggXggKernGradient.m: Compute a cross gradient between two GG kernels.
tensorKernExtractParam.m: Extract parameters from the TENSOR kernel structure.
componentKernReadParamsFromFID.m: Read a component based kernel from a C++ file.
lfmjpComputeUpsilonMatrix.m: Upsilon matrix jolt. pos. with t1, t2 limits
lfmXlfmKernCompute.m: Compute a cross kernel between two LFM kernels.
whitehKernExtractParam.m: Extract parameters from the WHITEH kernel structure.
rbfperiodicKernExtractParam.m: Extract parameters from the RBFPERIODIC kernel structure.
mlpKernDisplay.m: Display parameters of the MLP kernel.
lfmaXlfmaKernCompute.m: Acceleration and acceleration LFM kernel  
rbfhKernDiagGradient.m: Gradient of the RBFH kernel's diagonal wrt parameters.
biasKernExpandParam.m: Create kernel structure from BIAS kernel's parameters.
lfmGradientSigmaH3.m: Gradient of the function h_i(z) with respect \sigma.
lfmapGradientSigmaUpsilonMatrix.m: Gradient of upsilon matrix ap wrt sigma
lfmKernCompute.m: Compute the LFM kernel given the parameters and X.
ggKernParamInit.m: GG kernel parameter initialisation.
kernelCenter.m: Attempts to Center Kernel Matrix
lfmaXlfmKernGradient.m: Compute a cross gradient between a LFMA and a LFM.
whiteXwhiteKernGradient.m: Compute a cross gradient between two WHITE kernels.
lfmwhiteComputePsi.m: Helper function for comptuing part of the LFM-WHITE
lfmGradientH42.m: Gradient of the function h_i(z) with respect to some of the
whitefixedXwhitefixedKernCompute.m: Compute a cross kernel between two WHITEFIXED kernels.
simwhiteKernDiagCompute.m: Compute the diagonal of the SIM-WHITE kernel.
rbfinfwhiteKernCompute.m: Compute the RBF-WHITE kernel (with integration limits
fileKernParamInit.m: FILE kernel parameter initialisation.
ouKernCompute.m: Compute the Ornstein-Uhlenbeck (OU) kernel arising from the
lfmaKernDisplay.m: Display parameters of the LFMA kernel.
wienerKernDisplay.m: Display parameters of the WIENER kernel.
ardKernDiagGradient.m: Compute the gradient of the ARD kernel's diagonal wrt parameters.
ouKernDiagGradX.m: Gradient of OU kernel's diagonal with respect to t (see
sdlfmXsdlfmKernGradientIC.m: Computes partial derivative for init. const.
multiKernParamInit.m: MULTI kernel parameter initialisation.
lfmComputeH4AP.m: Helper function for computing part of the LFMAP kernel.
gibbsKernExtractParam.m: Extract parameters from the GIBBS kernel structure.
lfmaXrbfvKernCompute.m: Compute cross kernel between the LFMA and RBFV kernels.
rbfperiodic2KernGradX.m: Gradient of RBFPERIODIC2 kernel with respect to a point x.
whitefixedKernDiagCompute.m: Compute diagonal of WHITEFIXED kernel.
whitefixedKernCompute.m: Compute the WHITEFIXED kernel given the parameters and X.
rbfperiodic2KernGradient.m: Gradient of RBFPERIODIC2 kernel's parameters.
gaussianKernDisplay.m: Display parameters of the GAUSSIAN kernel.
translateKernParamInit.m: TRANSLATE kernel parameter initialisation.
simKernDisplay.m: Display parameters of the SIM kernel.
ouKernDiagCompute.m: Compute diagonal of OU kernel (see ouKernCompute or
dexpKernGradient.m: Gradient of the double exponential kernel's parameters.
sdlfmvXsdlfmKernComputeBlock.m: Computes SDLFM kernel matrix for block i,j
sdlfmvXsdlfmKernGradientBlock.m: Gradients of the parameters in block i,j
lmcKernDiagGradX.m: Gradient of LMC kernel's diagonal with respect to X.
expKernGradX.m: Gradient of EXP kernel with respect to a point x.
kernGradient.m: Compute the gradient wrt the kernel's parameters.
lfmKernGradient.m: Gradient of LFM kernel's parameters.
lfmavGradientSigmaUpsilonMatrix.m: Gradient of upsilon matrix av wrt sigma
lmcKernExpandParam.m: Expands parameters into a LMC kernel structure.
wienerKernGradX.m: Gradient of WIENER kernel with respect to a point x.
whiteXwhiteKernCompute.m: Compute a cross kernel between two WHITE kernels.
lfmGradientSigmaUpsilon.m: Gradient of the function \upsilon(z) with respect
sdlfmXsdrbfKernGradientBlockIEJ.m: 
ggKernDisplay.m: Display parameters of the GG kernel.
lfmwhiteKernDiagGradX.m: Gradient of LFM-WHITE kernel's diagonal w.r.t. t.
sqexpKernDiagGradient.m: Compute the gradient of the SQEXP kernel's diagonal wrt parameters.
noneKernDisplay.m: Display parameters of the NONE kernel.
lfmComputeUpsilon.m: Helper function for comptuing part of the LFM kernel.
linKernExtractParam.m: Extract parameters from the LIN kernel structure.
lfmwhiteKernDiagCompute.m: Compute diagonal of LFM-WHITE kernel.
cmpndKernDiagGradX.m: Gradient of CMPND kernel's diagonal with respect to X.
whiteblockKernCompute.m: Compute the WHITEBLOCK kernel. 
ggwhiteKernDisplay.m: Display parameters of the GG WHITE kernel.
rbfhKernDiagCompute.m: Compute diagonal of RBFH kernel.
gibbsperiodicKernParamInit.m: GIBBSPERIODIC kernel parameter initialisation.
whiteblockKernDiagGradient.m: WHITEBLOCK kernel's diagonal gradient wrt par.
lfmCreate.m: Create a LFM model.
rbfwhiteXwhiteKernGradient.m: Compute gradient between the RBF-WHITE and
sdlfmKernExtractParam.m: Extract parameters from the SDLFM kernel structure.
simwhiteXsimwhiteKernGradient.m: Compute a cross gradient between two
linardKernDiagGradX.m: Gradient of LINARD kernel's diagonal with respect to X.
lfmComputeTest.m: Test the file lfmComputeH.
linard2KernDiagCompute.m: Compute diagonal of LINARD2 kernel.
whitefixedKernDisplay.m: Display parameters of the WHITEFIXED kernel.
lfmaaComputeUpsilonMatrix.m: Upsilon matrix acce. accel. with t1, t2 limits
multiKernExpandParam.m: Create kernel structure from MULTI kernel's parameters.
translateKernExpandParam.m: Create kernel structure from TRANSLATE kernel's parameters.
heatKernCompute.m: Compute a kernel matrix for a HEAT kernel.
lfmvpComputeUpsilonVector.m: Upsilon vector for vel. pos. with t1 limit
kernWriteToFID.m: Load from an FID written by the C++ implementation.
heatKernParamInit.m: HEAT kernel parameter initialisation.
velotransKernParamInit.m: VELOTRANS kernel parameter initialisation.
sdlfmaXsdlfmKernGradientBlock.m: Gradients of the parameters in block i,j
biasKernDisplay.m: Display parameters of the BIASkernel.
lmcKernExtractParam.m: Extract parameters from the LMC kernel struc.
lfmaKernExtractParam.m: Extract parameters from the LFMA kernel structure.
ggXgaussianKernGradX.m: Compute gradient between the GG and GAUSSIAN
velotransKernDiagCompute.m: Compute diagonal of VELOTRANS kernel.
rbfKernDisplay.m: Display parameters of the RBF kernel.
mlpardKernExpandParam.m: Create kernel structure from MLPARD kernel's parameters.
biasKernDiagGradX.m: Gradient of BIAS kernel's diagonal with respect to X.
ggXgaussianKernCompute.m: Compute a cross kernel between the GG and GAUSSIAN kernels.
srbfhKernGradient.m: Gradient of the parameters of a SRBFH kernel.
matern52KernDiagCompute.m: Compute diagonal of MATERN52 kernel.
mlpKernDiagGradX.m: Gradient of MLP kernel's diagonal with respect to X.
gibbsperiodicKernDiagGradient.m: Compute the gradient of the GIBBSPERIODIC kernel's diagonal wrt parameters.
simKernDiagGradX.m: Gradient of SIM kernel's diagonal with respect to the
linardKernExpandParam.m: Create kernel structure from LINARD kernel's parameters.
ggwhiteKernDiagCompute.m: Compute diagonal of GG WHITE kernel.
whiteKernDisplay.m: Display parameters of the WHITE kernel.
cmpndKernCompute.m: Compute the CMPND kernel given the parameters and X.
lfmaKernDiagCompute.m: Compute diagonal of LFMAXLFMA kernel.
kernWriteParamsToFID.m: Write the kernel parameters to a stream.
simwhiteXsimwhiteKernCompute.m: Compute a cross kernel between two SIM-WHITE
lfmvXlfmKernCompute.m: Velocity and position LFM kernel  
ardKernExpandParam.m: Create kernel structure from ARD kernel's parameters.
velotransKernExtractParam.m: Extract parameters from the VELOTRANS kernel structure.
lfmGradientSigmaH4VP.m: Gradient of the function h_i(z) with respect \sigma.
sdlfmaXsdrbfKernCompute.m: Cross kernel between a SDLFMA and a SDRBF kernels.
whitefixedKernParamInit.m: WHITEFIXED kernel parameter initialisation.
matern52KernDiagGradient.m: Compute the gradient of the MATERN52 kernel's diagonal wrt parameters.
linard2KernDisplay.m: Display parameters of the LINARD2 kernel.
linardKernParamInit.m: LINARD kernel parameter initialisation.
mlpardKernDiagCompute.m: Compute diagonal of MLPARD kernel.
sdlfmaMeanGradient.m: Gradients wrt parameters of the accel. mean SDLFM.
biasKernDiagCompute.m: Compute diagonal of BIAS kernel.
ratquadKernExpandParam.m: Create kernel structure from RATQUAD kernel's parameters.
sdrbfKernExpandParam.m: Pass parameters from params to SDRBF kernel
fileKernDisplay.m: Display parameters of the FILE kernel.
whiteKernDiagGradX.m: Gradient of WHITE kernel's diagonal with respect to X.
gaussianwhiteKernDiagCompute.m: Compute diagonal of gaussian white kernel.
lmcKernDiagGradient.m: Gradient of the LMC kernel's diagonal wrt parameters.
lfmGradientSigmaH4AP.m: Gradient of the function h_i(z) with respect \sigma.
ggKernDiagGradient.m: Compute gradient of the diagonal of GG kernel.
simwhiteKernDiagGradX.m: Gradient of SIM-WHITE kernel's diagonal w.r.t. t.
linKernGradient.m: Gradient of LIN kernel's parameters.
matern32KernDiagGradient.m: Compute the gradient of the MATERN32 kernel's diagonal wrt parameters.
rbfinfwhiteKernExtractParam.m: Extract parameters from the RBF-WHITE kernel
gaussianwhiteKernGradient.m: Gradient of gaussian white kernel's parameters.
heatKernDisplay.m: Display parameters of the HEAT kernel.
sheatKernDiagCompute.m: Compute a diagonal for the SHEAT kernel matrix.
rbfXnoneKernCompute.m: Compute a cross kernel between RBF and NONE kernels.
sdrbfKernGradient.m: Gradient of SDRBF kernel's parameters.
disimXrbfKernGradient.m: Compute gradient between the DISIM and RBF kernels.
lfmaKernExpandParam.m: Create kernel structure from LFMA kernel's parameters.
multiKernGradX.m: Gradient of MULTI kernel with respect to a point x.
heatKernExpandParam.m: Create kernel structure from HEAT kernel's parameters.
kernToolboxes.m: Load in the relevant toolboxes for kern.
fileKernCompute.m: Compute the FILE kernel given the parameters and X.
polyKernGradX.m: Gradient of POLY kernel with respect to input locations.
sdlfmaXsdlfmKernCompute.m: Cross kernel between a SDLFMA and a SDLFM kernels.
lfmGradientSigmaH3VV.m: Gradient of the function h_i(z) with respect \sigma.
multiKernCompute.m: Compute the MULTI kernel given the parameters and X.
pskernelGradient.m: Gradient on likelihood approximation for point set IVM.
cmpndKernParamInit.m: CMPND kernel parameter initialisation.
lmcKernGradX.m: Gradient of LMC kernel with respect to input locations.
rbfKernDiagGradX.m: Gradient of RBF kernel's diagonal with respect to X.
mlpardKernExtractParam.m: Extract parameters from the MLPARD kernel structure.
ardKernDiagGradX.m: Gradient of ARD kernel's diagonal with respect to X.
