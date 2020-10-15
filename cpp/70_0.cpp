#include <map>
#include <iostream>
#include <chrono>
#include <ctime>
#include <vector>

using namespace std;

const vector<int> genPrimes (const int max) {
  const int k = (max - 2) / 2;
  bool primeBools [max];
  for (int i = 0; i < max; i++) {
    primeBools[i] = i % 2 != 1 || i == 1;
  }
  primeBools[0] = false;
  for (int i = 1; i <= k; i++) {
    for(int j = i; i + j + 2 * i * j <= k; j++) {
      primeBools[2 * (i + j + 2 * i * j)] = false;
    }
  }
  vector<int> primes;
  for(int i = 0;  i < max; i++) {
    if (primeBools[i]) {
      primes.push_back(i + 1);
    }
  }
  return primes;
}

using namespace chrono;

int main() {
  auto start = high_resolution_clock::now();
  genPrimes(100);
  auto end = high_resolution_clock::now();
  auto time = duration_cast<nanoseconds>(end - start).count();
  cout<<"took: " << time<<endl;
}