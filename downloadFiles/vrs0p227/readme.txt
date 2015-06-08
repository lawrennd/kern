KERN software
Version 0.227		Tuesday 09 Aug 2011 at 20:37

Version 0.227
-------------

Added diag covariance which uses the inputs as a diagonal covariance function (takes a one dimensional input only). Useful for having heteroschedastic noise. And index covariance functions which return a value if the two input indices are identical, and zero otherwise. Also includes Jaakko's NDDISIM and NDSIM covariance functions.

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

ggKernExpandParam.m: Create kernel structure from GG kernel's parameters.
translateKernDisplay.m: Display parameters of the TRANSLATE kernel.
sdlfmjMeanCompute.m: Jolt mean for the switching dynamical LFM model.
simKernExtractParam.m: Extract parameters from the SIM kernel structure.
polyardKernDiagCompute.m: Compute diagonal of POLYARD kernel.
kernGradX.m: Compute the gradient of the kernel wrt X.
rbfinfwhiteXrbfinfwhiteKernGradient.m: Compute a cross gradient between two
matern52KernDisplay.m: Display parameters of the MATERN52 kernel.
lfmGradientSigmaH3VP.m: Gradient of the function h_i(z) with respect \sigma.
rbfperiodic2KernDisplay.m: Display parameters of the RBFPERIODIC2 kernel.
rbfardjitKernExtractParam.m: Extract parameters from the RBFARD2 kernel structure.
kernDisplay.m: Display the parameters of the kernel.
whitehKernDiagGradient.m: Compute the gradient of the WHITEH kernel's diagonal wrt parameters.
ardKernExtractParam.m: Extract parameters from the ARD kernel structure.
rbfXnoneKernGradient.m: Compute a cross gradient between RBF and DUMMY
disimXsimKernGradient.m: Compute gradient between the DISIM and SIM kernels.
whiteKernGradient.m: Gradient of white-noise (WHITE) kernel's
lfmaaComputeUpsilonMatrix.m: Upsilon matrix acce. accel. with t1, t2 limits
cmpndKernGradX.m: Gradient of CMPND kernel with respect to a point x.
sdlfmXsdrbfKernCompute.m: Cross kernel between a SDLFM and a SDRBF kernels.
expKernDisplay.m: Display parameters of the EXP kernel.
sdlfmXsdlfmKernGradient.m: Gradients of cross kernel between 2 SDLFM kernels.
ouKernDiagCompute.m: Compute diagonal of OU kernel (see ouKernCompute or
gibbsperiodicKernGradient.m: Gradient of GIBBSPERIODIC kernel's parameters.
lfmExpandParam.m: Expand the given parameters into a LFM structure.
translateKernParamInit.m: TRANSLATE kernel parameter initialisation.
gibbsperiodicKernGradX.m: Gradient of GIBBSPERIODIC kernel with respect to a point x.
whiteKernParamInit.m: WHITE kernel parameter initialisation.
ggwhiteXgaussianwhiteKernCompute.m: Compute a cross kernel between the GG white and GAUSSIAN white kernels.
linKernDisplay.m: Display parameters of the LIN kernel.
lfmKernGradX.m: Gradient of LFM kernel with respect to a point x.
lfmGradientSigmaH3.m: Gradient of the function h_i(z) with respect \sigma.
ndsimKernGradient.m: Gradient of SIM kernel's parameters.
rbfhKernExpandParam.m: Create kernel structure from RBFH kernel's parameters.
sdlfmaXsdlfmKernGradient.m: Gradients of cross kernel between 2 SDLFM kernels.
wienerKernGradX.m: Gradient of WIENER kernel with respect to a point x.
lfmComputeUpsilonDiagVector.m: 
gaussianKernDisplay.m: Display parameters of the GAUSSIAN kernel.
heatKernParamInit.m: HEAT kernel parameter initialisation.
expKernGradX.m: Gradient of EXP kernel with respect to a point x.
lmcKernDisplay.m: Display parameters of the LMC kernel.
expKernGradient.m: Gradient of EXP kernel's parameters.
translateKernCompute.m: Compute the TRANSLATE kernel given the parameters and X.
ouKernGradX.m: Gradient of OU kernel with respect to a point x (see
nddisimKernGradient.m: Gradient of NDDISIM kernel's parameters.
lmcKernParamInit.m: LMC kernel parameter initialisation.
sdlfmXsdrbfKernGradientBlockIEJ.m: 
lmcKernDiagCompute.m: Compute the diagonal of the LMC kernel.
sdlfmvKernGradient.m: Gradient of SDLFM kernel's parameters.
whitefixedKernDiagCompute.m: Compute diagonal of WHITEFIXED kernel.
ggKernGradient.m: Gradient of GG kernel's parameters.
kernExpandParam.m: Expand parameters to form a kernel structure.
heatXheatKernCompute.m: Compute a cross kernel between two HEAT kernels.
kernDiagGradX.m: Compute the gradient of the  kernel wrt X.
lfmKernCompute.m: Compute the LFM kernel given the parameters and X.
kernReadFromFID.m: Load from an FID written by the C++ implementation.
whiteKernCompute.m: Compute the white-noise (WHITE) kernel between
sdlfmvXsdlfmKernGradientICBlock.m: Partial derivatives initial conditions
rbfKernGradX.m: Gradient of RBF kernel with respect to input locations.
ouKernDiagGradX.m: Gradient of OU kernel's diagonal with respect to t (see
indexKernCompute.m: Compute the INDEX kernel given the parameters and X.
wienerKernExpandParam.m: Create kernel structure from WIENER kernel's parameters.
kernPriorLogProb.m: Compute penalty terms associated with kernel priors.
lfmvXrbfKernCompute.m: Compute a cross kernel between the LFMV and RBF kernels.
noneKernExpandParam.m: Create kernel structure from NONE kernel's parameters.
rbfardjitKernExpandParam.m: Create kernel structure from RBFARDJIT kernel's parameters.
lfmvpComputeUpsilonDiagVector.m: Upsilon diag vector vel. pos. with t1, t2 limits
sheatKernCompute.m: Compute a cross kernel between two SHEAT kernels.
mlpardKernGradient.m: Gradient of MLPARD kernel's parameters.
sdlfmaXsdlfmaKernGradientBlockIGJ.m: 
nddisimXndsimKernGradient.m: Compute a cross gradient between NDDISIM and NDSIM
whitehKernDiagCompute.m: Compute diagonal of WHITEH kernel.
whiteKernExpandParam.m: Create kernel structure from WHITE kernel's parameters.
disimKernParamInit.m: DISIM kernel parameter initialisation.
matern52KernDiagGradX.m: Gradient of MATERN52 kernel's diagonal with respect to X.
simKernExpandParam.m: Create kernel structure from SIM kernel's parameters.
sqexpKernParamInit.m: SQEXP kernel parameter initialisation.
wienerKernParamInit.m: WIENER kernel parameter initialisation.
lfmaXlfmaKernCompute.m: Acceleration and acceleration LFM kernel  
getLocalGradAlphaOmega.m: Gradients of parameters in alpha and omega
disimXdisimKernGradient.m: Compute a cross gradient between two DISIM kernels.
linardKernCompute.m: Compute the LINARD kernel given the parameters and X.
sdlfmaXsdlfmvKernCompute.m: Cross kernel between a SDLFMA and a SDLFMV kernels.
sheatKernGradient.m: Gradient of the parameters of a SHEAT kernel.
gibbsKernDisplay.m: Display parameters of the GIBBS kernel.
ratquadKernExpandParam.m: Create kernel structure from RATQUAD kernel's parameters.
sqexpKernCompute.m: Compute the SQEXP kernel given the parameters and X.
rbfinfwhiteXwhiteKernGradient.m: Compute gradient between the RBF-WHITE kernel
gibbsperiodicKernDiagCompute.m: Compute diagonal of GIBBSPERIODIC kernel.
sdlfmXsdrbfKernComputeBlock.m: Cross kernel between SDLFM and SDRBF for i,j
simKernDiagGradX.m: Gradient of SIM kernel's diagonal with respect to the
cmpndKernDiagGradient.m: Compute the gradient of the CMPND kernel's diagonal wrt parameters.
lfmaXrbfKernGradient.m: Compute gradient between the LFMA and RBF kernels.
velotransKernGradient.m: Gradient of VELOTRANS kernel's parameters.
expKernParamInit.m: EXP kernel parameter initialisation.
ggXgaussianKernGradient.m: Compute gradient between the GG and GAUSSIAN kernels.
polyardKernGradient.m: Gradient of POLYARD kernel's parameters.
rbfwhiteKernDiagGradX.m: Gradient of RBF-WHITE kernel's diagonal w.r.t. t.
lfmComputeH3AP.m: Helper function for computing part of the LFMAP kernel.
indexKernGradient.m: Gradient of INDEX kernel's parameters.
dexpKernGradX.m: Gradient of the double exponential kernel with respect to a
whiteblockKernGradX.m: Gradient of WHITEBLOCK kernel wrt input locations.
lfmSample.m: Sample from LFM kernel
kernExtractParam.m: Extract parameters from kernel structure.
lfmGradientSigmaUpsilon.m: Gradient of the function \upsilon(z) with respect
kernCorrelation.m: Compute the correlation matrix kernel given the parameters and X.
diagKernParamInit.m: DIAG kernel parameter initialisation.
linKernDiagCompute.m: Compute diagonal of LIN kernel.
matern32KernDiagCompute.m: Compute diagonal of MATERN32 kernel.
sdlfmaXsdlfmaKernComputeBlock.m: Computes SDLFM kernel matrix for block i,j
sdlfmXsdlfmvKernGradientICBlock.m: Partial derivatives initial conditions
heatKernExpandParam.m: Create kernel structure from HEAT kernel's parameters.
rbfperiodicKernDiagGradient.m: Compute the gradient of the RBFPERIODIC kernel's diagonal wrt parameters.
matern52KernDiagCompute.m: Compute diagonal of MATERN52 kernel.
ggwhiteXggwhiteKernGradient.m: Compute a cross gradient between two GG WHITE kernels.
biasKernGradX.m: Gradient of BIAS kernel with respect to input locations.
lfmaaComputeUpsilonDiagVector.m: Diag. of Upsilon matrix acce. accel. 
simwhiteKernParamInit.m: SIM-WHITE kernel parameter initialisation.
rbfKernExpandParam.m: Create kernel structure from RBF kernel's parameters.
mlpardKernDiagGradX.m: Gradient of MLPARD kernel's diagonal with respect to X.
gibbsKernParamInit.m: GIBBS kernel parameter initialisation.
rbfardjitKernDiagCompute.m: Compute diagonal of RBFARDJIT kernel.
sdlfmvXsdlfmKernComputeBlock.m: Computes SDLFM kernel matrix for block i,j
rbfKernParamInit.m: RBF kernel parameter initialisation.
fileKernParamInit.m: FILE kernel parameter initialisation.
linardKernGradX.m: Gradient of LINARD kernel with respect to input locations.
rbfKernGradient.m: Gradient of RBF kernel's parameters.
sdlfmKernExpandParam.m: Pass parameters from params to SDLFM kernel
velotransKernExpandParam.m: Create kernel structure from VELOTRANS kernel's parameters.
gaussianwhiteKernExpandParam.m: Create kernel structure from gaussian white 
ggwhiteKernParamInit.m: GG WHITE kernel parameter initialisation.
ratquadKernDiagGradient.m: Compute the gradient of the RATQUAD kernel's diagonal wrt parameters.
lfmaXlfmKernCompute.m: Acceleration and position LFM kernel  
whiteblockKernDiagGradient.m: WHITEBLOCK kernel's diagonal gradient wrt par.
lfmjXlfmKernCompute.m: Jolt and position LFM kernel  
simwhiteKernDiagGradX.m: Gradient of SIM-WHITE kernel's diagonal w.r.t. t.
rbfhKernDisplay.m: Display parameters of the RBFH kernel.
lfmComputeH3AV.m: Helper function for computing part of the LFMAV kernel.
gaussianKernExpandParam.m: Create kernel structure from gaussian kernel's parameters.
matern52KernExtractParam.m: Extract parameters from the MATERN52 kernel structure.
lfmComputeH4.m: Helper function for computing part of the LFM kernel.
rbfKernDisplay.m: Display parameters of the RBF kernel.
ggwhiteXwhiteKernCompute.m: Compute a cross kernel between a GG white and
rbfinfwhiteXwhiteKernCompute.m: Compute a cross kernel between the RBF-WHITE
linard2KernGradX.m: Gradient of LINARD2 kernel with respect to input locations.
sqexpKernDiagGradX.m: Gradient of SQEXP kernel's diagonal with respect to X.
rbfardjitKernCompute.m: Compute the RBFARD kernel given the parameters and X.
tensorKernDisplay.m: Display parameters of the TENSOR kernel.
lfmwhiteComputeH.m: Helper function for computing part of the LFM-WHITE
simwhiteXrbfwhiteKernCompute.m: Compute a cross kernel between a SIM-WHITE
lfmKernExtractParam.m: Extract parameters from the LFM kernel structure.
lfmCreate.m: Create a LFM model.
ggXgaussianKernCompute.m: Compute a cross kernel between the GG and GAUSSIAN kernels.
multiKernFixBlocks.m:
linardKernExpandParam.m: Create kernel structure from LINARD kernel's parameters.
rbfhKernParamInit.m: RBFH kernel parameter initialisation.
disimXdisimKernCompute.m: Compute a cross kernel between two DISIM kernels.
nddisimKernExpandParam.m: Create kernel structure from NDDISIM kernel's parameters.
lfmvKernDisplay.m: Display parameters of the LFMV kernel.
gaussianKernExtractParam.m: Extract parameters from the gaussian kernel structure.
biasKernDisplay.m: Display parameters of the BIASkernel.
ratquadKernCompute.m: Compute the RATQUAD kernel given the parameters and X.
kernParamInit.m: Kernel parameter initialisation.
tensorKernCompute.m: Compute the TENSOR kernel given the parameters and X.
disimXsimKernCompute.m: Compute a cross kernel between DISIM and SIM kernels.
lfmGradientSigmaH3AP.m: Gradient of the function h_i(z) with respect \sigma.
matern32KernParamInit.m: MATERN32 kernel parameter initialisation.
lfmGradientSigmaH.m: Gradient of the function h_i(z) with respect \sigma.
matern52KernCompute.m: Compute the MATERN52 kernel given the parameters and X.
gibbsperiodicKernParamInit.m: GIBBSPERIODIC kernel parameter initialisation.
lfmGradientSigmaH3VV.m: Gradient of the function h_i(z) with respect \sigma.
ggKernExtractParam.m: Extract parameters from the GG kernel structure.
lfmXrbfKernGradient.m: Compute gradient between the LFM and RBF kernels.
simKernCompute.m: Compute the SIM kernel given the parameters and X.
mlpKernDiagGradX.m: Gradient of MLP kernel's diagonal with respect to X.
whiteKernDiagGradX.m: Gradient of WHITE kernel's diagonal with respect to X.
rbfardKernExtractParam.m: Extract parameters from the RBFARD kernel structure.
cmpndKernDiagCompute.m: Compute diagonal of CMPND kernel.
lfmvKernParamInit.m: LFMV kernel parameter initialisation. 
dexpKernExtractParam.m: Extract parameters from the double exponential's
lfmaXlfmKernGradient.m: Compute a cross gradient between a LFMA and a LFM.
lmcKernGradient.m: Gradient of LMC kernel's parameters.
lfmLogLikelihood.m: Compute the log likelihood of a LFM model.
srbfhKernCompute.m: Compute an SRBFH kernel.
simKernGradX.m: Gradient of SIM kernel with respect to each time point in t1.
indexardKernExpandParam.m: Create kernel structure from INDEXARD kernel's parameters.
expKernDiagCompute.m: Compute diagonal of EXP kernel.
whiteKernDiagGradient.m: Compute the gradient of the WHITE kernel's diagonal wrt parameters.
kernSetWhite.m: Helper function to set the white noise in a kernel if it exists.
multiKernExtractParam.m: Extract parameters from the MULTI kernel structure.
expKernExpandParam.m: Create kernel structure from EXP kernel's parameters.
whiteKernDiagCompute.m: Compute diagonal of WHITE kernel.
diagKernGradX.m: Gradient of DIAG kernel with respect to a point x.
ggwhiteKernGradient.m: Gradient of GG WHITE kernel's parameters.
gaussianwhiteKernParamInit.m: Gaussian white kernel parameter initialisation.
disimKernExtractParam.m: Extract parameters from the DISIM kernel structure.
expKernExtractParam.m: Extract parameters from the EXP kernel structure.
sdlfmvKernExpandParam.m: Pass parameters from params to SDLFMV kernel
rbfinfwhiteKernGradient.m: Gradient of the parameters of the RBF-WHITE kernel
indexardKernCompute.m: Compute the INDEXARD kernel given the parameters and X.
sdlfmvXsdlfmKernGradient.m: Gradients of cross kernel between 2 SDLFM kernels.
tensorKernExtractParam.m: Extract parameters from the TENSOR kernel structure.
kernFactors.m: Extract factors associated with transformed
multiKernTest.m: Run some tests on the multiple output block kernel.
lfmvvGradientUpsilonMatrix.m: Gradient upsilon matrix vel. vel.
mlpKernParamInit.m: MLP kernel parameter initialisation.
matern32KernGradX.m: Gradient of MATERN32 kernel with respect to input locations.
heatKernDiagCompute.m: Diagonal of a kernel matrix for a HEAT kernel.
lfmwhiteXlfmwhiteKernGradient.m: Compute a cross gradient between two
heatKernDiagGradient.m: Gradient of the HEAT kernel's diagonal wrt parameters.
sdlfmvKernDiagComputeBlock.m: Diagonal of a SDLFM kernel matrix for block i
lfmGradientH42VP.m: Gradient of the function h_i(z) with respect to some of the
rbfperiodicKernCompute.m: Compute the RBFPERIODIC kernel given the parameters and X.
polyKernCompute.m: Compute the POLY kernel given the parameters and X.
whiteXwhiteKernCompute.m: Compute a cross kernel between two WHITE kernels.
dexpKernCompute.m: Compute the double exponential kernel,
rbfwhiteKernExtractParam.m: Extract parameters from the RBF-WHITE kernel
simComputeTest.m: Test the file simComputeH.
simwhiteKernDisplay.m: Display parameters of the SIM-WHITE kernel.
gaussianwhiteKernGradX.m: Gradient of gaussian white kernel with respect 
gaussianwhiteKernDisplay.m: Display parameters of the GAUSSIAN white kernel.
whitehKernParamInit.m: WHITEH kernel parameter initialisation.
rbfard2KernDisplay.m: Display parameters of the RBFARD2 kernel.
sqexpKernDiagCompute.m: Compute diagonal of SQEXP kernel.
gibbsKernGradient.m: Gradient of GIBBS kernel's parameters.
lfmComputeH4JP.m: Helper function for computing part of the LFMJP kernel.
simwhiteXsimwhiteKernCompute.m: Compute a cross kernel between two SIM-WHITE
disimKernDiagGradX.m: Gradient of DISIM kernel's diagonal with respect to X.
tensorKernGradient.m: Gradient of TENSOR kernel's parameters.
linard2KernParamInit.m: LINARD2 kernel parameter initialisation.
rbfardKernDiagCompute.m: Compute diagonal of RBFARD kernel.
lfmvXrbfvKernCompute.m: Compute a cross kernel between the LFMV and RBFV kernels.
lfmjXlfmvKernCompute.m: Jolt and velocity LFM kernel  
sdlfmvKernCompute.m: Compute the SDLFMV kernel given the parameters and X.
multiKernDisplay.m: Display parameters of the MULTI kernel.
whiteKernGradX.m: Gradient of WHITE kernel with respect to input locations.
rbfperiodicKernGradient.m: Gradient of RBFPERIODIC kernel's parameters.
translateKernExtractParam.m: Extract parameters from the TRANSLATE kernel structure.
indexardKernDiagCompute.m: Compute diagonal of INDEXARD kernel.
sdlfmvKernDisplay.m: Display parameters of the SDLFMV kernel.
simwhiteKernCompute.m: Compute the SIM-WHITE kernel given the parameters, t1
ggKernDiagCompute.m: Compute diagonal of GG kernel.
lfmvpGradientUpsilonVector.m: Gradient upsilon vector vel. pos.
whiteblockKernDisplay.m: Display parameters of the WHITEBLOCK kernel.
ggKernDisplay.m: Display parameters of the GG kernel.
lfmGradientH42AP.m: Gradient of the function h_i(z) with respect to some of the
ggwhiteKernExpandParam.m: Create kernel structure from GG white kernel's parameters.
noneKernExtractParam.m: Extract parameters from the NONE kernel structure.
linKernGradient.m: Gradient of LIN kernel's parameters.
rbfinfwhiteKernExtractParam.m: Extract parameters from the RBF-WHITE kernel
mlpKernExtractParam.m: Extract parameters from the MLP kernel structure.
diagKernGradient.m: Gradient of DIAG kernel's parameters.
polyardKernExtractParam.m: Extract parameters from the POLYARD kernel structure.
lfmLogLikeGradients.m: Compute the gradients of the log likelihood of a LFM model.
lfmvpComputeUpsilonVector.m: Upsilon vector for vel. pos. with t1 limit
sdlfmXsdlfmKernGradientBlockILJ.m: 
rbfperiodicKernExpandParam.m: Create kernel structure from RBFPERIODIC kernel's parameters.
simwhiteXrbfinfwhiteKernGradient.m: Compute a cross gradient between a
gibbsKernDiagGradX.m: Gradient of GIBBS kernel's diagonal with respect to X.
sdlfmaXsdrbfKernGradientBlock.m: Gradients of the parameters in block i,j
dexpKernDiagGradX.m: Gradient of the double exponential kernel's diagonal
cmpndKernExpandParamTransformSettings.m: Create kernel structure from CMPND kernel's parameter transformation settings.
sdlfmKernExtractParam.m: Extract parameters from the SDLFM kernel structure.
gaussianKernGradX.m: Gradient of gaussian kernel with respect to input locations.
linardKernDisplay.m: Display parameters of the LINARD kernel.
lfmaXlfmvKernGradient.m: Compute a cross gradient between a LFMA and a LFMV.
lfmvpGradientUpsilonMatrix.m: Gradient upsilon matrix vel. pos.
lfmvpGradientSigmaUpsilonMatrix.m: Gradient of upsilon matrix vp wrt sigma
simComputeH.m: Helper function for comptuing part of the SIM kernel.
ardKernExpandParam.m: Create kernel structure from ARD kernel's parameters.
simwhiteXsimwhiteKernGradient.m: Compute a cross gradient between two
rbfinfwhiteKernExpandParam.m: Create kernel structure from RBF-WHITE kernel's
dexpKernParamInit.m: The double exponential kernel is usually called
kernToolboxes.m: Load in the relevant toolboxes for kern.
linKernCompute.m: Compute the LIN kernel given the parameters and X.
lmcKernCompute.m: Compute the LMC kernel given the parameters and X.
fileKernExpandParam.m: Create kernel structure from FILE kernel's parameters.
rbfwhiteKernDiagCompute.m: Compute diagonal of RBF-WHITE kernel.
multiKernDiagGradX.m: Gradient of MULTI kernel's diagonal with respect to X.
ggXggKernGradient.m: Compute a cross gradient between two GG kernels.
kernPriorGradient.m: Compute gradient terms associated with kernel priors.
lfmwhiteXlfmwhiteKernCompute.m: Compute a cross kernel between two LFM-WHITE
gibbsKernExpandParam.m: Create kernel structure from GIBBS kernel's parameters.
rbfKernDiagCompute.m: Compute diagonal of RBF kernel.
lfmaXlfmaKernGradient.m: Compute a cross gradient between a LFMA and a LFMA.
sdlfmXsdlfmKernGradientBlockIEJ.m: 
simwhiteKernGradX.m: Gradient of SIM-WHITE kernel with respect to a point t.
lfmvKernDiagCompute.m: Compute diagonal of LFMV kernel.
noneKernDiagGradX.m: Gradient of NONE kernel's diagonal with respect to X.
lfmComputeH3.m: Helper function for computing part of the LFM kernel.
simXsimComputeDiagH.m: Helper function for comptuing part of the SIM kernel.
indexardKernParamInit.m: INDEXARD kernel parameter initialisation.
rbfinfwhiteKernDisplay.m: Display parameters of the RBF-WHITE kernel (with
mlpKernDiagCompute.m: Compute diagonal of MLP kernel.
ndsimKernExpandParamTransformSettings.m: Create kernel structure from SIM kernel's parameters' transform settings.
wienerKernGradient.m: Gradient of WIENER kernel's parameters.
lfmComputeH3JV.m: Helper function for computing part of the LFMJV kernel.
rbfardjitKernDisplay.m: Display parameters of the RBFARDJIT kernel.
rbfard2KernDiagGradX.m: Gradient of RBFARD2 kernel's diagonal with respect to X.
rbfperiodic2KernGradX.m: Gradient of RBFPERIODIC2 kernel with respect to a point x.
multiKernGradX.m: Gradient of MULTI kernel with respect to a point x.
lfmXlfmKernCompute.m: Compute a cross kernel between two LFM kernels.
ggKernCompute.m: Compute the GG kernel given the parameters and X.
noneKernParamInit.m: NONE kernel parameter initialisation.  
whitehKernExtractParam.m: Extract parameters from the WHITEH kernel structure.
noneKernDisplay.m: Display parameters of the NONE kernel.
sparseKernDisplay.m: Display parameters of the SPARSE kernel.
indexKernExpandParam.m: Create kernel structure from INDEX kernel's parameters.
rbfwhiteKernCompute.m: Compute the RBF-WHITE kernel given the parameters, t1
multiKernDiagCompute.m: Compute diagonal of MULTI kernel.
sdlfmXsdrbfKernGradientBlock.m: Gradients of the parameters in block i,j
sdlfmXsdlfmKernComputeBlock.m: Computes SDLFM kernel matrix for block i,j
gibbsKernExtractParam.m: Extract parameters from the GIBBS kernel structure.
rbfinfwhiteXrbfinfwhiteKernCompute.m: Compute a cross kernel between two
whitefixedKernExtractParam.m: Extract parameters from the WHITEFIXED kernel structure.
lfmapGradientUpsilonMatrix.m: Gradient upsilon matrix accel. pos.
ardKernDiagGradX.m: Gradient of ARD kernel's diagonal with respect to X.
polyardKernParamInit.m: POLYARD kernel parameter initialisation.
cmpndKernGradient.m: Gradient of CMPND kernel's parameters.
rbfperiodic2KernGradient.m: Gradient of RBFPERIODIC2 kernel's parameters.
ouKernGradient.m: Gradient of OU kernel's parameters (see ouKernCompute or
tensorKernSetIndex.m: Set the indices in the tensor kernel.
lfmGradientSigmaH3AV.m: Gradient of the function h_i(z) with respect \sigma.
sqexpKernGradX.m: Gradient of SQEXP kernel with respect to a point x.
matern52KernParamInit.m: MATERN52 kernel parameter initialisation.
lfmwhiteKernDisplay.m: Display parameters of the LFM-WHITE kernel.
matern32KernDiagGradX.m: Gradient of MATERN32 kernel's diagonal with respect to X.
cmpndKernCompute.m: Compute the CMPND kernel given the parameters and X.
lmcKernDiagGradX.m: Gradient of LMC kernel's diagonal with respect to X.
gaussianKernGradient.m: Gradient of gaussian kernel's parameters.
ouKernExpandParam.m: Create kernel structure from OU kernel's parameters
heatXheatKernGradient.m: Gradient wrt parameters between two HEAT kernels.
diagKernExtractParam.m: Extract parameters from the DIAG kernel structure.
sdlfmvXsdrbfKernGradientBlock.m: Gradients of the parameters in block i,j
expKernCompute.m: Compute the EXP kernel given the parameters and X.
velotransKernDiagCompute.m: Compute diagonal of VELOTRANS kernel.
wienerKernDisplay.m: Display parameters of the WIENER kernel.
gibbsKernDiagGradient.m: Compute the gradient of the GIBBS kernel's diagonal wrt parameters.
diagKernDiagCompute.m: Compute diagonal of DIAG kernel.
lfmKernGradient.m: Gradient of LFM kernel's parameters.
kernWriteParamsToFID.m: Write the kernel parameters to a stream.
whiteXnoneKernCompute.m: Compute a cross kernel between WHITE and NONE kernels.
mlpardKernParamInit.m: MLPARD kernel parameter initialisation.
polyKernExpandParam.m: Create kernel structure from POLY kernel's parameters.
lmcKernDiagGradient.m: Gradient of the LMC kernel's diagonal wrt parameters.
rbfwhiteXwhiteKernGradient.m: Compute gradient between the RBF-WHITE and
rbfardjitKernDiagGradX.m: Gradient of RBFARDJIT kernel's diagonal with respect to X.
whitefixedKernDisplay.m: Display parameters of the WHITEFIXED kernel.
heatKernCompute.m: Compute a kernel matrix for a HEAT kernel.
biasKernDiagCompute.m: Compute diagonal of BIAS kernel.
noneKernDiagCompute.m: Compute diagonal of NONE kernel.
indexardKernDisplay.m: Display parameters of the INDEXARD kernel.
rbfard2KernDiagGradient.m: Compute the gradient of the RBFARD2 kernel's diagonal wrt parameters.
lfmKernDiagGradX.m: Gradient of LFM kernel's diagonal with respect to X.
gibbsKernDiagCompute.m: Compute diagonal of GIBBS kernel.
lfmavGradientSigmaUpsilonMatrix.m: Gradient of upsilon matrix av wrt sigma
kernReadParamsFromFID.m: Read the kernel parameters from C++ file FID.
lfmKernDisplay.m: Display parameters of the LFM kernel.
sdlfmKernMeanCovPartial.m: Helper function for derivatives in SDLFM kernel
pskernelObjective.m: Likelihood approximation for point set IVM.
lfmGradientUpsilon.m: Gradient of the function \upsilon(z) with respect to
whitefixedXwhitefixedKernGradient.m: Compute a cross gradient between two WHITEFIXED kernels.
indexardKernGradient.m: Gradient of INDEXARD kernel's parameters.
indexKernDiagCompute.m: Compute diagonal of INDEX kernel.
sdlfmaXsdrbfKernGradient.m: Gradients cross kernel between a SDLFM and SDRBF
sdlfmvXsdlfmvKernGradientICBlock.m: Partial derivatives initial conditions
sdlfmvXsdlfmvKernGradient.m: Gradients of cross kernel between 2 SDLFM kernels.
matern32KernExtractParam.m: Extract parameters from the MATERN32 kernel structure.
lfmwhiteKernGradX.m: Gradient of LFM-WHITE kernel with respect to a point t.
heatXrbfhKernGradient.m: Gradient wrt parameters between a HEAT and a RBFH.
rbfperiodicKernGradX.m: Gradient of RBFPERIODIC kernel with respect to a point x.
sdlfmKernGradientConstant.m: Gradients for constants for the SDLFM kernel
sdlfmvXsdlfmvKernGradientBlock.m: Gradients of the parameters in block i,j
lfmwhiteXwhiteKernCompute.m: Compute a cross kernel between the LFM-WHITE
polyardKernDisplay.m: Display parameters of the POLYARD kernel.
lfmwhiteXwhiteKernGradient.m: Compute gradient between the LFM-WHITE and
kernelCenter.m: Attempts to Center Kernel Matrix
sqexpKernDiagGradient.m: Compute the gradient of the SQEXP kernel's diagonal wrt parameters.
whitehKernExpandParam.m: Create kernel structure from WHITEH kernel's parameters.
lfmwhiteKernDiagCompute.m: Compute diagonal of LFM-WHITE kernel.
biasKernDiagGradX.m: Gradient of BIAS kernel's diagonal with respect to X.
ggKernDiagGradient.m: Compute gradient of the diagonal of GG kernel.
sdlfmaXsdlfmKernComputeBlock.m: Computes SDLFM kernel matrix for block i,j
ouKernParamInit.m: Ornstein-Uhlenbeck (OU) kernel parameter initialisation.
rbfperiodicKernParamInit.m: RBFPERIODIC kernel parameter initialisation.
lfmaXlfmvKernCompute.m: Acceleration and velocity LFM kernel  
ratquadKernDiagCompute.m: Compute diagonal of RATQUAD kernel.
lfmComputeUpsilon.m: Helper function for comptuing part of the LFM kernel.
sdlfmvKernDiagCompute.m: Compute diagonal of a SDLFMV kernel.
sdlfmaXsdlfmaKernGradientBlock.m: Gradients of the parameters in block i,j
gibbsperiodicKernDiagGradX.m: Gradient of GIBBSPERIODIC kernel's diagonal with respect to X.
kernDiagCompute.m: Compute the kernel given the parameters and X.
lfmaXrbfvKernCompute.m: Compute cross kernel between the LFMA and RBFV kernels.
cmpndKernParamInit.m: CMPND kernel parameter initialisation.
simXsimKernGradient.m: Compute a cross gradient between two SIM kernels.
disimXrbfKernGradient.m: Compute gradient between the DISIM and RBF kernels.
whiteblockKernExpandParam.m: Fill WHITEBLOCK kernel structure with params.
whitefixedKernGradient.m: Gradient of WHITEFIXED kernel's parameters.
lfmjXlfmaKernCompute.m: Jolt and acceleration LFM kernel  
polyKernExtractParam.m: Extract parameters from the POLY kernel structure.
sdlfmKernGradient.m: Gradient of SDLFM kernel's parameters.
wienerKernExtractParam.m: Extract parameters from the WIENER kernel structure.
ratquadKernGradX.m: Gradient of RATQUAD kernel with respect to input locations.
gibbsKernGradX.m: Gradient of GIBBS kernel with respect to input locations.
linard2KernDiagCompute.m: Compute diagonal of LINARD2 kernel.
lfmGradientSigmaH4VP.m: Gradient of the function h_i(z) with respect \sigma.
componentKernReadParamsFromFID.m: Read a component based kernel from a C++ file.
fileKernGradX.m: Gradient of FILE kernel with respect to a point x.
rbfhKernCompute.m: Compute the RBFH kernel given the parameters and X.
whitefixedKernParamInit.m: WHITEFIXED kernel parameter initialisation.
disimKernCompute.m: Compute the DISIM kernel given the parameters and X.
whitefixedKernDiagGradX.m: Gradient of WHITEFIXED kernel's diagonal with respect to X.
gibbsperiodicKernDiagGradient.m: Compute the gradient of the GIBBSPERIODIC kernel's diagonal wrt parameters.
lfmaKernParamInit.m: LFMA kernel parameter initialisation. 
lfmGradientSigmaH4VV.m: Gradient of the function h_i(z) with respect \sigma.
gibbsperiodicKernDisplay.m: Display parameters of the GIBBSPERIODIC kernel.
lfmComputeH3VV.m: Helper function for computing part of the LFMVXLFMV kernel.
linKernExtractParam.m: Extract parameters from the LIN kernel structure.
rbfperiodicKernDiagCompute.m: Compute diagonal of RBFPERIODIC kernel.
lfmvvGradientSigmaUpsilonMatrix.m: Gradient of upsilon matrix vv wrt sigma
whiteKernExpandParamTransformSettings.m: Create kernel structure from WHITE kernel's
sdlfmaXsdlfmKernCompute.m: Cross kernel between a SDLFMA and a SDLFM kernels.
lfmapComputeUpsilonVector.m: Upsilon vector for acce. pos. with t1 limit
disimKernExpandParam.m: Create kernel structure from DISIM kernel's parameters.
linard2KernExtractParam.m: Extract parameters from the LINARD2 kernel structure.
simXsimComputeDiagHStat.m: Helper function for computing part of the stationary version
nddisimKernExpandParamTransformSettings.m: Create kernel structure from DISIM kernel's parameters.
lfmapComputeUpsilonMatrix.m: Upsilon matrix acce. pos. with t1, t2 limits
rbfinfwhiteKernParamInit.m: The RBF-WHITE-INF kernel is a convolutional
translateKernDiagCompute.m: Compute diagonal of TRANSLATE kernel.
sdlfmaXsdlfmKernGradientBlock.m: Gradients of the parameters in block i,j
rbfard2KernDiagCompute.m: Compute diagonal of RBFARD2 kernel.
sdrbfKernCompute.m: Compute the SDRBF kernel given the parameters and t1.
lfmComputeH3JA.m: Helper function for computing part of the LFMJA kernel.
lfmwhiteKernCompute.m: Compute the LFM-WHITE kernel given the parameters, t1
multiKernComputeBlock.m:
multiKernCacheBlock.m:
sdlfmaXsdlfmKernGradientBlockIEJ.m: 
ggwhiteKernExtractParam.m: Extract parameters from the GG WHITE kernel structure.
polyKernDiagCompute.m: Compute diagonal of POLY kernel.
polyKernParamInit.m: POLY kernel parameter initialisation.
rbfhKernExtractParam.m: Extract parameters from the RBFH kernel structure.
indexKernParamInit.m: INDEX kernel parameter initialisation.
lfmaKernCompute.m: Compute the LFMA kernel given the parameters and X.
heatXrbfhKernCompute.m: Cross kernel between a HEAT and a RBF kernels.
lfmaKernExpandParam.m: Create kernel structure from LFMA kernel's parameters.
tensorKernDiagCompute.m: Compute diagonal of TENSOR kernel.
polyKernGradient.m: Gradient of POLY kernel's parameters.
whiteblockKernGradient.m: Gradient of WHITEBLOCK kernel's parameters.
sdlfmaXsdlfmvKernComputeBlock.m: Computes SDLFM kernel matrix for block i,j
matern32KernExpandParam.m: Create kernel structure from MATERN32 kernel's parameters.
lfmvKernExtractParam.m: Extract parameters from the LFMV kernel structure.
whiteblockKernDiagGradX.m: Gradient of WHITEBLOCK kernel's diagonal wrt X.
whitefixedKernDiagGradient.m: Compute the gradient of the WHITEFIXED kernel's diagonal wrt parameters.
rbfard2KernCompute.m: Compute the RBFARD kernel given the parameters and X.
lfmvXlfmvKernGradient.m: Compute a cross gradient between a LFMV and a LFMV.
disimComputeH.m: Helper function for comptuing part of the DISIM kernel.
multiKernExpandParamTransformSettings.m: Create kernel structure from MULTI kernel's parameter transformation settings.
fileKernRead.m: Read kernel values from file or cache.
matern52KernExpandParam.m: Create kernel structure from MATERN52 kernel's parameters.
rbfKernCompute.m: Compute the RBF kernel given the parameters and X.
ardKernParamInit.m: ARD kernel parameter initialisation.
whiteKernExtractParam.m: Extract parameters from the WHITE kernel structure.
disimKernGradient.m: Gradient of DISIM kernel's parameters.
rbfperiodic2KernExpandParam.m: Create kernel structure from RBFPERIODIC2 kernel's parameters.
whitehKernGradient.m: Gradient of WHITEH kernel's parameters.
rbfhKernDiagGradient.m: Gradient of the RBFH kernel's diagonal wrt parameters.
mlpardKernGradX.m: Gradient of MLPARD kernel with respect to input locations.
sdlfmXsdlfmvKernGradientBlock.m: Gradients of the parameters in block i,j
cmpndKernSetIndex.m: Set the indices in the compound kernel.
noneKernCompute.m: Compute the NONE kernel given the parameters and X.
sdlfmXsdlfmvKernGradientBlockIGJ.m: 
whiteKernDisplay.m: Display parameters of the WHITE kernel.
lfmwhiteComputeGradThetaH1.m: computes a portion of the LFM-WHITE kernel's gradient w.r.t. theta.
whiteblockKernExtractParam.m: Extract parameters from WHITEBLOCK kernel str.
rbfwhiteKernDisplay.m: Display parameters of the RBF-WHITE kernel.
sdlfmvXsdlfmKernGradientBlock.m: Gradients of the parameters in block i,j
linardKernDiagGradX.m: Gradient of LINARD kernel's diagonal with respect to X.
gaussianKernParamInit.m: Gaussian kernel parameter initialisation.
lfmjvComputeUpsilonMatrix.m: Upsilon matrix jolt. vel. with t1, t2 limits
lfmXrbfvKernCompute.m: Compute a cross kernel between the LFM and RBFV kernels.
fileKernDisplay.m: Display parameters of the FILE kernel.
lfmComputeH3VP.m: Helper function for computing part of the LFMVXLFM kernel.
tensorKernParamInit.m: TENSOR kernel parameter initialisation.
lfmwhiteComputeGradThetaH2.m: computes a portion of the LFM-WHITE kernel's gradient w.r.t. theta.
sqexpKernExpandParam.m: Create kernel structure from SQEXP kernel's parameters.
lfmGradientSigmaH4AP.m: Gradient of the function h_i(z) with respect \sigma.
sdrbfKernExtractParam.m: Extract parameters from the SDRBF kernel structure.
lfmvXlfmKernCompute.m: Velocity and position LFM kernel  
disimKernDiagCompute.m: Compute diagonal of DISIM kernel.
diagKernCompute.m: Compute the DIAG kernel given the parameters and X.
whitefixedKernGradX.m: Gradient of WHITEFIXED kernel with respect to a point x.
ndsimKernDiagCompute.m: Compute diagonal of NDSIM kernel.
lfmXrbfKernCompute.m: Compute a cross kernel between the LFM and RBF kernels.
rbfwhiteXwhiteKernCompute.m: Compute a cross kernel between the RBF-WHITE
linard2KernDiagGradX.m: Gradient of LINARD2 kernel's diagonal with respect to X.
lfmComputeH4JV.m: Helper function for computing part of the LFMJV kernel.
lfmComputeH.m: Helper function for computing part of the LFM kernel.
whitehKernCompute.m: Compute the WHITEH kernel given the parameters and X.
gaussianwhiteKernCompute.m: Compute the covariance of the output samples 
heatKernGradient.m: Gradient of HEAT kernel's parameters.
biasKernCompute.m: Compute the BIAS kernel given the parameters and X.
matern32KernDiagGradient.m: Compute the gradient of the MATERN32 kernel's diagonal wrt parameters.
simXrbfKernGradient.m: Compute gradient between the SIM and RBF kernels.
rbfperiodicKernExtractParam.m: Extract parameters from the RBFPERIODIC kernel structure.
lfmGradientSigmaH4.m: Gradient of the function h_i(z) with respect \sigma.
nddisimKernExtractParam.m: Extract parameters from the NDDISIM kernel structure.
ggwhiteKernDiagCompute.m: Compute diagonal of GG WHITE kernel.
mlpKernGradient.m: Gradient of MLP kernel's parameters.
rbfardKernCompute.m: Compute the RBFARD kernel given the parameters and X.
kernCompute.m: Compute the kernel given the parameters and X.
disimComputeHPrime.m: Helper function for comptuing part of the DISIM kernel.
rbfardKernGradient.m: Gradient of RBFARD kernel's parameters.
lfmvvComputeUpsilonDiagVector.m: Upsilon vector vel. vel. with t1 = t2
whitefixedKernCompute.m: Compute the WHITEFIXED kernel given the parameters and X.
diagKernExpandParam.m: Create kernel structure from DIAG kernel's parameters.
lmcKernExpandParam.m: Expands parameters into a LMC kernel structure.
ggwhiteKernCompute.m: Compute the GG white kernel given the parameters and X.
linard2KernExpandParam.m: Create kernel structure from LINARD2 kernel's parameters.
rbfardKernDiagGradX.m: Gradient of RBFARD kernel's diagonal with respect to X.
velotransKernParamInit.m: VELOTRANS kernel parameter initialisation.
lfmaKernDiagCompute.m: Compute diagonal of LFMAXLFMA kernel.
lfmapGradientSigmaUpsilonMatrix.m: Gradient of upsilon matrix ap wrt sigma
heatKernDisplay.m: Display parameters of the HEAT kernel.
rbfperiodicKernDiagGradX.m: Gradient of RBFPERIODIC kernel's diagonal with respect to X.
ratquadKernGradient.m: Gradient of RATQUAD kernel's parameters.
ratquadKernParamInit.m: RATQUAD kernel parameter initialisation.
rbfinfwhiteKernDiagGradX.m: Gradient of RBF-WHITE kernel's (with integration
linardKernDiagCompute.m: Compute diagonal of LINARD kernel.
sdlfmXsdlfmvKernComputeBlock.m: Computes SDLFM kernel matrix for block i,j
simKernDiagGradient.m: Compute the gradient of the SIM kernel's diagonal wrt parameters.
sdlfmvXsdrbfKernComputeBlock.m: Cross kernel between SDLFM and SDRBF for i,j
rbfperiodic2KernParamInit.m: RBFPERIODIC2 kernel parameter initialisation.
lfmvpGradientSigmaUpsilonVector.m: Gradient of upsilon vector vp wrt sigma
mlpardKernDisplay.m: Display parameters of the MLPARD kernel.
lfmavComputeUpsilonMatrix.m: Upsilon matrix acce. vel. with t1, t2 limits
multiKernDiagGradientBlock.m:
gaussianwhiteKernDiagGradient.m: Compute the gradient of the gaussian white 
rbfard2KernExtractParam.m: Extract parameters from the RBFARD2 kernel structure.
wienerKernDiagGradX.m: Gradient of WIENER kernel's diagonal with respect to X.
gaussianKernCompute.m: Compute the Gaussian kernel given the parameters and X.
mlpKernExpandParam.m: Create kernel structure from MLP kernel's parameters.
velotransKernCompute.m: Compute the VELOTRANS kernel given the parameters and X.
rbfperiodic2KernDiagGradX.m: Gradient of RBFPERIODIC2 kernel's diagonal with respect to X.
kernWriteToFID.m: Load from an FID written by the C++ implementation.
ouKernDisplay.m: Display parameters of the OU kernel (see ouKernCompute or
translateKernDiagGradX.m: Gradient of TRANSLATE kernel's diagonal with respect to X.
dexpKernDisplay.m: Display parameters of the double exponential kernel.
dexpKernDiagCompute.m: Compute diagonal of the double exponential kernel.
sdlfmXsdlfmKernCompute.m: Compute a cross kernel between two SDLFM kernels.
rbfhKernGradient.m: Gradient of RBFH kernel's parameters.
velotransKernDiagGradX.m: Gradient of VELOTRANS kernel's diagonal with respect to X.
sdlfmaXsdlfmKernGradientBlockILJ.m: 
lfmvKernExpandParam.m: Create kernel structure from LFMV kernel's parameters.
lfmGradientH42.m: Gradient of the function h_i(z) with respect to some of the
ardKernCompute.m: Compute the ARD kernel given the parameters and X.
rbfardKernGradX.m: Gradient of RBFARD kernel with respect to input locations.
whiteblockKernParamInit.m: WHITE BLOCK kernel parameter initialisation.
simKernDiagCompute.m: Compute diagonal of SIM kernel.
ggKernParamInit.m: GG kernel parameter initialisation.
fileKernCompute.m: Compute the FILE kernel given the parameters and X.
rbfardjitKernGradient.m: Gradient of RBFARD2 kernel's parameters.
ndsimKernExpandParam.m: Create kernel structure from NDSIM kernel's parameters.
rbfardKernDisplay.m: Display parameters of the RBFARD kernel.
matern52KernDiagGradient.m: Compute the gradient of the MATERN52 kernel's diagonal wrt parameters.
rbfardjitKernDiagGradient.m: Compute the gradient of the RBFARD2 kernel's diagonal wrt parameters.
simXsimKernCompute.m: Compute a cross kernel between two SIM kernels.
lfmComputeH4AA.m: Helper function for computing part of the LFMAA kernel.
ardKernDiagGradient.m: Compute the gradient of the ARD kernel's diagonal wrt parameters.
lfmvXlfmvKernCompute.m: Velocity and velocity LFM kernel  
cmpndKernExtractParam.m: Extract parameters from the CMPND kernel structure.
fileKernGradient.m: Gradient of FILE kernel's parameters.
sheatKernDiagCompute.m: Compute a diagonal for the SHEAT kernel matrix.
lfmapGradientSigmaUpsilonVector.m: Gradient of upsilon vector ap wrt sigma
lfmUpdateKernels.m: Updates the kernel representations in the LFM structure.
fileKernExtractParam.m: Extract parameters from the FILE kernel structure.
linKernParamInit.m: LIN kernel parameter initialisation.
lfmwhiteKernParamInit.m: LFM-WHITE kernel parameter initialisation.
dexpKernExpandParam.m: Create a kernel structure from the double exponential
rbfperiodic2KernCompute.m: Compute the RBFPERIODIC2 kernel given the parameters and X.
simXsimKernDiagGradient.m: Gradient for the diagonal between two SIM kernels.
sdlfmKernDiagCompute.m: Compute diagonal of a SDLFM kernel.
lfmComputeH4VV.m: Helper function for computing part of the LFMVXLFMV kernel.
rbfardKernDiagGradient.m: Compute the gradient of the RBFARD kernel's diagonal wrt parameters.
rbfhKernDiagGradX.m: Gradient of RBFH kernel's diagonal with respect to X.
lfmvpComputeUpsilonMatrix.m: Upsilon matrix vel. pos. with t1, t2 limits
heatKernExtractParam.m: Extract parameters from the HEAT kernel structure.
lfmwhiteXrbfwhiteKernCompute.m: Compute a cross kernel between an LFM-WHITE
lfmaaGradientSigmaUpsilonMatrix.m: Gradient of upsilon matrix aa wrt sigma
whitefixedKernExpandParam.m: Create kernel structure from WHITEFIXED kernel's parameters.
kernGradient.m: Compute the gradient wrt the kernel's parameters.
ggwhiteXwhiteKernGradient.m: Compute gradient between the GGWHITE and WHITE kernels.
pskernelGradient.m: Gradient on likelihood approximation for point set IVM.
kernExpandParamTransformSettings.m: Expand parameters' transform settings to form a kernel structure.
simXrbfKernCompute.m: Compute a cross kernel between the SIM and RBF kernels.
kernPca.m: performs KPCA.
computeKernel.m: Compute the kernel given the parameters and X.
expKernDiagGradX.m: Gradient of EXP kernel's diagonal with respect to X.
rbfard2KernExpandParam.m: Create kernel structure from RBFARD2 kernel's parameters.
lfmavGradientUpsilonMatrix.m: Gradient upsilon matrix accel. vel.
lfmaKernDisplay.m: Display parameters of the LFMA kernel.
rbfperiodic2KernDiagCompute.m: Compute diagonal of RBFPERIODIC2 kernel.
sdlfmaMeanGradient.m: Gradients wrt parameters of the accel. mean SDLFM.
linard2KernDisplay.m: Display parameters of the LINARD2 kernel.
linKernDiagGradX.m: Gradient of LIN kernel's diagonal with respect to X.
lfmGradientH41.m: Gradient of the function h_i(z) with respect to some of the
sdlfmaXsdlfmvKernGradient.m: Gradients of cross kernel between 2 SDLFM kernels.
rbfwhiteKernParamInit.m: RBF-WHITE kernel parameter initialisation. The RBF-
lfmComputeH3JP.m: Helper function for computing part of the LFMJP kernel.
rbfwhiteXrbfwhiteKernCompute.m: Compute a cross kernel between two RBF-WHITE
gibbsKernSetLengthScaleFunc.m: Set the length scale function of the GIBBS kernel.
whitehKernDiagGradX.m: Gradient of WHITEH kernel's diagonal with respect to X.
componentKernWriteParamsToFID.m: Write a component based kernel to a stream.
dexpKernGradient.m: Gradient of the double exponential kernel's parameters.
sdlfmvXsdrbfKernGradient.m: Gradients cross kernel between a SDLFM and SDRBF
linard2KernGradient.m: Gradient of LINARD2 kernel's parameters.
mlpardKernCompute.m: Compute the MLPARD kernel given the parameters and X.
multiKernGradientBlockX.m:
biasKernExtractParam.m: Extract parameters from the BIAS kernel structure.
linKernGradX.m: Gradient of LIN kernel with respect to input locations.
simComputeHStat.m: Helper function for computing part of the stationary version
gaussianKernDiagGradient.m: Compute the gradient of the gaussian kernel's diagonal wrt parameters.
lfmwhiteKernExpandParam.m: Create kernel structure from LFM-WHITE kernel's
rbfinfwhiteKernDiagCompute.m: Compute diagonal of RBF-WHITE kernel (with
mlpardKernExtractParam.m: Extract parameters from the MLPARD kernel structure.
multiKernExpandParam.m: Create kernel structure from MULTI kernel's parameters.
cmpndKernDiagGradX.m: Gradient of CMPND kernel's diagonal with respect to X.
lfmKernDiagCompute.m: Compute diagonal of LFM kernel.
ratquadKernExtractParam.m: Extract parameters from the RATQUAD kernel structure.
disimKernDiagGradient.m: Compute the gradient of the DISIM kernel's diagonal wrt parameters.
sdlfmKernParamInit.m: SDLFM kernel initialization
ardKernDiagCompute.m: Compute diagonal of ARD kernel.
sdlfmvXsdlfmvKernCompute.m: Compute a cross kernel between two SDLFMV kernels.
lfmwhiteComputePsi.m: Helper function for comptuing part of the LFM-WHITE
lfmjpComputeUpsilonVector.m: Upsilon vector jolt. pos. with t1, t2 limits
sdlfmvKernExtractParam.m: Extract parameters from the SDLFMV kernel structure.
gaussianwhiteKernDiagCompute.m: Compute diagonal of gaussian white kernel.
ggwhiteKernDisplay.m: Display parameters of the GG WHITE kernel.
tensorKernSlash.m: Tensor kernel created by removing ith component.
lfmjXrbfKernCompute.m: Compute cross kernel between the LFMJ and RBF kernels.
polyardKernGradX.m: Gradient of POLYARD kernel with respect to input locations.
indexKernDisplay.m: Display parameters of the INDEX kernel.
simwhiteXwhiteKernGradient.m: Compute gradient between the SIM-WHITE and WHITE kernels.
lfmKernExpandParam.m: Create kernel structure from LFM kernel's parameters.
whiteXnoneKernGradient.m: Compute a cross gradient between WHITE and DUMMY kernels.
lmcKernExtractParam.m: Extract parameters from the LMC kernel struc.
rbfwhiteKernGradient.m: Gradient of RBF-WHITE kernel's parameters.
lfmaXrbfKernCompute.m: Compute cross kernel between the LFMA and RBF kernels.
sheatKernDiagGradient.m: Gradient of the parameters of diagonal of a SHEAT kernel.
sdlfmXsdlfmKernGradientIC.m: Computes partial derivative for init. const.
kernGetVariance.m: Get the signal associated with a the kernel.
translateKernGradX.m: Gradient of TRANSLATE kernel with respect to a point x.
sdrbfKernDisplay.m: Display parameters of the SDRBF kernel.
sdlfmKernDisplay.m: Display parameters of the SDLFM kernel.
ggwhiteXggwhiteKernCompute.m: Compute a cross kernel between two GG white kernels.
sdlfmXsdlfmKernGradientICBlock.m: Partial derivatives initial conditions
gaussianKernDiagCompute.m: Compute diagonal of gaussian kernel.
sdlfmvXsdlfmKernCompute.m: Cross kernel between a SDLFMV and a SDLFM kernels.
sdlfmKernComputeConstant.m: Compute constants for the SDLFM kernel
lfmKernParamInit.m: LFM kernel parameter initialisation. The latent force
cmpndKernExpandParam.m: Create kernel structure from CMPND kernel's parameters.
matern32KernGradient.m: Gradient of MATERN32 kernel's parameters.
linardKernExtractParam.m: Extract parameters from the LINARD kernel structure.
rbfardjitKernGradX.m: Gradient of RBFARDJIT kernel with respect to input locations.
biasKernDiagGradient.m: Compute the gradient of the BIAS kernel's diagonal wrt parameters.
simKernDisplay.m: Display parameters of the SIM kernel.
lmcKernGradX.m: Gradient of LMC kernel with respect to input locations.
ggXgaussianKernGradX.m: Compute gradient between the GG and GAUSSIAN
matern52KernGradX.m: Gradient of MATERN52 kernel with respect to input locations.
sdlfmaXsdlfmvKernGradientBlock.m: Gradients of the parameters in block i,j
biasKernGradient.m: Gradient of BIAS kernel's parameters.
whiteblockKernDiagCompute.m: Compute diagonal of WHITEBLOCK kernel.
multiKernGradient.m: Gradient of MULTI kernel's parameters.
sdlfmKernDiagComputeBlock.m: Diagonal of a SDLFM kernel matrix for block i
rbfinfwhiteKernGradX.m: Gradient of RBF-WHITE kernel (with integration limits
polyKernGradX.m: Gradient of POLY kernel with respect to input locations.
gibbsKernCompute.m: Compute the GIBBS kernel given the parameters and X.
simKernParamInit.m: SIM kernel parameter initialisation.
lfmGradientH32.m: Gradient of the function h_i(z) with respect to some of the
disimXrbfKernCompute.m: Compute a cross kernel between the DISIM and RBF kernels.
rbfKernDiagGradient.m: Compute the gradient of the RBF kernel's diagonal wrt parameters.
kernSetIndex.m: Set the indices on a compound kernel.
rbfwhiteKernExpandParam.m: Create kernel structure from RBF-WHITE kernel's
simSample.m: Sample from SIM kernel
mlpardKernDiagCompute.m: Compute diagonal of MLPARD kernel.
rbfinfwhiteKernCompute.m: Compute the RBF-WHITE kernel (with integration limits
gibbsperiodicKernCompute.m: Compute the GIBBSPERIODIC kernel given the parameters and X.
biasKernParamInit.m: BIAS kernel parameter initialisation.
kernTest.m: Run some tests on the specified kernel.
sdlfmaXsdrbfKernComputeBlock.m: Cross kernel between SDLFM and SDRBF for i,j
whitehKernGradX.m: Gradient of WHITEH kernel with respect to input locations.
whiteXrbfKernGradient.m: Compute a cross gradient between WHITE and RBF kernels.
sdlfmXsdrbfKernGradient.m: Cross gradient between a SDLFM and a SDRBF kernels.
sdlfmXsdlfmKernGradientBlock.m: Gradients of the parameters in block i,j
polyardKernExpandParam.m: Create kernel structure from POLYARD kernel's parameters.
simwhiteKernExpandParam.m: Create kernel structure from SIM-WHITE kernel's
translateKernGradient.m: Gradient of TRANSLATE kernel's parameters.
linardKernParamInit.m: LINARD kernel parameter initialisation.
simwhiteKernGradient.m: Gradient of SIM-WHITE kernel's parameters.
lfmGradientH31.m: Gradient of the function h_i(z) with respect to some of the
polyardKernDiagGradX.m: Gradient of POLYARD kernel's diagonal with respect to X.
simwhiteXwhiteKernCompute.m: Compute a cross kernel between the SIM-WHITE
polyardKernCompute.m: Compute the POLYARD kernel given the parameters and X.
tensorKernDiagGradX.m: Gradient of TENSOR kernel's diagonal with respect to X.
diagKernDiagGradX.m: Gradient of DIAG kernel's diagonal with respect to X.
kernDiagGradient.m: Compute the gradient of the kernel's parameters for the diagonal.
velotransKernGradX.m: Gradient of VELOTRANS kernel with respect to a point x.
lfmKernDiagGradient.m: Compute the gradient of the LFM kernel's diagonal wrt parameters.
lfmGradientH.m: Gradient of the function h_i(z) with respect to some of the
whitehKernDisplay.m: Display parameters of the WHITEH kernel.
lfmvXlfmKernGradient.m: Compute a cross gradient for a LFMVXLFM.
rbfperiodic2KernExtractParam.m: Extract parameters from the RBFPERIODIC2 kernel structure.
rbfwhiteXrbfwhiteKernGradient.m: Compute a cross gradient between two
lfmwhiteXrbfwhiteKernGradient.m: Compute a cross gradient between an LFM-WHITE
lfmGradientH41VP.m: Gradient of the function h_i(z) with respect to some of the
whitefixedXwhitefixedKernCompute.m: Compute a cross kernel between two WHITEFIXED kernels.
matern32KernCompute.m: Compute the MATERN32 kernel given the parameters and X.
whiteXwhiteKernGradX.m:
ardKernGradX.m: Gradient of ARD kernel with respect to a point x.
ouKernExtractParam.m: Extract parameters from the OU kernel structure (see
kernCreate.m: Initialise a kernel structure.
lfmExtractParam.m: Extract the parameters of an LFM model.
sdlfmKernGradientMean.m: Gradients of the parameters of mean function cov.
gaussianwhiteKernDiagGradX.m: Gradient of gaussian white kernel's diagonal with respect to X.
disimKernDisplay.m: Display parameters of the DISIM kernel.
rbfardKernExpandParam.m: Create kernel structure from RBFARD kernel's parameters.
sdlfmvXsdrbfKernCompute.m: Cross kernel between a SDLFMV and a SDRBF kernels.
polyKernDisplay.m: Display parameters of the POLY kernel.
translateKernExpandParam.m: Create kernel structure from TRANSLATE kernel's parameters.
lfmComputeH4VP.m: Helper function for computing part of the LFMVXLFM kernel.
disimSample.m: Sample from SIM kernel
lfmapGradientUpsilonVector.m: Gradient upsilon vector accel. pos.
lfmGradientSigmaH4AV.m: Gradient of the function h_i(z) with respect \sigma.
linard2KernCompute.m: Compute the LINARD2 kernel given the parameters and X.
sdlfmvXsdlfmvKernComputeBlock.m: Computes SDLFM kernel matrix for block i,j
lfmvvComputeUpsilonMatrix.m: Upsilon matrix vel. vel. with t1, t2 limits
lfmjpComputeUpsilonMatrix.m: Upsilon matrix jolt. pos. with t1, t2 limits
ggwhiteXgaussianwhiteKernGradX.m: Compute gradient between the GG white and
simwhiteKernExtractParam.m: Extract parameters from the SIM-WHITE kernel
gaussianwhiteKernExtractParam.m: Extract parameters from the gaussian white 
lfmwhiteKernExtractParam.m: Extract parameters from the LFM-WHITE kernel
wienerKernCompute.m: Compute the WIENER kernel given the parameters and X.
sdrbfKernParamInit.m: SDRBF kernel initialization
lfmwhiteKernDiagGradX.m: Gradient of LFM-WHITE kernel's diagonal w.r.t. t.
tensorKernExpandParam.m: Create kernel structure from TENSOR kernel's parameters.
mlpKernCompute.m: Compute the MLP kernel given the parameters and X.
velotransKernDisplay.m: Display parameters of the VELOTRANS kernel.
lfmComputeH4AV.m: Helper function for computing part of the LFMAV kernel.
nddisimXndsimKernCompute.m: Compute a cross kernel between DISIM and SIM kernels with no decay in the SIM part.
rbfKernExtractParam.m: Extract parameters from the RBF kernel structure.
velotransKernExtractParam.m: Extract parameters from the VELOTRANS kernel structure.
whiteXwhiteKernGradient.m: Compute a cross gradient between two WHITE kernels.
sqexpKernExtractParam.m: Extract parameters from the SQEXP kernel structure.
multiKernCompute.m: Compute the MULTI kernel given the parameters and X.
multiKernDiagGradient.m: Compute the gradient of the MULTI kernel's diagonal wrt parameters.
lfmXlfmKernGradient.m: Compute a cross gradient between two LFM kernels.
linardKernGradient.m: Gradient of LINARD kernel's parameters.
multiKernGradientBlock.m:
gaussianKernDiagGradX.m: Gradient of gaussian kernel's diagonal with respect to X.
srbfhKernGradient.m: Gradient of the parameters of a SRBFH kernel.
sdlfmaXsdrbfKernCompute.m: Cross kernel between a SDLFMA and a SDRBF kernels.
lfmGradientSigmaH4AA.m: Gradient of the function h_i(z) with respect \sigma.
lfmaaGradientUpsilonMatrix.m: Gradient upsilon matrix accel. accel.
gibbsperiodicKernExpandParam.m: Create kernel structure from GIBBSPERIODIC kernel's parameters.
gibbsperiodicKernExtractParam.m: Extract parameters from the GIBBSPERIODIC kernel structure.
ndsimKernCompute.m: Compute the NDSIM kernel with no decay given the parameters and X.
noneKernGradient.m: Gradient of NONE kernel's parameters.
indexKernExtractParam.m: Extract parameters from the INDEX kernel structure.
rbfardKernParamInit.m: RBFARD kernel parameter initialisation.
sdlfmXsdrbfKernGradientBlockIGJ.m: 
lfmjaComputeUpsilonMatrix.m: Upsilon matrix jolt. accel. with t1, t2 limits
rbfperiodicKernDisplay.m: Display parameters of the RBFPERIODIC kernel.
mlpKernDisplay.m: Display parameters of the MLP kernel.
lfmvXrbfKernGradient.m: Compute gradient between the LFMV and RBF kernels.
lfmComputeH4JA.m: Helper function for computing part of the LFMJA kernel.
lfmGradientSigmaH3AA.m: Gradient of the function h_i(z) with respect \sigma.
multiKernParamInit.m: MULTI kernel parameter initialisation.
ratquadKernDisplay.m: Display parameters of the RATQUAD kernel.
matern52KernGradient.m: Gradient of MATERN52 kernel's parameters.
ardKernDisplay.m: Display parameters of the ARD kernel.
disimKernGradX.m: Gradient of DISIM kernel with respect to a point x.
simKernGradient.m: Gradient of SIM kernel's parameters.
mlpKernGradX.m: Gradient of MLP kernel with respect to input locations.
cmpndKernDisplay.m: Display parameters of the CMPND kernel.
ggwhiteXgaussianwhiteKernGradient.m: Compute gradient between the GG white
lfmComputeH3AA.m: Helper function for computing part of the LFMAA kernel.
sdlfmaXsdlfmaKernCompute.m: Cross kernel between a SDLFMA and a SDLFMA kernels.
linKernExpandParam.m: Create kernel structure from LIN kernel's parameters.
nddisimKernParamInit.m: NDDISIM kernel parameter initialisation.
noneKernGradX.m: Gradient of NONE kernel with respect to a point x.
rbfwhiteKernGradX.m: Gradient of RBF-WHITE kernel with respect to a point t.
sdrbfKernGradient.m: Gradient of SDRBF kernel's parameters.
simwhiteXrbfinfwhiteKernCompute.m: Compute a cross kernel between a SIM-WHITE
fileKernDiagCompute.m: Compute diagonal of FILE kernel.
lfmComputeTest.m: Test the file lfmComputeH.
sdlfmXsdlfmKernGradientBlockIGJ.m: 
rbfard2KernParamInit.m: RBFARD2 kernel parameter initialisation.
gaussianwhiteKernGradient.m: Gradient of gaussian white kernel's parameters.
ggXggKernCompute.m: Compute a cross kernel between two GG kernels.
ndsimKernParamInit.m: SIM kernel parameter initialisation.
sdlfmaXsdlfmaKernGradient.m: Gradients of cross kernel between 2 SDLFM kernels.
tensorKernGradX.m: Gradient of TENSOR kernel with respect to a point x.
ouKernCompute.m: Compute the Ornstein-Uhlenbeck (OU) kernel arising from the
sqexpKernGradient.m: Gradient of SQEXP kernel's parameters.
rbfard2KernGradX.m: Gradient of RBFARD2 kernel with respect to input locations.
rbfardjitKernParamInit.m: RBFARD2 kernel parameter initialisation.
mlpardKernExpandParam.m: Create kernel structure from MLPARD kernel's parameters.
ratquadKernDiagGradX.m: Gradient of RATQUAD kernel's diagonal with respect to X.
lfmComputeH4AP.m: Helper function for computing part of the LFMAP kernel.
rbfXnoneKernCompute.m: Compute a cross kernel between RBF and NONE kernels.
rbfard2KernGradient.m: Gradient of RBFARD2 kernel's parameters.
diagKernDisplay.m: Display parameters of the DIAG kernel.
simwhiteXrbfwhiteKernGradient.m: Compute a cross gradient between a SIM-WHITE
whiteblockKernCompute.m: Compute the WHITEBLOCK kernel. 
lfmOptions.m: Creates a set of default options for a LFM model.
polyKernDiagGradX.m: Gradient of POLY kernel's diagonal with respect to X.
simwhiteKernDiagCompute.m: Compute the diagonal of the SIM-WHITE kernel.
lfmwhiteKernGradient.m: Gradient of LFM-WHITE kernel's parameters.
simXsimKernDiagCompute.m: Diagonal of a cross kernel between two SIM kernels.
lfmaKernExtractParam.m: Extract parameters from the LFMA kernel structure.
sqexpKernDisplay.m: Display parameters of the SQEXP kernel.
ardKernGradient.m: Gradient of ARD kernel's parameters.
indexardKernExtractParam.m: Extract parameters from the INDEXARD kernel structure.
wienerKernDiagCompute.m: Compute diagonal of WIENER kernel.
sdlfmKernCompute.m: Compute the SDLFM kernel given the parameters and X.
sdrbfKernExpandParam.m: Pass parameters from params to SDRBF kernel
sdlfmvKernParamInit.m: SDLFMV kernel initialization
ndsimKernExtractParam.m: Extract parameters from the SIM kernel structure.
matern32KernDisplay.m: Display parameters of the MATERN32 kernel.
lfmTest.m: Test the gradients of the LFM model.
rbfhKernDiagCompute.m: Compute diagonal of RBFH kernel.
biasKernExpandParam.m: Create kernel structure from BIAS kernel's parameters.
rbfKernDiagGradX.m: Gradient of RBF kernel's diagonal with respect to X.
