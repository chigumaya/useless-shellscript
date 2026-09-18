#!/bin/bash
fb='i%15==0 ?
      x[$(echo FizzBuzz >&3)] : 
      ( i%3==0 ?
        x[$(echo Fizz >&3)] :
        ( i%5==0 ?
          x[$(echo Buzz >&3)] :
          x[$(echo $i >&3)]
        )
      ),
    ++i > 100 || fb'
((i=1,fb)) 3>&1
