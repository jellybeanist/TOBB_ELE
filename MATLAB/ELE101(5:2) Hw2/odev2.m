%%  Soru 2:
%%txbits bize verilmis olmali.
%%L=length(txbits) bilgisi de biliniyor olacak.
%%Yorum kisminda kendi denemelerimi yapmak amaciyla arrayler olusturacagim.
%%Bu soruda kullandigim mantik, elimizde varolan txbits arrayini kullanarak
%%bastaki sayilari txbits icindeki degerlerle dolduracak, 6 ile modunu alip
%%kalan kisma gereken sayi kadar sonuna 0 ekleyecek bir islem yaparak daha
%%sonra bu arrayin tersini almak. En son tersi alinan bu arrayi 6li parcalara
%%bölerek yazdirmak.

%%Asagidaki L degeri degistirilerek olusturulan arrayler kontrol
%%edilebilir.
%%L = 102;
L = 97;

txbits=rand(1,L);
newArray = reshape([txbits zeros(1,(mod(-length(txbits),6)))]',[6,ceil((length(txbits)/6))]);


%%  Soru 3
%%SNR degerlerinin bulundugu array keyfi olusturulmustur istenen sekilde
%%degistirilebilir. limited arrayi icinde 10-15DB arasindaki degerlerin
%%bulundugu indexler tutulmustur. Yazdirilmistir ancak workspace icinde de
%%gorulebilir.

%%Denemek icin asagidaki satir yorumdan cikarilmalidir veya yeni bir array
%%olusturulmalidir.
%%SNRarray=[20 30 40 14 25 32 27 29 18 17 11 13];
limited = find((SNRarray>10)&(SNRarray<15));


%%  Soru 4
%%Asagidaki x degiskenine istenen deger verilerek ciftler adli arrayde
%%istenen cevap bulunabilir. Yazdirmasi icin sonuna ";" koymadim. 
%%Workspace icinde de gorulebilir.

%%Denemek icin asagidaki satir yorumdan cikarilmalidir veya yeni bir array
%%olusturulmalidir.
%%x = 123;
ciftler = (2:2:x)