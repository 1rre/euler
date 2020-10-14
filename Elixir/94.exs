#too much memory stuff


defmodule Euler94 do
  def result do
    sq = Enum.map(1..333333334, fn x ->
      if rem(x, 1000000) == 0 do
        IO.puts(x)
      end
      x * x
    end)
    Enum.each(1..333333334, fn v ->
      if rem(v, 1000000) == 0 do
        IO.puts(v)
      end
      if rem((v - 1) * (3 * v + 1), 4) == 0 && Enum.member?(Enum.take_while(sq, fn x -> x < trunc(0.25 * (v - 1) * (3 * v + 1)) end), trunc(0.25 * (v - 1) * (3 * v + 1))) do
        IO.puts("#{3 * v + 1}")
      end
      if rem((v + 1) * (3 * v - 1), 4) == 0 && Enum.member?(Enum.take_while(sq, fn x -> x < trunc(0.25 * (v + 1) * (3 * v - 1)) end), trunc(0.25 * (v + 1) * (3 * v - 1))) do
        IO.puts("#{3 * v - 1}")
      end
    end)
  end
end


begin = System.monotonic_time(:nanosecond)
result = Euler94.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
