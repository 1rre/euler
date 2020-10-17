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

# Finds all the primes less than n
# It's faster to use this method than a sieve as Elixir has immutable data structures
# which means that a lot of lists have to be generated, increasing the time complexity
# beyond O()

def plt(n), do: [2 | Enum.reject(2..n - 1, fn n -> if n == 1, do: false, else: Enum.any?(2..ceil(:math.sqrt(n)), &(rem(n, &1) == 0)) end)]
