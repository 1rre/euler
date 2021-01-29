{function, problem2, 0, l6}.
  {label,l5}.
    {func_info,{atom,euler},{atom,problem2},0}.
  {label,l6}.
    {move,{integer,0},{x,0}}.
    {move,{integer,1},{x,1}}.
    {move,{integer,1},{x,2}}.
  {label,l7}.
    {test,is_lt,{f,9},[{x,1},{integer,4000000}]}.
    {gc_bif,'+',{f,6},3,[{x,1},{x,2}],{x,1}}.
    {gc_bif,'-',{f,6},3,[{x,1},{x,2}],{x,2}}.
    {gc_bif,'rem',{f,6},3,[{x,1},{integer,2}],{x,3}}.
    {test,is_eq,{f,7},[{x,3},{integer,0}]}.
  {label,l8}.
    {gc_bif,'+',{f,6},3,[{x,0},{x,1}],{x,0}}.
    {jump,{f,7}}.
  {label,l9}.
    return.
