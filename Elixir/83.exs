defmodule Euler83 do
  def stringMat(matrix) do
    Enum.join(Enum.map(matrix, fn ln -> Enum.join(ln, ",") end), "\n")
  end

  def result do
    file = elem(File.read("matrix.txt"), 1)
    lines = String.split(file, "\n")
    matrix = Enum.map(lines, fn x ->
      Enum.map(String.split(x, ","), fn y ->
        elem(Integer.parse(y), 0)
      end)
    end)

    stringMat(matrix)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler83.result
fin = System.monotonic_time(:nanosecond)
avg = fin - begin
IO.puts(to_string(result) <> "\ntook: " <> to_string(avg))
