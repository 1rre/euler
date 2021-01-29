defmodule Euler97 do
  def pow(x, n) do
    if n == 0 do
      1
    else
      x * pow(x, n - 1)
    end
  end
  def result do
    rem(28433 * pow(2, 7830457) + 1, 10000000000)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler97.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
