defmodule Euler71 do
  def result do
    Enum.reduce(1..1000000, [], fn v, acc ->

    end)
  end
end

avg = Enum.reduce(0..50, 0, fn x, acc ->
  begin = System.monotonic_time(:nanosecond)
  _ = Euler71.result
  fin = System.monotonic_time(:nanosecond)
  if(x >= 1) do
    (acc * (x - 1) + (fin - begin)) / x
  else
    0
  end
end)
result = Euler71.result
IO.puts(to_string(result) <> "\ntook: " <> to_string(avg))
