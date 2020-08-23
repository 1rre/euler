defmodule Primes do
  def genPrimes(max) do
    k = trunc((max - 2) / 2)
    primes = Enum.reduce(1..k, [], fn v, acc ->
      acc ++ [v]
    end)
    Enum.each(1..k, fn i ->
      l = trunc((k - i) / (1 + 2 * i))
      Enum.each(i..l, fn j ->
        List.replace_at(primes, i + j + 2 * i * j - 1, 0)
      end)
    end)
    [2] ++ Enum.map(Enum.filter(primes, fn x -> x != 0 end), fn x -> x * 2 + 1 end)
  end
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

