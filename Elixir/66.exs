defmodule Euler66 do
  findSquares = Enum.reduce(1..100000)
  def minSol(d) do

  end
  def result do

  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler66.result
fin = System.monotonic_time(:nanosecond)
IO.puts(to_string(result) <> "\ntook: " <> to_string(fin - begin))
