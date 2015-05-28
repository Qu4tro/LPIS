(begin
    (declare 
             (string fizz)
             (string buzz)
             (int current)
             (int max)
    )
    (statements 
                (set fizz "Fizz")
                (set buzz "Buzz")
                (set max 100)
                (set current 1)
                (while (!= current max)
                    (cond 
                        (== (% current 15) 0) (print (cat fizz buzz))
                        (== (% current 3)  0) (print fizz)
                        (== (% current 5)  0) (print buzz)
                        (true)                (print current)
                    )
                    (set current (+ current 1))
                ) 
    )
)
