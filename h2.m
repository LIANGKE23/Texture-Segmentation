function [hValue] = h2(y, S_control,Orientation,F)

hValue = Gaussian1(y, S_control) * exp(2i*pi*F*y*sind(Orientation));