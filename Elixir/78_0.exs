defmodule Euler78 do
  def ways(chain, max, n, acc) do
    if n >= 1 do
      Enum.reduce((n)..1, 0, fn v, acc ->
        case Enum.sum(chain) + v do
          x when x == max -> acc + 1
          x when x < max -> acc + ways(chain ++ [v], max, v, acc)
          _ -> acc
        end
      end)
    else
      acc
    end
  end
  def result do
    num =
    ways([], num, num, 1)
#    wayMap = Enum.reduce(1..num, %{}, fn v, acc ->
#      x = ways(acc, [], v, v)
#      Map.put(acc, v, x)
#    end)
#    Enum.join(Map.keys(wayMap), ",")
  end
end

IO.puts(Euler78.result)
