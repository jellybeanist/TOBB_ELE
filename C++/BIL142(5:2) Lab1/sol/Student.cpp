//Xcode Version 9.2 (9C40b) kullaniyorum.
//Burak Can KARAKURT - 161201049
#include <iostream>
#include "Student.h"
using namespace std;

Student::Student():studentNo(0),midtermGrade(0),finalGrade(0){}

Student::Student(const int& no,const double& mt,const double& fin):studentNo(no),midtermGrade(mt),finalGrade(fin){}

Student::~Student() {
    cout<<"Destructor running for Student "<<studentNo<<endl;
}

const int Student::getStudentNo()const{
    return studentNo;
}
const double Student::getMidtermGrade()const{
    return midtermGrade;
}
const double Student::getFinalGrade()const{
    return finalGrade;
}


double Student::computeYearEndGrade(){
    double endGrade;
    endGrade = (0.4*midtermGrade)+(0.6*finalGrade);
    return endGrade;
}

//year end grade hesabindan sonra eger esit cikarsa final notu yüksek olani döndürecek.
Student CompareStudents(Student& s1, Student& s2){
    double ilk=s1.computeYearEndGrade();
    double ikinci=s2.computeYearEndGrade();
    if(ilk>ikinci)
        return s1;
    else if(ikinci>ilk)
        return s2;
    else{
        if(s1.getFinalGrade()>=s2.getFinalGrade())
            return s1;
        else
            return s2;
    }
}
