% Burak Can KARAKURT - ELE101 Odev 5

%NOT: Kullanici girisi icin ulke,sene,kita ve sene2 degiskenleri istenen
%degerlere ayarlanmalidir. Kullanici girisi isteniyorsa 23,24,45 ve 46.
%satirlar yorumdan cikartilarak command window'dan gelen komutlar
%izlenmelidir.

%% Soru 1-a:
%Oncelikle istenen .mat dosyasini load edelim. Bu iki sikta da kullanilacak.
load infimfchange.mat;

%1. index ulke,
%2. index kita,
%3-43. indexler, 1980-2020 arasi 41 yildaki enflasyon degerini veriyor.

%publish edebilmek icin default deger atadim. kod calistirildiginda
%kullanici girisi beklenecek veya asagidan yoruma alarak bu degiskenler
%uzerinden giris saglanabilir.
ulke='Angola';
sene='2020';

%GIRIS KISMI 1 - Ulke ve sene icin kullanici girisi alalim:
%ulke=input('Istenen ulkeyi giriniz: ','s');
%sene=input('Istenen seneyi giriniz: ','s');

index=find(contains(infimfchange,ulke));

%1980=3. index, buna gore bir denklem kurmak gerekli. 2020=43. index
%sene-1977 dogru cevabi verecek.
sene=str2double(sene);
sene=sene-1977;
%Istenen ulkenin o senedeki enflasyonu asagidaki gibidir:
disp("Istenen ulkedeki istenen seneye ait enflasyon: ");
disp(infimfchange(index,sene));


%% Soru 1-b:
%publish edebilmek icin default deger atadim. kod calistirildiginda
%kullanici girisi beklenecek veya asagidan yoruma alarak bu degiskenler
%uzerinden giris saglanabilir.
kita='Europe';
sene2='1998';

%GIRIS KISMI 2 - Kita ve sene icin kullanici girisi bekleniyor:
%kita=input('Istenen kitayi giriniz: ','s');
%sene2=input('Istenen seneyi giriniz: ','s');

%.mat dosyasinda verilen kitada bulunan ulkelerin index bilgisinin alinmasi:
ulkeIndexleri=find(contains(infimfchange,kita));
%Sene icin array index duzenlemesi/formulu:
sene2=str2double(sene2)-1977;
%Kita bilgisi 2. sutunda bulunuyor. 30. satirdaki kod ile ilk sutundan
%baslayarak tum satirlari kontrol edip diger sutuna geciyorum. Ilk sutunda
%137 deger var, yani indexten 137 cikarinca 2. sutundaki hangi indexe denk
%geldiklerini buluyorum.
ulkeIndexleri=ulkeIndexleri-137;
%Verilen kitada kac tane ulke oldugunu, o ulkelerin indexlerini ve o seneki
%enflasyon degerlerini tutmak icin enflasyon diye bir array olusturuyorum:
ulkeSayisi=length(ulkeIndexleri);
enflasyon(1:ulkeSayisi,1)=infimfchange(ulkeIndexleri,sene2);
%Verilen kitanin o yildaki enflasyon degerlerinin histogrami, ortalamasi,
%standart sapmasi asagidaki gibidir:
histogram(str2double(enflasyon));
xlabel('Enflasyon degeri');
ylabel('Ulke sayisi');
title('Enflasyon Histagrami');

ortalama=mean(str2double(enflasyon));
sapma=std(str2double(enflasyon));

disp("Ortalama: ");
disp(ortalama)
disp("Standart Sapma: ");
disp(sapma);

%% Soru 2-a:
%100 kisiden olusan 1 dakika ortalamali musteri gelis suresi arrayi:
sureler=exprnd(1,1,100);

%% Soru 2-b:
%Musterilerin kumulatif bir sekilde gelis surelerini toplayalim:
toplam=cumsum(sureler);
%toplam=10 dakika olana kadar gelen musteri sayisini bulalim. Arrayin son
%indexi veya uzunlugu istenen sayiyi verecek.
musteriSayisib=find(toplam<10);
ondakika=length(musteriSayisib);
disp("10 dakikada gelen musteri sayisi: ");
disp(ondakika);

%% Soru 2-c:
%a sikkinda yapilan islemin 1000 deneme icin yapilmasi:
sureler2=exprnd(1,100,1000);
%toplam2 icinde gelis surelerini toplayarak tutalim:
toplam2=cumsum(sureler2);
%toplamin 10'dan buyuk oldugu musteri indexini bulmak icin sutunlari satir
%yaparak x=toplam2>10; seklinde x'te depolayacagim.
toplam2=toplam2';
%x icerisinde 10 dakikadan once gelen musteriler 0, 10. dakikadan sonra
%gelen musteriler 1 ile tutulmus oldu.
x=toplam2>10;
%x arrayi icindeki ilk 1 degerinin hangi indexte oldugunu ondakika2 arrayi
%icinde tutma islemi:
[~,ondakika2]=max(x,[],2);
%ondakika2 icinde tutulan index, ilk 1 degerinin oldugu indextir. Bize
%bundan bir onceki yani 10. dakikaya kadar gelen musteri sayisi lazim. 1
%eksilterek bu sayiya ulasmaliyim:
ondakika2=ondakika2-1;
disp("10 dakikada gelen musteri sayilari ondakika2 arrayi icerisinde tutulmaktadir. 1000 adet sonuc olacagi icin bastirilmamistir. ");
%disp(ondakika2);

%% Soru 2-d:
%d sikkinda bulunan ilk 10 dakika icerisinde gelen musterilerin 1000 ornek
%icin hesaplanmis halinin histograma dokulmus hali:
histogram(ondakika2);
xlabel('10 dakikada gelen musteri sayisi');
ylabel('Toplam musteriler');
title('10 dakika icinde gelen musterilerin histogrami');
%% Soru 2-e:
%ortalamasý 10 olan 1000 adet Poisson dagilimli rastgele sayi uretme
%islemi:
poisson=poissrnd(10,1,1000);
figure
histogram(poisson);
xlabel('Rastgele sayilarin degeri');
ylabel('Rastgele sayilarin sayisi');
title('Poisson Histagrami');

disp("Cizilen 2 histogramin karsilastirmasi:")
figure
subplot(1,2,1);
histogram(poisson);
subplot(1,2,2);
histogram(ondakika2);

%d ve e sikkinda bulunan histogramlar kod her calistirildiginda degismekle
%birlikte, birebir ayni olmasa da benzer ciktilar olarak gorulmektedir.

%% References:

%1) https://www.mathworks.com/matlabcentral/answers/2015-find-index-of-cells-containing-my-string

%2) https://www.mathworks.com/help/matlab/ref/mean.html

%3) https://www.mathworks.com/help/matlab/ref/std.html

%4 https://www.mathworks.com/help/matlab/ref/matlab.graphics.chart.primitive.histogram.html

%5) https://www.mathworks.com/matlabcentral/answers/353394-how-to-add-element-to-a-cell-array-struct-without-loop

%6) https://www.mathworks.com/help/matlab/ref/findstr.html

%7) https://www.mathworks.com/help/matlab/ref/cumsum.html

%8) https://www.mathworks.com/help/stats/exprnd.html

%9) https://www.mathworks.com/matlabcentral/answers/155348-how-do-you-find-the-index-of-the-first-true-value-in-a-logical-vector

%10) https://www.mathworks.com/help/stats/poissrnd.html


