clear
clc
format long g
X=3763917.000
Y=1235727.000
Z=4982084.000+33*15
A=6378137
e2=0.00669438002290
r = sqrt(X^2 + Y^2);
n=0
Aws=1;
while Aws > 0.00005*pi/(180*60*60)
    n=n+1
    if n<=1;
    F(n) = atan((Z/r) * ((1 - e2)^-1));
    N(n) = A/sqrt(1 - e2 * (sin(F(n))^2));
    H(n)=(r/cos(F(n)))-N(n);
    Aws=1
    end
    if n>1;
    F(n) = atan((Z/r) * (1 - e2 * (N(n - 1)/(N(n - 1) + H(n - 1))))^-1);
    N(n) = A/sqrt(1 - e2 * (sin(F(n))^2));
    H(n)=(r/cos(F(n)))-N(n);
    RO=F(n)-F(n-1);
    Aws=sqrt(RO^2);
    end
end
La=atan(Y/X)
X2=(N(n)+H(n))*cos(F(n))*cos(La)
Y2=(N(n)+H(n))*cos(F(n))*sin(La)
Z2=((N(n)*(1-e2))+H(n))*sin(F(n))
F=F(n)
La
H=H(n)



