defmodule Euler104 do
  @double_max 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    defp m_mul(a, b) do
      {
        {
          elem(elem(a,0),0) * elem(elem(b,0),0) + elem(elem(a,0),1) * elem(elem(b,1),0),
          elem(elem(a,0),0) * elem(elem(b,0),1) + elem(elem(a,0),1) * elem(elem(b,1),1)
        },
        {
          elem(elem(a,1),0) * elem(elem(b,0),0) + elem(elem(a,1),1) * elem(elem(b,1),0),
          elem(elem(a,1),0) * elem(elem(b,0),1) + elem(elem(a,1),1) * elem(elem(b,1),1)
        }
      }
    end

    def int_pow(x, n) do
      case n do
        0 -> 1
        1 -> x
        _ -> x * int_pow(x, n - 1)
      end
    end

    defp div_while(x) do
      case div(x, 1000000000) do
        0 -> x
        y -> div_while(div(x, (if x < @double_max do
          int_pow(10, max(1,trunc(:math.log10(y))))
        else
          @double_max
        end)))
      end
    end

    defp has_digits_1(n) do #There has to be a faster way of doing this but immutable lists make it trickier.
      d = Integer.digits(n)
      Enum.member?(d, 1) && Enum.member?(d, 2) && Enum.member?(d, 3) && Enum.member?(d, 4) && Enum.member?(d, 5) && Enum.member?(d, 6) && Enum.member?(d, 7) && Enum.member?(d, 8) && Enum.member?(d, 9)
    end

    defp fib_last(n\\3, pre1\\1, pre2\\1, matrix\\m_mul({{1,1},{1,0}},{{1,1},{1,0}})) do
      if rem(pre1 + pre2, 1000000000) |> has_digits_1() && elem(elem(matrix, 0),0) |> div_while(n) |> has_digits_1() do
        n
      else
        fib_last(n + 1, rem(pre1 + pre2, 1000000000), pre1, m_mul(matrix, {{1,1},{1,0}}))
      end
    end

    def result do
      fib_last()
    end
  end
