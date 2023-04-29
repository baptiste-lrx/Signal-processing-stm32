function coeffs_fir = createAntiAliasFilter
%CREATEANTIALIASFILTER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.4 and Signal Processing Toolbox 8.0.
% Generated on: 28-Mar-2023 02:36:12

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 3072000;  % Sampling Frequency

Fpass = 20000;           % Passband Frequency
Fstop = 28000;           % Stopband Frequency
Dpass = 0.057501127785;  % Passband Ripple
Dstop = 0.001;            % Stopband Attenuation
dens  = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);
coeffs_fir=Hd.Numerator;
% [EOF]
