defmodule Euler87 do
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
  def result do
    n = 50000000
    primes = genPrimes(trunc(:math.sqrt(n)))
    Enum.count(Enum.reduce(primes, %{}, fn i, acc ->
      Enum.reduce_while(primes, acc, fn j, acc ->
        if i * i + j * j * j <= n do
          {:cont, Enum.reduce_while(primes, acc, fn k, acc ->
            x = i * i + j * j * j + k * k * k * k
            cond do
              x <= n -> {:cont, Map.put_new(acc, x, false)}
              true -> {:halt, acc}
            end
          end)}
        else
          {:halt, acc}
        end
      end)
    end))
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler87.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
