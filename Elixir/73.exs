defmodule Euler73 do

end

begin = System.monotonic_time(:nanosecond)
result = Euler73.result
fin = System.monotonic_time(:nanosecond)
IO.puts(to_string(result) <> "\ntook: " <> to_string(fin - begin))
