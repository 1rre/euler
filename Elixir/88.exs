defmodule Euler88 do
  def compareFineSums(v, n, last) do
    v = List.update_at(v, n, fn x ->
      if last do
        x + 1
      else
        x - 1
      end
    end)
    sum = Enum.sum(v)
    product = Enum.reduce(v, 1, fn v, acc -> acc * v end)
    #IO.puts("#{Enum.join(v, ",")}")
    #IO.puts("sum: #{sum}, product: #{product}, n: #{n}")
    cond do
      sum == product -> sum
      last && sum > product -> compareFineSums(v, n, true)
      last && n < Enum.count(v) - 1 && Enum.at(v, n + 1) > 1 -> compareFineSums(v, n + 1, false)
      Enum.at(v, n) > 1 && sum < product -> compareFineSums(v, n, false)
      Enum.at(v, 0) > 1 && n >= Enum.count(v) - 1 -> compareFineSums(v, 0, sum > product)
      Enum.count(v) - 1 <= n -> compareFineSums(v, 0, true)
      sum > product -> compareFineSums(v, n + 1, true)
      Enum.at(v, n + 1) > 1 -> compareFineSums(v, n + 1, false)
      true -> compareFineSums(v, n + 1, true)
    end
  end
  def compareSums(v, last) do
    sum = Enum.sum(v)
    product = Enum.reduce(v, 1, fn v, acc -> acc * v end)
    #IO.puts("#{Enum.join(v, ",")}")
    #IO.puts("sum: #{sum}, product: #{product}")
    cond do
      sum == product -> sum
      sum > product && last -> Enum.map(v, fn x -> x + 1 end) |> compareSums(true)
      last -> compareFineSums(v, 0, false)
      sum < product -> Enum.map(v, fn x -> x - 1 end) |> compareSums(false)
      true -> compareFineSums(v, 0, true)
    end
  end
  def result do
    n = 1200
    Enum.reduce(2..n, 0, fn x, acc ->
      IO.puts("x: #{x}")
      acc + compareSums(List.duplicate(1, x), true)
    end)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler88.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
