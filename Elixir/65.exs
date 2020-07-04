defmodule Euler65 do
  def addFrac(frac, int) do
    [Enum.at(frac, 0) + Enum.at(frac, 1) * int, Enum.at(frac, 1)]
  end
  def invertFrac(frac) do
    Enum.reverse(frac)
  end
  def frac(depth) do
    case depth do
      0 -> 2
      x when rem(x + 1, 3) == 0 -> div(x + 1, 3) * 2
      _ -> 1
    end
  end
  def findToDepth(x) do
    Enum.reduce((x - 2)..0, [1, 1], fn v, acc ->
      addFrac(invertFrac(acc), frac(v))
    end)
  end
  def result do
    Enum.sum(Integer.digits(Enum.at(findToDepth(100), 0)))
  end
end
avg = Enum.reduce(0..1000, 0, fn x, acc ->
  begin = System.monotonic_time(:nanosecond)
  _ = Euler65.result
  fin = System.monotonic_time(:nanosecond)
  if(x >= 1) do
    (acc * (x - 1) + (fin - begin)) / x
  else
    0
  end
end)
result = Euler65.result
IO.puts(to_string(result) <> "\ntook: " <> to_string(avg))
