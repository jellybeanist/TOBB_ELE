% ELE371 Proje 1

% y(n)=2*y(n-1)+3*y(n-2)+x(n-1)+x(n-2);

%% 1. Soru
% Teorik hesaplamada h[n] = -(1/4)*(-1)^n + (1/4)*(3)^n olarak bulunmustur.
% MATLAB'da 0. index olmadigi icin h(0), h(1) olarak gozukecektir.
% 2. soruyla uyum saglayabilmek icin n 3'ten baslatilmistir.
% Bunun sebebi 2. soruda anlatilmistir.
% Teorik h[n]=h1[n].
h1=zeros(1,51);
for n=1:49
    h1(n+2)=-(1/4)*(-1)^n + (1/4)*(3)^n;
end
grid on
stem(h1)
xlabel('Impulse response h[n]');
ylabel('n values');
title('Question 1');

%% 2. Soru

% h(n)=impulse(n)
% Array indexleri MATLAB'da negatif veya 0 olamaz.
% Fark denklemlerinde input non-zero olana kadar output 0 olarak kabul
%edilir. Yani impulse fonksiyonu sifirdan farkli olana kadar y degerleri
%sifir olacaktir. impulse, yalnizca n=0 degerinde MATLAB'da sifir indexi
%tanimli olmadigi icin impulse yalnizca n=1 degerinde 1 olacaktir. Bu da
% y(1)'den onceki y degerleri sifira esit olacaktir anlamina gelmektedir.

%(n-2) sifirdan buyuk olmak zorunda oldugu icin, ilk basta hesaplanmasi
%gereken y(1) degeri grafikte ve arrayde 1 birim saga kaymis olarak
%gozukmektedir. 0<=n<=50 icin islem yapacagimizdan, 1 birim saga kayan
%cikis degerleri 1<=n<=51 icin yapilmistir. 

% y(0), MATLAB'da y(1)'e takabul etmektedir. 1 birim de saga kaydigi icin
% y(0) array icerisinde y(2) olarak tutulmaktadir.
% y(-1) array icerisinde y(1) olarak tutulmaktadir ve degeri 0 olacaktir.
% Bu islemler sonucunda y(2) hesaplanmalidir ancak MATLAB'da y(0) indexi
% yoktur. El ile yapilan hesaplamadan y(0) degeri yani MATLAB'daki y(2)
% degeri 0 olarak bulunmustur. Bu deger el ile girilmelidir.
% y2(n)=h[n].

y2=zeros(1,51);
y2(2)=0;
impulse=zeros(1,51);
impulse(1)=1;
x2=impulse;

for n=3:51
y2(n)=2*y2(n-1)+3*y2(n-2)+x2(n-1)+x2(n-2); 
end
% Karisikligi ortadan kaldirmak ve ilk soruyla indexleri karsilastirabilmek
% adina y arrayi 1 birim sola kaydirilmistir. Array icindeki y(3), eskiden
% teorik y(1)'e denk gelmekteyken bu islem sonucu arraydeki y(1) teorik
% y(0)'a ve arraydeki y(2) teorik y(1)'e denk olacaktir.
yn=circshift(y2,-1);
yn(end)=[];
figure;
grid on
stem(y2)
ylabel('Output y2[n]');
xlabel('n values');
title('y2[n]=h[n]');

figure
hold on
stem(y2,'r','*');
stem(h1);
hold off
ylabel('Output h[n]');
xlabel('n values');
title('h[n] by hand over h[n] recursive ');

figure
plot(y2-h1);
ylabel('Difference');
xlabel('n values');
title('Difference between y[n] and h[n]');

%% 3. Soru
% 3 ve 4. sorudaki fonksiyon x[n] = u[n] + cos(20*pi*n)'dir.
% Kolayca gorulecegi uzere, cos(20*pi*n) n'in her tamsayi degerinde
% periyodik olmasi sebebiyle 1'e esit olacaktir.
% Dolayisiyle x[n]=2 n>=0 denebilir.

% y(1), teorik olarak hesaplanan y(0)'a denktir.
% u(n), pozitif her deger icin zaten 1 olacaktir.
y3=zeros(1,101);
u=ones(1,102);
for n=0:100
    y3(n+1)=(3^n)-u(n+1);
end
figure
grid on
stem(y3)
ylabel('Output y[n]');
xlabel('n values');
title('Question 3');

%% 4. Soru
u=ones(1,101);
x4=zeros(1,101);
y4=zeros(1,101);

for n=1:101
    x4(n)=u(n)+cos(20*pi*n);
end
% Buradaki y4 soru olarak sorulmamistir. Recursive hesap yaparak cikmasi
% gereken sonuca dogru ulasip ulasmadigimi kontrol ettim. Sonuc ayni cikti.
y4(1)=0;
y4(2)=2;
for n=3:101
y4(n)=2*y4(n-1)+3*y4(n-2)+x4(n-1)+x4(n-2);
end

% a = y[n] - 2y[n-1] - 3y[n-2]
% b = 0x[n] + x[n-1] + x[n-2]
% x4 = x[n] = u[n] + cos(20*pi*n);
a=[1 -2 -3];
b=[0 1 1];
Z=filter(b,a,x4);

figure;
grid on
stem(y2)
ylabel('"filter" output y[n]');
xlabel('n values');
title('Z=y[n]');

figure
hold on
stem(y3,'r','*');
stem(Z);
hold off
ylabel('Output y[n]');
xlabel('n values');
title('y[n] by hand over y[n] by filter command ');

figure
plot(Z-y3);
ylabel('Difference');
xlabel('n values');
title('Difference between y[n] by hand and y[n] by filter command');

%% 5. Soru
for n=1:101
    x4(n)=u(n)+cos(20*pi*n);
end
ycnv=conv(h1,x4);
figure
stem(ycnv);
title('Convolution of x[n] and h[n]');
xlim([0 100])

%% 6. Soru
hfir=y2(1:15);
fhfir=fft(hfir);
fshfir=fftshift(hfir);
fy2=fft(y2);
fsy2=fftshift(y2);

figure
subplot(2,1,1);
plot(fhfir)
title('Fourier Transform of hfir[n] with fft and fftshift');
subplot(2,1,2)
plot(fshfir)

figure
subplot(2,1,1);
plot(fy2)
title('Fourier Transform of h[n] with fft and fftshift');
subplot(2,1,2)
plot(fsy2)
