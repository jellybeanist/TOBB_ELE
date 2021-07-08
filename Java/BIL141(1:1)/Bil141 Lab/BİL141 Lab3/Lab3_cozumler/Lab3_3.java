//package deney03;

import java.util.Scanner;


public class Lab3_3 {

	public static void main(String[] args) {
		Scanner k = new Scanner(System.in);
		System.out.println("Lutfen yapmak istediginiz islemi yaziniz : ");
		String giris = k.next();
		double sonuc = 0,sayi1,sayi2;
		int index = -1;
		char islem = ' ';
		// BONUS KISMI ICIN GEREKEN KISIMLAR YORUMLA BELIRTILMISTIR...
		// -------> BONUS BASLANGIC <--------------
		String temp = giris;
		if(giris.charAt(0)=='-'){
			giris = giris.substring(1);
		}
		// -------> BONUS BITIS <--------------
		if(giris.contains("*")||giris.contains("+")||giris.contains("-")||giris.contains("/")){
			if(giris.contains("*")){
				index = giris.indexOf("*");
				islem = giris.charAt(index);
			}
			else if(giris.contains("+")){
				index = giris.indexOf("+");
				islem = giris.charAt(index);
			}
			else if(giris.contains("/")){
				index = giris.indexOf("/");
				islem = giris.charAt(index);
			}
			else if(giris.contains("-")){
				index = giris.indexOf("-");
				islem = giris.charAt(index);
			}
			sayi1 = Double.parseDouble(giris.substring(0, index));
			// -------> BONUS BASLANGIC <--------------
			if(temp.charAt(0)=='-'){
				sayi1=-sayi1;
			}
			// -------> BONUS BITIS <--------------
			sayi2 = Double.parseDouble(giris.substring(index+1));
			System.out.println("Belirlenen islem: "+islem+ "\nIlk sayi: "+sayi1+"\nIkinci sayi: "+sayi2);
			switch (islem){
			case '*':
				sonuc = sayi1*sayi2;
				break;
			case '+':
				sonuc = sayi1+sayi2;
				break;
			case '/':
				sonuc = sayi1/sayi2;
				break;
			case '-':
				sonuc = sayi1-sayi2;
				break;
			default:
				System.out.println("Uzgunuz. Bu islemi su an gerceklestiremiyoruz.");
			}
			System.out.println("Sonuc degeri: "+sonuc);
		}
		else{
			System.out.println("Hic islem bulunamamistir...");
		}
	}

}
