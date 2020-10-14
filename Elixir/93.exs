defmodule Euler93 do
  def calcRun(a, b, c, d) do

  end
  def result do
    Enum.reduce(1..6, {0, 0}, fn a, acc ->
      Enum.reduce(a + 1..7, acc, fn b, acc ->
        Enum.reduce(b + 1..8, acc, fn c, acc ->
          Enum.reduce(c + 1..9, acc, fn d, acc ->
            case calcRun(a, b, c, d) do
              x when x > elem(acc, 0) -> {x, a * 1000 + b * 100 + c * 10 + d}
              _ -> acc
            end
          end)
        end)
      end)
    end)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler93.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
