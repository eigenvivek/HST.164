##
cd(@__DIR__)
using Pkg
Pkg.activate(".")

using DSP
using FFTW
using Plots

## FFT the first signal
fs = 44100.0
t = 0:1/fs:1
signal = exp.(-t)

freqs = fftfreq(length(t), fs) |> fftshift
F = fft(signal) |> fftshift

time_plot = plot(t, signal, title = "Signal");
freq_plot = plot(freqs, abs.(F), title = "Spectrum", xlim = (-500, +500));
plot(time_plot, freq_plot, layout = 2)

## FFT the second signal
t = -10:1/(fs):10
signal = exp.(-t .^ 2 / 4)

freqs = fftfreq(length(t), fs) |> fftshift
F = fft(signal) |> fftshift

time_plot = plot(t, signal, title = "Signal");
freq_plot = plot(freqs, abs.(F), title = "Spectrum", xlim = (-25, +25));
plot(time_plot, freq_plot, layout = 2)
