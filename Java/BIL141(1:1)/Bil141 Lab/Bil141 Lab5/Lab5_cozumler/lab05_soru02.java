/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab05;

import java.util.Scanner;

/**
 *
 * @author admin
 */
public class lab05_soru02 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner k = new Scanner(System.in);
        while(true){
            double toplam=0;
            System.out.print("Lütfen bir N giriniz: ");
            int N = k.nextInt();
            if(N<0) break;
            for(int i=0;i<=N;i++)
                toplam+=4*Math.pow(-1,i)/(2.0*i+1.0);
            System.out.println(N+" için pi sayısı: "+toplam);
        }
        //BONUS KISMI
        double hata,toplam=0;
        int counter=0;
        do{
            toplam+=4*Math.pow(-1,counter)/(2.0*counter+++1.0);
            hata = Math.abs((Math.PI-toplam)/Math.PI);
        }while(hata>Math.pow(10,-6));
        System.out.println("Milyonda bir hata için gereken N değeri "+counter);
        }
    
}
