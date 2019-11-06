function [Stminsek]=KatStop(Katw);
    Kat=Katw(1:2);
    [n,r]=size(Kat);
    wd=0;
    while r>wd;
        wd=wd+1;
        Katstopnie(wd)=fix(Kat(wd));
        Minuty(wd)=(Kat(wd)-fix(Kat(wd)))*60;
        Katminuty(wd)=fix(Minuty(wd));
        Sekundy(wd)=(Minuty(wd)-Katminuty(wd))*60;
        Katsekundy(wd)=round(Sekundy(wd),5)
    end
    Stminsek=[Katstopnie;Katminuty;Katsekundy;]
    assignin('base','Stminsek',Stminsek)
end