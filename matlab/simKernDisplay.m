function simKernDisplay(kern, spacing)

% SIMKERNDISPLAY Display parameters of the SIM kernel.
% FORMAT
% DESC displays the parameters of the single input motif
% kernel and the kernel type to the console.
% ARG kern : the kernel to display.
%
% FORMAT does the same as above, but indents the display according
% to the amount specified.
% ARG kern : the kernel to display.
% ARG spacing : how many spaces to indent the display of the kernel by.
%
% SEEALSO : simKernParamInit, modelDisplay, kernDisplay
%
% COPYRIGHT : Neil D. Lawrence, 2006

% KERN

if nargin > 1
  spacing = repmat(32, 1, spacing);
else
  spacing = [];
end
spacing = char(spacing);
fprintf(spacing);
fprintf('SIM Variance: %2.4f\n', kern.variance)
fprintf(spacing);
fprintf('SIM inverse width: %2.4f (length scale %2.4f)\n', ...
        kern.inverseWidth, 1/sqrt(kern.inverseWidth));
%fprintf(spacing);
%fprintf('SIM delay: %2.4f\n', kern.delay)
fprintf(spacing);
fprintf('SIM decay: %2.4f\n', kern.decay)
