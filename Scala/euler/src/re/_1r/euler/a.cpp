int main()
{
  pairInt::pairOfInts x = pairInt(2, 3).values
  cout<<x.sum<<endl
  class pairInt(int a, int b) 
  {
    class int1(int a)
    {
      int1& operator+(int2 b)
      {
        return b + a;
      }
      //I cba doing the << operator but imagine it does the same
    }
    class int2(int a)
    {
      int1& operator+(int b)
      {
        return b + a;
      }
    }
    class pairOfInts(int1 a, int2 b)
    {
      int1 sum()
      {
        return a + b;
      }
    }
    pairOfInts values = pairOfInts(a, b);
    pairOfInts operator[]()
    {
      return values;
    }
  }
}