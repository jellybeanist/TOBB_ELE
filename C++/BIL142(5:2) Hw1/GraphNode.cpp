#include <iostream>
using namespace std;

class GraphNode{
private:
    int id;
    GraphNode *neighborNodes[5];
public:
    GraphNode(const int &id_item);
    GraphNode operator+(const GraphNode &rhs);
    void idSetter(const int &sayi);
    int idGetter(void);
    bool setNeighborNode(GraphNode &n);
    bool deleteNeighborNode(GraphNode &n);
    GraphNode* getNeighborAtIndex(int &index);
};

int main()
{
    GraphNode n1(1),n2(2),n3(3),n4(4);
    n1.setNeighborNode(n3);
    n2.setNeighborNode(n4);
    n3.setNeighborNode(n4);
    n4.setNeighborNode(n1);
    n3.setNeighborNode(n1);

    GraphNode n5(5);
    n5=n1+n2;

    GraphNode *graphnodes[]={&n1,&n2,&n3,&n4,&n5};
    for(int i=0;i<5;i++){
        for(int j=0;j<5;j++){
            if(graphnodes[i]->getNeighborAtIndex(j)!=NULL)
            cout<<graphnodes[i]->idGetter()<<"->"<<graphnodes[i]->getNeighborAtIndex(j)->idGetter()<<endl;
        }
    }
}

GraphNode::GraphNode(const int &id_item){
    id=id_item;
}

GraphNode GraphNode::operator+(const GraphNode &rhs){
    GraphNode temp(-1);
    for(int i=0;i<5;i++){
        temp.setNeighborNode(*neighborNodes[i]);
        temp.setNeighborNode(*rhs.neighborNodes[i]);
    }
    return temp;
}

void GraphNode::idSetter(const int &sayi){
    id=sayi;
}

int GraphNode::idGetter(void){
    return id;
}

bool GraphNode::setNeighborNode(GraphNode &n){
    for(int i=0;i<5;i++){
        if(neighborNodes[i]==&n)
            return false;
    }
    for(int i=0;i<5;i++){
        if(neighborNodes[i]==NULL){
            neighborNodes[i]=&n;
            return true;
        }
    }
    return false;
}

bool GraphNode::deleteNeighborNode(GraphNode &n){
    for(int i=0;i<5;i++){
        if(neighborNodes[i]==&n){
            neighborNodes[i]=NULL;
            return true;
        }
    }
    return false;
}

GraphNode* GraphNode::getNeighborAtIndex(int &index){
    if(neighborNodes[index]!=NULL)
        return neighborNodes[index];
}

