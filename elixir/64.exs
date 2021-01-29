defmodule Utils do
  def add(list, item) do
    Enum.reverse([item | Enum.reverse(list)])
  end
  defimpl String.Chars, for: Tuple do
    def to_string(tuple) do
      interior =
        tuple
        |> Tuple.to_list()
        |> Enum.map(&Kernel.to_string/1)
        |> Enum.join(", ")

      "{#{interior}}"
    end
  end
  def pow(a, b) do
    if is_integer(b) do
      case b do
        0 -> 1
        x when x > 0 -> a * pow(a, b - 1)
        x when x < 0 -> 1 / (a * pow(a, b - 1))
      end
    else
      :math.pow(a, b)
    end
  end
  def intSqrt(x) do
    floor(:math.sqrt(x))
  end
end
defmodule Euler64 do
  def checkAll(list, sublist, i) do
    listSize = Enum.count(list)
    sublistSize = Enum.count(sublist)
    #IO.puts(to_string(listSize) <> "," <> to_string(sublistSize))
    cond do
      listSize == 0 -> true
      listSize < sublistSize -> false
      List.starts_with?(list, sublist) ->
        #IO.puts("checking: " <> Enum.join(list, ",") <> " and " <> Enum.join(sublist, ","))
        checkAll(Enum.drop(list, sublistSize), sublist, i)
      true -> false
    end
  end
  def checkList(i, n) do
    Enum.reduce_while(Enum.drop(n, 1), [List.first(n)], fn x, acc ->
      y = Enum.drop(n, Enum.count(acc))
      #IO.puts("y: " <> Enum.join(y, ","))
      #IO.puts("Acc: " <> Enum.join(acc, ","))
      if(Enum.count(n) > 0 && checkAll(n, acc, i)) do
        #IO.puts("init: " <> Enum.join(acc, ","))
        {:halt, {acc, true}}
      else
        #IO.puts("Not")
        {:cont, Utils.add(acc, x)}
      end
    end)
  end
  def genNext(x, lastx) do
    #IO.puts(lastx)
    y = 1 / lastx
    yf = floor(y)
    IO.puts(lastx)
    yr = y - yf
    if Float.round(yr, 10) == Float.round(lastx, 10) do
      IO.puts("worked")
      {Utils.add(x, yf), lastx}
    else
      {Utils.add(x, yf), yr}
    end

  end
  def period(x, lastx, n) do
    cond do
      :math.sqrt(n) == Utils.intSqrt(n) -> 0
      Enum.count(x) > Utils.intSqrt(n) + 1 ->
        cl = checkList(n, x)
        if is_tuple(cl) do
          cl0 = elem(cl,0)
          vl = Enum.count(cl0)
          IO.puts(to_string(n) <> "->" <> to_string(vl))
          vl
        else
          next = genNext(x, lastx)
          IO.puts(Enum.join(elem(next,0),"·"))
          a = elem(next, 1)
          if a == lastx do
            period(elem(next, 0), lastx, n)
          else
            period(elem(next, 0), a, n)
          end

        end
      true ->
      next = genNext(x, lastx)
      #IO.puts(Enum.join(elem(next,0),"·"))
      period(elem(next, 0), elem(next, 1), n)
    end
  end
  def result do
    Enum.reduce(1..100, 0, fn x, acc ->
      sqrtx = Utils.intSqrt(x)
      if rem(period([], :math.sqrt(x) - sqrtx, x), 2) == 1 do
        acc + 1
      else
        acc
      end
    end)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler64.result
fin = System.monotonic_time(:nanosecond)
IO.puts(to_string(result) <> "\ntook: " <> to_string(fin - begin))
