defmodule Euler88 do
@max 12000
@max_time 800
  def find_sum(n, list, start_time\\System.monotonic_time(:millisecond), added\\false) do
    sum = Enum.sum(list)
    mul = Enum.reduce(list, &(&1 * &2))
#    IO.puts("[#{Enum.join(list, ",")}]: #{sum}, #{mul}")
    cond do
      System.monotonic_time(:millisecond) - start_time > 2 * @max_time -> -1
      System.monotonic_time(:millisecond) - start_time > @max_time && !(added) ->
        IO.puts("Adding")
        find_sum(n, List.replace_at(list, n - 1, Enum.at(list, n - 1) + n), start_time, true)
      sum == mul ->
        #IO.puts("#{n}: #{sum}")
        sum
      mul < sum -> find_sum(n, Enum.map(list, &(if :rand.normal > 0.5, do: &1 + ceil(abs(:rand.normal)), else: &1)), start_time, added)
      mul > sum -> find_sum(n, Enum.map(list, &(if :rand.normal > 0.5, do: max(1, &1 - ceil(abs(:rand.normal))), else: &1)), start_time, added)
    end
  end
  def result do
    Enum.reduce(2..@max, MapSet.new(), fn n, acc ->
      IO.puts(n)
      MapSet.put(acc, Enum.map(1..12, fn _ -> Task.async(Euler88, :find_sum, [n, List.duplicate(2, n)]) end) |> Enum.map(fn x -> Task.await(x, @max * 2000) end) |> Enum.filter(&(&1 != -1)) |> Enum.min)
    end) |> Enum.sum
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler88.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
