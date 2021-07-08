#include <stdlib.h>
#include <iostream>
#include <string>
using namespace std;

//A�a��da bir ba�l� liste(linkedlist) veri yap�s� i�in s�n�f aray�zleri verilmi�tir.
// Her �ye fonksiyonun yan�nda yorum olarak ��renci numaras� ile ilgili kriter belirlenmi�tir
// !!! Sadece ��renci numaran�z�n son rakam�n�n belirtildi�i �ye fonksiyonlar� implement etmeniz beklenmektedir.

// Sizden istenen fonksiyonlar d���ndakilerin zaten var oldu�unu farzedip kendi fonksiyonlar�n�zda kullanabilirsiniz.
// Yard�mc� olacaksa bu listede olmayan, ek ba�ka fonksiyonlar yazabilirsiniz.

// Buraya Ad Soyad ve ��renci Numaran�z�n tamam�n� yaz�n�z: Burak Can KARAKURT - 161201049

class listnode
{
public:
    string s;
    int count;
    listnode *next;
    listnode *prev;
    listnode();  // 0,2,4,6,8
//soru 1
    listnode(const string & ss, const int &c); //1,3,5,7,9
};

class mylist
{
public:
	// Default constructor
    mylist(); 
    
//soru 2
    //Destructor
    ~mylist();  //0,1,2,3,4,5,6,7,8,9

//soru 3
    //pointeri verilen d���m listenin eleman� ise True, de�ilse False d�nmeli.
    bool isElement(listnode* ptr);  //0,1,2,3,4,5,6,7,8,9

	//�lk konuma yeni d���m yerle�tirmeli
    void insertfront(const string &s, const int & c);  //0,1
    
	//Son konuma yeni d���m yerle�tirmeli
    void insertback(const string &s, const int & c);   //2,3
    
    //ptr ile g�sterilen d���m�n soluna yeni d���m olu�turmal�
    void insertbefore(listnode *ptr, const string &s, const int &c); //4,5
    
        //ptr ile g�sterilen d���m�n sa��na yeni d���m olu�turmal�
    void insertafter(listnode *ptr, const string &s, const int &c);  //6,7
    
//soru 4
    //pos index konumuna yeni d���m  olu�turmal�
    void insertpos(const int & pos, const string &s, const int &c);  //8,9

//soru 5
	//ilk d���m� d�nmeli
    listnode* front() const;  //0,9
    
	//Son d���m� d�nmeli
    listnode* back() const;   //1,8
    
    //listenin boyutunu d�nmeli
    int length() const;       //2,7
    
    //ilk eleman� listeden silmeli
    void removefront();       //3,6
    
    //son eleman� listeden silmeli
    void removeback();        //4,5

    mylist(const mylist & l);   //0,3,6

    mylist& operator=(const mylist  &l);  //1,4,7
    
//soru 6
    //pointer'i verilen d���mler e�er her ikisi de listede bulunuyorsa, yerleri de�i�tirilip True d�necek, de�ilse False.
    bool swap(listnode* ptr1, listnode* ptr2); //2,9

    //Pointer'i verilen d���mler e�er her ikisi de listede bulunuyorsa, A�a��daki i�lemler yap�l�p True d�necek, de�ilse False.
    //count1 ve s1 ilk d���m�n �ye alanlar�; count2 ve s2 ikinci d���m�n �ye alanlar� olmak �zere count1 += count2, ve s1+= s2 i�lemi yap�lacak.
    //Sonra ptr2'nin g�sterdi�i d���m silinecek.
    bool mergenodes(listnode* ptr1, listnode* ptr2);  //5,8


	////s parametresi, �ye alandaki s de�erine e�it olan bir d���m varsa onu bul ve d�nd�r
    listnode *search(const string &s); //0,5

    //count de�eri en b�y�k olan d���m� bul
    listnode *findmaxcount();   //1,6

    void remove(listnode * ptr);  //2,7
    

    //count de�eri en b�y�k olan d���m� sil
    void removemaxcount();  //3,8

//soru 7
    //s parametresi, �ye alandaki s de�erine e�it olan bir d���m varsa de�erini 1 art�r. Yoksa False d�n.
    bool searchandinc (const string &s);  //4,9



private:
    listnode *head;
    listnode *tail;
    int size;
};

//cevap 1
listnode::listnode(const string &ss, const int &c){
	s=ss;
	count=c;
	next=NULL;
	prev=NULL;
}

//cevap 2
mylist::~mylist(){
	listnode *current=head;
	while(current !=0){
		listnode* next= current -> next;
		delete current;
		current = next;
	}
	head=0;
	}

//cevap 3
bool mylist::isElement(listnode* ptr){
	listnode* temp = head;
	while(temp!=NULL){
		if(temp=ptr){
			return true;
		}
		else{
			temp=temp->next;
		}
	}
	return false;
}

//cevap 4
void mylist::insertpos(const int & pos, const string &s, const int &c){
	listnode* newptr=createnode(s,c);
	listnode* temp=head;
	
	for(int i=0;i<pos-1;i++){
		temp=temp->next;
	}
	newptr->next=temp;
	newptr->prev=temp->prev;
	newptr->next->prev=newptr;
	newptr->prev->next=newptr;
	size++;
	return;
}

//cevap 5
listnode* mylist::front()const{
return head;
}

//cevap 6
bool mylist::swap(listnode* ptr1, listnode* ptr2){
		listnode* tempptr;
		listnode *temp1,*temp2;
		int check1=0;
		int check2=0;
		
		for(tempptr=head;tempptr!=NULL;tempptr=tempptr->next){
			if(tempptr==ptr1){
				check1=1;
				temp1=tempptr->next;
				break;
			}
		}
		for(tempptr=head;tempptr!=NULL;tempptr=tempptr->next){
			if(tempptr==ptr2){
				check2=1;
				temp2=tempptr->next;
				break;
			}
		}
		
		if(check1==1 && check2==1){
			ptr1->prev=ptr2->prev;
			ptr2->prev=temp1;
			ptr2->next=ptr1->next;
			ptr1->next=temp2;
			return true;
		}
		else
			return false;
}



//cevap 7
bool mylist::searchandinc (const string &s){
	listnode* temp=head;
	while(temp!=NULL){
		if(temp->s==s){
			temp->count++;
			return true;
		}
		else
			temp=temp->next;
	}
	return false;
}

//soru olarak yok yeni bir method tanimladim. insert islemi icin kullanacagim. herhangi bir sinifa ait de�il.
	listnode* createnode(const string&ss, const int&c){
	listnode* newnode;
	newnode=new listnode(ss,c);
	return newnode;
}


int main(void) {
	return 0;
}


