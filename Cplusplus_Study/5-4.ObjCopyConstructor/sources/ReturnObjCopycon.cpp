#include <iostream>
using namespace std;

class SoSimple {
private:
    int num;
public:
    SoSimple(int n) : num(n) { }
    SoSimple(const SoSimple& copy) : num(copy.num) {
        cout<<"Called SoSimple(const SoSimple& copy)"<<endl;
    }
    SoSimple& AddNum(int n) {
        num += n;
        return *this;
    }
    void ShowData() {
        cout<<"num: "<<num<<endl;
    }
}