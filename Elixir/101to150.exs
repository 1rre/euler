#These are completed problems only
#Problems in progress are in their own files

defmodule Euler101 do
  def int_pow(x, n) do
    case n do
      0 -> 1
      1 -> x
      _ -> x * int_pow(x, n - 1)
    end
  end
  def calc_diff(series, n) do #Uses nth term to calculate a
    if(n == 0) do
      hd(series)
    else
      calc_diff(Enum.zip(series, tl(series)) |> Enum.map(fn {x, y} -> div(y - x, n) end), n - 1)
    end
  end
  def bop(series, n, acc\\[]) do
    if n == 0 do
      [calc_diff(series, n) | acc]
    else
      diff = calc_diff(series, n)
      Enum.zip(1..length(series), series) |> Enum.map(fn {x, y} -> (y - diff * int_pow(x, n)) end) |> bop(n - 1, [diff | acc])
    end
  end
  def map_func(bp, series) do
    Enum.map(1..length(series), fn x ->
      Enum.reduce(Enum.zip(bp, 1..length(bp)), 0, fn {y,z}, acc -> acc +  y * int_pow(x, z - 1) end)
    end) |> List.last()
  end
  def result do
    series = Enum.map(1..20, &(1 - &1 + int_pow(&1, 2) - int_pow(&1, 3) + int_pow(&1, 4) - int_pow(&1, 5) + int_pow(&1, 6) - int_pow(&1, 7) + int_pow(&1, 8) - int_pow(&1, 9) + int_pow(&1, 10)))
    Enum.reduce(1..9, 0, &(&2 + map_func(bop(Enum.take(series, &1 + 2), &1), Enum.take(series, &1 + 2))))
  end
end

defmodule Euler102 do
  def mxc0(a, b) do
    if 0 != Enum.at(a, 0) - Enum.at(b, 0) do
      Enum.at(a, 1) - ((Enum.at(a, 1) - Enum.at(b, 1)) / (Enum.at(a, 0) - Enum.at(b, 0))) * Enum.at(a, 0)
    else
      0
    end
  end
  def result do
    triangles = Enum.map(String.split(elem(File.read("triangles.txt"), 1), "\n"), fn ln -> Enum.chunk_every(Enum.map(String.split(ln, ","), fn pt -> String.to_integer(pt) end), 2) end)
    Enum.count(triangles, fn tri ->
      cab = !(Enum.at(Enum.at(tri, 0), 0) > 0 && Enum.at(Enum.at(tri, 1), 0) > 0) && !(Enum.at(Enum.at(tri, 0), 0) < 0 && Enum.at(Enum.at(tri, 1), 0) < 0)
      cac = !(Enum.at(Enum.at(tri, 0), 0) > 0 && Enum.at(Enum.at(tri, 2), 0) > 0) && !(Enum.at(Enum.at(tri, 0), 0) < 0 && Enum.at(Enum.at(tri, 2), 0) < 0)
      cbc = !(Enum.at(Enum.at(tri, 1), 0) > 0 && Enum.at(Enum.at(tri, 2), 0) > 0) && !(Enum.at(Enum.at(tri, 1), 0) < 0 && Enum.at(Enum.at(tri, 2), 0) < 0)
      bab = mxc0(Enum.at(tri, 0), Enum.at(tri, 1)) < 0
      bac = mxc0(Enum.at(tri, 0), Enum.at(tri, 2)) < 0
      bbc = mxc0(Enum.at(tri, 1), Enum.at(tri, 2)) < 0
      cab && cac && (bab && !bac || !bab && bac) || cab && cbc && (!bab && bbc || bab && !bbc) || cac && cbc && (!bac && bbc || bac && !bbc)
    end)
  end
end

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

defmodule Euler104 do
@double_max 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
  defp m_mul(a, b) do
    {
      {
        elem(elem(a,0),0) * elem(elem(b,0),0) + elem(elem(a,0),1) * elem(elem(b,1),0),
        elem(elem(a,0),0) * elem(elem(b,0),1) + elem(elem(a,0),1) * elem(elem(b,1),1)
      },
      {
        elem(elem(a,1),0) * elem(elem(b,0),0) + elem(elem(a,1),1) * elem(elem(b,1),0),
        elem(elem(a,1),0) * elem(elem(b,0),1) + elem(elem(a,1),1) * elem(elem(b,1),1)
      }
    }
  end

  def int_pow(x, n) do
    case n do
      0 -> 1
      1 -> x
      _ -> x * int_pow(x, n - 1)
    end
  end

  defp div_while(x) do
    case div(x, 1000000000) do
      0 -> x
      y -> div_while(div(x, (if x < @double_max do
        int_pow(10, max(1,trunc(:math.log10(y))))
      else
        @double_max
      end)))
    end
  end

  defp has_digits_1(n) do #There has to be a faster way of doing this but immutable lists make it trickier.
    d = Integer.digits(n)
    Enum.member?(d, 1) && Enum.member?(d, 2) && Enum.member?(d, 3) && Enum.member?(d, 4) && Enum.member?(d, 5) && Enum.member?(d, 6) && Enum.member?(d, 7) && Enum.member?(d, 8) && Enum.member?(d, 9)
  end

  defp fib_last(n\\3, pre1\\1, pre2\\1, matrix\\m_mul({{1,1},{1,0}},{{1,1},{1,0}})) do
    if rem(pre1 + pre2, 1000000000) |> has_digits_1() && elem(elem(matrix, 0),0) |> div_while(n) |> has_digits_1() do
      n
    else
      fib_last(n + 1, rem(pre1 + pre2, 1000000000), pre1, m_mul(matrix, {{1,1},{1,0}}))
    end
  end

  def result do
    fib_last()
  end
