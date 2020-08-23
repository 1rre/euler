defmodule Euler81 do
  def stringMat(matrix) do
    Enum.join(Enum.map(matrix, fn ln -> Enum.join(ln, ",") end), "\n")
  end

  def get(matrix, x, y) do
    Enum.at(Enum.at(matrix, x), y)
  end

  def navigate(x, y, matrix, rtn) do
    sz = 79
    rtn = cond do
      x >= sz -> rtn
      !Map.has_key?(rtn, {x + 1, y}) ->
        rtn = Map.put(rtn, {x + 1, y}, Map.get(rtn, {x, y}) + get(matrix, x + 1, y))
        navigate(x + 1, y, matrix, rtn)
      Map.get(rtn, {x, y}) + get(matrix, x + 1, y) < Map.get(rtn, {x + 1, y}) ->
        rtn = Map.replace!(rtn, {x + 1, y}, Map.get(rtn, {x, y}) + get(matrix, x + 1, y))
        navigate(x + 1, y, matrix, rtn)
      true -> rtn
    end
    rtn = cond do
      y >= sz -> rtn
      !Map.has_key?(rtn, {x, y + 1}) ->
        rtn = Map.put(rtn, {x, y + 1}, Map.get(rtn, {x, y}) + get(matrix, x, y + 1))
        navigate(x, y + 1, matrix, rtn)
      Map.get(rtn, {x, y}) + get(matrix, x, y + 1) < Map.get(rtn, {x, y + 1}) ->
        rtn = Map.replace!(rtn, {x, y + 1}, Map.get(rtn, {x, y}) + get(matrix, x, y + 1))
        navigate(x, y + 1, matrix, rtn)
      true -> rtn
    end
    rtn
  end

  def result do
    file = elem(File.read("matrix_1.txt"), 1)
    lines = String.split(file, "\n")
    matrix = Enum.map(lines, fn x ->
      Enum.map(String.split(x, ","), fn y ->
        elem(Integer.parse(y), 0)
      end)
    end)
    rtn = %{{0,0} => get(matrix, 0, 0)}
    rtn = navigate(0, 0, matrix, rtn)
    Map.get(rtn, {79, 79})
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler81.result
fin = System.monotonic_time(:nanosecond)
avg = fin - begin
IO.puts(to_string(result) <> "\ntook: " <> to_string(avg))
