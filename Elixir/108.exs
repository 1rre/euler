defmodule Euler108 do
  def recip(n) do
    Enum.count(n + 1..2 * n, fn v ->
      lcm = n * v / Integer.gcd(n, v)
      1 / v + 1 / lcm == 1 / n
    end)
  end
  def result do
    Enum.find(1..9999999999, fn n ->
      x = recip(n)
      #IO.puts("#{n} -> #{x}")
      x > 100
    end)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler108.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
