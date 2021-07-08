
Mevcut dosya konumunu alarak, TestSounds klasorune girerek wav ve flac
dosyalarini okuyorum

Donguyle dosyadaki toplam ses dosyasi sayisini aliyorum.

Verilen kadın-erkek icin 0-1 verisinin tutulacagi bir vektor olusturuyorum.

Aynı sekilde isimleri de tutuyorum. Bunun sebebi hangi wav-flac dosyasi ile islem yapilacak onu belirlemek ve ayni zamanda sonuc kisminda kadin-erkek sesi belirlenirken hangi wav-flac dosyasi icin sonuc verildigini gostermek.

wav dosyalari 2 adet side'dan olusuyor. left ve right side arasinda
fark oldukca az. ikisinin farkini cizdirdigimiz zaman 10^-3 gibi bir fark olusuyor. Islem icin herhangi biri secilebilir. flac icin bu durum farkli, sadece tek bir kanali oldugundan herhangi bir ayrim yapmamiza gerek yok.

Dosyalari aldiktan sonra yapilmasi gereken islem temel frekansi bulmak icin ses dosyasini otokorelasyona sokmak. (otokorelasyon yaparken, fonksiyonu konvolusyon yapar gibi kendisini onceki degeri ile carparak ilerliyoruz).


Tek taraf icin otokorelasyon yaparak sonrasinda bunun orijine simetrigini alip birbirine ekliyoruz ve isleminin sonucunu otokorelasyon vektoru olarak kaydediyoruz. Bunun sebebi ise otokorelasyon isleminin sonucu double sided olmali.
Iki matrisi birbirine ekledikten sonra olusan buyuk matrisin ilk elemani sol taraftaki matristen geliyor. O yüzden ilk elemani soldaki ilk elemana esitliyoruz.

Sonucu cizdirmek icin gecikme araligi (sn) belirleyerek korelasyon katsayisinin gecikmeye gore cizdiriyoruz.


Daha sonra ses dosyasinin otokorelasyon sonucunda bulunan temel frekans degerini cevirerek belirlenen threshold yani esik frekansi ile karsilastirip, sesin hangi cinsiyete ait oldugunu belirliyoruz. Mutlak bir bilgi olmamakla birlikte bazi sitelerde kadin ve erkek sesi frekans araliklari yaziyor. 170 ikisini birbirinden ayirmak icin yeterli bir deger gibi gozuktugu icin esik olarak secilmistir.

Esik degeri ve cikti karsilastirarak sesin hangi cinsiyete ait oldugu command windowa yazdiriliyor ve submission vectore kaydediliyor. 

