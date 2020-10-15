defmodule Euler94 do
  def check(a, b) do
    c = b / 2 * :math.sqrt(a * a - b * b / 4)
    if trunc(c) == c do
      2 * a + b
    else
      0
    end
  end
  def calcn(a, b) do
    Enum.reduce(a..b, 0, fn s, acc ->
      acc + check(s, s - 1) + check(s, s + 1)
    end)
  end
  def result do
    n = 333333333
    a = [
      Task.async(Euler94, :calcn, [2, trunc(n / 12)]), #CPU 0
      Task.async(Euler94, :calcn, [trunc(n / 12), trunc(n / 6)]), #CPU 1
      Task.async(Euler94, :calcn, [trunc(n / 6), trunc(n / 4)]), #CPU 2
      Task.async(Euler94, :calcn, [trunc(n / 4), trunc(n / 3)]), #CPU 3
      Task.async(Euler94, :calcn, [trunc(n / 3), trunc(5 * n / 12)]), #CPU 4
      Task.async(Euler94, :calcn, [trunc(5 * n / 12), trunc(n / 2)]), #CPU 5
      Task.async(Euler94, :calcn, [trunc(n / 2), trunc(7 * n / 12)]), #CPU 6
      Task.async(Euler94, :calcn, [trunc(7 * n / 12), trunc(2 * n / 3)]), #CPU 7
      Task.async(Euler94, :calcn, [trunc(2 * n / 3), trunc(3 * n / 4)]), #CPU 8
      Task.async(Euler94, :calcn, [trunc(3 * n / 4), trunc(5 * n / 6)]), #CPU 9
      Task.async(Euler94, :calcn, [trunc(5 * n / 6), trunc(11 * n / 12)]), #CPU 10
      Task.async(Euler94, :calcn, [trunc(11 * n / 12), n]) #CPU 11
    ]
    Enum.map(a, fn x -> Task.await(x, 999999999) end) |> Enum.sum()
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler94.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
