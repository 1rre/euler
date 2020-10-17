defmodule Euler3 do

  def is_prime?(n), do: n == 2 || !Enum.any?(2..trunc(:math.sqrt(n)), &rem(n, &1) == 0)

  def largest_pf(n) do
    if is_prime?(n) do
      n
    else
      Enum.map(2..trunc(:math.sqrt(n)), fn x ->
        if rem(n, x) == 0, do: largest_pf(div(n, x)), else: 0
      end) |> Enum.max()
    end
  end

  def result do
    largest_pf(600851475143)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler3.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{fin - begin}")
