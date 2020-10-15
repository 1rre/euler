def genCoPrime(m, n, max, acc) do
  #IO.puts("#{n} / #{m}")
  if m + 2 * n <= max do
    genCoPrime(m + 2 * n, n, max, if 2 * m + n <= max do
      genCoPrime(2 * m + n, m, max, if 2 * m - n <= max do
        genCoPrime(2 * m - n, m, max, acc + 1)
      else
        acc
      end + 1)
    else
      if 2 * m - n <= max do
        genCoPrime(2 * m - n, m, max, acc + 1)
      else
        acc
      end
    end + 1)
  else
    if 2 * m + n <= max do
      genCoPrime(2 * m + n, m, max, if 2 * m - n <= max do
        genCoPrime(2 * m - n, m, max, acc + 1)
      else
        acc
      end + 1)
    else
      if 2 * m - n <= max do
        genCoPrime(2 * m - n, m, max, acc + 1)
      else
        acc
      end
    end
  end
end
def resulta do
  n = 100
  genCoPrime(2, 1, n, 1) + genCoPrime(3, 1, n, 1)
end
