defmodule E91 do
  def hypot2(a, b) do
    a * a + b * b
  end
  def result do
    n = 50
    Enum.reduce(0..n, 0, fn i_x, acc ->
      Enum.reduce(0..n, acc, fn i_y, acc ->
        Enum.reduce(0..n, acc, fn j_x, acc ->
          Enum.reduce(0..n, acc, fn j_y, acc ->
            if {i_x, i_y} != {j_x, j_y} && {j_x, j_y} != {0, 0} && {i_x, i_y} != {0, 0} do
              l1 = hypot2(i_x, i_y)
              l2 = hypot2(i_x - j_x, i_y - j_y)
              l3 = hypot2(j_x, j_y)
              mx = max(l1, l3)
              mn = min(l1, l3)
              if mx == mn + l2 do
                acc + 1
              else
                acc
              end
            else
              acc
            end
          end)
        end)
      end)
    end) / 2
  end
end

begin = System.monotonic_time(:nanosecond)
result = E91.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin) / 1000000000}")
