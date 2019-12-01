function Vincent=Vincent(fiA,lambA,fiB,lambB)
    a=6378137;
    e2=0.00669438002290;
    b=a*sqrt(1-e2);
    f=1-b/a;
    dellamb=lambB-lambA;
    UA=atan((1-f)*tan(fiA));
    UB=atan((1-f)*tan(fiB));
    n=0;
    AWS=0.000001*pi/(180*60*60)-1;
    while AWS<(0.000001*pi/(180*60*60));
        if n>=1;
           w=n+1;
           L(w)=dellamb+(1-C(n))*f*sin_alfa(n)*(ro(n)+C(n)*sin_ro(n)*(cos_2rom(n)+C(n)*cos_ro(n)*(-1+2*cos_2rom(n)^2)));
           AWS=sqrt((L(w)-L(n))^2);
           n=n+1;
        end
        if n<1;
           n=n+1;
           L(n)=dellamb;
        end
        sin_ro(n)=sqrt((cos(UB)*sin(L(n))^2)+(cos(UA)*sin(UB)-sin(UA)*cos(UB)*cos(L(n)))^2);
        cos_ro(n)=sin(UA)*sin(UB)+cos(UA)*cos(UB)*cos(L(n));
        ro(n)=atan(sin_ro(n)/cos_ro(n));
        sin_alfa(n)=(cos(UA)*cos(UB)*sin(L(n)))/sin_ro(n);
        cos_alfa2(n)=1-sin_alfa(n)^2;
        cos_2rom(n)=cos_ro(n)-(2*sin(UA)*sin(UB))/cos_alfa2(n);
        C(n)=(f/16)*cos_alfa2(n)*(4+f*(4-3*cos_alfa2(n)));
    end
    u2=((a^2)-(b^2)/(b^2))*cos_alfa2(n);
    A=1+(u2/16384)*(4096+u2*(-768+u2*(320-175*u2)));
    B=(u2/1024)*(256+u2*(-128+u2*(74-47*u2)));
    deltro=B*sin_ro(n)*(cos_2rom(n)+(1/4)*B*(cos_ro(n)*(-1+2*(cos_2rom(n))^2))-(1/6)*B*cos_2rom(n)*(-3+4*sin_ro(n)^2)*(-3+4*(cos_2rom(n))^2));
    Sab=b*A*(ro(n)-deltro);
    Aab=atan((cos(UB)*sin(L))/(-sin(UA)*cos(UB)+cos(UA)*sin(UB)*cos(L)))+pi
    assignin('base','Aab',Aab)
end