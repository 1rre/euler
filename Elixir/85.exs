defmodule Euler85 do
  def approx(x, y, below, closest) do
    n = Enum.reduce(0..x - 1, 0, fn i, acc ->
      Enum.reduce(0..y - 1, acc, fn j, acc ->
        acc + (x - i) * (y - j)
      end)
    end)
    IO.puts("#{x}, #{y} = #{n}\nclosest: #{elem(closest, 0)}, Area: #{elem(closest, 1)}")
    newClosest = if(abs(2000000 - n) < abs(2000000 - elem(closest, 0))) do
      {n, x * y}
    else
      closest
    end
    cond do
      n == 1999998 -> x * y
      (n < 2000000 && below) -> approx(x + 1, y, true, newClosest)
      (n < 2000000) -> approx(x, y + 1, true, newClosest)
      below -> approx(x - 1, y, false, newClosest)
      true -> approx(x, y - 1, false, newClosest)
    end
  end
  def result do
    approx(50, 50, false, {0, 0})
  end
end

begin = System.monotonic_time(:millisecond)
result = Euler85.result
fin = System.monotonic_time(:millisecond)
IO.puts("#{result}\ntook: #{fin - begin}")
