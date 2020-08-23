defmodule Ptest do
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
end

IO.puts(Enum.join(Ptest.genPrimes(1000), "\n"))
