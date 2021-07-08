//  XCode kullaniyorum. 
//  Dogru calismiyor hocam. Gec katildim, bitiremeyecegim icin bu haliyle yüklüyorum.
//  Burak Can KARAKURT - 161201049
//  main.cpp
//  bil142lab7
//
//  Created by Burak Can  KARAKURT on 24.03.2021.
//  Copyright © 2021 Burak Can  KARAKURT. All rights reserved.
//

#include <iostream>
#include <string>
using namespace std;

class Vehicle {
private:
  Vehicle(const char * type) {
  }

  ~Vehicle() {
  }
};

class Brand : Vehicle{
private:
  Brand(const char *brand) : Vehicle(type) {
  }
  ~Brand() {
  }
};

class Model : Brand{
private:
  Model(const char *model, int speed, int price) : Brand (brand,type){
  }
    
  ~Model() {
  }
};

int main()
{   
    Model deneme;
    deneme.model="ModelS"
    deneme.speed=250;
    deneme.price=250000;
    deneme.brand="tesla"
    deneme.type="electric"
    cout<<"Hello World";

    return 0;
}