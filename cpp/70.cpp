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

void primeFactors(const int& n, const vector<int>& primes, map<int, vector<int>>& pfMap) {
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

int phi(double x, map<int, vector<int>>& pf) {
  for(double n : (pf[x])) {
    x *= 1 - 1 / n;
  }
  return x;
}

bool isPermulation(const int& i, const int& j) {
  auto js = to_string(j);
  auto is = to_string(i);
  return is_permutation(is.begin(), is.end(), js.begin());
}

using namespace chrono;

int main() {
  auto start = high_resolution_clock::now();
  auto primes = genPrimes(10000000);
  map<int, vector<int>> pf;
  pf[1] = {};
  tuple<int, int, double> best = make_tuple(0, 0, 1e303);
  for(int i = 2; i < 10000000; i++) {
    primeFactors(i, primes, pf);
    int phi_i = phi(i, pf);
    if((double) i / phi_i < get<2>(best) && isPermulation(i, phi_i)) {
      best = {i, phi_i, (double) i / phi_i};
    }
  }
  auto end = high_resolution_clock::now();
  auto time = duration_cast<nanoseconds>(end - start).count();
  cout<<get<0>(best)<<"\n";
  cout<<"took: " << time<<endl;
}