end

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

defmodule Euler106 do
  def result do

  end
end

defmodule Euler107 do
  def result do

  end
end

defmodule Euler108 do
  def result do

  end
end

defmodule Euler109 do
  def result do

  end
end

defmodule Euler110 do
  def result do

  end
end

defmodule Euler111 do
  def result do

  end
end

defmodule Euler112 do
  def result do

  end
end

defmodule Euler113 do
  def result do

  end
end

defmodule Euler114 do
  def result do

  end
end

defmodule Euler115 do
  def result do

  end
end

defmodule Euler116 do
  def result do

  end
end

defmodule Euler117 do
  def result do

  end
end

defmodule Euler118 do
  def result do

  end
end

defmodule Euler119 do
  def result do

  end
end

defmodule Euler120 do
  def result do

  end
end

defmodule Euler121 do
  def result do

  end
end

defmodule Euler122 do
  def result do

  end
end

defmodule Euler123 do
  def result do

  end
end

defmodule Euler124 do
  def result do

  end
end

defmodule Euler125 do
  def result do

  end
end

defmodule Euler126 do
  def result do

  end
end

defmodule Euler127 do
  def result do

  end
end

defmodule Euler128 do
  def result do

  end
end

defmodule Euler129 do
  def result do

  end
end

defmodule Euler130 do
  def result do

  end
end

defmodule Euler131 do
  def result do

  end
end

defmodule Euler132 do
  def result do

  end
end

defmodule Euler133 do
  def result do

  end
end

defmodule Euler134 do
  def result do

  end
end

defmodule Euler135 do
  def result do

  end
end

defmodule Euler136 do
  def result do

  end
end

defmodule Euler137 do
  def result do

  end
end

defmodule Euler138 do
  def result do

  end
end

defmodule Euler139 do
  def result do

  end
end

defmodule Euler140 do
  def result do

  end
end

defmodule Euler141 do
  def result do

  end
end

defmodule Euler142 do
  def result do

  end
end

defmodule Euler143 do
  def result do

  end
end

defmodule Euler144 do
  def result do

  end
end

defmodule Euler145 do
  def result do

  end
end

defmodule Euler146 do
  def result do

  end
end

defmodule Euler147 do
  def result do

  end
end

defmodule Euler148 do
  def result do

  end
end

defmodule Euler149 do
  def result do

  end
end

defmodule Euler150 do
  def result do

  end
end

begin = System.monotonic_time(:nanosecond)
result = case System.argv() |> hd do
  "101" -> Euler101.result()
  "102" -> Euler102.result()
  "103" -> Euler103.result()
  "104" -> Euler104.result()
  "105" -> Euler105.result()
  "106" -> Euler106.result()
  "107" -> Euler107.result()
  "108" -> Euler108.result()
  "109" -> Euler109.result()
  "110" -> Euler110.result()
  "111" -> Euler111.result()
  "112" -> Euler112.result()
  "113" -> Euler113.result()
  "114" -> Euler114.result()
  "115" -> Euler115.result()
  "116" -> Euler116.result()
  "117" -> Euler117.result()
  "118" -> Euler118.result()
  "119" -> Euler119.result()
  "120" -> Euler120.result()
  "121" -> Euler121.result()
  "122" -> Euler122.result()
  "123" -> Euler123.result()
  "124" -> Euler124.result()
  "125" -> Euler125.result()
  "126" -> Euler126.result()
  "127" -> Euler127.result()
  "128" -> Euler128.result()
  "129" -> Euler129.result()
  "130" -> Euler130.result()
  "131" -> Euler131.result()
  "132" -> Euler132.result()
  "133" -> Euler133.result()
  "134" -> Euler134.result()
  "135" -> Euler135.result()
  "136" -> Euler136.result()
  "137" -> Euler137.result()
  "138" -> Euler138.result()
  "139" -> Euler139.result()
  "140" -> Euler140.result()
  "141" -> Euler141.result()
  "142" -> Euler142.result()
  "143" -> Euler143.result()
  "144" -> Euler144.result()
  "145" -> Euler145.result()
  "146" -> Euler146.result()
  "147" -> Euler147.result()
  "148" -> Euler148.result()
  "149" -> Euler149.result()
  "150" -> Euler150.result()
end
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin) / 1000000000}")
