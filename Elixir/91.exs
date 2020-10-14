defmodule Euler91 do
  def result do
    n = 50

    Enum.reduce(1..div(n, 2), Enum.reduce(1..n, 0, fn x, acc ->
      Enum.reduce(1..n, acc, fn y, acc ->
        acc + 3
      end)
    end), fn x, acc ->
      Enum.reduce(1..div(n, 2), acc + 1, fn y, acc ->
        acc + 1
      end)
    end)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler91.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
