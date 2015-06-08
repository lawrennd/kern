KERN software
Version 0.221		Friday 17 Apr 2009 at 17:45

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

ggKernCompute.m: Compute the GG kernel given the parameters and X.
kernSetIndex.m: Set the indices on a compound kernel.
simwhiteXsimwhiteKernCompute.m: Compute a cross kernel between two SIM-WHITE
ardKernExpandParam.m: Create kernel structure from ARD kernel's parameters.
simwhiteXrbfinfwhiteKernCompute.m: Compute a cross kernel between a SIM-WHITE
gaussianKernExtractParam.m: Extract parameters from the gaussian kernel structure.
whitefixedKernParamInit.m: WHITEFIXED kernel parameter initialisation.
kernPca.m: performs KPCA.
linKernGradient.m: Gradient of LIN kernel's parameters.
ratquadKernParamInit.m: RATQUAD kernel parameter initialisation.
rbfperiodicKernExpandParam.m: Create kernel structure from RBFPERIODIC kernel's parameters.
kernExtractParam.m: Extract parameters from kernel structure.
gibbsKernSetLengthScaleFunc.m: Set the length scale function of the GIBBS kernel.
tensorKernGradX.m: Gradient of TENSOR kernel with respect to a point x.
ouKernGradient.m: Gradient of OU kernel's parameters (see ouKernCompute or
kernelCenter.m: Attempts to Center Kernel Matrix
polyardKernGradX.m: Gradient of POLYARD kernel with respect to input locations.
rbfperiodicKernGradient.m: Gradient of RBFPERIODIC kernel's parameters.
ratquadKernExtractParam.m: Extract parameters from the RATQUAD kernel structure.
gibbsKernCompute.m: Compute the GIBBS kernel given the parameters and X.
fileKernRead.m: Read kernel values from file or cache.
biasKernDiagGradient.m: Compute the gradient of the BIAS kernel's diagonal wrt parameters.
ggwhiteKernExpandParam.m: Create kernel structure from GG white kernel's parameters.
disimXdisimKernCompute.m: Compute a cross kernel between two DISIM kernels.
gaussianwhiteKernGradient.m: Gradient of gaussian white kernel's parameters.
matern52KernDiagCompute.m: Compute diagonal of MATERN52 kernel.
whiteXwhiteKernGradX.m:
polyKernExpandParam.m: Create kernel structure from POLY kernel's parameters.
lfmwhiteKernGradient.m: Gradient of LFM-WHITE kernel's parameters.
lfmKernGradient.m: Gradient of LFM kernel's parameters.
whiteXnoneKernGradient.m: Compute a cross gradient between WHITE and DUMMY kernels.
gibbsperiodicKernDisplay.m: Display parameters of the GIBBSPERIODIC kernel.
multiKernGradient.m: Gradient of MULTI kernel's parameters.
lfmXlfmKernCompute.m: Compute a cross kernel between two LFM kernels.
mlpardKernExtractParam.m: Extract parameters from the MLPARD kernel structure.
mlpKernExpandParam.m: Create kernel structure from MLP kernel's parameters.
lfmOptions.m: Creates a set of default options for a LFM model.
ggwhiteKernParamInit.m: GG WHITE kernel parameter initialisation.
rbfKernDiagGradient.m: Compute the gradient of the RBF kernel's diagonal wrt parameters.
ggwhiteXggwhiteKernGradient.m: Compute a cross gradient between two GG WHITE kernels.
ardKernDiagGradient.m: Compute the gradient of the ARD kernel's diagonal wrt parameters.
tensorKernDiagGradient.m: Compute the gradient of the TENSOR kernel's diagonal wrt parameters.
rbfardKernGradX.m: Gradient of RBFARD kernel with respect to input locations.
wienerKernParamInit.m: WIENER kernel parameter initialisation.
simKernDiagGradX.m: Gradient of SIM kernel's diagonal with respect to X.
gibbsperiodicKernCompute.m: Compute the GIBBSPERIODIC kernel given the parameters and X.
polyardKernParamInit.m: POLYARD kernel parameter initialisation.
ouKernDiagCompute.m: Compute diagonal of OU kernel (see ouKernCompute or
lfmKernDiagGradient.m: Compute the gradient of the LFM kernel's diagonal wrt parameters.
rbfinfwhiteKernExtractParam.m: Extract parameters from the RBF-WHITE kernel
rbfwhiteKernDisplay.m: Display parameters of the RBF-WHITE kernel.
simwhiteXwhiteKernCompute.m: Compute a cross kernel between the SIM-WHITE
translateKernGradient.m: Gradient of TRANSLATE kernel's parameters.
rbfperiodicKernGradX.m: Gradient of RBFPERIODIC kernel with respect to a point x.
rbfinfwhiteKernParamInit.m: RBF-WHITE kernel (with integration limits between
ggwhiteKernCompute.m: Compute the GG white kernel given the parameters and X.
lfmExtractParam.m: Extract the parameters of an LFM model.
rbfXnoneKernCompute.m: Compute a cross kernel between RBF and NONE kernels.
noneKernCompute.m: Compute the NONE kernel given the parameters and X.
noneKernDisplay.m: Display parameters of the NONE kernel.
gaussianKernGradX.m: Gradient of gaussian kernel with respect to input locations.
rbfinfwhiteXrbfinfwhiteKernGradient.m: Compute a cross gradient between two
gaussianKernParamInit.m: Gaussian kernel parameter initialisation.
ouKernExpandParam.m: Create kernel structure from OU kernel's parameters
lfmKernExpandParam.m: Create kernel structure from LFM kernel's parameters.
biasKernDisplay.m: Display parameters of the BIASkernel.
ardKernExtractParam.m: Extract parameters from the ARD kernel structure.
kernCompute.m: Compute the kernel given the parameters and X.
simwhiteKernExpandParam.m: Create kernel structure from SIM-WHITE kernel's
whiteKernDiagCompute.m: Compute diagonal of WHITE kernel.
rbfKernExtractParam.m: Extract parameters from the RBF kernel structure.
sqexpKernExpandParam.m: Create kernel structure from SQEXP kernel's parameters.
gibbsperiodicKernExtractParam.m: Extract parameters from the GIBBSPERIODIC kernel structure.
disimXrbfKernCompute.m: Compute a cross kernel between the DISIM and RBF kernels.
lfmComputeH4.m: Helper function for computing part of the LFM kernel.
disimKernDiagGradient.m: Compute the gradient of the DISIM kernel's diagonal wrt parameters.
noneKernExpandParam.m: Create kernel structure from NONE kernel's parameters.
rbfinfwhiteXwhiteKernCompute.m: Compute a cross kernel between the RBF-WHITE
kernCreate.m: Initialise a kernel structure.
whitefixedKernDiagCompute.m: Compute diagonal of WHITEFIXED kernel.
simwhiteKernDisplay.m: Display parameters of the SIM-WHITE kernel.
whiteKernDiagGradX.m: Gradient of WHITE kernel's diagonal with respect to X.
sparseKernDisplay.m: Display parameters of the SPARSE kernel.
gibbsKernExtractParam.m: Extract parameters from the GIBBS kernel structure.
wienerKernCompute.m: Compute the WIENER kernel given the parameters and X.
ggwhiteKernGradient.m: Gradient of GG WHITE kernel's parameters.
fileKernGradient.m: Gradient of FILE kernel's parameters.
expKernParamInit.m: EXP kernel parameter initialisation.
expKernGradient.m: Gradient of EXP kernel's parameters.
ggXggKernCompute.m: Compute a cross kernel between two GG kernels.
rbfwhiteXwhiteKernCompute.m: Compute a cross kernel between the RBF-WHITE
matern32KernDiagCompute.m: Compute diagonal of MATERN32 kernel.
cmpndKernDiagCompute.m: Compute diagonal of CMPND kernel.
biasKernParamInit.m: BIAS kernel parameter initialisation.
gibbsperiodicKernDiagCompute.m: Compute diagonal of GIBBSPERIODIC kernel.
cmpndKernExtractParam.m: Extract parameters from the CMPND kernel structure.
simwhiteKernGradient.m: Gradient of SIM-WHITE kernel's parameters.
simXrbfKernCompute.m: Compute a cross kernel between the SIM and RBF kernels.
lfmwhiteKernGradX.m: Gradient of LFM-WHITE kernel with respect to a point t.
ggXgaussianKernGradX.m: Compute gradient between the GG and GAUSSIAN
linardKernDisplay.m: Display parameters of the LINARD kernel.
multiKernDiagGradX.m: Gradient of MULTI kernel's diagonal with respect to X.
polyKernDiagGradX.m: Gradient of POLY kernel's diagonal with respect to X.
lfmwhiteXrbfwhiteKernCompute.m: Compute a cross kernel between an LFM-WHITE
simwhiteXrbfinfwhiteKernGradient.m: Compute a cross gradient between a
rbfwhiteKernGradX.m: Gradient of RBF-WHITE kernel with respect to a point t.
whiteXrbfKernGradient.m: Compute a cross gradient between WHITE and RBF kernels.
linardKernParamInit.m: LINARD kernel parameter initialisation.
multiKernCacheBlock.m:
kernGetVariance.m: Get the signal associated with a the kernel.
multiKernTest.m: Run some tests on the multiple output block kernel.
componentKernWriteParamsToFID.m: Write a component based kernel to a stream.
rbfardKernDisplay.m: Display parameters of the RBFARD kernel.
polyKernCompute.m: Compute the POLY kernel given the parameters and X.
simKernParamInit.m: SIM kernel parameter initialisation.
linKernDiagCompute.m: Compute diagonal of LIN kernel.
pskernelGradient.m: Gradient on likelihood approximation for point set IVM.
multiKernDiagCompute.m: Compute diagonal of MULTI kernel.
whiteXwhiteKernGradient.m: Compute a cross gradient between two WHITE kernels.
kernPriorGradient.m: Compute gradient terms associated with kernel priors.
simComputeTest.m: Test the file simComputeH.
disimKernExtractParam.m: Extract parameters from the DISIM kernel structure.
disimKernGradX.m: Gradient of DISIM kernel with respect to a point x.
linKernDiagGradX.m: Gradient of LIN kernel's diagonal with respect to X.
disimComputeH.m: Helper function for comptuing part of the DISIM kernel.
biasKernDiagGradX.m: Gradient of BIAS kernel's diagonal with respect to X.
kernGradient.m: Compute the gradient wrt the kernel's parameters.
cmpndKernSetIndex.m: Set the indices in the compound kernel.
ggwhiteXgaussianwhiteKernCompute.m: Compute a cross kernel between the GG white and GAUSSIAN white kernels.
kernTest.m: Run some tests on the specified kernel.
ggXgaussianKernCompute.m: Compute a cross kernel between the GG and GAUSSIAN kernels.
simKernDiagGradient.m: Compute the gradient of the SIM kernel's diagonal wrt parameters.
lfmGradientH31.m: Gradient of the function h_i(z) with respect to some of the
mlpKernCompute.m: Compute the MLP kernel given the parameters and X.
simKernExtractParam.m: Extract parameters from the SIM kernel structure.
ggwhiteKernDiagCompute.m: Compute diagonal of GG WHITE kernel.
multiKernFixBlocks.m:
sqexpKernCompute.m: Compute the SQEXP kernel given the parameters and X.
mlpardKernParamInit.m: MLPARD kernel parameter initialisation.
ratquadKernDisplay.m: Display parameters of the RATQUAD kernel.
linKernGradX.m: Gradient of LIN kernel with respect to input locations.
gibbsKernDiagGradX.m: Gradient of GIBBS kernel's diagonal with respect to X.
mlpardKernExpandParam.m: Create kernel structure from MLPARD kernel's parameters.
disimXsimKernGradient.m: Compute gradient between the DISIM and SIM kernels.
polyKernGradX.m: Gradient of POLY kernel with respect to input locations.
gaussianwhiteKernExpandParam.m: Create kernel structure from gaussian white 
lfmwhiteKernExtractParam.m: Extract parameters from the LFM-WHITE kernel
simXsimKernCompute.m: Compute a cross kernel between two SIM kernels.
sqexpKernExtractParam.m: Extract parameters from the SQEXP kernel structure.
gaussianKernCompute.m: Compute the Gaussian kernel given the parameters and X.
ggwhiteXgaussianwhiteKernGradX.m: Compute gradient between the GG white and
mlpardKernCompute.m: Compute the MLPARD kernel given the parameters and X.
mlpKernGradX.m: Gradient of MLP kernel with respect to input locations.
cmpndKernDisplay.m: Display parameters of the CMPND kernel.
simwhiteKernExtractParam.m: Extract parameters from the SIM-WHITE kernel
gaussianwhiteKernGradX.m: Gradient of gaussian white kernel with respect 
lfmGradientH32.m: Gradient of the function h_i(z) with respect to some of the
lfmGradientSigmaH4.m: Gradient of the function h_i(z) with respect \sigma.
linardKernCompute.m: Compute the LINARD kernel given the parameters and X.
expKernDiagGradX.m: Gradient of EXP kernel's diagonal with respect to X.
polyKernDiagCompute.m: Compute diagonal of POLY kernel.
whitefixedKernExtractParam.m: Extract parameters from the WHITEFIXED kernel structure.
matern32KernGradient.m: Gradient of MATERN32 kernel's parameters.
ggKernParamInit.m: GG kernel parameter initialisation.
disimKernExpandParam.m: Create kernel structure from DISIM kernel's parameters.
lfmXrbfKernCompute.m: Compute a cross kernel between the LFM and RBF kernels.
whitefixedKernExpandParam.m: Create kernel structure from WHITEFIXED kernel's parameters.
kernGradX.m: Compute the gradient of the kernel wrt X.
matern52KernGradient.m: Gradient of MATERN52 kernel's parameters.
cmpndKernExpandParam.m: Create kernel structure from CMPND kernel's parameters.
mlpKernDiagCompute.m: Compute diagonal of MLP kernel.
lfmwhiteKernDisplay.m: Display parameters of the LFM-WHITE kernel.
multiKernGradientBlock.m:
tensorKernDiagGradX.m: Gradient of TENSOR kernel's diagonal with respect to X.
disimComputeHPrime.m: Helper function for comptuing part of the DISIM kernel.
rbfperiodicKernDiagCompute.m: Compute diagonal of RBFPERIODIC kernel.
gaussianKernDiagGradient.m: Compute the gradient of the gaussian kernel's diagonal wrt parameters.
whitefixedKernGradX.m: Gradient of WHITEFIXED kernel with respect to a point x.
ratquadKernCompute.m: Compute the RATQUAD kernel given the parameters and X.
ouKernDisplay.m: Display parameters of the OU kernel (see ouKernCompute or
linKernDisplay.m: Display parameters of the LIN kernel.
rbfinfwhiteXwhiteKernGradient.m: Compute gradient between the RBF-WHITE kernel
fileKernExpandParam.m: Create kernel structure from FILE kernel's parameters.
rbfardKernDiagGradient.m: Compute the gradient of the RBFARD kernel's diagonal wrt parameters.
lfmKernDiagCompute.m: Compute diagonal of LFM kernel.
rbfwhiteKernDiagGradX.m: Gradient of RBF-WHITE kernel's diagonal w.r.t. t.
rbfwhiteXrbfwhiteKernCompute.m: Compute a cross kernel between two RBF-WHITE
linardKernExpandParam.m: Create kernel structure from LINARD kernel's parameters.
ggXgaussianKernGradient.m: Compute gradient between the GG and GAUSSIAN kernels.
kernPriorLogProb.m: Compute penalty terms associated with kernel priors.
linardKernGradX.m: Gradient of LINARD kernel with respect to input locations.
lfmComputeH3.m: Helper function for computing part of the LFM kernel.
expKernDisplay.m: Display parameters of the EXP kernel.
gibbsKernDisplay.m: Display parameters of the GIBBS kernel.
polyKernExtractParam.m: Extract parameters from the POLY kernel structure.
rbfKernDiagGradX.m: Gradient of RBF kernel's diagonal with respect to X.
linardKernDiagCompute.m: Compute diagonal of LINARD kernel.
ggKernGradient.m: Gradient of GG kernel's parameters.
sqexpKernDisplay.m: Display parameters of the SQEXP kernel.
polyardKernExpandParam.m: Create kernel structure from POLYARD kernel's parameters.
kernReadFromFID.m: Load from an FID written by the C++ implementation.
rbfKernDiagCompute.m: Compute diagonal of RBF kernel.
componentKernReadParamsFromFID.m: Read a component based kernel from a C++ file.
lfmGradientUpsilon.m: Gradient of the function \upsilon(z) with respect to
translateKernParamInit.m: TRANSLATE kernel parameter initialisation.
simwhiteKernParamInit.m: SIM-WHITE kernel parameter initialisation.
lfmwhiteComputeGradThetaH1.m: computes a portion of the LFM-WHITE kernel's gradient w.r.t. theta.
rbfardKernCompute.m: Compute the RBFARD kernel given the parameters and X.
gaussianwhiteKernDisplay.m: Display parameters of the GAUSSIAN white kernel.
gaussianwhiteKernCompute.m: Compute the covariance of the output samples 
multiKernDisplay.m: Display parameters of the MULTI kernel.
translateKernCompute.m: Compute the TRANSLATE kernel given the parameters and X.
lfmwhiteKernDiagGradX.m: Gradient of LFM-WHITE kernel's diagonal w.r.t. t.
rbfardKernExtractParam.m: Extract parameters from the RBFARD kernel structure.
lfmComputeH.m: Helper function for computing part of the LFM kernel.
whitefixedKernCompute.m: Compute the WHITEFIXED kernel given the parameters and X.
gibbsperiodicKernExpandParam.m: Create kernel structure from GIBBSPERIODIC kernel's parameters.
disimKernDiagCompute.m: Compute diagonal of DISIM kernel.
lfmGradientSigmaH3.m: Gradient of the function h_i(z) with respect \sigma.
linardKernGradient.m: Gradient of LINARD kernel's parameters.
gibbsperiodicKernParamInit.m: GIBBSPERIODIC kernel parameter initialisation.
mlpKernParamInit.m: MLP kernel parameter initialisation.
cmpndKernParamInit.m: CMPND kernel parameter initialisation.
lfmLogLikelihood.m: Compute the log likelihood of a LFM model.
expKernExtractParam.m: Extract parameters from the EXP kernel structure.
cmpndKernDiagGradX.m: Gradient of CMPND kernel's diagonal with respect to X.
whiteKernExtractParam.m: Extract parameters from the WHITE kernel structure.
simKernGradient.m: Gradient of SIM kernel's parameters.
ratquadKernDiagGradX.m: Gradient of RATQUAD kernel's diagonal with respect to X.
whiteKernDiagGradient.m: Compute the gradient of the WHITE kernel's diagonal wrt parameters.
noneKernParamInit.m: NONE kernel parameter initialisation.  
expKernExpandParam.m: Create kernel structure from EXP kernel's parameters.
rbfinfwhiteKernDiagCompute.m: Compute diagonal of RBF-WHITE kernel (with
wienerKernDiagGradX.m: Gradient of WIENER kernel's diagonal with respect to X.
rbfperiodicKernDiagGradient.m: Compute the gradient of the RBFPERIODIC kernel's diagonal wrt parameters.
lfmwhiteComputeH.m: Helper function for computing part of the LFM-WHITE
lfmwhiteXwhiteKernCompute.m: Compute a cross kernel between the LFM-WHITE
rbfinfwhiteKernGradient.m: Gradient of the parameters of the RBF-WHITE kernel
disimXsimKernCompute.m: Compute a cross kernel between DISIM and SIM kernels.
rbfardKernDiagGradX.m: Gradient of RBFARD kernel's diagonal with respect to X.
lfmwhiteXlfmwhiteKernGradient.m: Compute a cross gradient between two
sqexpKernGradient.m: Gradient of SQEXP kernel's parameters.
kernToolboxes.m: Load in the relevant toolboxes for kern.
simwhiteKernCompute.m: Compute the SIM-WHITE kernel given the parameters, t1
expKernCompute.m: Compute the EXP kernel given the parameters and X.
polyardKernDiagCompute.m: Compute diagonal of POLYARD kernel.
expKernGradX.m: Gradient of EXP kernel with respect to a point x.
ggKernExpandParam.m: Create kernel structure from GG kernel's parameters.
gaussianwhiteKernDiagCompute.m: Compute diagonal of gaussian white kernel.
ouKernCompute.m: Compute the Ornstein-Uhlenbeck (OU) kernel arising from the
linKernExpandParam.m: Create kernel structure from LIN kernel's parameters.
disimKernDiagGradX.m: Gradient of DISIM kernel's diagonal with respect to X.
noneKernGradX.m: Gradient of NONE kernel with respect to a point x.
ratquadKernDiagCompute.m: Compute diagonal of RATQUAD kernel.
mlpardKernDisplay.m: Display parameters of the MLPARD kernel.
kernCorrelation.m: Compute the correlation matrix kernel given the parameters and X.
gibbsperiodicKernDiagGradient.m: Compute the gradient of the GIBBSPERIODIC kernel's diagonal wrt parameters.
polyardKernDisplay.m: Display parameters of the POLYARD kernel.
linKernCompute.m: Compute the LIN kernel given the parameters and X.
rbfperiodicKernParamInit.m: RBFPERIODIC kernel parameter initialisation.
lfmwhiteXwhiteKernGradient.m: Compute gradient between the LFM-WHITE and
gibbsKernDiagGradient.m: Compute the gradient of the GIBBS kernel's diagonal wrt parameters.
translateKernDiagCompute.m: Compute diagonal of TRANSLATE kernel.
biasKernCompute.m: Compute the BIAS kernel given the parameters and X.
multiKernDiagGradient.m: Compute the gradient of the MULTI kernel's diagonal wrt parameters.
multiKernCompute.m: Compute the MULTI kernel given the parameters and X.
rbfKernCompute.m: Compute the RBF kernel given the parameters and X.
lfmXrbfKernGradient.m: Compute gradient between the LFM and RBF kernels.
matern32KernParamInit.m: MATERN32 kernel parameter initialisation.
wienerKernDiagCompute.m: Compute diagonal of WIENER kernel.
simwhiteXrbfwhiteKernGradient.m: Compute a cross gradient between a SIM-WHITE
ardKernParamInit.m: ARD kernel parameter initialisation.
lfmwhiteKernDiagCompute.m: Compute diagonal of LFM-WHITE kernel.
matern32KernDisplay.m: Display parameters of the MATERN32 kernel.
rbfKernParamInit.m: RBF kernel parameter initialisation.
matern52KernParamInit.m: MATERN52 kernel parameter initialisation.
ggwhiteKernDisplay.m: Display parameters of the GG WHITE kernel.
polyardKernGradient.m: Gradient of POLYARD kernel's parameters.
simwhiteKernDiagCompute.m: Compute diagonal of SIM-WHITE kernel.
lfmKernParamInit.m: LFM kernel parameter initialisation. The latent force
rbfinfwhiteKernDisplay.m: Display parameters of the RBF-WHITE kernel (with
kernDisplay.m: Display the parameters of the kernel.
fileKernParamInit.m: FILE kernel parameter initialisation.
disimKernCompute.m: Compute the DISIM kernel given the parameters and X.
lfmGradientH41.m: Gradient of the function h_i(z) with respect to some of the
lfmGradientSigmaH.m: Gradient of the function h_i(z) with respect \sigma.
gaussianwhiteKernDiagGradient.m: Compute the gradient of the gaussian white 
rbfinfwhiteKernDiagGradX.m: Gradient of RBF-WHITE kernel's (with integration
tensorKernSlash.m: Tensor kernel created by removing ith component.
kernDiagCompute.m: Compute the kernel given the parameters and X.
cmpndKernGradient.m: Gradient of CMPND kernel's parameters.
ratquadKernExpandParam.m: Create kernel structure from RATQUAD kernel's parameters.
matern32KernDiagGradient.m: Compute the gradient of the MATERN32 kernel's diagonal wrt parameters.
translateKernExpandParam.m: Create kernel structure from TRANSLATE kernel's parameters.
tensorKernSetIndex.m: Set the indices in the tensor kernel.
matern32KernGradX.m: Gradient of MATERN32 kernel with respect to input locations.
sqexpKernDiagCompute.m: Compute diagonal of SQEXP kernel.
kernDiagGradX.m: Compute the gradient of the  kernel wrt X.
gibbsperiodicKernDiagGradX.m: Gradient of GIBBSPERIODIC kernel's diagonal with respect to X.
matern52KernExpandParam.m: Create kernel structure from MATERN52 kernel's parameters.
biasKernExtractParam.m: Extract parameters from the BIAS kernel structure.
wienerKernDisplay.m: Display parameters of the WIENER kernel.
ggKernDiagCompute.m: Compute diagonal of GG kernel.
rbfardKernGradient.m: Gradient of RBFARD kernel's parameters.
matern52KernDiagGradX.m: Gradient of MATERN52 kernel's diagonal with respect to X.
rbfwhiteKernExpandParam.m: Create kernel structure from RBF-WHITE kernel's
lfmwhiteXlfmwhiteKernCompute.m: Compute a cross kernel between two LFM-WHITE
ardKernDisplay.m: Display parameters of the ARD kernel.
lfmKernGradX.m: Gradient of LFM kernel with respect to a point x.
matern32KernDiagGradX.m: Gradient of MATERN32 kernel's diagonal with respect to X.
mlpardKernDiagCompute.m: Compute diagonal of MLPARD kernel.
rbfwhiteXwhiteKernGradient.m: Compute gradient between the RBF-WHITE and
lfmwhiteXrbfwhiteKernGradient.m: Compute a cross gradient between an LFM-WHITE
noneKernDiagCompute.m: Compute diagonal of NONE kernel.
rbfperiodicKernDisplay.m: Display parameters of the RBFPERIODIC kernel.
polyardKernExtractParam.m: Extract parameters from the POLYARD kernel structure.
translateKernDisplay.m: Display parameters of the TRANSLATE kernel.
lfmXlfmKernGradient.m: Compute a cross gradient between two LFM kernels.
sqexpKernGradX.m: Gradient of SQEXP kernel with respect to a point x.
whiteKernDisplay.m: Display parameters of the WHITEkernel.
kernExpandParam.m: Expand parameters to form a kernel structure.
gibbsperiodicKernGradX.m: Gradient of GIBBSPERIODIC kernel with respect to a point x.
lfmComputeTest.m: Test the file lfmComputeH.
kernReadParamsFromFID.m: Read the kernel parameters from C++ file FID.
ardKernGradient.m: Gradient of ARD kernel's parameters.
simwhiteXwhiteKernGradient.m: Compute gradient between the SIM-WHITE and WHITE kernels.
tensorKernGradient.m: Gradient of TENSOR kernel's parameters.
rbfKernDisplay.m: Display parameters of the RBF kernel.
matern52KernDisplay.m: Display parameters of the MATERN52 kernel.
noneKernDiagGradX.m: Gradient of NONE kernel's diagonal with respect to X.
ggwhiteXgaussianwhiteKernGradient.m: Compute gradient between the GG white 
simComputeH.m: Helper function for comptuing part of the SIM kernel.
ardKernDiagGradX.m: Gradient of ARD kernel's diagonal with respect to X.
rbfwhiteKernGradient.m: Gradient of RBF-WHITE kernel's parameters.
simwhiteKernGradX.m: Gradient of SIM-WHITE kernel with respect to a point t.
matern52KernCompute.m: Compute the MATERN52 kernel given the parameters and X.
ardKernDiagCompute.m: Compute diagonal of ARD kernel.
whiteXnoneKernCompute.m: Compute a cross kernel between WHITE and NONE kernels.
gibbsKernParamInit.m: GIBBS kernel parameter initialisation.
lfmKernDiagGradX.m: Gradient of LFM kernel's diagonal with respect to X.
rbfardKernParamInit.m: RBFARD kernel parameter initialisation.
sqexpKernDiagGradient.m: Compute the gradient of the SQEXP kernel's diagonal wrt parameters.
simwhiteKernDiagGradX.m: Gradient of SIM-WHITE kernel's diagonal w.r.t. t.
noneKernExtractParam.m: Extract parameters from the NONE kernel structure.
matern32KernExtractParam.m: Extract parameters from the MATERN32 kernel structure.
multiKernGradientBlockX.m:
biasKernDiagCompute.m: Compute diagonal of BIAS kernel.
rbfperiodicKernDiagGradX.m: Gradient of RBFPERIODIC kernel's diagonal with respect to X.
rbfwhiteKernDiagCompute.m: Compute diagonal of RBF-WHITE kernel.
ouKernParamInit.m: Ornstein-Uhlenbeck (OU) kernel parameter initialisation.
mlpKernExtractParam.m: Extract parameters from the MLP kernel structure.
simKernCompute.m: Compute the SIM kernel given the parameters and X.
ggwhiteXggwhiteKernCompute.m: Compute a cross kernel between two GG white kernels.
matern32KernCompute.m: Compute the MATERN32 kernel given the parameters and X.
lfmGradientSigmaUpsilon.m: Gradient of the function \upsilon(z) with respect
multiKernExtractParam.m: Extract parameters from the MULTI kernel structure.
ggKernExtractParam.m: Extract parameters from the GG kernel structure.
wienerKernExtractParam.m: Extract parameters from the WIENER kernel structure.
lfmwhiteComputeGradThetaH2.m: computes a portion of the LFM-WHITE kernel's gradient w.r.t. theta.
rbfperiodicKernCompute.m: Compute the RBFPERIODIC kernel given the parameters and X.
disimXrbfKernGradient.m: Compute gradient between the DISIM and RBF kernels.
gibbsKernExpandParam.m: Create kernel structure from GIBBS kernel's parameters.
kernDiagGradient.m: Compute the gradient of the kernel's parameters for the diagonal.
tensorKernParamInit.m: TENSOR kernel parameter initialisation.
polyardKernDiagGradX.m: Gradient of POLYARD kernel's diagonal with respect to X.
ratquadKernGradient.m: Gradient of RATQUAD kernel's parameters.
rbfwhiteKernExtractParam.m: Extract parameters from the RBF-WHITE kernel
disimKernDisplay.m: Display parameters of the DISIM kernel.
simKernDisplay.m: Display parameters of the SIM kernel.
whitefixedXwhitefixedKernGradient.m: Compute a cross gradient between two WHITEFIXED kernels.
mlpardKernDiagGradX.m: Gradient of MLPARD kernel's diagonal with respect to X.
ggXggKernGradient.m: Compute a cross gradient between two GG kernels.
gaussianKernDisplay.m: Display parameters of the GAUSSIAN kernel.
lfmGradientH.m: Gradient of the function h_i(z) with respect to some of the
whitefixedKernDiagGradX.m: Gradient of WHITEFIXED kernel's diagonal with respect to X.
whitefixedXwhitefixedKernCompute.m: Compute a cross kernel between two WHITEFIXED kernels.
ratquadKernGradX.m: Gradient of RATQUAD kernel with respect to input locations.
kernWriteToFID.m: Load from an FID written by the C++ implementation.
gibbsKernGradX.m: Gradient of GIBBS kernel with respect to input locations.
whiteKernExpandParam.m: Create kernel structure from WHITE kernel's parameters.
biasKernGradX.m: Gradient of BIAS kernel with respect to input locations.
mlpKernGradient.m: Gradient of MLP kernel's parameters.
fileKernGradX.m: Gradient of FILE kernel with respect to a point x.
gaussianwhiteKernExtractParam.m: Extract parameters from the gaussian white 
sqexpKernDiagGradX.m: Gradient of SQEXP kernel's diagonal with respect to X.
lfmwhiteKernExpandParam.m: Create kernel structure from LFM-WHITE kernel's
lfmUpdateKernels.m: Updates the kernel representations in the LFM structure.
expKernDiagCompute.m: Compute diagonal of EXP kernel.
rbfinfwhiteKernGradX.m: Gradient of RBF-WHITE kernel (with integration limits
rbfinfwhiteKernExpandParam.m: Create kernel structure from RBF-WHITE kernel's
linKernExtractParam.m: Extract parameters from the LIN kernel structure.
rbfwhiteKernCompute.m: Compute the RBF-WHITE kernel given the parameters, t1
gaussianKernDiagCompute.m: Compute diagonal of gaussian kernel.
multiKernParamInit.m: MULTI kernel parameter initialisation.
tensorKernExtractParam.m: Extract parameters from the TENSOR kernel structure.
linardKernExtractParam.m: Extract parameters from the LINARD kernel structure.
rbfXnoneKernGradient.m: Compute a cross gradient between RBF and DUMMY
gaussianKernGradient.m: Gradient of gaussian kernel's parameters.
rbfinfwhiteKernCompute.m: Compute the RBF-WHITE kernel (with integration limits
lfmCreate.m: Create a LFM model.
lfmComputeUpsilon.m: Helper function for comptuing part of the LFM kernel.
biasKernExpandParam.m: Create kernel structure from BIAS kernel's parameters.
fileKernDiagCompute.m: Compute diagonal of FILE kernel.
gibbsKernGradient.m: Gradient of GIBBS kernel's parameters.
ggKernDisplay.m: Display parameters of the GG kernel.
lfmTest.m: Test the gradients of the LFM model.
tensorKernDisplay.m: Display parameters of the TENSOR kernel.
whiteXwhiteKernCompute.m: Compute a cross kernel between two WHITE kernels.
whitefixedKernGradient.m: Gradient of WHITEFIXED kernel's parameters.
cmpndKernDiagGradient.m: Compute the gradient of the CMPND kernel's diagonal wrt parameters.
multiKernExpandParam.m: Create kernel structure from MULTI kernel's parameters.
rbfardKernDiagCompute.m: Compute diagonal of RBFARD kernel.
fileKernDisplay.m: Display parameters of the FILE kernel.
simKernExpandParam.m: Create kernel structure from SIM kernel's parameters.
multiKernGradX.m: Gradient of MULTI kernel with respect to a point x.
ouKernExtractParam.m: Extract parameters from the OU kernel structure (see
ardKernCompute.m: Compute the ARD kernel given the parameters and X.
biasKernGradient.m: Gradient of BIAS kernel's parameters.
lfmwhiteKernParamInit.m: LFM-WHITE kernel parameter initialisation.
whiteKernCompute.m: Compute the WHITE kernel given the parameters and X.
simKernGradX.m: Gradient of SIM kernel with respect to a point x.
simwhiteXrbfwhiteKernCompute.m: Compute a cross kernel between a SIM-WHITE
noneKernGradient.m: Gradient of NONE kernel's parameters.
polyKernDisplay.m: Display parameters of the POLY kernel.
gaussianwhiteKernParamInit.m: Gaussian white kernel parameter initialisation.
computeKernel.m: Compute the kernel given the parameters and X.
lfmGradientH42.m: Gradient of the function h_i(z) with respect to some of the
whiteKernGradient.m: Gradient of WHITE kernel's parameters.
simKernDiagCompute.m: Compute diagonal of SIM kernel.
mlpKernDiagGradX.m: Gradient of MLP kernel's diagonal with respect to X.
lfmKernCompute.m: Compute the LFM kernel given the parameters and X.
gibbsperiodicKernGradient.m: Gradient of GIBBSPERIODIC kernel's parameters.
wienerKernGradient.m: Gradient of WIENER kernel's parameters.
sqexpKernParamInit.m: SQEXP kernel parameter initialisation.
rbfinfwhiteXrbfinfwhiteKernCompute.m: Compute a cross kernel between two
whitefixedKernDisplay.m: Display parameters of the WHITEFIXED kernel.
whitefixedKernDiagGradient.m: Compute the gradient of the WHITEFIXED kernel's diagonal wrt parameters.
simXrbfKernGradient.m: Compute gradient between the SIM and RBF kernels.
disimKernGradient.m: Gradient of DISIM kernel's parameters.
polyKernGradient.m: Gradient of POLY kernel's parameters.
matern52KernExtractParam.m: Extract parameters from the MATERN52 kernel structure.
matern52KernGradX.m: Gradient of MATERN52 kernel with respect to input locations.
gaussianwhiteKernDiagGradX.m: Gradient of gaussian white kernel's diagonal with respect to X.
translateKernGradX.m: Gradient of TRANSLATE kernel with respect to a point x.
gaussianKernExpandParam.m: Create kernel structure from gaussian kernel's parameters.
lfmLogLikeGradients.m: Compute the gradients of the log likelihood of a LFM model.
ouKernGradX.m: Gradient of OU kernel with respect to a point x (see
tensorKernExpandParam.m: Create kernel structure from TENSOR kernel's parameters.
polyKernParamInit.m: POLY kernel parameter initialisation.
multiKernComputeBlock.m:
cmpndKernGradX.m: Gradient of CMPND kernel with respect to a point x.
lfmKernDisplay.m: Display parameters of the LFM kernel.
lfmExpandParam.m: Expand the given parameters into a LFM structure.
rbfwhiteKernParamInit.m: RBF-WHITE kernel parameter initialisation. The RBF-
whiteKernGradX.m: Gradient of WHITE kernel with respect to input locations.
kernWriteParamsToFID.m: Write the kernel parameters to a stream.
translateKernDiagGradX.m: Gradient of TRANSLATE kernel's diagonal with respect to X.
matern32KernExpandParam.m: Create kernel structure from MATERN32 kernel's parameters.
fileKernExtractParam.m: Extract parameters from the FILE kernel structure.
matern52KernDiagGradient.m: Compute the gradient of the MATERN52 kernel's diagonal wrt parameters.
rbfwhiteXrbfwhiteKernGradient.m: Compute a cross gradient between two
tensorKernCompute.m: Compute the TENSOR kernel given the parameters and X.
kernSetWhite.m: Helper function to set the white noise in a kernel if it exists.
disimKernParamInit.m: DISIM kernel parameter initialisation.
disimXdisimKernGradient.m: Compute a cross gradient between two DISIM kernels.
linKernParamInit.m: LIN kernel parameter initialisation.
lfmKernExtractParam.m: Extract parameters from the LFM kernel structure.
tensorKernDiagCompute.m: Compute diagonal of TENSOR kernel.
polyardKernCompute.m: Compute the POLYARD kernel given the parameters and X.
ggwhiteKernExtractParam.m: Extract parameters from the GG WHITE kernel structure.
translateKernExtractParam.m: Extract parameters from the TRANSLATE kernel structure.
mlpardKernGradient.m: Gradient of MLPARD kernel's parameters.
fileKernCompute.m: Compute the FILE kernel given the parameters and X.
lfmSample.m: Sample from LFM kernel
rbfardKernExpandParam.m: Create kernel structure from RBFARD kernel's parameters.
whiteKernParamInit.m: WHITE kernel parameter initialisation.
rbfKernGradX.m: Gradient of RBF kernel with respect to input locations.
gaussianKernDiagGradX.m: Gradient of gaussian kernel's diagonal with respect to X.
wienerKernGradX.m: Gradient of WIENER kernel with respect to a point x.
mlpardKernGradX.m: Gradient of MLPARD kernel with respect to input locations.
simwhiteXsimwhiteKernGradient.m: Compute a cross gradient between two
lfmwhiteKernCompute.m: Compute the LFM-WHITE kernel given the parameters, t1
cmpndKernCompute.m: Compute the CMPND kernel given the parameters and X.
kernParamInit.m: Kernel parameter initialisation.
rbfperiodicKernExtractParam.m: Extract parameters from the RBFPERIODIC kernel structure.
ratquadKernDiagGradient.m: Compute the gradient of the RATQUAD kernel's diagonal wrt parameters.
rbfKernGradient.m: Gradient of RBF kernel's parameters.
kernFactors.m: Extract factors associated with transformed optimisation space.
lfmwhiteComputePsi.m: Helper function for comptuing part of the LFM-WHITE
wienerKernExpandParam.m: Create kernel structure from WIENER kernel's parameters.
ouKernDiagGradX.m: Gradient of OU kernel's diagonal with respect to t (see
mlpKernDisplay.m: Display parameters of the MLP kernel.
simXsimKernGradient.m: Compute a cross gradient between two SIM kernels.
gibbsKernDiagCompute.m: Compute diagonal of GIBBS kernel.
rbfKernExpandParam.m: Create kernel structure from RBF kernel's parameters.
ardKernGradX.m: Gradient of ARD kernel with respect to a point x.
pskernelObjective.m: Likelihood approximation for point set IVM.
linardKernDiagGradX.m: Gradient of LINARD kernel's diagonal with respect to X.
