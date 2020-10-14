defmodule Euler714 do
  def isDuo(x) do
    if x < 102 do
      true
    else
      y = Integer.digits(x)
      yh = hd(y)
      z = Enum.find(y, true, fn n -> n != yh end)
      if z != true do
        if Enum.find(y, true, fn n -> n != yh && n != z end) == true do
          true
        else
          false
        end
      else
        true
      end
    end
  end
  def findDuo(duo, n) do
    if isDuo(duo) do
      duo
    else
      findDuo(duo + n, n)
    end
  end
  def loop(acc, v, map, n) do
    if rem(v, 100) == 0 do
      IO.puts(v)
    end
    cond do
      v > n -> acc
      (v < 102 || isDuo(v)) ->
        loop(acc + v, v + 1, [v | map], n)
      true ->
        fnd = Enum.find(2..trunc(:math.sqrt(v)), false, fn y ->
          rem(v, y) == 0 && rem(Enum.at(map, v - div(v, y)), v) == 0
        end)
        duo = if fnd == false do
          findDuo(v + v, v)
        else
          Enum.at(map, v - div(v, fnd))
        end
        loop(acc + duo, v + 1, [duo | map], n)
    end

  end
  def result do
    loop(0, 1, [], 5000)
  end
end

begin = System.monotonic_time(:millisecond)
result = Euler714.result
fin = System.monotonic_time(:millisecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000}")
