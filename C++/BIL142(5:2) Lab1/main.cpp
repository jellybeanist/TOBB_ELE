//
//  main.cpp
//  bil142lab1
//
//  Created by Burak Can  KARAKURT on 3.02.2021.
//  Copyright © 2021 Burak Can  KARAKURT. All rights reserved.
//

#include <iostream>
using namespace std;
//friend function. bu kisim duzgun calismiyor. yoruma alip kalan kisimlari kontrol ettim.
//void CompareStudents(Student x, Student y){
//    if (x.computeYearEndGrade>y.computeYearEndGrade)
//        cout<<"ilk ogrenci daha yuksek puan toplamistir"<<endl;
//    if (x.computeYearEndGrade<y.computeYearEndGrade)
//        cout<<"ikinci ogrenci daha yuksek puan toplamistir"<<endl;
//    if (x.computeYearEndGrade==y.computeYearEndGrade)
//        cout<<"iki ogrenci esit puan toplamistir"<<endl;
//}

//class tanimlamasini burada yaptim. member fields ve functions tanimladim.
class Student{
public:
    Student(int sn, int mg, int fg);
    int getStudentNo(void);
    void setStudentNo(int sn);
    int getMidtermGrade(void);
    void setMidtermGrade(int mg);
    int getFinalGrade(void);
    void setFinalGrade(int fg);
    double computeYearEndGrade(void);
    ~Student(void);
    
private:
    int studentNo;
    int midtermGrade;
    int finalGrade;
};

Student::Student(int sn, int mg, int fg){
    studentNo=sn;
    midtermGrade=mg;
    finalGrade=fg;
}



//asagida fonksiyonlarin icini doldurdum. get fonksiyonlari bir islem yapmayacak, direkt olarak deger dönecek.
//set fonksiyonlari ise giristeki degeri sinif icinde tanimlanmis haliyle o degiskene atayacak. bu degisken private oldugu icin onemli.
//computeYearEndGrade ise double tipinde bir not dönecek. bu notu karsilastirma icin kullanacagim.
int Student::getStudentNo(void){
    return studentNo;
}

void Student::setStudentNo(int sn){
    studentNo=sn;
}

int Student::getMidtermGrade(void){
    return midtermGrade;
}

void Student::setMidtermGrade(int mg){
    midtermGrade=mg;
}

int Student::getFinalGrade(void){
    return finalGrade;
}

void Student::setFinalGrade(int fg){
    finalGrade=fg;
}

double Student::computeYearEndGrade(void){
    return (0.4*midtermGrade)+(0.6*finalGrade);
}

Student::~Student(void){
    
}


int main() {
    //2 tane student objesi olusturdum. iclerini numara,midterm ve final notlariyla doldurdum. deneme amacli yazdim. set get fonksiyonlarim var ancak tek tek yazmak yerine bu sekilde alarak ilerledim.
    Student s1(161201049,80,55);
    Student s2(151201049,90,40);
    
    double note1,note2;
    note1=s1.computeYearEndGrade();
    note2=s2.computeYearEndGrade();
    cout<<note1<<endl;
    cout<<note2;
    return 0;
}


