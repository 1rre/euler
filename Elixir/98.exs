defmodule Euler98 do
  def result do
    Enum.join(Enum.reject(Enum.map(Enum.map(Enum.chunk_by(Enum.sort_by(Enum.map(String.split(elem(File.read("words.txt"), 1), ","), fn x -> String.to_charlist(String.trim(x, "\"")) end), fn x -> Enum.count(x) end), fn x -> Enum.count(x) end), fn x -> Enum.map(Enum.reject(Enum.chunk_by(Enum.sort_by(x, fn y -> Enum.sort(y) end), fn x -> Enum.sort(x) end), fn x -> Enum.count(x) == 1 end), fn x -> to_string(x) end) end), fn x -> Enum.join(x, "\n") end), fn x -> x == "" end), "\n")
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler98.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
