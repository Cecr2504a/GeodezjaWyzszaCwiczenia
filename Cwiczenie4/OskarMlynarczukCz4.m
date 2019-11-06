
clc
clear
format long g
a=1
e2=6378137
lambA=1000
fiA=500
lambB=200
fiB=15
b=a*sqrt(1-e2)
f=1-b/a
dellamb=lambB-lambA
UA=atan((1-f)*tan(fiA))
UB=atan((1-f)*tan(fiB))
n=0
AWS=1+0.000001*pi/(180*60*60)
while AWS>(0.000001*pi/(180*60*60))
    if n<1
        n=n+1   
        L(n)=dellamb
        else
            L(n+1)=dellamb+(1-C(n))*f*sin_alfa(n)*(ro(n)+C(n)*sin_ro(n)*(cos_2rom(n)+C(n)*cos_ro(n)*(-1+2*cos_2rom(n)^2)))
            n=n+1
            AWS=sqrt((L(n)-L(n-1))^2)
    end
    sin_ro(n)=sqrt((cos(UB)*sin(L(n))^2)+(cos(UA)*sin(UB)-sin(UA)*cos(UB)*cos(L(n)))^2)
    cos_ro(n)=sin(UA)*sin(UB)+cos(UA)*cos(UB)*cos(L(n))
    ro(n)=atan(sin_ro(n)/cos_ro(n))
    sin_alfa(n)=(cos(UA)*cos(UB)*sin(L(n)))/sin_ro(n)
    cos_alfa2(n)=1-sin_alfa(n)^2
    cos_2rom(n)=cos_ro(n)-(2*sin(UA)*sin(UB))/cos_alfa2(n)
    C(n)=(f/16)*cos_alfa2(n)*(4+f*(4-3*cos_alfa2(n)))
end

