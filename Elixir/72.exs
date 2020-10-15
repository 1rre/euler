#Generate primes & remove first, then see what is in the form 2mn etc.

defmodule Euler72 do
  def genCoPrime(m, n, acc) do
    max = 1000000
    if m + 2 * n <= max do
      genCoPrime(m + 2 * n, n, if 2 * m + n <= max do
        genCoPrime(2 * m + n, m, if 2 * m - n <= max do
          genCoPrime(2 * m - n, m, acc + 1)
        else
          acc
        end + 1)
      else
        if 2 * m - n <= max do
          genCoPrime(2 * m - n, m, acc + 1)
        else
          acc
        end
      end + 1)
    else
      if 2 * m + n <= max do
        genCoPrime(2 * m + n, m, if 2 * m - n <= max do
          genCoPrime(2 * m - n, m, acc + 1)
        else
          acc
        end + 1)
      else
        if 2 * m - n <= max do
          genCoPrime(2 * m - n, m, acc + 1)
        else
          acc
        end
      end
    end
  end
  def result do
    a = Task.async(Euler72, :genCoPrime, [5, 2, 1])
    b = Task.async(Euler72, :genCoPrime, [3, 2, 1])
    c = Task.async(Euler72, :genCoPrime, [4, 1, 1])
    d = Task.async(Euler72, :genCoPrime, [5, 1, 1])
    e = Task.async(Euler72, :genCoPrime, [5, 3, 1])
    f = Task.async(Euler72, :genCoPrime, [7, 3, 1])
    Task.await(a, 99999999) +
    Task.await(b, 99999999) +
    Task.await(c, 99999999) +
    Task.await(d, 99999999) +
    Task.await(e, 99999999) +
    Task.await(f, 99999999) +
    2
  end
end

begin = System.monotonic_time(:nanosecond)
result = Euler72.result
fin = System.monotonic_time(:nanosecond)
IO.puts("#{result}\ntook: #{(fin - begin)/1000000000}")
