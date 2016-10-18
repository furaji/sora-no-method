#include <iostream>

class 天体
{
public:
    void メソッド() {
        std::cout << "天体のメソッド" << std::endl;
    }
};

int main()
{
    天体 天体;
    天体.メソッド();
}
