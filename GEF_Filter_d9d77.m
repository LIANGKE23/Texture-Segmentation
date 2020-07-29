X = imread('d9d77.gif');
Y = imbinarize(X);
Z = imbinarize(X);
imshow(Y)
[M,N] = size(X);
F = 0.059;
S_control1 = 25;%%sigema1
S_control2 = 25;%%sigema2
OriAngle = 0;%%theta (deg)
filterImage1 = zeros(M,N);
filterImage2 = zeros(M,N);
M0 = zeros(M,N);
M1 = zeros(M,N);
%%threshold:[0.011,0.0125] 
for i = 1+2*S_control1 : M - 2*S_control1
    for j = 1: N
        for m = i-2*S_control1 : i + 2*S_control1
            filterImage1(i,j) = filterImage1(i,j) + Y(m,j)*h1(i-m, S_control1,OriAngle,F);
        end
    end    
end
for i = 1+2*S_control1 : M - 2*S_control1
    for j = 1+2*S_control1: N-2*S_control1
        for m = j-2*S_control1 : j + 2*S_control1
            M0(i,j) = M0(i,j) + filterImage1(i,m)*h2(j-m,S_control1,OriAngle,F);
        end
    end
end
for i = 1: M 
    for j = 1: N
        M0(i,j) = abs(M0(i,j));
    end
end
for i = 1+2*S_control2 : M - 2*S_control2
    for j = 1: N
        for m = i-2*S_control2 : i + 2*S_control2
            filterImage2(i,j) = filterImage2(i,j) + M0(m,j)*Gaussian1(i-m, S_control2);
        end
    end    
end
for i = 1+2*S_control2 : M - 2*S_control2
    for j = 1+2*S_control2: N-2*S_control2
        for m = j-2*S_control2 : j + 2*S_control2
            M1(i,j) = M1(i,j) + filterImage2(i,m)*Gaussian2(j-m,S_control2);
        end
    end
end

M0_0=imbinarize(M0);
figure;imshow(M0_0);
M1_1=imbinarize(M1);
figure;imshow(M1_1);

[x,y]=size(M0);
X=1:x;
Y=1:y;
[xx,yy]=meshgrid(Y,X);
i=(M0);
figure;mesh(xx,yy,i);


[x,y]=size(M1);
X=1:x;
Y=1:y;
[xx,yy]=meshgrid(Y,X);
i=(M1);
figure;mesh(xx,yy,i);

for i = 1: M 
    for j = 1: N
        if  0.011<M1(i,j) &&  0.0125> M1(i,j) && j<280
           Z(i,j) = 1;
           
        end
    end
end
figure;
imshow(Z)