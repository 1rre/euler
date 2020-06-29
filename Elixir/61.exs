defmodule Euler62 do
  def shape(i, n) do
    i * (i * (n - 2) - (n - 4)) / 2
  end

  def isShapeR(a, b, i, n) do
    if b - a == 1 do
      false
    else
      x = round(shape(floor((a + b) / 2), n))
      if x == i do
        true
      else
        if x > i do
          isShapeR(a, floor((a + b) / 2), i, n)
        else
          isShapeR(floor((a + b) / 2), b, i, n)
        end
      end
    end
  end

  def isShape(i, n) do
    i == 0 || i == 1 || i > 1 && isShapeR(0, i, i, n)
  end

  def allShapes(i) do
    if Enum.any?(i, fn x -> isShape(x,3) end) do
      if Enum.any?(i, fn x -> isShape(x, 4) end) do
        if Enum.any?(i, fn x -> isShape(x, 5) end) do
          if Enum.any?(i, fn x -> isShape(x, 6) end) do
            if Enum.any?(i, fn x -> isShape(x, 7) end) do
              Enum.any?(i, fn x -> isShape(x, 8) end)
            end
          else
            false
          end
        else
          false
        end
      else
        false
      end
    else
      false
    end
  end

  def resultR(i_1, i_2, i_3, i_4, i_5) do
    i_6 = elem(Integer.parse(String.slice(to_string(i_5), 2, 2) <> String.slice(to_string(i_1), 0, 2)),0)
    i = [i_1, i_2, i_3, i_4, i_5, i_6]
    sorted = is_number(Enum.reduce_while(i, Enum.at(i, 0) - 1, fn x, acc ->
      if x > acc, do: {:cont, x}, else: {:halt, false}
    end))
    if sorted do
      if allShapes(i) do
        i
      else
        #not all shapes
      end
    else
      #not sorted
    end

    #IO.puts(to_string(i_1) <> "," <> to_string(i_2) <> "," <> to_string(i_3) <> "," <> to_string(i_4) <> "," <> to_string(i_5) <> "," <> to_string(i_6))
  end
  def getRange(i) do
    iLast2 = elem(Integer.parse(String.slice(to_string(i), 2, 2)), 0)
    (iLast2 * 100) .. ((iLast2 + 1) * 100 - 1)
  end
  def result do
    i1r = 1010..9999
    Enum.each(i1r, fn i_1 ->
      IO.puts(to_string(i_1))
      i2r = getRange(i_1)
      Enum.each(i2r, fn i_2 ->
        if i_2 > i_1 do
          i3r = getRange(i_2)
          Enum.each(i3r, fn i_3 ->
            if i_3 > i_2 do
              i4r = getRange(i_3)
              Enum.each(i4r, fn i_4 ->
                if i_4 > i_3 do
                  i5r = getRange(i_4)
                  Enum.each(i5r, fn i_5 ->
                    if i_5 > i_4 do
                      i_6 = elem(Integer.parse(String.slice(to_string(i_5), 2, 2) <> String.slice(to_string(i_1), 0, 2)),0)

                    end
                  end)
                end
              end)
            end
          end)
        end
      end)
    end)
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler62.result
fin = System.monotonic_time(:nanosecond)
IO.puts(to_string(result) <> "\ntook: " <> to_string(fin - begin))
trues = [true, true, false]
if(Enum.all?(trues, fn x -> x end)) do
  IO.puts("True")
end
