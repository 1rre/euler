#DOESN'T WORK
defmodule Euler96 do
  def check_index(sudoku, index) do
    v = Enum.filter([
      Enum.at(sudoku, rem(index, 9)),
      Enum.at(sudoku, rem(index, 9) + 9),
      Enum.at(sudoku, rem(index, 9) + 18),
      Enum.at(sudoku, rem(index, 9) + 27),
      Enum.at(sudoku, rem(index, 9) + 36),
      Enum.at(sudoku, rem(index, 9) + 45),
      Enum.at(sudoku, rem(index, 9) + 54),
      Enum.at(sudoku, rem(index, 9) + 63),
      Enum.at(sudoku, rem(index, 9) + 72)
    ], fn n -> is_integer(n) end)
    h = Enum.filter([
      Enum.at(sudoku, div(index, 9) * 9),
      Enum.at(sudoku, div(index, 9) * 9 + 1),
      Enum.at(sudoku, div(index, 9) * 9 + 2),
      Enum.at(sudoku, div(index, 9) * 9 + 3),
      Enum.at(sudoku, div(index, 9) * 9 + 4),
      Enum.at(sudoku, div(index, 9) * 9 + 5),
      Enum.at(sudoku, div(index, 9) * 9 + 6),
      Enum.at(sudoku, div(index, 9) * 9 + 7),
      Enum.at(sudoku, div(index, 9) * 9 + 8)
    ], fn n -> is_integer(n) end)
    b = Enum.filter([
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27),
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27 + 1),
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27 + 2),
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27 + 9),
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27 + 10),
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27 + 11),
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27 + 18),
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27 + 19),
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27 + 20)
    ], fn n -> is_integer(n) end)
    Enum.reject(Enum.at(sudoku, index), fn n -> Enum.member?(v, n) || Enum.member?(h, n) || Enum.member?(b, n) end)
  end
  def a_check(sudoku, index) do
    v = Enum.filter([
      Enum.at(sudoku, rem(index, 9)),
      Enum.at(sudoku, rem(index, 9) + 9),
      Enum.at(sudoku, rem(index, 9) + 18),
      Enum.at(sudoku, rem(index, 9) + 27),
      Enum.at(sudoku, rem(index, 9) + 36),
      Enum.at(sudoku, rem(index, 9) + 45),
      Enum.at(sudoku, rem(index, 9) + 54),
      Enum.at(sudoku, rem(index, 9) + 63),
      Enum.at(sudoku, rem(index, 9) + 72)
    ], fn n -> is_list(n) end)
    h = Enum.filter([
      Enum.at(sudoku, div(index, 9) * 9),
      Enum.at(sudoku, div(index, 9) * 9 + 1),
      Enum.at(sudoku, div(index, 9) * 9 + 2),
      Enum.at(sudoku, div(index, 9) * 9 + 3),
      Enum.at(sudoku, div(index, 9) * 9 + 4),
      Enum.at(sudoku, div(index, 9) * 9 + 5),
      Enum.at(sudoku, div(index, 9) * 9 + 6),
      Enum.at(sudoku, div(index, 9) * 9 + 7),
      Enum.at(sudoku, div(index, 9) * 9 + 8)
    ], fn n -> is_list(n) end)
    b = Enum.filter([
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27),
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27 + 1),
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27 + 2),
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27 + 9),
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27 + 10),
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27 + 11),
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27 + 18),
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27 + 19),
      Enum.at(sudoku, div(rem(index, 9), 3) * 3 + div(div(index, 9), 3) * 27 + 20)
    ], fn n -> is_list(n) end)
    List.replace_at(sudoku, index, Enum.find(Enum.at(sudoku, index), Enum.at(sudoku, index), fn x ->
      !(Enum.member?(v, x) || Enum.member?(h, x) || Enum.member?(b, x))
    end))
  end
  def check(sudoku, achk) do
    sud = Enum.reduce(0..80, sudoku, fn index, acc ->
      v = Enum.at(acc, index)
      cond do
        is_integer(v) -> acc
        achk -> a_check(acc, index)
        Enum.count(v) == 1 -> List.replace_at(acc, index, Enum.at(v, 0))
        true -> List.replace_at(acc, index, check_index(acc, index))
      end
    end)
    cond do
      achk -> check(sud, false)
      Enum.all?(sud, fn x -> is_integer(x) end) -> Enum.at(sud, 0) * 100 + Enum.at(sud, 1) * 10 + Enum.at(sud, 2)
      sud == sudoku && achk -> 0
      sud == sudoku -> check(sudoku, true)
      true -> check(sud, false)
    end
  end
  def result do
    vin = Enum.map(String.split(elem(File.read("sudoku.txt"),1), "\n"), fn ln -> Enum.map(Enum.filter(String.split(ln, ""), fn x -> x != "" end), fn n ->
      case n do
        "0" -> [1, 2, 3, 4, 5, 6, 7, 8, 9]
        _ -> String.to_integer(n)
      end
    end) end)
    Enum.sum(Enum.map(vin, fn x -> check(x, false) end))
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler96.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
