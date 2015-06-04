(begin
    (declare 
             (int total)
    )
    (statements 
                (set total 1)
                (set n 5)
                (while (> n 1)

                    (set total (* total n))
                    (set total (- total 1))
                ) 

                (print total)
    )
)
