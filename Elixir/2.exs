defmodule Euler2 do
  def fib(sum, pre1, pre2) do
    current = pre1 + pre2
    cond do
      current > 4000000 -> sum
      rem(current, 2) == 0 -> fib(sum + current, current, pre1)
      true -> fib(sum, current, pre1)
    end
  end
  def result do
    fib(2, 2, 1)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler2.result
fin = System.monotonic_time(:nanosecond)
IO.puts(to_string(result) <> "\ntook: " <> to_string(fin - begin))
