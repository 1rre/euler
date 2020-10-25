defmodule Euler94 do
@max div(1000000000, 2)
  def result(x\\2, y\\1, acc\\0), do: if x > @max, do: acc, else: result(2 * x + y * 3, y * 2 + x, acc + (if 2 * x - 1 > 0 && y * (x - 2) > 0 && rem(2 * x - 1, 3) == 0 && rem(y * (x - 2), 3) == 0, do: 2 * x - 1 + 1, else: 0) + (if 2 * x + 1 > 0 && y * (x + 2) > 0 && rem(2 * x + 1, 3) == 0 && rem(y * (x + 2), 3) == 0, do: 2 * x + 1 + 1, else: 0))
end
begin = System.monotonic_time(:nanosecond)
result = Euler94.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
