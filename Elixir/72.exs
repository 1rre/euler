defmodule Euler72 do
  def branch(top, m, n) do
    if m <= top do
      IO.puts(to_string(n) <> "/" <> to_string(m))
      1 + branch(top, 2 * m - n, m) + branch(top, 2 * m + n, m) + branch(top, m + 2 * n, n)
    else
      0
    end
  end
  def result do
    branch(1000000, 3, 1) + branch(1000000, 2, 1)
  end
end

IO.puts(to_string(Euler72.result))
