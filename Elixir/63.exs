defmodule Euler63 do
  def findx(tryx) do
    case tryx do
      9999 -> "hello"
      "e" -> 1492
      _ -> [67, "nanana"]
    end
  end
end
x = Euler63.findx(9999)
y = Euler63.findx("e")
z = Euler63.findx([[31,"hello"], true, [fn p -> :math.asin(p) end]])
IO.puts(to_string(x) <> "," <> to_string(y) <> "," <> to_string(z))
