
package lab02_cozumleri;

import java.util.*;

public class Lab02_cozumleri {
public static void main(String[] args) {
Scanner k = new Scanner(System.in);
/*
***********************************************************************
---------------        BIL 141 LAB II Cozumleri          --------------
***********************************************************************

***********************************************************************
+++++   SORU-1      ++++++
*/
//while(true){   //-> Bonus Satiri
/*
System.out.println("Yapmak istediginiz islem nedir?");
System.out.print("'Toplama','Cikarma','Carpma','Bolme' ... ");

String islem = k.next();
k.nextLine();
if(islem.equals("Toplama")||islem.equals("Cikarma")||islem.equals("Carpma")||islem.equals("Bolme")){
double girdi1,girdi2,sonuc;
System.out.print("Lutfen islem yapilacak ilk sayiyi giriniz: ");
girdi1 = k.nextDouble();
k.nextLine();
System.out.print("Lutfen islem yapilacak ikinci sayiyi giriniz: ");
girdi2 = k.nextDouble();
k.nextLine();
if(islem.equals("Toplama")){
sonuc = girdi1+girdi2;
}else if(islem.equals("Cikarma")){
sonuc = girdi1-girdi2;
}else if(islem.equals("Carpma")){
sonuc = girdi1*girdi2;
}else{
sonuc = girdi1/girdi2;
}
System.out.println("Secilen islem: "+islem+" Sonuc: "+sonuc);
}else{
System.out.println("Tanimlanamayan girdi. Islem sonlandirildi.");
}
*/
/*
**************************************************************
------------------BONUS SORUSU 1------------------------------
**************************************************************
*/
/*
System.out.println("Devam etmek istiyor musunuz?(e/h)");
String ans = k.next();
if(ans.equals("e")){
System.out.println("Islemlere devam ediliyor...");
}else if(ans.equals("h")){
System.out.println("Isteginiz uzerine islemler sonlandirildi...");
break;
}else{
System.out.println("Tanimlanamayan girdi. Islem sonlandirildi.");
break;
}
}
*/

/*
***********************************************************************
+++++   SORU-2      ++++++
*/
/*
double result;
System.out.println("Lutfen bir x sayisi giriniz: ");
double x = k.nextDouble();
System.out.println("Lutfen bir y sayisi giriniz: ");
double y = k.nextDouble();
if(x<=2&&y<=-1){
result = Math.max((x-5)/(double)(y-1),(y+1)/(double)(3-x));
}else if(x>2&&y<=-1){
result = -Math.pow(x, y*Math.PI);
}else if(x<=2&&y>-1){
result = -Math.abs(Math.sqrt(3)*y-x/2.0);
}else{
result = Math.sqrt(2*x+y);
}
System.out.println("x: "+x+" y: "+y+" icin sonuc: "+result);
*/

/*
***********************************************************************
+++++   SORU-3      ++++++
*/

double para;
System.out.print("Cekmek istediginiz para miktarini giriniz: ");
para = k.nextDouble();
int intPara = (int)para,ikiyuz,yuz,elli,yirmi,on,bes,bir;
if(intPara==para){
//200 luk sayisi
ikiyuz = intPara/200;
// SUPER BONUS ICIN YORUMU KALDIRIN
/*
int K = 2;
ikiyuz = (int)Math.min(K, ikiyuz);
*/
intPara = intPara-ikiyuz*200;
// 100 luk sayisi
yuz = intPara/100;
// SUPER BONUS ICIN YORUMU KALDIRIN
/*
int M = 3;
yuz = (int)Math.min(M, yuz);
*/
intPara = intPara-yuz*100;
// 50 lik sayisi
elli = intPara/50;
intPara = intPara-elli*50;
// 20 lik sayisi
yirmi = intPara/20;
intPara = intPara-yirmi*20;
// 10 luk sayisi
on = intPara/10;
intPara = intPara-on*10;
// 5 lik sayisi
bes = intPara/5;
bir = intPara-bes*5;

if(ikiyuz !=0){
System.out.println(ikiyuz+" adet 200 TL'lik banknot");
}
if(yuz !=0){
System.out.println(yuz+" adet 100 TL'lik banknot");
}
if(elli !=0){
System.out.println(elli+" adet 50 TL'lik banknot");
}
if(yirmi !=0){
System.out.println(yirmi+" adet 20 TL'lik banknot");
}
if(on !=0){
System.out.println(on+" adet 10 TL'lik banknot");
}
if(bes !=0){
System.out.println(bes+" adet 5 TL'lik banknot");
}
if(bir !=0){
System.out.println(bir+" adet 1 TL'lik bozukluk verilecektir.");
}
}else{
System.out.println("SU ANDA SADECE TAMSAYILI PARALAR VEREBILIYORUM.");
}

}

}
