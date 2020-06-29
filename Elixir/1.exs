defmodule Utils do
  def upto1k(cnt, total) do
    cond do
      cnt == 1000 -> total
      rem(cnt, 3) == 0 || rem(cnt, 5) == 0 -> upto1k(cnt + 1, total + cnt)
      true -> upto1k(cnt + 1, total)
    end
  end
end

IO.puts(Utils.upto1k(1,0))
