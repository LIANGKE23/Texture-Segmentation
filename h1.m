function [hValue] = h1(x, S_control,Orientation,F)

hValue = Gaussian1(x, S_control) * exp(2i*pi*F*x*cosd(Orientation));