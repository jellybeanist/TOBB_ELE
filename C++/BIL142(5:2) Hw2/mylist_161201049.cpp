//Burak Can KARAKURT - 161201049
//CodeBlocks kullandım.
#include <stdlib.h>
#include <iostream>
#include <string>
using namespace std;

class listnode
{
public:
 string s;
 int count;
 listnode *next;
 listnode *prev;
 listnode();
 listnode(const string & ss, const int &c);
};

class mylist
{
public:

 mylist();

 ~mylist();

 bool isElement(listnode* ptr);
 void insertfront(const string &s, const int & c);
 void insertback(const string &s, const int & c);
 void insertbefore(listnode *ptr, const string &s, const int &c);
 void insertafter(listnode *ptr, const string &s, const int &c);
 void insertpos(const int & pos, const string &s, const int &c);

 listnode* front() const;
 listnode* back() const;
 int length() const;

 void removefront();
 void removeback();

 mylist(const mylist & l);   //0,3,6
 mylist& operator=(const mylist  &l);  //1,4,7

 bool swap(listnode* ptr1, listnode* ptr2);
 bool mergenodes(listnode* ptr1, listnode* ptr2);
 listnode *search(const string &s);
 listnode *findmaxcount();
 void remove(listnode * ptr);
 void removemaxcount();
 bool searchandinc (const string &s);

private:
 listnode *head;
 listnode *tail;
 int size;
};

listnode* createnode(const string& ss,const int &c){           //creates a new node and returns pointer to that node
    listnode* newnode;
    newnode=new listnode(ss,c);

    return newnode;
}

listnode::listnode(){
    next=NULL;
    prev=NULL;
    count=0;
    s="node";
}

listnode::listnode(const string & ss, const int &c){
    s=ss;
    count=c;
    next=NULL;
    prev=NULL;
}

mylist::mylist(){
    head=NULL;
    tail=NULL;
    size=0;
}

mylist::~mylist(){
    listnode *current=head;

    while( current != 0 ) {
    listnode* next = current->next;
    delete current;
    current = next;
    }

    head = 0;
}

bool mylist::isElement(listnode* ptr){
    listnode* temp=head;

    while(temp!=NULL){
        if(temp==ptr){
            return true;
        }
        else{
            temp=temp->next;
        }
    }
    return false;
}

void mylist::insertfront(const string &s, const int & c){
    listnode* newptr=createnode(s,c);
    if(head==NULL){     //if no node
        head=newptr;
        tail=newptr;
        size++;
    }
    else{
        newptr->next=head;
        head->prev=newptr;
        head=newptr;
        size++;
    }
    return;
}

void mylist::insertback(const string &s, const int & c){
    listnode* newptr=createnode(s,c);
    if(head==NULL){     //if no node
        head=newptr;
        tail=newptr;
        size++;
    }
    else{
        newptr->prev=tail;
        tail->next=newptr;
        tail=newptr;
        size++;
    }
    return;
}

void mylist::insertbefore(listnode *ptr, const string &s, const int &c){
    listnode* temp=head;
    while(temp!=NULL){
        if(temp==ptr){
            listnode* newptr=createnode(s,c);
            newptr->next=temp;
            newptr->prev=temp->prev;
            newptr->prev->next=newptr;
            newptr->next->prev=newptr;
            size++;
        }
        else{
            temp=temp->next;
        }
    }
    cout<<"unable to insert"<<endl;
    return;
}

void mylist::insertafter(listnode *ptr, const string &s, const int &c){
    listnode* temp=head;
    while(temp!=NULL){
        if(temp==ptr){
            listnode* newptr=createnode(s,c);
            newptr->next=temp->next;
            newptr->prev=temp;
            newptr->prev->next=newptr;
            newptr->next->prev=newptr;
            size++;
        }
        else{
            temp=temp->next;
        }
    }
    cout<<"unable to insert"<<endl;
    return;
}

void mylist::insertpos(const int& pos, const string& s, const int& c){

    listnode* newptr=createnode(s,c);
    listnode* temp=head;

    if(temp==NULL){     //if there is no node
        head=newptr;
        tail=newptr;
        return;
    }

    if(pos==0){                             //inserting to starting point
        newptr->next=head;
        newptr->next->prev=newptr;
        head=newptr;
        size++;
    }
    else if(pos<size){

        for(int i=0;i<pos-1;i++){
            temp=temp->next;
        }

        newptr->next=temp;
        newptr->prev=temp->prev;
        newptr->next->prev=newptr;
        newptr->prev->next=newptr;
        size++;
    }
    else if(pos==size){                 //inserting to end of list
        newptr->prev=tail;
        tail->next=newptr;
        tail=newptr;
        size++;
    }
    else{
        cout<<"unable to insert"<<endl;
        return;
    }
    return;
}

listnode* mylist::front()const{
    return head;
}

listnode* mylist::back()const{
    return tail;
}

int mylist::length()const{
    return size;
}

void mylist::removefront(){
    if(head==NULL){
        cout<<"unable to remove"<<endl;
    }
    else{
        listnode* temp=head;
        head=head->next;
        delete temp;
        size--;
    }
}

void mylist::removeback(){
    if(tail==NULL){
        cout<<"unable to remove"<<endl;
    }
    else{
        listnode* temp=tail;
        tail=tail->prev;
        delete temp;
        size--;
    }
}

mylist::mylist(const mylist & l){
    listnode* temp1=NULL; //current
    listnode* temp2=NULL; //next

    if(l.head==NULL)
        head=NULL;
    else{
        head=new listnode;
        head->s=l.head->s;
        head->count=l.head->count;
        temp1=head;
        temp2=l.head->next;
    }

    while(temp2!=NULL){
        insertafter(temp1,temp2->s,temp2->count);
        temp2=temp2->next;
        temp1=temp1->next;
    }
    size=l.size;
}


mylist& mylist::operator=(const mylist  &l){
    head=l.head;
    tail=l.tail;
    size=l.size;
}

bool mylist::swap(listnode* ptr1, listnode* ptr2){

    listnode* tempptr;
    listnode *temp1,*temp2;
    int check1=0;
    int check2=0;

    for(tempptr=head;tempptr!=NULL;tempptr=tempptr->next){
        if(tempptr==ptr1){
            check1=1;
            temp1=tempptr->prev;
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

bool mylist::mergenodes(listnode* ptr1, listnode* ptr2){
    if(isElement(ptr1)==false && isElement(ptr2)==false)
        return false;
    else{
        ptr1->count=ptr1->count+ptr2->count;
        ptr1->s=ptr1->s+ptr2->s;

        listnode* temp=ptr2;
        temp=temp->prev;
        temp->next=ptr2->next;
        ptr2->next->prev=temp;
        delete ptr2;
        size--;
    }
}

listnode* mylist::search(const string& s){
    listnode* temp=head;
    while(temp!=NULL){
        if(temp->s==s){
            return temp;
        }
        temp=temp->next;
    }
    return NULL;
}

listnode* mylist::findmaxcount(){
    listnode* temp=head;
    listnode* largest=head;
    while(temp!=NULL){
        if(temp->count>largest->count){
            largest=temp;
        }
        temp=temp->next;
    }
    return NULL;
}

void mylist::remove(listnode * ptr){
    listnode* temp=ptr->prev;
    temp->next=ptr->next;
    ptr->next->prev=temp;
    delete ptr;
    size--;
}

void mylist::removemaxcount(){
    listnode* temp=findmaxcount();
    remove(temp);
}

bool mylist::searchandinc(const string& s){

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


int main(){
return 0;
};
