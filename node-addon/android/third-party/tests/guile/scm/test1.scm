
(display "test1.scm\n")


(define-public (randomize-rand-seed)
  ;(ly:randomize-rand-seed)
  (let*
      ((t (gettimeofday))
       (seed (*
              (cdr t)
              (car t)
              (getpid))))
  (set! *random-state* (seed->random-state seed))))

(randomize-rand-seed)

(display "test1.scm end.\n")
