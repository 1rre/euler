defmodule Euler65 do
  def findConvergentTo(x) do

  end
  def result do

  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler65.result
fin = System.monotonic_time(:nanosecond)
IO.puts(to_string(result) <> "\ntook: " <> to_string(fin - begin))
