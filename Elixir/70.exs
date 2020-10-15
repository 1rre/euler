defmodule Euler70 do
  def filterle(list, n) do
    Enum.take_while(list, fn x -> x <= n end)
  end

  def genPrimes(max) do
    k = trunc((max - 2) / 2)
    notPrimes = Enum.reduce(1..k, Enum.to_list(1..max), fn i, primes ->
      Enum.reduce(i..k, primes, fn j, primes ->
        if i + j + 2 * i * j <= k do
          List.delete_at(primes, 2 * (i + j + 2 * i * j) + 1)
        else
          primes
        end
      end)
    end)
    [2 | Enum.take_every(notPrimes, 2)]
  end

  def primeFactors(n, primes, pfMap) do
    Map.put(pfMap, n, cond do
      n == 1 -> []
      List.last(primes) == n -> [n]
      true ->
        divisor = Enum.find(primes, 1, fn x -> rem(n, x) == 0 end)
        [divisor | Map.get(pfMap, div(n, divisor))]
    end)
  end

  def phi(x, pf) do
    trunc(Enum.reduce(Enum.uniq(pf), x, fn y, acc ->
      acc * (1 - 1 / y)
    end))
  end

  def result do
    n = 100000
    primes = genPrimes(n)
    0
    #IO.puts("PrimesDone")
    #pfMap = Enum.reduce(2..n, %{}, fn x, pfMap ->
    #  primeFactors(x, Enum.take_while(primes, fn y -> y <= x end), pfMap)
    #end)
    #x = Enum.min_by(Enum.filter(Enum.map(pfMap, fn {x, pf} -> {x, phi(x, pf)} end), fn {x, y} -> Enum.sort(Integer.digits(x)) == Enum.sort(Integer.digits(y)) end), fn {x, y} -> x / y end)
    #elem(x, 0) / elem(x, 1)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler70.result
fin = System.monotonic_time(:nanosecond)
IO.puts(to_string(result) <> "\ntook: " <> to_string(fin - begin))
