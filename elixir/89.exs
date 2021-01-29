defmodule Euler89 do
  def parse(x) do
    String.contains?(x, "")
  end


  def result do
    file = elem(File.read("roman.txt"), 1)
    lines = Enum.map(String.split(file, "\n"), fn x -> String.to_charlist(x) end)
    Enum.reduce(lines, 0, fn v, acc ->
      acc + (Enum.count(v) - Enum.count(write(parse(v), [])))
    end)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler89.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
