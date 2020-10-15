defmodule Primes do
  def genPrimes(max) do
    k = trunc((max - 2) / 2)
    notPrimes = Enum.reduce(1..k, [1], fn i, primes ->
      Enum.reduce(i..k, primes, fn j, primes ->
        if i + j + 2 * i * j <= k do
          [2 * (i + j + 2 * i * j) + 1 | primes]
        else
          primes
        end
      end)
    end)
    Enum.reject(1..max, fn x -> rem(x, 2) == 0 && x != 2 || Enum.member?(notPrimes, x) end)
  end
def genNotPrimes(max) do
  k = trunc((max - 2) / 2)
  notPrimes = Enum.reverse([1 | tl(Enum.sort(Enum.uniq(Enum.reduce(1..k, [], fn i, primes ->
    [2 * i | Enum.reduce(i..k, primes, fn j, primes ->
      if i + j + 2 * i * j <= k do
        [2 * (i + j + 2 * i * j) + 1 | primes]
      else
        primes
      end
    end)]
  end))))])
end
avg = Enum.reduce(0..30, 0, fn x, acc ->
  begin = System.monotonic_time(:nanosecond)
  _ = Euler_78.result
  fin = System.monotonic_time(:nanosecond)
  if(x >= 1) do
    (acc * (x - 1) + (fin - begin)) / x
  else
    0
  end
end)
IO.puts(to_string(result) <> "\ntook: " <> to_string(avg))
