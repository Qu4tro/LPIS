(begin
    (declare 
             (array 100 fib)
             (int fib0)
             (int fib1)
             (int temp)

             (int index)
    )
    (statements 
                (set fib0 0)
                (set fib1 1)
                (set fib 0 fib0)
                (set fib 1 fib1)
                (set index 2)
                (while (< fib1 100)

                    (set temp fib0)
                    (set fib0 fib1)
                    (set fib1 (+ fib0 temp))

                    (set index fib fib1)
                    (set index (+ index 1))
                ) 

                (set index 0)
                (while (!= index (len fib))
                    (print (get fib index))
                    (set index (+ index 1))
                )
    )
)
