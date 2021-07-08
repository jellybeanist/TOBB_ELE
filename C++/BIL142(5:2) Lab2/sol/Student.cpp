#include <iostream>
#include "Student.h"
using namespace std;
 
Student::Student() : studentNo(1111111), midtermGrade(50), finalGrade(50){} 

Student::Student(int no, int midterm, int finall) : studentNo(no), midtermGrade(midterm), finalGrade(finall){}


int Student::getStudentNo() const{
   return studentNo;
}
int Student::getMidtermGrade() const{
   return midtermGrade;
}
int Student::getFinalGrade() const{
   return finalGrade;
}


double Student::computeYearEndGrade() const{
	double endGrade;
	endGrade = (0.4*midtermGrade)+(0.6*finalGrade);
	return endGrade;
}

Student CompareStudents(const Student& s1, const Student& s2){
	int ilk=s1.computeYearEndGrade();
	int ikinci=s2.computeYearEndGrade();
	if(ilk>ikinci)
		return s1;
	else if(ilk<ikinci)
		return s2;
	else
		if(s1.getFinalGrade()>=s2.getFinalGrade())
			return s1;
		else
			return s2;
}

