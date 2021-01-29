{function, problem1, 0, 1}.
  {label,0}.
    {func_info,{atom,euler},{atom,problem1},0}.
  {label,1}.
    {move, {integer, 0}, {x, 0}}.
    {move, {integer, 0}, {x, 1}}.
  {label,2}.
    {gc_bif, '+', {f, 1}, 2, [{x, 1}, {integer, 1}], {x, 1}}.
    {test, is_lt, {f, 4}, [{x,1}, {integer, 1000}]}. 
    {gc_bif, 'rem', {f, 1}, 2, [{x, 1}, {integer, 3}], {x, 2}}.
    {test, is_ne, {f, 3}, [{x, 2}, {integer, 0}]}.
    {gc_bif, 'rem', {f, 1}, 2, [{x, 1}, {integer, 5}], {x, 2}}.
    {test, is_ne, {f, 3}, [{x, 2}, {integer, 0}]}.
    {jump, {f, 2}}.
  {label,3}.
    {gc_bif, '+', {f, 1}, 2, [{x, 0}, {x, 1}], {x, 0}}.
    {jump, {f, 2}}.
  {label,4}.
    return.
