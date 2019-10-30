clear
clc
format longg
X=3763917.000
Y=1235727.000
Z=4982084.000+33*15
A=6378137.000;
e2=0.00669438002290;
WspKart=[X,Y,Z]
hirvonen(X,Y,Z)
sAB=35125.123;
azAB=(70*pi/180)+33*pi/180;
zAB=(85*pi/180)+33*pi/(180*60);
F=WspGeo(1)*pi/180
La=WspGeo(2)*pi/180
xAB=[sAB*sin(zAB)*cos(azAB);sAB*sin(zAB)*sin(azAB);sAB*cos(zAB)]
R=[-sin(F)*cos(La), -sin(La),  cos(F)*cos(La);
   -sin(F)*sin(La), cos(La),   cos(F)*sin(La);
   cos(F),          0 ,        sin(F)];
Przyrosty=inv(R')*xAB
WspKartB=WspKart'+Przyrosty
hirvonen(WspKartB(1),WspKartB(2),WspKartB(3))
KatStop(ans)