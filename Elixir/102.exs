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

#begin = System.monotonic_time(:nanosecond)
result = Euler102.result
#fin = System.monotonic_time(:nanosecond)
avg = Enum.reduce(0..500, 0, fn x, acc ->
  begin = System.monotonic_time(:nanosecond)
  Euler102.result
  fin = System.monotonic_time(:nanosecond)
  if(x >= 1) do
    (acc * (x - 1) + (fin - begin)) / x
  else
    0
  end
end) / 1000000000
IO.puts("#{result}\ntook: #{(avg)}")
