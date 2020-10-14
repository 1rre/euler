#include <map>
#include <iostream>
#include <chrono>
#include <ctime>
#include <vector>
#include <algorithm>

using namespace std;

const vector<int> genPrimes (const int max) {
  const int64_t k = (max - 2) / 2;
  vector<bool> primeBools;
  primeBools.resize(k, true);
  primeBools[0] = false;
  for (int64_t i = 1; i <= k; i++) {
    for(int64_t j = i; i + j + 2 * i * j <= k; j++) {
      primeBools[i + j + 2 * i * j] = false;
    }
  }
  vector<int> primes = {2};
  for(int i = 0;  i < k; i++) {
    if (primeBools[i]) {
      primes.push_back(2 * (i) + 1);
    }
  }
  return primes;
}

void primeFactors(const int& n, const vector<int>& primes, vector<vector<int>>& pfMap) {
  if (binary_search(primes.begin(), primes.end(), n)) {
    pfMap[n] = {n};
  } else {
    int divisor;
    for(auto x : primes) {
      if (n % x == 0) {
        divisor = x;
        break;
      }
    }

    pfMap[n] = pfMap[n / divisor];
    if(!binary_search(pfMap[n].rbegin(), pfMap[n].rend(), divisor)) {
      pfMap[n].push_back(divisor);
    }
  }
}


using namespace chrono;

int main() {
  int n = 100000;

  auto start = high_resolution_clock::now();
  auto primes = genPrimes(n);
  vector<vector<int>> pf;
  pf.resize(n + 1);
  pf[1] = {};
  int cnt = 0;
  for(int i = 2; i <= n; i++) {
    if(i % 1000 == 0) cout<<i<<"\n";
    primeFactors(i, primes, pf);
    for(int j = 1; j < i; j++) {
      auto& pfi = pf[i];
      auto& pfj = pf[j];
      if(find_first_of(pfi.begin(), pfi.end(), pfj.begin(), pfj.end()) == pfi.end()) cnt++;
    }
  }
  auto end = high_resolution_clock::now();
  auto time = duration_cast<milliseconds>(end - start).count();
  cout<<cnt<<endl;
  cout<<"took: " << time<<endl;
}