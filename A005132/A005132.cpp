#include<iostream>
#include<vector>

using namespace std;

int main()
{
    const size_t vs = 200<<20;
    vector<char> v(vs);
    int value = 0;
    int index = 1;
    v[0] = 1;

    while(index < 20132014)
    {
        if((value - index) > 0 && !v[value - index])
        {
            value -= index;
        }
        else
        {
            value += index;
            if(value >= vs)
            {
                cout << "vector too small " << index << endl;
                return 0;
            }
        }
        index++;
        v[value] = 1;
    }

    cout << value << endl;
    return 0;
}
