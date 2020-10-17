defmodule Euler1 do
@max 1000
  def result, do: Enum.map(1..div(@max, 3), &(3 * &1)) ++ Enum.map(1..div(@max, 5), &(if rem(&1, 3) == 0, do: 0, else: 5 * &1)) |> Enum.sum
end


begin = System.monotonic_time(:nanosecond)
result = Euler1.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{fin - begin}")
