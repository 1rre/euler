defmodule Euler6 do
  def intpow(x, n), do: if n <= 0, do: 1, else: x * intpow(x, n - 1)
  def result do
    (Enum.sum(1..100) |> intpow(2)) - Enum.reduce(1..100, &(&2 + &1 * &1))
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler6.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{fin - begin}")

#The algorithm works in an acceptable time, however we can use the formulae for sum of n and sum of n² to do it faster


defmodule Euler6_Alt do
  def intpow(x, n), do: if n <= 0, do: 1, else: x * intpow(x, n - 1)
  def result do
    (div(100 * 101, 2) |> intpow(2)) - div(100 * 101 * 201, 6)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler6_Alt.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{fin - begin}")
