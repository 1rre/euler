defmodule Euler90 do
  def cube do
    Enum.each(0..4, fn s0 ->
      Enum.each(s0..5, fn s1 ->
        Enum.each(s1..6, fn s2 ->
          Enum.each(s2..7, fn s3 ->
            Enum.each(s3..8, fn s4 ->
              Enum.each(s4..9, fn s5 ->
                [s0, s1, s2, s3, s4, s5, s6]
              end)
            end)
          end)
        end)
      end)
    end)
  end
  def result do
    sq = Enum.map(1..trunc(:math.sqrt(100)), fn x -> x * x end)

  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler90.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin) / 1000000000}")
