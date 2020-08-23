defmodule Euler70 do
  def sqrtIrrational(x) do
    case :math.sqrt(x) do
      n if is_integer(n) -> false
      n -> n
    end
  end
  def result do
    Enum.reduce(1..100, fn x, acc ->
      cond do
    end)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler70result
fin = System.monotonic_time(:nanosecond)
IO.puts(to_string(result) <> "\ntook: " <> to_string(fin - begin))
