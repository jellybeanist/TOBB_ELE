/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab4_3;

public class Lab4_3 {
   
    public static void main(String[] args) {
        int sayac=1;
        int zar_1=0;
        int zar_2=0;
        int zar_3=0;
        int zar_4=0;
        int zar_5=0;
        int zar_6=0;
        int rand_sayi;
        while(sayac<=2100){
            rand_sayi=(int) Math.floor(Math.random()*21+1);
            switch(rand_sayi){
                case 1:case 2:case 3:case 4:case 5:case 6:
                    zar_1++;
                    break;
                case 7:case 8:case 9:case 10:case 11:
                    zar_2++;
                    break;
                case 12:case 13:case 14:case 15:
                    zar_3++;
                    break;
                case 16:case 17:case 18:
                    zar_4++;
                    break;
                case 19:case 20:
                    zar_5++;
                    break;
                case 21:
                    zar_6++;
                    break;
            }
            sayac++;
        }
        System.out.println("1 gelme sayisi: "+zar_1);
        System.out.println("2 gelme sayisi: "+zar_2);
        System.out.println("3 gelme sayisi: "+zar_3);
        System.out.println("4 gelme sayisi: "+zar_4);
        System.out.println("5 gelme sayisi: "+zar_5);
        System.out.println("6 gelme sayisi: "+zar_6);
        
    }
    
}
