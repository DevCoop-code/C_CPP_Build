#include <iostream>
#include <cstring>
using namespace std;

class SelfRef {
private:
    int num;
public:
    SelfRef(int n) : num(n) {
        cout<<"객체 생성"<<num<<endl;
    }
    SelfRef& Adder(int n) {
        num+=n;
        return *this;   // *this는 객체 자신의 포인터가 아닌 객체 자신을 반환하겠다는 의미
        // SelfRef& 으로 반환한다는건 객체 자신을 참조할 수 있는 참조의 정보가 반환됨
    }
    SelfRef& ShowTwoNumber() {
        cout<<num<<endl;
        return *this;
    }
};

int main(void) {
    SelfRef obj(3);
    SelfRef &ref = obj.Adder(2);

    obj.ShowTwoNumber();
    obj.ShowTwoNumber();

    ref.Adder(1).ShowTwoNumber().Adder(2).ShowTwoNumber();

    return 0;
}