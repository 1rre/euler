defmodule Euler94 do
  def bin_search(list, n) do
    cond do
      length(list) == 0 -> false
      length(list) == 1 -> n == hd(list)
      Enum.at(list, div(length(list), 2)) > n -> bin_search(Enum.take(list, div(length(list), 2)), n)
      true -> bin_search(Enum.drop(list, div(length(list), 2)), n)
    end
  end

  def int_pow(x, n) do
    case n do
      0 -> 1
      1 -> x
      _ -> x * int_pow(x, n - 1)
    end
  end

  def result do
    Enum.map(1..div(333333333, 2) + 1, fn x_ ->
      x = x_ * 2 - 1
      if rem(x, 1000000) == 1, do: IO.puts(x)
      y = int_pow(x, 4) * 3 + int_pow(x, 3) + int_pow(x, 2) * 26 + x + 3
      if rem(y, 16) == 0, do: div(y, 16), else: 0
    end)
  end
end
begin = System.monotonic_time(:nanosecond)
result = Euler94.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
