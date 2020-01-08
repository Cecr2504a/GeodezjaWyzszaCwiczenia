clear
clc
format longg
Upierw=importdata('Pierwotne.txt')
Xp=Upierw(:,1)
Yp=Upierw(:,2)
Zp=Upierw(:,3)
Uwtor=importdata('Wtorne.txt')
Xw=Uwtor(:,1)
Yw=Uwtor(:,2)
Zw=Uwtor(:,3)
[a,b]=size(Upierw)
for n=1:a
    A(n).a=[Xp(n) 0 -Zp(n) Yp(n) 1 0 0
    Yp(n) Zp(n) 0 -Xp(n) 0 1 0
    Zp(n) -Yp(n) Xp(n) 0 0 0 1]
    L(n).a=[Xp(n)-Xw(n);Yp(n)-Yw(n);Zp(n)-Zw(n)]
end
AA=[A(1).a;A(2).a;A(3).a;A(4).a;A(5).a]
LL=[L(1).a;L(2).a;L(3).a;L(4).a;L(5).a]
ATA=AA'*AA
ATL=AA'*LL
X=(-inv(ATA))*ATL