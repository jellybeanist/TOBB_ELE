class Student {

	friend Student CompareStudents(const Student& s1, const Student& s2);


private:
   const int studentNo;
   const int midtermGrade;
   const int finalGrade;

 
public:
   Student();
   Student(int no, int midterm, int finall);
   
   int getStudentNo() const;
   
   int getMidtermGrade() const;
   
   int getFinalGrade() const;
   
   double computeYearEndGrade() const;   
};
