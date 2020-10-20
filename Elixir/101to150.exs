defmodule Euler101 do
  def result do

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
  def result do

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

  defp int_pow(x, n) do
    case n do
      0 -> 1
      1 -> x
      _ -> x * int_pow(x, n - 1)
    end
  end

  defp div_while(x, n\\0) do
    if n != 0, do: IO.puts(n)
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
  def result do

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
  "101" ->  Euler11.result()
  "102" ->  Euler12.result()
  "103" ->  Euler13.result()
  "104" ->  Euler14.result()
  "105" ->  Euler15.result()
  "106" ->  Euler16.result()
  "107" ->  Euler17.result()
  "108" ->  Euler18.result()
  "109" ->  Euler19.result()
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
IO.puts("#{result}\ntook: #{fin - begin}")
