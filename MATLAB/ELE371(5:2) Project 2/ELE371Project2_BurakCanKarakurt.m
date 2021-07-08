%ELE371 Proje 2 - Burak Can KARAKURT
%% 1-a
zaman = linspace(-2.50,2.50,500); %0.01 artisla -2.5, 2.5 arasinda 500 noktalik vektor olusturalim.
 
xt = [linspace(0.5,0,50),... %-2.5 ve -2 arasinda lineer azalan 50 nokta.
        zeros(1,100),...        %-2 ve -1 arasi 0'a esit 100 nokta.
            ones(1,100),...   %-1 ve 0 arasi 1'e esit 100 nokta.
                linspace(1,0,100),...   %0 ve 1 arasi lineer azalan 100 nokta.
                    zeros(1,100),...        %1 ve 2 arasi 0'a esit 100 nokta.
                        ones(1,50)];    %2 ve 2.5 arasi 1'e esit 50 nokta.
%Olusturulan xt vektoru grafikten cikarilmistir. Vektorlerin esit olmasi
%icin lineer artip azalan veya sifira esit olan vektorlerin toplanmasiyla
%500 noktali bir buyuk xt vektoru olusturulmustur.
 
plot(zaman, xt)
grid on
xlabel ('zaman')
ylabel('x(t)')
title ('x(t) fonksiyonu')
%Proje foyunde verilen sekilde cizdirme islemi yapilmistir.
 
 
%% 1-b
zaman = linspace(-2.50,2.50,500); %yukarida tanimlanan zaman vektoru.
a0=1/2; %teorik olarak hesaplanan a0. hesaplama rapora eklenecek!
tuma0=(a0*ones(1,500)); %verilen zaman boyunca sabit olan a0 degeri.
plot(zaman,tuma0);
xlabel ('zaman')
ylabel('a0')
title ('DC kisim')
 
%% 1-c
k = 1:15;
w = 2*pi/3; %acisal frekans
ak = 2*((sin(k*w)./k*w)+((1-cos(k*w))./(k.^2*w^2)))/3; %el ile hesaplandi.
for i = 1:2:9
    plot(a0+ak(i)*cos(i*w*zaman));
    hold on %ust uste cizdir
end
legend('k=1','k=3','k=5','k=7','k=9')
 
%% 2-a
x = (-5:0.01:5); %verilen zaman araligi. 1001 noktali.
y = sinc(x).*sinc(x); %MATLAB'da hazir bulunan sinc fonksiyonu.
plot(x,y)
xlabel ('Zaman(t)')
ylabel('sinc^2(t)')
title ('Hazir sinc^2(t) fonksiyonu')
grid on
figure
sinc2t = (sin(pi*x).*sin(pi*x))./((pi*x).*(pi*x)); %teorik olarak verilen sinc fonksiyonu.
sinc2t(501)=1; %tepe degerini el ile girmemiz gerekiyor. 0'da sinusun aldigi degerle alakali olarak.
plot(x,sinc2t)
xlabel ('Zaman(t)')
ylabel('sinc^2(t)')
title ('sin(pi*x)*sin(pi*x))./((pi*x)*(pi*x) seklindeki sinc^2(t) fonksiyonu')
axis=[-8,8,-0.1,1.2];
grid on
figure
plot(y-sinc2t)
xlabel ('Zaman(t)')
ylabel('sinc^2(t) fonksiyonlari arasindaki fark')
title ('sinc^2(t) - sin^2(pi*t)/(pi*t)^2 ')
%% 2-b
 
%F[x1(t)x2(t)]=(1/2.pi)[X1(w)*X2(w)], *=convolution oldugunu biliyoruz.
%F[x1(t)]=F[x2(t)]=y2b=rectangularPulse.
zaman = (-5:0.01:5);
zaman2 = (-10:0.01:10); %verilen zaman araligi. 
y2b = rectangularPulse(-pi,pi,zaman); %sinc fonksiyonunun fourier donusumu. tabloyu rapora ekle!
figure
plot(zaman,y2b);
xlim=([-8 8]); %eksen araliklarini sabitleyelim.
ylim=([-0.1 1.2]); 
xlabel('Frekans') %x ekseni zaman 
ylabel ('F\{sinc(t)\}') %y ekseni sinc(t) fonksiyonu
title ('F\{sinc(t)\} grafigi')
grid on
 
