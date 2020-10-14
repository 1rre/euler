defmodule Euler98 do
  def result do
    afs = Enum.map(trunc(:math.sqrt(999999999))..1, fn x -> x * x end)
    file = elem(File.read("words.txt"), 1)
    words = Enum.reject(Enum.map(String.split(file, "\r\n"), fn x -> String.split(x, ",") end), fn x -> String.reverse(Enum.at(x, 0)) == Enum.at(x, 1) end)
    Enum.reduce(words, 0, fn aa, acc ->
      x = String.to_charlist(Enum.at(aa, 0))
      y = String.to_charlist(Enum.at(aa, 1))
      xc = Enum.count(x)
      xu = Enum.count(Enum.uniq(x))
      Enum.reduce(Enum.filter(Enum.chunk_by(Enum.sort_by(Enum.filter(afs, fn xx -> Enum.count(Integer.digits(xx)) == xc && Enum.count(Enum.uniq(Integer.digits(xx))) == xu end), fn xx -> Enum.sort(Integer.digits(xx)) end), fn xx -> Enum.sort(Integer.digits(xx)) end), fn xx -> Enum.count(xx) > 1 end), acc, fn a, acc -> Enum.reduce(a, acc, fn b, acc -> Enum.reduce(a, acc, fn c, acc ->
            sxb = Enum.sort_by(Enum.zip(x, Integer.digits(b)), fn nn -> elem(nn, 0) end)
            syc = Enum.sort_by(Enum.zip(y, Integer.digits(c)), fn nn -> elem(nn, 0) end)
            if sxb == syc && Enum.all?(sxb, fn aa -> Enum.all?(Enum.filter(sxb, fn bb -> elem(bb, 0) == elem(aa, 0) end), fn bb -> elem(bb, 1) == elem(aa, 1) end) end) do
              if(b > c) do
                c
              else
                b
              end
            else
              acc
            end
          end)
        end)
      end)
    end)
  end
end

result = Euler98.result
avg = Enum.reduce(0..0, 0, fn x, acc ->
  begin = System.monotonic_time(:nanosecond)
  _ = Euler98.result
  fin = System.monotonic_time(:nanosecond)
  if(x >= 1) do
    (acc * (x - 1) + (fin - begin)) / x
  else
    0
  end
end)
IO.puts("#{result}\ntook: #{(avg)/1000000000}")
