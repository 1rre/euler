defmodule Euler1 do
  @max 1000
  def result, do: Enum.map(1..div(@max, 3), &(3 * &1)) ++ Enum.map(1..div(@max, 5), &(if rem(&1, 3) == 0, do: 0, else: 5 * &1)) |> Enum.sum
end

defmodule Euler2 do
  def fib(sum, pre1, pre2) do
    current = pre1 + pre2
    cond do
      current > 4000000 -> sum
      rem(current, 2) == 0 -> fib(sum + current, current, pre1)
      true -> fib(sum, current, pre1)
    end
  end
  def result do
    fib(2, 2, 1)
  end
end

defmodule Euler3 do
  def is_prime?(n), do: n == 2 || !Enum.any?(2..trunc(:math.sqrt(n)), &rem(n, &1) == 0)

  def largest_pf(n) do
    if is_prime?(n) do
      n
    else
      Enum.map(2..trunc(:math.sqrt(n)), fn x ->
        if rem(n, x) == 0, do: largest_pf(div(n, x)), else: 0
      end) |> Enum.max()
    end
  end

  def result do
    largest_pf(600851475143)
  end
end

defmodule Euler4 do
  def is_pal([hd | x]) do
    if hd == Enum.at(x, length(x) - 1, hd), do: is_pal(List.delete_at(x, length(x) - 1)), else: false
  end
  def is_pal(x) do
    if is_integer(x), do: is_pal(Integer.digits(x)), else: true
  end
  def result do
    Enum.reduce_while(999..100, 0, fn i, acc ->
      if i * i <= acc do
        {:halt, acc}
      else
        {:cont, Enum.reduce_while(i..100, acc, fn j, acc ->
          case i * j do
            x when x < acc -> {:halt, acc}
            x -> if is_pal(x), do: {:halt, x}, else: {:cont, acc}
          end
        end)}
      end
    end)
  end
end

defmodule Euler5 do
  def is_divisible(x) do
    case Enum.map(11..20, &(if rem(x, &1) == 0, do: div(x, &1), else: [])) |> List.flatten() |> Enum.filter(&Enum.all?(11..20, fn y -> rem(&1, y) == 0 end)) do
      [] -> x
      y -> Enum.map(y, &is_divisible/1) |> Enum.min()
    end

  end
  def result do
    is_divisible(670442572800)
  end
end

defmodule Euler6 do
  def intpow(x, n), do: if n <= 0, do: 1, else: x * intpow(x, n - 1)
  def result do
    (Enum.sum(1..100) |> intpow(2)) - Enum.reduce(1..100, &(&2 + &1 * &1))
  end
end

#The algorithm works in an acceptable time, however we can use the formulae for sum of n and sum of n² to do it faster

defmodule Euler6_Alt do
  def intpow(x, n), do: if n <= 0, do: 1, else: x * intpow(x, n - 1)
  def result do
    (div(100 * 101, 2) |> intpow(2)) - div(100 * 101 * 201, 6)
  end
end

defmodule Euler7 do
  def generate_while(max, acc\\2, n\\3) do
    cond do
      Enum.any?(2..ceil(:math.sqrt(n)), &rem(n, &1) == 0) -> generate_while(max, acc, n + 2)
      acc >= max -> n
      true -> generate_while(max, acc + 1, n + 2)
    end
  end
  def result do
    generate_while(10001)
  end
end

defmodule Euler8 do
  def max_13(n), do: if n == 0, do: 0, else: max(Enum.reduce(Integer.digits(rem(n, 10000000000000)), &*/2), max_13(div(n, 10)))
  def result, do: max_13(7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450)
end

defmodule Euler9 do
  def result do

  end
end

defmodule Euler10 do
  def result do

  end
end

defmodule Euler11 do
  def result do

  end
end

defmodule Euler12 do
  def result do

  end
end

defmodule Euler13 do
  def result do

  end
end

defmodule Euler14 do
  def result do

  end
end

defmodule Euler15 do
  def result do

  end
end

defmodule Euler16 do
  def result do

  end
end

defmodule Euler17 do
  def result do

  end
end

defmodule Euler18 do
  def result do

  end
end

defmodule Euler19 do
  def result do

  end
end

defmodule Euler20 do
  def result do

  end
end

defmodule Euler21 do
  def result do

  end
end

defmodule Euler22 do
  def result do

  end
end

defmodule Euler23 do
  def result do

  end
end

defmodule Euler24 do
  def result do

  end
end

defmodule Euler25 do
  def result do

  end
end

defmodule Euler26 do
  def result do

  end
end

defmodule Euler27 do
  def result do

  end
end

defmodule Euler28 do
  def result do

  end
end

defmodule Euler29 do
  def result do

  end
end

defmodule Euler30 do
  def result do

  end
end

defmodule Euler31 do
  def result do

  end
end

defmodule Euler32 do
  def result do

  end
end

defmodule Euler33 do
  def result do

  end
end

defmodule Euler34 do
  def result do

  end
end

defmodule Euler35 do
  def result do

  end
end

defmodule Euler36 do
  def result do

  end
end

defmodule Euler37 do
  def result do

  end
end

defmodule Euler38 do
  def result do

  end
end

defmodule Euler39 do
  def result do

  end
end

defmodule Euler40 do
  def result do

  end
end

defmodule Euler41 do
  def result do

  end
end

defmodule Euler42 do
  def result do

  end
end

defmodule Euler43 do
  def result do

  end
end

defmodule Euler44 do
  def result do

  end
end

defmodule Euler45 do
  def result do

  end
end

defmodule Euler46 do
  def result do

  end
end

defmodule Euler47 do
  def result do

  end
end

defmodule Euler48 do
  def result do

  end
end

defmodule Euler49 do
  def result do

  end
end

defmodule Euler50 do
  def result do

  end
end

begin = System.monotonic_time(:nanosecond)
result = case System.argv() |> hd do
  "1" -> Euler1.result()
  "2" -> Euler2.result()
  "3" -> Euler3.result()
  "4" -> Euler4.result()
  "5" -> Euler5.result()
  "6" -> Euler6.result()
  "7" -> Euler7.result()
  "8" -> Euler8.result()
  "9" -> Euler9.result()
  "10" -> Euler10.result()
  "11" -> Euler11.result()
  "12" -> Euler12.result()
  "13" -> Euler13.result()
  "14" -> Euler14.result()
  "15" -> Euler15.result()
  "16" -> Euler16.result()
  "17" -> Euler17.result()
  "18" -> Euler18.result()
  "19" -> Euler19.result()
  "20" -> Euler20.result()
  "21" -> Euler21.result()
  "22" -> Euler22.result()
  "23" -> Euler23.result()
  "24" -> Euler24.result()
  "25" -> Euler25.result()
  "26" -> Euler26.result()
  "27" -> Euler27.result()
  "28" -> Euler28.result()
  "29" -> Euler29.result()
  "30" -> Euler30.result()
  "31" -> Euler31.result()
  "32" -> Euler32.result()
  "33" -> Euler33.result()
  "34" -> Euler34.result()
  "35" -> Euler35.result()
  "36" -> Euler36.result()
  "37" -> Euler37.result()
  "38" -> Euler38.result()
  "39" -> Euler39.result()
  "40" -> Euler40.result()
  "41" -> Euler41.result()
  "42" -> Euler42.result()
  "43" -> Euler43.result()
  "44" -> Euler44.result()
  "45" -> Euler45.result()
  "46" -> Euler46.result()
  "47" -> Euler47.result()
  "48" -> Euler48.result()
  "49" -> Euler49.result()
  "50" -> Euler50.result()
end
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{fin - begin}")
