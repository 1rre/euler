defmodule Euler92 do
  def addSquare(x) do
    case Enum.reduce(Integer.digits(x), 0, fn v, acc -> acc + v * v end) do
      1 -> false
      89 -> true
      y -> addSquare(y)
    end
  end
  def result do
    Enum.reduce(1..10000000, 0, fn v, acc ->
      if addSquare(v) do
        acc + 1
      else
        acc
      end
    end)
  end
end


begin = System.monotonic_time(:nanosecond)
result = Euler92.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
