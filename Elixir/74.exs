defmodule Euler74 do
  def factorial(x) do
    if x == 0 do
      1
    else
      x * factorial(x - 1)
    end
  end
  def nextVal(last, count) do
    case Enum.reduce(Integer.digits(last), 0, fn x, acc -> acc + factorial(x) end) do
      x when x < 3 -> count + 2
      145 -> count + 2
      40585 -> count + 2
      169 -> count + 4
      871 -> count + 3
      872 -> count + 3
      x -> nextVal(x, count + 1)
    end
  end
  def reps(v, acc) do
    acc + cond do
      v > 1000000 -> 0
      nextVal(v, 0) == 60 -> 1 + reps(v + 1, acc)
      true -> reps(v + 1, acc)
    end
  end
  def result do
    reps(1, 0)
  end
end

IO.puts(Euler74.result)
