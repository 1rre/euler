defmodule Euler105 do
  def int_pow(x, n) do
    case n do
      1 -> x
      0 -> 1
      _ -> x * int_pow(x, n - 1)
    end
  end
  def is_valid(set) do
    size = length(set)
    size < 2 || (Enum.map(1..int_pow(2, size) - 2, fn i ->
      Integer.to_string(i, 2) |> String.pad_leading(size, "0") |> String.to_charlist() |> Enum.map(&(&1 == ?1))
    end) |> Enum.all?(fn i ->
      zipped = Enum.zip(i, set)
      b = Enum.filter(zipped, &elem(&1, 0)) |> Enum.map(&elem(&1, 1))
      c = Enum.reject(zipped, &elem(&1, 0)) |> Enum.map(&elem(&1, 1))
      {sum_b, sum_c} = {Enum.sum(b), Enum.sum(c)}
      sum_b != sum_c && !(length(b) > length(c) && sum_b <= sum_c) && !(length(b) < length(c) && sum_b >= sum_c)
    end)) && Enum.all?(0..size - 1, &Task.async(Euler105, :is_valid, [List.delete_at(set, &1)]) |> Task.await(:infinity))
  end
  def result do
    smalls = elem(File.read("sets.txt"), 1) |> String.split("\n") |> Enum.map(fn x -> Enum.map(String.split(x, ","), &elem(Integer.parse(&1), 0)) end) |> Enum.reject(&(&1 == ","))
    Enum.map(smalls, &Task.async(Euler105, :is_valid, [&1])) |> Enum.zip(smalls) |> Enum.filter(&Task.await(elem(&1, 0), :infinity)) |> Enum.map(&(elem(&1, 1))) |> Enum.map(&Enum.sum/1) |> Enum.sum()
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler105.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
