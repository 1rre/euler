defmodule Euler103 do
@size 7
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
  end)) && Enum.all?(0..size - 1, &is_valid(List.delete_at(set, &1)))
end

def reduce_set(thread, set\\[22,40,46,49,50,52,54], attempts\\0) do
  x = Enum.map(set, &(&1 - if :rand.normal > 0.125, do: 0, else: ( (if rem(attempts, 325) == 0 && attempts != 0, do: -ceil(abs(:rand.normal())), else: ceil(abs(:rand.normal())))))) |> Enum.sort
  if set != x && is_valid(x) do
    if Enum.sum(x) > Enum.sum(set) do
      #IO.puts("Increasing (#{thread}) (#{attempts})")
      reduce_set(thread, x, attempts)
    else
      #IO.puts("#{Enum.join(x,",")} (#{thread}) (#{attempts})")
      reduce_set(thread, x)
    end

  else
    if attempts > 1000 do
      #IO.puts("\n\n\nThread finished (#{thread})\n\n\n")
      set
    else
      reduce_set(thread, set, attempts + 1)
    end
  end
end

def find_starting() do
  x = List.duplicate(100, @size) |> Enum.map(&(&1 + round(:rand.normal * 30)))
  if is_valid(x) do
    x
  else
    find_starting()
  end
end

def result do
  [
    Task.async(Euler103, :reduce_set, [0, find_starting()]),
    Task.async(Euler103, :reduce_set, [1, find_starting()]),
    Task.async(Euler103, :reduce_set, [2, find_starting()]),
    Task.async(Euler103, :reduce_set, [3, find_starting()]),
    Task.async(Euler103, :reduce_set, [4, find_starting()]),
    Task.async(Euler103, :reduce_set, [5, find_starting()]),
    Task.async(Euler103, :reduce_set, [6, find_starting()]),
    Task.async(Euler103, :reduce_set, [7, find_starting()]),
    Task.async(Euler103, :reduce_set, [8, find_starting()]),
    Task.async(Euler103, :reduce_set, [9, find_starting()]),
    Task.async(Euler103, :reduce_set, [10, find_starting()]),
    Task.async(Euler103, :reduce_set, [11, find_starting()]),
    Task.async(Euler103, :reduce_set, [12, find_starting()]),
    Task.async(Euler103, :reduce_set, [13, find_starting()]),
    Task.async(Euler103, :reduce_set, [14, find_starting()]),
    Task.async(Euler103, :reduce_set, [15, find_starting()]),
    Task.async(Euler103, :reduce_set, [16, find_starting()]),
    Task.async(Euler103, :reduce_set, [17, find_starting()]),
    Task.async(Euler103, :reduce_set, [18, find_starting()]),
    Task.async(Euler103, :reduce_set, [19, find_starting()]),
    Task.async(Euler103, :reduce_set, [20, find_starting()]),
    Task.async(Euler103, :reduce_set, [21, find_starting()]),
    Task.async(Euler103, :reduce_set, [22, find_starting()]),
    Task.async(Euler103, :reduce_set, [23, find_starting()]),
  ] |> Enum.map(&Task.await(&1, :infinity)) |> Enum.min_by(&(Enum.sum(&1))) |> Enum.join()
end
end
