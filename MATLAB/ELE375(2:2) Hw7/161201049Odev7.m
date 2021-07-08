function [r1,r2]=eigen(S,yontem);

if yontem==1; %us yontemini kullanmak icin yontem degiskeni 1 olmalidir.
    for i=1:length(S) %1'den A'nin uzunluguna kadar matris olusturma.
    v=randn(length(S),1);vold=v+1; %v=rand kullanirken de A'nin uzunlugu kadar satir,1 tane de sutun yapma.
 
        while norm(abs(vold)-abs(v))/norm(abs(v))>0.000001; %(vold-v)/v yaparak hata payini hesapladik. donguye giren degerler bu hata payindan dusuk degerlerde calisti.
        vold=v; %eski degeri yenisine esitledik.
        z=S*v; %z=Sv yaptik.
        v=z/norm(abs(z)); %Sonra v'yi z/z'nin normu olarak bulduk. Bu kisim yontemin kendi algoritmasi.
        isaret=sign(vold(1)*v(1)); % iterasyonlarda degisen isaretleri ozdegerde kullanmak uzere signum fonksiyonunu kullanarak bulduk.
        end
            eigenvector=v; %bu esitlik zaten anlasiliyor.
            eigenvalue=isaret*norm(abs(z)); %ozvektoru bulduk.
            r1(i,1)=eigenvalue; 
            r2(:,i)=eigenvector; 
            S=S-eigenvalue*norm(abs(eigenvector));
    end
end


if yontem==2; %Jacobi yontemini kullanmak icin yontem degiskeni 2 olmalidir.
 tolerence=1; %toleransa bir baslangic degeri atadik.
 P=eye(length(S),length(S)); %P'ye de baslangic degeri atadik.
    while check > 0.000001; %yine hata payi (tolerans).
    R=eye(length(S),length(S)); %R=rotation matrice'e de baslangic degeri atadik.
    [d1,i1]=max(abs(S-diag(diag(S)))); %matrisin diagonal elemanlarini yok ederek max degeri bulduk.
    [d2,i2]=max(d1);
    i1=i1(i2); % yukarida buldugumuz sifira en uzak degeri bu degiskenlere kaydettik.
    theta=acot((S(i2,i2)-S(i1,i1))/(2*S(i1,i2)))/2; %thetayi bu algoritmayla hesapladik.
    R(i1,i1)=cos(th);  %buradaki 4 satirda 2 rotational matrice'i hesaplayacagiz.
    R(i2,i2)=cos(th);
    R(i1,i2)=sin(th); 
    R(i2,i1)=-sin(th);
    S=R'*S*R %matrisimizin son halini bulduk.
    P=R*P; %P'yi de guncelleyerek son halini bulduk.
    tolerence=sum(abs(Sdiag(diag(S))))/sum(abs(diag(S))); %hata payimizi bu algoritmayla hesaplayabiliriz.
    end
        eigenvalue=diag(S);
        eigenvector=P;
        
end



