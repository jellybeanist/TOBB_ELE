class Student {
    
    friend Student CompareStudents(Student& s1,Student& s2);
    
    
private:
    const int studentNo;
    const double midtermGrade;
    const double finalGrade;
    
    
public:
    Student();
    Student(const int& no,const double& mt,const double& fin);
    ~Student();
    
    const int getStudentNo()const;
    
    const double getMidtermGrade()const;
    
    const double getFinalGrade()const;
    
    double computeYearEndGrade();
};
