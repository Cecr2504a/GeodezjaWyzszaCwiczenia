function [Stminsek]=KatStop(Kat);
    [n,r]=size(Kat);
    wd=1;
    while r>=wd;
        Katstopnie(wd)=fix(Kat(wd));
        Minuty(wd)=(Kat(wd)-fix(Kat(wd)))*60;
        Katminuty(wd)=fix(Minuty(wd));
        Sekundy(wd)=(Minuty(wd)-Katminuty(wd))*60;
        Katsekundy(wd)=round(Sekundy(wd),5);
        wd=wd+1;
    end
    Stminsek=[Katstopnie;Katminuty;Katsekundy;]
    assignin('base','Stminsek',Stminsek)
end