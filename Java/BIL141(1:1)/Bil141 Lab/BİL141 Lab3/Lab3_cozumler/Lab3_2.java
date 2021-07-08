
package lab3_2;
import java.util.Scanner;

public class Lab3_2 {

    public static void main(String[] args) {
        Scanner klavye=new Scanner(System.in);
        double x0,y0,r;
        System.out.print("Lutfen daire merkezinin x koordinatini giriniz: ");
        x0=klavye.nextDouble();
        System.out.print("Lutfen daire merkezinin y koordinatini giriniz: ");
        y0=klavye.nextDouble();
        System.out.print("Lutfen daire yaricap degerini giriniz: ");
        r=klavye.nextDouble();
        double x,y;
        x=Math.random()*(3*r)+x0-(1.5*r);
        y=Math.random()*(3*r)+y0-(1.5*r);
        double uzaklik=Math.sqrt(Math.pow((x-x0),2)+Math.pow((y-y0),2));
        
        if(uzaklik<=r){
            System.out.println("("+x+","+y+") noktasi dairenin icindedir.");        
        }
        else{
            System.out.println("("+x+","+y+") noktasi dairenin disindadir.");
        }
    }
    
}
