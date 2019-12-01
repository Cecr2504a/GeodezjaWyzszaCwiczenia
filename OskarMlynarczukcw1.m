clear
clc
format long g
X=3763917.000
Y=1235727.000
Z=4982084.000+33*15
a=6378137.000
e2=0.00669438002290
WspKart=[X,Y,Z];
Hirvonen(X,Y,Z);

fst=WspGeo(1)*180/pi;
last=WspGeo(2)*180/pi;
zmn=[fst,last];
KatStop(zmn);
