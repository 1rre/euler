defmodule Euler63 do
  def pow(a, b) do
    if is_integer(b) do
      case b do
        0 -> 1
        1 -> a
        -1 -> 1 / a
        x when x > 0 -> a * pow(a, b - 1)
        x when x < 0 -> 1 / (a * pow(a, b - 1))
      end
    else
      :math.pow(a, b)
    end
  end
  def findPowDigits(n, cnt) do
    Enum.reduce_while(9..1, cnt, fn x, acc ->
      if Enum.count(Integer.digits(pow(x, n))) == n do
        {:cont, acc + 1}
      else
        {:halt, acc}
      end
    end)
  end
  defmacro gt do

  end
  def result do
    Enum.reduce_while(1..100, 0, fn x, acc ->
      a = findPowDigits(x, 0)
      if a > 0 do
        {:cont, acc + a}
      else
        {:halt, acc}
      end
    end)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler63.result
fin = System.monotonic_time(:nanosecond)
IO.puts(to_string(result) <> "\ntook: " <> to_string(fin - begin))
