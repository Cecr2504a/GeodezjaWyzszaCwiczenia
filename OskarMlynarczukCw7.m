clc
clear
format longg
Upierw=importdata('Pierwotne.txt')
Xp=Upierw(:,1)
Yp=Upierw(:,2)
Zp=Upierw(:,3)
[w,r]=size(Upierw)
H=(9.71014E-07)
alfa=-9.40596E-07
beta=8.5335E-07
gamma=2.01817E-06
Xo=-26.01137268
Yo=134.6240902
Zo=72.42653575
n=0
Uwtor=[]
while w>n
    n=n+1
    Uwtor(:,n)=[Xp(n) Yp(n) Zp(n)]'+[H gamma -beta; -gamma H alfa;beta -alfa H]*[Xp(n) Yp(n) Zp(n)]'+[Xo Yo Zo]'
    d(:,n)=[Xp(n)-Uwtor(1,n);Yp(n)-Uwtor(2,n);Zp(n)-Uwtor(3,n)]
end

