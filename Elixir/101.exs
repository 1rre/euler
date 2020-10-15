defmodule Euler101 do
  # 1 - n + n² - n³ + n⁴ - n⁵ + n⁶ - n⁷ + n⁸ - n⁹ + n¹⁰
  def function(n) do
    1 -
    n +
    n * n -
    n * n * n +
    n * n * n * n -
    n * n * n * n * n +
    n * n * n * n * n * n -
    n * n * n * n * n * n * n +
    n * n * n * n * n * n * n * n -
    n * n * n * n * n * n * n * n * n +
    n * n * n * n * n * n * n * n * n * n
  end
  def op(x, func) do
    IO.puts("#{x}:")
    Enum.map(1..x - 1, fn v ->
      (Enum.at(func, v) - Enum.at(func, v - 1))
    end) |> Enum.join(",") |> IO.puts()
  end
  def result do
    mp = Enum.map(1..10, fn x -> function(x) end)
    Enum.each(2..10, fn x -> op(x, mp) end)
    0
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler101.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
