#include <stdlib.h>
#include <iostream>
#include <string>
using namespace std;

//Aþaðýda bir baðlý liste(linkedlist) veri yapýsý için sýnýf arayüzleri verilmiþtir.
// Her üye fonksiyonun yanýnda yorum olarak öðrenci numarasý ile ilgili kriter belirlenmiþtir
// !!! Sadece Öðrenci numaranýzýn son rakamýnýn belirtildiði üye fonksiyonlarý implement etmeniz beklenmektedir.

// Sizden istenen fonksiyonlar dýþýndakilerin zaten var olduðunu farzedip kendi fonksiyonlarýnýzda kullanabilirsiniz.
// Yardýmcý olacaksa bu listede olmayan, ek baþka fonksiyonlar yazabilirsiniz.

// Buraya Ad Soyad ve Öðrenci Numaranýzýn tamamýný yazýnýz: Burak Can KARAKURT - 161201049

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
    //pointeri verilen düðüm listenin elemaný ise True, deðilse False dönmeli.
    bool isElement(listnode* ptr);  //0,1,2,3,4,5,6,7,8,9

	//Ýlk konuma yeni düðüm yerleþtirmeli
    void insertfront(const string &s, const int & c);  //0,1
    
	//Son konuma yeni düðüm yerleþtirmeli
    void insertback(const string &s, const int & c);   //2,3
    
    //ptr ile gösterilen düðümün soluna yeni düðüm oluþturmalý
    void insertbefore(listnode *ptr, const string &s, const int &c); //4,5
    
        //ptr ile gösterilen düðümün saðýna yeni düðüm oluþturmalý
    void insertafter(listnode *ptr, const string &s, const int &c);  //6,7
    
//soru 4
    //pos index konumuna yeni düðüm  oluþturmalý
    void insertpos(const int & pos, const string &s, const int &c);  //8,9

//soru 5
	//ilk düðümü dönmeli
    listnode* front() const;  //0,9
    
	//Son düðümü dönmeli
    listnode* back() const;   //1,8
    
    //listenin boyutunu dönmeli
    int length() const;       //2,7
    
    //ilk elemaný listeden silmeli
    void removefront();       //3,6
    
    //son elemaný listeden silmeli
    void removeback();        //4,5

    mylist(const mylist & l);   //0,3,6

    mylist& operator=(const mylist  &l);  //1,4,7
    
//soru 6
    //pointer'i verilen düðümler eðer her ikisi de listede bulunuyorsa, yerleri deðiþtirilip True dönecek, deðilse False.
    bool swap(listnode* ptr1, listnode* ptr2); //2,9

    //Pointer'i verilen düðümler eðer her ikisi de listede bulunuyorsa, Aþaðýdaki iþlemler yapýlýp True dönecek, deðilse False.
    //count1 ve s1 ilk düðümün üye alanlarý; count2 ve s2 ikinci düðümün üye alanlarý olmak üzere count1 += count2, ve s1+= s2 iþlemi yapýlacak.
    //Sonra ptr2'nin gösterdiði düðüm silinecek.
    bool mergenodes(listnode* ptr1, listnode* ptr2);  //5,8


	////s parametresi, üye alandaki s deðerine eþit olan bir düðüm varsa onu bul ve döndür
    listnode *search(const string &s); //0,5

    //count deðeri en büyük olan düðümü bul
    listnode *findmaxcount();   //1,6

    void remove(listnode * ptr);  //2,7
    

    //count deðeri en büyük olan düðümü sil
    void removemaxcount();  //3,8

//soru 7
    //s parametresi, üye alandaki s deðerine eþit olan bir düðüm varsa deðerini 1 artýr. Yoksa False dön.
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

//soru olarak yok yeni bir method tanimladim. insert islemi icin kullanacagim. herhangi bir sinifa ait deðil.
	listnode* createnode(const string&ss, const int&c){
	listnode* newnode;
	newnode=new listnode(ss,c);
	return newnode;
}


int main(void) {
	return 0;
}


