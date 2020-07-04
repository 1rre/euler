defmodule Euler66 do
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
  def ak(n, k) do
    if k == 0 do
      n
    else
      x = ak(n, k - 1)
      1 / (x - floor(x))
    end
  end
  def pk(n, k) do
    case k do
      0 -> floor(ak(n, 0))
      1 -> floor(ak(n, 0)) * floor(ak(n, 1)) + 1
      _ -> floor(ak(n, k)) * pk(n, k - 1) + pk(n, k - 2)
    end
  end
  def qk(n, k) do
    case k do
      0 -> 1
      1 -> floor(ak(n, 1))
      _ -> floor(ak(n, k)) * qk(n, k - 1) + qk(n, k - 2)
    end
  end
  def sqrtFrac(n2, k) do
    n = :math.sqrt(n2)
    {pk(n, k), qk(n, k)}
  end
  def recursiveFind(n2, k) do
    IO.puts(to_string(n2) <> "," <> to_string(k))
    x = sqrtFrac(n2, k)
    if pow(elem(x, 0), 2) - n2 * pow(elem(x, 1), 2) == 1 do
      elem(x, 0)
    else
      IO.puts(pow(elem(x, 0), 2) - n2 * pow(elem(x, 1), 2))
      recursiveFind(n2, k + 1)
    end
  end
  def result do
    Enum.map(1..62, fn x ->
      y = :math.sqrt(x)
      if(Float.floor(y) == y) do
        0
      else
        IO.puts(x)
        recursiveFind(x, 1)
      end
    end)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler66.result
fin = System.monotonic_time(:nanosecond)
IO.puts(to_string(result) <> "\ntook: " <> to_string(fin - begin))
