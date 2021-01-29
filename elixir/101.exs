defmodule Euler101 do
  def int_pow(x, n) do
    case n do
      0 -> 1
      1 -> x
      _ -> x * int_pow(x, n - 1)
    end
  end
  def calc_diff(series, n) do #Uses nth term to calculate a
    if(n == 0) do
      hd(series)
    else
      calc_diff(Enum.zip(series, tl(series)) |> Enum.map(fn {x, y} -> div(y - x, n) end), n - 1)
    end
  end
  def bop(series, n, acc\\[]) do
    if n == 0 do
      [calc_diff(series, n) | acc]
    else
      diff = calc_diff(series, n)
      Enum.zip(1..length(series), series) |> Enum.map(fn {x, y} -> (y - diff * int_pow(x, n)) end) |> bop(n - 1, [diff | acc])
    end
  end
  def map_func(bp, series) do
    Enum.map(1..length(series), fn x ->
      Enum.reduce(Enum.zip(bp, 1..length(bp)), 0, fn {y,z}, acc -> acc +  y * int_pow(x, z - 1) end)
    end) |> List.last()
  end
  def result do
    series = Enum.map(1..20, &(1 - &1 + int_pow(&1, 2) - int_pow(&1, 3) + int_pow(&1, 4) - int_pow(&1, 5) + int_pow(&1, 6) - int_pow(&1, 7) + int_pow(&1, 8) - int_pow(&1, 9) + int_pow(&1, 10)))
    Enum.reduce(1..9, 0, &(&2 + map_func(bop(Enum.take(series, &1 + 2), &1), Enum.take(series, &1 + 2))))
  end
end
