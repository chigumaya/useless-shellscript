divert(-1)
define(`Lsystem',`ifelse($2,0,,`Lsystem($1,decr($2),$3)')define($3,`$1')')
define(`F',``F L F L F R R F R R F L F L F'')
Lsystem(`F L F L F L F L F L F',5,`_path_')
define(`dir',`ifelse($1,0,``h2'',$1,1,``l1 -2'',$1,2,``l-1 -2'',$1,3,``h-2'',$1,4,``l-1 2'',``l1 2'')')
define(`i',0)
define(`F',`dir(i)')
define(`L',`define(`i',eval((i+1)%6))')
define(`R',`define(`i',eval((i+5)%6))')
divert(0)dnl
<svg xmlns="http://www.w3.org/2000/svg" width="992" height="994">
  <path d="M253 983 _path_" fill="none" stroke="gray"/>
</svg>
