defmodule Euler67 do
  def replace(head, tail) do
    if Enum.count(tail) == 0 do
      elem(Enum.at(head, 0), 0)
    else
      replace(Enum.map(hd(tail), fn x ->
        {elem(x, 0) + elem(max(Enum.at(head, elem(x, 1)), Enum.at(head, elem(x, 1) + 1)), 0), elem(x, 1)}
      end), tl(tail))
    end
  end
  def result(input) do
    replace(hd(input), tl(input))
  end
end

input = Enum.reverse(Enum.map(String.split(elem(File.read("triangle.txt"),1),"\n"), fn x -> Enum.with_index(Enum.map(String.split(x, " "), fn y -> String.to_integer(y) end)) end))

avg = Enum.reduce(0..1000, 0, fn x, acc ->
  begin = System.monotonic_time(:nanosecond)
  _ = Euler67.result(input)
  fin = System.monotonic_time(:nanosecond)
  if(x >= 1) do
    (acc * (x - 1) + (fin - begin)) / x
  else
    0
  end
end)
result = Euler67.result(input)
IO.puts(to_string(result) <> "\ntook: " <> to_string(avg))
