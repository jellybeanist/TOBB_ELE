{\rtf1\ansi\ansicpg1254\cocoartf1504\cocoasubrtf840
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;\f1\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red0\green116\blue0;\red255\green255\blue255;\red100\green56\blue32;
\red196\green26\blue22;\red170\green13\blue145;\red0\green0\blue0;\red92\green38\blue153;\red63\green110\blue116;
\red28\green0\blue207;\red38\green71\blue75;\red46\green13\blue110;}
{\*\expandedcolortbl;;\csgenericrgb\c0\c45600\c0;\csgray\c100000;\csgenericrgb\c39100\c22000\c12500;
\csgenericrgb\c77000\c10200\c8600;\csgenericrgb\c66500\c5200\c56900;\csgenericrgb\c0\c0\c0;\csgenericrgb\c35900\c14900\c60100;\csgenericrgb\c24700\c43100\c45600;
\csgenericrgb\c11000\c0\c81000;\csgenericrgb\c14900\c27800\c29400;\csgenericrgb\c18100\c5200\c43100;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab543
\pard\tx543\pardeftab543\pardirnatural\partightenfactor0

\f0\fs22 \cf2 \cb3 //
\f1\fs24 \cf0 \

\f0\fs22 \cf2 //  main.cpp
\f1\fs24 \cf0 \

\f0\fs22 \cf2 //  bil142lab1
\f1\fs24 \cf0 \

\f0\fs22 \cf2 //
\f1\fs24 \cf0 \

\f0\fs22 \cf2 //  Created by Burak Can  KARAKURT on 3.02.2021.
\f1\fs24 \cf0 \

\f0\fs22 \cf2 //  Copyright \'a9 2021 Burak Can  KARAKURT. All rights reserved.
\f1\fs24 \cf0 \

\f0\fs22 \cf2 //
\f1\fs24 \cf0 \
\

\f0\fs22 \cf4 #include \cf5 <iostream>
\f1\fs24 \cf0 \

\f0\fs22 \cf6 using\cf7  \cf6 namespace\cf7  \cf8 std\cf7 ;
\f1\fs24 \cf0 \

\f0\fs22 \cf2 //friend function. bu kisim duzgun calismiyor. yoruma alip kalan kisimlari kontrol ettim.
\f1\fs24 \cf0 \

\f0\fs22 \cf2 //void CompareStudents(Student x, Student y)\{
\f1\fs24 \cf0 \

\f0\fs22 \cf2 //    if (x.computeYearEndGrade>y.computeYearEndGrade)
\f1\fs24 \cf0 \

\f0\fs22 \cf2 //        cout<<"ilk ogrenci daha yuksek puan toplamistir"<<endl;
\f1\fs24 \cf0 \

\f0\fs22 \cf2 //    if (x.computeYearEndGrade<y.computeYearEndGrade)
\f1\fs24 \cf0 \

\f0\fs22 \cf2 //        cout<<"ikinci ogrenci daha yuksek puan toplamistir"<<endl;
\f1\fs24 \cf0 \

\f0\fs22 \cf2 //    if (x.computeYearEndGrade==y.computeYearEndGrade)
\f1\fs24 \cf0 \

\f0\fs22 \cf2 //        cout<<"iki ogrenci esit puan toplamistir"<<endl;
\f1\fs24 \cf0 \

\f0\fs22 \cf2 //\}
\f1\fs24 \cf0 \
\

\f0\fs22 \cf2 //class tanimlamasini burada yaptim. member fields ve functions tanimladim.
\f1\fs24 \cf0 \

\f0\fs22 \cf6 class\cf7  Student\{
\f1\fs24 \cf0 \

\f0\fs22 \cf6 public\cf7 :
\f1\fs24 \cf0 \

\f0\fs22 \cf7     Student(\cf6 int\cf7  sn, \cf6 int\cf7  mg, \cf6 int\cf7  fg);
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf6 int\cf7  getStudentNo(\cf6 void\cf7 );
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf6 void\cf7  setStudentNo(\cf6 int\cf7  sn);
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf6 int\cf7  getMidtermGrade(\cf6 void\cf7 );
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf6 void\cf7  setMidtermGrade(\cf6 int\cf7  mg);
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf6 int\cf7  getFinalGrade(\cf6 void\cf7 );
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf6 void\cf7  setFinalGrade(\cf6 int\cf7  fg);
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf6 double\cf7  computeYearEndGrade(\cf6 void\cf7 );
\f1\fs24 \cf0 \

\f0\fs22 \cf7     ~Student(\cf6 void\cf7 );
\f1\fs24 \cf0 \

\f0\fs22 \cf7     
\f1\fs24 \cf0 \

\f0\fs22 \cf6 private\cf7 :
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf6 int\cf7  studentNo;
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf6 int\cf7  midtermGrade;
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf6 int\cf7  finalGrade;
\f1\fs24 \cf0 \

\f0\fs22 \cf7 \};
\f1\fs24 \cf0 \
\

\f0\fs22 \cf9 Student\cf7 ::Student(\cf6 int\cf7  sn, \cf6 int\cf7  mg, \cf6 int\cf7  fg)\{
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf9 studentNo\cf7 =sn;
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf9 midtermGrade\cf7 =mg;
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf9 finalGrade\cf7 =fg;
\f1\fs24 \cf0 \

\f0\fs22 \cf7 \}
\f1\fs24 \cf0 \
\
\
\

\f0\fs22 \cf2 //asagida fonksiyonlarin icini doldurdum. get fonksiyonlari bir islem yapmayacak, direkt olarak deger d\'f6necek.
\f1\fs24 \cf0 \

\f0\fs22 \cf2 //set fonksiyonlari ise giristeki degeri sinif icinde tanimlanmis haliyle o degiskene atayacak. bu degisken private oldugu icin onemli.
\f1\fs24 \cf0 \

\f0\fs22 \cf2 //computeYearEndGrade ise double tipinde bir not d\'f6necek. bu notu karsilastirma icin kullanacagim.
\f1\fs24 \cf0 \

\f0\fs22 \cf6 int\cf7  \cf9 Student\cf7 ::getStudentNo(\cf6 void\cf7 )\{
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf6 return\cf7  \cf9 studentNo\cf7 ;
\f1\fs24 \cf0 \

\f0\fs22 \cf7 \}
\f1\fs24 \cf0 \
\

\f0\fs22 \cf6 void\cf7  \cf9 Student\cf7 ::setStudentNo(\cf6 int\cf7  sn)\{
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf9 studentNo\cf7 =sn;
\f1\fs24 \cf0 \

\f0\fs22 \cf7 \}
\f1\fs24 \cf0 \
\

\f0\fs22 \cf6 int\cf7  \cf9 Student\cf7 ::getMidtermGrade(\cf6 void\cf7 )\{
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf6 return\cf7  \cf9 midtermGrade\cf7 ;
\f1\fs24 \cf0 \

\f0\fs22 \cf7 \}
\f1\fs24 \cf0 \
\

\f0\fs22 \cf6 void\cf7  \cf9 Student\cf7 ::setMidtermGrade(\cf6 int\cf7  mg)\{
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf9 midtermGrade\cf7 =mg;
\f1\fs24 \cf0 \

\f0\fs22 \cf7 \}
\f1\fs24 \cf0 \
\

\f0\fs22 \cf6 int\cf7  \cf9 Student\cf7 ::getFinalGrade(\cf6 void\cf7 )\{
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf6 return\cf7  \cf9 finalGrade\cf7 ;
\f1\fs24 \cf0 \

\f0\fs22 \cf7 \}
\f1\fs24 \cf0 \
\

\f0\fs22 \cf6 void\cf7  \cf9 Student\cf7 ::setFinalGrade(\cf6 int\cf7  fg)\{
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf9 finalGrade\cf7 =fg;
\f1\fs24 \cf0 \

\f0\fs22 \cf7 \}
\f1\fs24 \cf0 \
\

\f0\fs22 \cf6 double\cf7  \cf9 Student\cf7 ::computeYearEndGrade(\cf6 void\cf7 )\{
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf6 return\cf7  (\cf10 0.4\cf7 *\cf9 midtermGrade\cf7 )+(\cf10 0.6\cf7 *\cf9 finalGrade\cf7 );
\f1\fs24 \cf0 \

\f0\fs22 \cf7 \}
\f1\fs24 \cf0 \
\

\f0\fs22 \cf9 Student\cf7 ::~Student(\cf6 void\cf7 )\{
\f1\fs24 \cf0 \

\f0\fs22 \cf7     
\f1\fs24 \cf0 \

\f0\fs22 \cf7 \}
\f1\fs24 \cf0 \
\
\

\f0\fs22 \cf6 int\cf7  main() \{
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf2 //2 tane student objesi olusturdum. iclerini numara,midterm ve final notlariyla doldurdum. deneme amacli yazdim. set get fonksiyonlarim var ancak tek tek yazmak yerine bu sekilde alarak ilerledim.
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf9 Student\cf7  s1(\cf10 161201049\cf7 ,\cf10 80\cf7 ,\cf10 55\cf7 );
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf9 Student\cf7  s2(\cf10 151201049\cf7 ,\cf10 90\cf7 ,\cf10 40\cf7 );
\f1\fs24 \cf0 \

\f0\fs22 \cf7     
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf6 double\cf7  note1,note2;
\f1\fs24 \cf0 \

\f0\fs22 \cf7     note1=s1.\cf11 computeYearEndGrade\cf7 ();
\f1\fs24 \cf0 \

\f0\fs22 \cf7     note2=s2.\cf11 computeYearEndGrade\cf7 ();
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf8 cout\cf7 <<note1<<\cf12 endl\cf7 ;
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf8 cout\cf7 <<note2;
\f1\fs24 \cf0 \

\f0\fs22 \cf7     \cf6 return\cf7  \cf10 0\cf7 ;
\f1\fs24 \cf0 \

\f0\fs22 \cf7 \}
\f1\fs24 \cf0 \
\
\
}