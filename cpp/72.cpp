#include <iostream>

int branch(int top, int m, int n)
{

    if(m <= top)
    {
        return 1 + branch(top, 2 * m - n, m) + branch(top, 2 * m + n, m) + branch(top, m + 2 * n, n);
    }
    else
    {
        std::cout<<n<<"/"<<m<<"\n";
        return 0;
    }
}

int main()
{
    int x = branch(1000000, 3, 1) + branch(1000000, 2, 1);
    std::cout<<"fin"<<std::endl;
    std::cout<<x<<"\n";
    return 0;
}