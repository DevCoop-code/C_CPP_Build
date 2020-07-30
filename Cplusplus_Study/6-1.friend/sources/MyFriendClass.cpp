#include <iostream>
#include <cstring>
using namespace std;

class Girl;     // Girl 이라는 이름의 클래스가 있음을 알림

class Boy {
private:
    int height;
    friend class Girl;
public:
    Boy(int len) : height(len) { }
    void ShowYourFriendInfo(Girl &frn);
};

class Girl {
private:
    char phNum[20];
public:
    Girl(char* num) {
        strcpy(phNum, num);
    }
    void ShowYourFriendInfo(Boy &frn);
    friend class Boy;
};

void Boy::ShowYourFriendInfo(Girl &frn) {
    cout<<"Her phone number: "<<frn.phNum<<endl;
}

void Girl::ShowYourFriendInfo(Boy &frn) {
    cout<<"His height: "<<frn.height<<endl;
}

int main(void) {
    Boy boy(180);
    Girl girl("xxx-xxxx-xxxx");
    boy.ShowYourFriendInfo(girl);
    girl.ShowYourFriendInfo(boy);

    return 0;
}