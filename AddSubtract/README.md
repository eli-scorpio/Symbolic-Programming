# Add-and-Subtract-Predicates
Prolog program that implements predicate to add and subtract successors (s(0)) and predecessors (p(0))   
Implemented using tail recursion for helper predicate simplify/3

## Recommended IDE 
Swish Prolog

## Example queries to run
?- add2(s(0)+s(0), s(0+s(s(0))), Z).  
output: Z = s(s(s(s(s(0)))))

?- add2(p(0), p(0)+s(p(0)), Z).  
output: Z = p(p(0))

?- minus(p(s(p(p(p(s(s(s(0)))))))), Z).  
output: Z = 0

?- add2(p(0)+s(s(0)), -s(s(0)), Z).  
output: Z = p(0)

?- subtract(p(0), -s(s(0)), Z).  
output: Z = s(0)

?- add2(-(s(0)-p(0)),s(0),X).  
output: X = p(0)

?- subtract(p(0), p(s(0))-s(s(0)), Z).  
output: Z = s(0)

## Authors
Eligijus Skersonas

