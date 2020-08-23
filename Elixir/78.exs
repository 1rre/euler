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
  def rr(num) do
    case ways([], num, num, 1) do
      x when rem(x, 100) == 0 -> Enum.join([num, x], ",")
      _ ->
        IO.puts(num)
        rr(num + 1)
    end
  end
  def result do
    rr(2)
  end
end

IO.puts(Euler78.result)
