defmodule Euler78 do
<<<<<<< HEAD
  def sign(a) do
    if rem(abs(a + 1), 2) == 0 do
      1
    else
      -1
    end
  end
  def p(n, q) do
    [cond do
      n > 0 -> sqrt = :math.sqrt(24 * n + 1)
        Enum.reduce(trunc(-(sqrt - 1) / 6)..trunc((sqrt + 1) / 6), 0, fn k, acc ->
          acc + if k != 0 do
            sign(k) * Enum.at(q, trunc(k * (3 * k - 1) / 2) - 1, 0)
          else
            0
          end
        end)
      n == 0 -> 1
      true -> 0
    end | q]
  end
  def result do
    n = 55374
    hd(0..n |> Enum.reduce([], fn n, q ->
      q = p(n, q)
      if rem(n, 5) == 4 && rem(hd(q), 1000000) == 0 do
        IO.puts("#{n}: #{hd(q)}")
      end
      q
    end))
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler78.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin) / 1000000000}")
=======

  def result do
    rr(2)
  end
end

IO.puts(Euler78.result)
>>>>>>> 586e1ba890d950595e7b542f79e1b28444ce88f1
