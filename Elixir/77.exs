defmodule Euler77 do
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
    [2 | tl(Enum.take_every(notPrimes, 2))]
  end

  def result do
    n = 10
    primes = genPrimes(n)
    IO.puts(Enum.join(primes, ","))
    Enum.join(Map.values(Enum.reduce(2..n, %{0 => 1, 1 => 0}, fn i, map ->
      Map.put(map, i, Enum.reduce_while(primes, 0, fn j, acc ->
        IO.puts("#{i} - #{j} = #{i - j} -> #{Map.get(map, i - j, 0)}")
        if i >= j do
          {:cont, acc + Map.get(map, i - j, 0)}
        else
          {:halt, acc}
        end
      end))
    end)), ",")
  end
end

#avg = Enum.reduce(0..30, 0, fn x, acc ->
#  begin = System.monotonic_time(:nanosecond)
#  _ = Euler77.result
#  fin = System.monotonic_time(:nanosecond)
#  if(x >= 1) do
#    (acc * (x - 1) + (fin - begin)) / x
#  else
#    0
#  end
#end)
begin = System.monotonic_time(:nanosecond)
result = Euler77.result
fin = System.monotonic_time(:nanosecond)
avg = fin - begin
IO.puts(to_string(result) <> "\ntook: " <> to_string(avg))
