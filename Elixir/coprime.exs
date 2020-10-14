defmodule Coprime do
@pi 31415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679
@exp 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
@pi2 trunc(@pi/2)

  def find(itr) do
    if :math.tan(div(itr, @exp)) > div(itr, @exp) do
      IO.puts("#{div(itr, @exp)}, #{:math.tan(div(itr, @exp))}")
    end
    find(itr + @pi)
  end

  def main do
    IO.puts(@exp)
    find(@pi2)
  end
end

Coprime.main()