y2bconvy2b=conv(y2b,y2b); %sinc*sinc konvolusyon islemi.
sinc2ft=y2bconvy2b*(1/2*pi); %konvolusyon sonucunun 1/2pi ile bolunmus hali istenen donusumu verecek.
figure
plot(zaman2,sinc2ft);
xlim=([-8 8]); %eksen araliklarini sabitleyelim.
ylim=([-0.1 1.2]); 
xlabel('Frekans') %x ekseni zaman 
ylabel ('F\{sinc^2(t)\}') %y ekseni sinc(t) fonksiyonu
title ('F\{sinc^2(t)\} grafigi')
grid on
 
 
%% 3
w=-10:0.1:10; 
W=(2);
for j=1:length(w)
if ((w(j))<W & (w(j))>0 ) tri(j)=(1-(w(j)/2));
elseif ((w(j))>-W & (w(j))<=0) tri(j)=(1+(w(j)/2));
else
tri(j)=0;
end
end
 
h=10*sinc(5*w/(pi));
 
figure;
plot(w,tri);
title('F\{sinc(t)^2\}'); 
xlabel('w (pi)'); 
ylabel('genlik');
grid on;
figure
plot(w,h);
%fourier of rect.
title('10sinc(10w/2*pi)');
xlabel('w (pi)'); 
ylabel('genlik');
grid on;
 
%tnin fourier donusumunu matlabda yazamadigim icin konvolusyon islemini
%yapamadim.
 
%% 4-a
%rapora eklemeyi unutma:
%fft fonksiyonu: fast fourier transform
%Y?= fft(X)?fast fourier transform algoritmasini kullanarak X?in ayrik zamanli fourier donusumunu hesaplar.
%Eger x bir vektorse fft bu vektorun fourier donusumunu verir.
%Y?= fft(X, n)?n noktali fast fourier transformu hesaplar.
%Eger n degeri belirtilmediyse Y ile X ayni uzunluktadir.
%Eger X bir vektor ve uzunlugu n sayisindan kucuk ise sondaki noktalar 0 ile doldurulur.
%fftshift fonksiyonu:
%fftshift(X), fft sonucunun sifir frekans bilesenini dizinin ortasina kaydirir. 
 
time = linspace(-5,5,1001); %-5 5 araliginda 1001 noktali vektor olarak zaman
sinc2 = sinc(time).^2; %sin^2c(t) fonksiyonu
rect = rectangularPulse(-5,5,time); %rect fonksiyonu
y = sinc2.*time.*rect;
N = 4096;
freq = (-N/2:N/2-1)/N; %-fsden fsye kadar
A1 = abs(fft(y,N)); % fourier transform
A2 = fftshift(A1); % vektoru ortalamak icin
plot(freq,A2);
xlabel('Frekans') %x ekseni zaman 
ylabel ('F\{tsinc^2(t)rect(t)\}') %y ekseni sinc(t) fonksiyonu
title ('N = 4096 icin F\{tsinc^2(t)rect(t)\} grafigi') % grafigi
 
%% 4-b
N = 1024; 
freq = (-N/2:N/2-1)/N; %-fsden fsye kadar
A1 = abs(fft(y,N)); % fourier transform
A2 = fftshift(A1); % vektoru ortalamak icin
figure
plot(freq,A2);
xlabel('Frekans') %x ekseni zaman 
ylabel ('F\{tsinc^2(t)rect(t)\}') %y ekseni sinc(t) fonksiyonu
title ('N = 1024 icin F\{tsinc^2(t)rect(t)\} grafigi') % grafigi
N = 512;
freq = (-N/2:N/2-1)/N; %-fsden fsye kadar
A1 = abs(fft(y,N)); % fourier transform
A2 = fftshift(A1); % vektoru ortalamak icin
figure
plot(freq,A2);
xlabel('Frekans') %x ekseni zaman 
ylabel ('F\{tsinc^2(t)rect(t)\}') %y ekseni sinc(t) fonksiyonu
title ('N = 512 icin F\{tsinc^2(t)rect(t)\} grafigi') % grafigi
N = 256;
freq = (-N/2:N/2-1)/N; %-fsden fsye kadar
A1 = abs(fft(y,N)); % fourier transform
A2 = fftshift(A1); % vektoru ortalamak icin
figure
plot(freq,A2);
xlabel('Frekans') %x ekseni zaman 
ylabel ('F\{tsinc^2(t)rect(t)\}') %y ekseni sinc(t) fonksiyonu
title ('N = 256 icin F\{tsinc^2(t)rect(t)\} grafigi') % grafigi
N = 128;
freq = (-N/2:N/2-1)/N; %-fsden fsye kadar
A1 = abs(fft(y,N)); % fourier transform
A2 = fftshift(A1); % vektoru ortalamak icin
figure
plot(freq,A2);
xlabel('Frekans') %x ekseni zaman 
ylabel ('F\{tsinc^2(t)rect(t)\}') %y ekseni sinc(t) fonksiyonu
title ('N = 128 icin F\{tsinc^2(t)rect(t)\} grafigi') % grafigi
