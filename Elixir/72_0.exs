defmodule Euler72 do

  def result do
    n = 2500
    frac = Enum.reduce(2..n, %{}, fn i, frac ->
      Enum.reduce(1..i - 1, frac, fn j, frac ->
          Map.put_new(frac, j / i, nil)
      end)
    end)
    Enum.count(frac)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler72.result
fin = System.monotonic_time(:nanosecond)
IO.puts(to_string(result) <> "\ntook: " <> to_string(fin - begin))
