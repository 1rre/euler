defmodule Euler4 do
  def is_pal([hd | x]) do
    if hd == Enum.at(x, length(x) - 1, hd), do: is_pal(List.delete_at(x, length(x) - 1)), else: false
  end
  def is_pal(x) do
    if is_integer(x), do: is_pal(Integer.digits(x)), else: true
  end
  def result do
    Enum.reduce_while(999..100, 0, fn i, acc ->
      if i * i <= acc do
        {:halt, acc}
      else
        {:cont, Enum.reduce_while(i..100, acc, fn j, acc ->
          case i * j do
            x when x < acc -> {:halt, acc}
            x -> if is_pal(x), do: {:halt, x}, else: {:cont, acc}
          end
        end)}
      end
    end)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler4.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{fin - begin}")
