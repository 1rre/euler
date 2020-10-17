defmodule Euler5 do
  def is_divisible(x) do
    case Enum.map(11..20, &(if rem(x, &1) == 0, do: div(x, &1), else: [])) |> List.flatten() |> Enum.filter(&Enum.all?(11..20, fn y -> rem(&1, y) == 0 end)) do
      [] -> x
      y -> Enum.map(y, &is_divisible/1) |> Enum.min()
    end

  end
  def result do
    is_divisible(670442572800)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler5.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{fin - begin}")
