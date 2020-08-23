defmodule E75 do
  def genTriples(set, a, b, c) do
    max = 1500000
    x = a + b + c
    list = [a, b, c]
    if x <= max do
      genTriples(
        genTriples(
          genTriples(
            MapSet.put(set, list),
            2 * a + b - c, -2 * a + 2 * b + 2 * c, -2 * a + b + 3 * c),
          2 * a + b + c, 2 * a - 2 * b + 2 * c, 2 * a - b + 3 * c),
        2 * a - b + c, 2 * a + 2 * b + 2 * c, 2 * a + b + 3 * c
      )
    else
      set
    end
  end
  def genMultiples(set, list, n) do
    max = 1500000
    x = Enum.map(list, fn y -> y * n end)
    sum = Enum.sum(x)
    if sum > max || MapSet.member?(set, x) do
      set
    else
      genMultiples(MapSet.put(set, x), list, n + 1)
    end
  end
  def result do
    set = genTriples(MapSet.new([[3,4,5]]), 3, 4, 5)
    Enum.count(MapSet.to_list(Enum.reduce(set, set, fn x, acc -> genMultiples(acc, x, 1) end)))
  end
end

IO.puts(E75.result)
