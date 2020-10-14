#561, 562, 607,
defmodule Euler95 do
  def sumDivisors(n) do
    #IO.puts(n)
    Enum.sum(Enum.reduce(2..trunc(:math.sqrt(n)), [1], fn v, acc ->
      if v != 0 && rem(n, v) == 0 do
        case div(n, v) do
          x when x == v ->
            [v | acc]
          x ->
            [v | [ x | acc]]
        end
      else
        acc
      end
    end))
  end
  def chain(n, cnt, hd) do
    #Am adding to list so that I can check to see if amicable number is reached & so infinite loop will occur.
    cond do
      cnt > 28 -> 0
      n > 1000000 || n < 10 -> 0
      n == hd -> cnt
      true -> chain(sumDivisors(n), cnt + 1, hd)
    end
  end
  def result do
    #629072, 589786
    n = 629072
    Enum.reduce(1..n, 0, fn x, acc ->
      case chain(sumDivisors(x), 1, x) do
        y when y >= acc ->
          IO.puts("#{x}, #{y}")
          y
        _ -> acc
      end
    end)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler95.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
