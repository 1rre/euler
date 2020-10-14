defmodule Euler99 do
  def result do
    Enum.join(Enum.max_by(Enum.map(String.split(elem(File.read("base_exp.txt"), 1), "\n"), fn x -> Enum.map(String.split(x, ","), fn y -> String.to_integer(y) end) end), fn v -> Enum.at(v, 1) * :math.log10(Enum.at(v, 0)) end), ", ")
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler99.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
