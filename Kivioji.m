function Kivioji=Kivioji(sAB,azAB,zAB,F,La)
    a=6378137.000;
    e2=0.00669438002290;
    n=sAB/125;
    ds=sAB/n;
    for i=1:n
        M=a*(1-e2)/sqrt((1-e2*(sin(F))^2)^3);
        N=a/sqrt(1-e2*(sin(F))^2);
        dfi=(ds*cos(azAB))/M;
        dAab=(sin(azAB)*tan(F)*ds)/N;
        fim=F+0.5*dfi;
        Aabm=azAB+0.5*dAab;
        Mm=a*(1-e2)/sqrt((1-e2*(sin(fim))^2)^3);
        Nm=a/sqrt(1-e2*(sin(fim))^2);
        dfim=(cos(Aabm)*ds)/Mm;
        dlamb=(sin(Aabm)*ds)/(Nm*cos(fim));
        dAm=(sin(Aabm)*tan(fim)*ds)/Nm;
        F=F+dfim;
        La=La+dlamb;
        azAB=azAB+dAm;
    end
    Fb=F;
    Lab=La;
    azBA=azAB+pi;
    assignin('base','Fb',Fb)
    assignin('base','Lab',Lab)
    assignin('base','azAB',azAB)
    assignin('base','azBA',azBA)
end

