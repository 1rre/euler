defmodule Euler7 do
  def generate_while(max, acc\\2, n\\3) do
    cond do
      Enum.any?(2..ceil(:math.sqrt(n)), &rem(n, &1) == 0) -> generate_while(max, acc, n + 2)
      acc >= max -> n
      true -> generate_while(max, acc + 1, n + 2)
    end
  end
  def result do
    generate_while(10001)
  end
end


begin = System.monotonic_time(:nanosecond)
result = Euler7.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{fin - begin}")
