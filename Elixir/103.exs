defmodule Euler103 do
@size 7
  def permutations([]) do
    [[]]
  end

  def permutations(list) do
    for h <- list, t <- permutations(list -- [h]), do: [h | t]
  end

  def is_valid(a) do
    Enum.all?(a, &(&1 > 0)) && Enum.all?(permutations(a), fn set ->
      Enum.all?(1..length(set) - 2, fn x ->
        Enum.all?(x..length(set) - 1, fn y ->
          {b, c_} = Enum.split(set, x)
          {c, _} = Enum.split(c_, y)
          {sum_b, sum_c} = {Enum.sum(b), Enum.sum(c)}

          ((length(b) > length(c) && sum_b > sum_c) ||
          (length(b) < length(c) && sum_b < sum_c) ||
          (length(b) == length(c))) && sum_b != sum_c
        end)
        end)
    end)
  end

  def reduce_set(set\\[102,85,82,90,112,81,122], n\\0) do
    x = List.replace_at(set, n, Enum.at(set, n) - (if :rand.normal() > 0.85, do: trunc(:rand.normal() * 5), else: :rand.uniform(div(Enum.at(set, n), 2))))
    if is_valid(x) do
      IO.puts(Enum.join(x,","))
      reduce_set(x, rem(n + 1, @size))
    else
      reduce_set(set, rem(n + 1, @size))
    end
  end

  def find_valid(set\\[94, 95, 96, 97, 98, 99, 100], n\\0) do
    IO.puts(set |> Enum.join(","))
    if is_valid(set) do
      set
    else
      if Enum.all?(set, &(&1 <= 0)) do
        find_valid()
      else
        List.replace_at(set, n, Enum.at(set, n) - trunc(:rand.normal(div(Enum.at(set, n), 3), :math.sqrt(div(Enum.at(set, n), 3))))) |> find_valid(rem(n + 1, @size))
      end
    end
  end

  def result do
  reduce_set() |> Enum.join(",")
  end

end

begin = System.monotonic_time(:nanosecond)
result = Euler103.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
