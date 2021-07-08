clear all
close all
clc

tic
%mevcut dosya konumunu alma, TestSounds klasorune girerek wav ve flac
%dosyalarini okuma kismi. 

%Bu kisim OS X kullanilarak yapildigi icin slashlerin farklilik gostermesi
%ihtimali vardir.

currentFolder = pwd; 
divide = strfind(currentFolder,'/');
currentFolder = currentFolder(1:divide(end)-1);
currentFolder = strcat(currentFolder,'/TestSounds'); 
currentFolder = strcat(currentFolder);
wavFiles = fullfile(currentFolder,'*.wav');
flacFiles = fullfile(currentFolder,'*.flac');
wavx = dir(wavFiles);
flacx = dir(flacFiles);
cd(currentFolder);

audioCount = size(wavx,1) + size(flacx,1); %toplam ses dosyasi sayisi

submissionVector=zeros(1,audioCount);%verilen kadýn-erkek icin 0-1 verisinin tutulacagi vektor.
%alttaki dongu, girmis oldugumuz wav dosyalarýnýn klasorunde wav dosyasi
%sayisi kadar donecek. 
 for x = 1:size(wavx,1)
    audInput = wavx(x).name; %isim alma sebebi hangi wav dosyasi ile islem yapilacak onu belirlemek. 
    %Ayni zamanda sonuc kisminda kadin-erkek sesi belirlenirken hangi wav dosyasi icin sonuc verildigini gostermek.
    [audio,Fs] = audioread(audInput);
    %wav dosyalari 2 adet side'dan olusuyor. left ve right side arasinda
    %fark oldukca az. ikisinin farkini cizdirdigimiz zaman 10^-3 gibi bir fark
    %olusuyor. Islem icin herhangi biri secilebilir.
% left=audio(:,1);
% plot(left);
% title('wav dosyasý sol kanal');
% figure;
%     right=audio(:,2);
%     plot(right);
%     title('wav dosyasý sag kanal');
%     figure;
%         plot(left-right);
%         title('sag-sol arasi fark');
%         figure;
    
y=size(audio,1);



delay1 = Fs/500;

delay2 = Fs/50;

r1=zeros(1,delay2+1);
r2=zeros(1,delay2+1);
%length(r1)%321
%length(r2)%321
%ms20%320

%tek taraf icin otokorelasyon yapma islemi. otokorelasyon yaparken,
%fonksiyonu konvolusyon yapar gibi kendisini onceki degeri ile carparak
%ilerliyoruz. 
for i = 1:delay2
   r1(i+1)=sum(audio(i+1:end).*audio(1:end-i));
end
plot (r1);
title('r1');
figure;
autocorr=zeros(1,2*(delay2)+1); %otokorelasyon sonucunu olusturacagimiz vektor.
%length(autocorr)%641
%r tek side icin corr, bunun simetrigini alip birbirine ekle ve autocorr
%isleminin sonucu bu vektor.

%r1in orijine gore simetrigini alma islemi.
for i = 1:delay2
    r2(i)=r1((delay2+1)-i);
end
plot (r2);
title('r2');
figure;
%r1 ve r2yi birlestirerek autocorr matrisini olusturma. bunu yapma
%amacimiz, otokorelasyon sonucu double sided olmali.
for i = 1:delay2
    autocorr(i)=r2(i);
end
for i = 1:delay2
    autocorr(delay2+i)=r1(i);
end

%autocorr matrisinin ilk elemani, sol bilesenden geliyor. O yüzden ilk
%degeri r2nin ilk degerine esitlemeliyiz.
autocorr(1)=r2(1);

%grafik icin gecikme araliginin belirlenmesi
delay = (-delay2:delay2)/Fs;

plot(delay, autocorr);

title('Otokorelasyon');
xlabel('Gecikme(sn)');
ylabel('Korelasyon katsayisi');

autocorr = autocorr(delay2 + 1 : 2*delay2+1);

[rmax, tx] = max(autocorr(delay1:delay2));

Fx = Fs/(delay1+tx-1);
Fth= 170; %% threshold yani esik frekansi belirleme islemi. Net bir bilgi olmamaklar birlikte
%bazi sitelerde kadin ve erkek sesi frekans araliklari yaziyor. 170 ikisini
%birbirinden ayirmak icin yeterli bir deger gibi gozuktugu icin
%secilmistir.

%esik degeri ve ciktimizi karsilastirarak sesin hangi cinsiyete ait
%oldugunu command windowa yazdirma.
if Fx > Fth
    sonuc = [audInput, ' kadin sesidir'];
    submissionVector(x) = 1;
    disp(sonuc)

else
    sonuc = [audInput, ' erkek sesidir'];
    disp(sonuc)

end

end


%Sorunun ikinci asamasi ise wav degil flac dosyalari icin ayni islemlerin
%yapilmasi.
%Farklari ise flac dosyalarinda left-right ayrimi yok, tek bir kanaldan
%olusuyor.


for x = 1:size(flacx,1)
    audInput = flacx(x).name;
    [audio,Fs] = audioread(audInput);
    audioLength=length(audio);
    
delay1 = Fs/500;

delay2 = Fs/50;

r1=zeros(1,delay2+1);
r2=zeros(1,delay2+1);
r1(1)= sum(audio.*audio);
%length(r1)%321
%length(r2)%321
%ms20%320
for i = 1:delay2
   r1(i+1)=sum(audio(i+1:end).*audio(1:end-i));
end
%plot (r1);
%title('r1');
%figure;

autocorr=zeros(1,2*(delay2)+1);

for i = 1:delay2
    r2(i)=r1((delay2+1)-i);
end
% plot (r2);
% title('r2');
% figure;
for i = 1:delay2
    autocorr(i)=r2(i);
end
for i = 1:delay2
    autocorr(delay2+i)=r1(i);
end
autocorr(1)=r2(1);

delay = (-delay2:delay2)/Fs;

plot(delay, autocorr);

title('Otokorelasyon');

xlabel('Gecikme(sn)');

ylabel('Korelasyon katsayisi');

autocorr = autocorr(delay2 + 1 : 2*delay2+1);

[rmax, tx] = max(autocorr(delay1:delay2));

Fx = Fs/(delay1+tx-1);

Fth= 170;

if Fx > Fth
    sonuc = [audInput, ' kadin sesidir'];
    submissionVector(x+size(wavx,1)) = 1;
    disp(sonuc)
else
    sonuc = [audInput, ' erkek sesidir'];
    disp(sonuc)
end
end

toc
