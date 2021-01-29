defmodule Euler86 do
  def calc(a, b, c) do
    :math.sqrt(a * a + b * b + 2 * b * c + c * c)
  end
  def result do
    n = 1818
    Enum.reduce(1..n, 0, fn c, acc ->
      IO.puts(c)
      Enum.reduce(c..n, acc, fn b, acc ->
        Enum.reduce_while(b..n, acc, fn a, acc ->
          result = calc(a, b, c)
          cond do
            trunc(result) == result -> {:cont, acc + 1}
            true -> {:cont, acc}
          end
        end)
      end)
    end)
  end
end

#avg = Enum.reduce(0..1, 0, fn x, acc ->
#  begin = System.monotonic_time(:nanosecond)
#  _ = Euler86.result
#  fin = System.monotonic_time(:nanosecond)
#  if(x >= 1) do
#    (acc * (x - 1) + (fin - begin)) / x
#  else
#    0
#  end
#end) / 1000000000
avg = 0
result = Euler86.result
IO.puts("#{result}\ntook: #{avg}")
