defmodule Euler714 do
  def isDuo(x) do
    y = Integer.digits(x)
    Enum.find(y, false, fn z ->
      z != 0 && z != Enum.find(y, false, fn n ->
        n != '0'
      end)
    end) == false
  end
  def findDuo(duo, n) do
    target = 4910
    if rem(div(duo, target), 999959) == 0 do
      IO.puts("#{duo}")
    end
    if isDuo(duo) do
      IO.puts("#{duo}")
      exit(duo)
    else
      findDuo(duo + n, n)
    end
  end
  def result(x) do
    if(x == x) do
      result(x)
    end
  end
end

target = 4910
[spawn(Euler714, :findDuo, [target, target * 8]),
      spawn(Euler714, :findDuo, [target * 2, target * 8]),
      spawn(Euler714, :findDuo, [target * 3, target * 8]),
      spawn(Euler714, :findDuo, [target * 4, target * 8]),
      spawn(Euler714, :findDuo, [target * 5, target * 8]),
      spawn(Euler714, :findDuo, [target * 6, target * 8]),
      spawn(Euler714, :findDuo, [target * 7, target * 8]),
      spawn(Euler714, :findDuo, [target * 8, target * 8])]


begin = System.monotonic_time(:millisecond)
result = Euler714.result(true)
fin = System.monotonic_time(:millisecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000}")
