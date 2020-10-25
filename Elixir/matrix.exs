defmodule Matrix do
  def det(a) do
    if length(a) == 1 do
      hd(hd(a))
    else
      Enum.map(Enum.with_index(hd(a)), fn {x, i} ->
        {i, x, Task.async(Matrix, :det, [Enum.map(tl(a), &List.delete_at(&1, i))])}
      end) |> Enum.map(fn {i, x, t} -> (-2 * rem(i, 2) + 1) * x * Task.await(t, :infinity) end) |> Enum.sum()
    end
  end
  def random(size) do
    Enum.map(1..size, fn _ -> Enum.map(1..size, fn _ -> :rand.normal end) end)
  end
  def to_string(mat) do
    Enum.join(Enum.map(mat, &Enum.join(&1, ",")), "\n")
  end
end
matrix = Matrix.random(System.argv() |> hd |> Integer.parse() |> elem(0))
begin = System.monotonic_time(:nanosecond)
result = Matrix.det(matrix)
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
