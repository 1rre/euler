{function, problem3, 0, l11}.
  {label,l10}.
    {func_info,{atom,euler},{atom,problem3},0}.
  {label,l11}.
    {move,{integer,600851475143},{x,0}}.
  {label,l12}.
    {move,{integer,1},{x,1}}.
  {label,l13}.
    {gc_bif,'+',{f,l11},2,[{x,1},{integer,1}],{x,1}}.
    {test,is_ne,{f,l14},[{x,0},{x,1}]}.
    {gc_bif,'rem',{f,l11},2,[{x,0},{x,1}],{x,2}}.
    {test,is_eq,{f,l13},[{x,2},{integer,0}]}.
    {gc_bif,'div',{f,l11},2,[{x,0},{x,1}],{x,0}}.
    {move,{integer,1},{x,1}}.
    {jump,{f,l13}}.
  {label,l14}.
    return.
