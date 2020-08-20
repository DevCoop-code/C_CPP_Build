#include <iostream>
using namespace std;

class First
{
private:
    char* strOne;
public:
    First(char* str)
    {
        strOne = new char[strlen(str) + 1];
    }
    // ~First()
    // {
    //     cout<<"~First()"<<endl;
    //     delete[] strOne;
    // }        // Memory Leak 발생
    virtual ~First()
    {
        cout<<"~First()"<<endl;
        delete[] strOne;
    }
};

class Second: public First
{
private:
    char* strTwo;
public:
    Second(char* str1, char* str2): First(str1)
    {
        strTwo = new char[strlen(str2) + 1];
    }
    ~Second()
    {
        cout<<"~Second"<<endl;
        delete[] strTwo;
    }
};

int main(void)
{
    First* ptr = new Second("simple", "complex");
    delete ptr;     // Memory Leak 발생
    return 0;
}