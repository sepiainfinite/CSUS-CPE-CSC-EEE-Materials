;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname AllTestCh08) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (appendlist A B)
  (if (null? A) B
      (cons (car A)(appendlist (cdr A) B))))

(appendlist '(1 2 3) '(4 5 6))

(define (myReverse L)
  (if (null? L) '()
      (append (myReverse (cdr L))(list(car L)))))

(myReverse '(1 2 3 4 5))


(define (atom? a)
  (not (list? a)))

(define (cSL L M) ;tests for the structural equality of two given lists.
  (cond ((or (null? M) (null? L)) (and (null? L) (null? M)))
        ((or (list? (car L)) (list? (car M)))
         (and (cSL (car L) (car M)) (cSL (cdr L) (cdr M))))
        (else
         (and (and (atom? (car L)) (atom?(car M))) (cSL (cdr L) (cdr M))))))
      

(cSL '(1 (2 () 3  4 4) 3) '(1 (2 () 4 4) 3))

(define (removeatom a L)
  (cond ((null? L)
         '())
        ((list? (car L))
         (cons (removeatom a (car L)) (removeatom a (cdr L)))) ; <------important
        ((eq? a (car L))
         (removeatom a (cdr L)))
        (else
         (cons (car L) (removeatom a (cdr L))))))

(removeatom 'a '( a ( b c ( a ) a ) ( a b ) ) ) ; ( ( b c ( ) ) ( b ) )

(removeatom 'a '( a  b c  a  a   a b  ))

(define (deepReverse L)
  (cond ((null? L) '())
        ((list? (car L))
         (append (deepReverse (cdr L)) (list(deepReverse (car L)))))  ; <------important
        (else
         (append (deepReverse (cdr L)) (list(car L))))))

(deepReverse '( ( 2 3 ) 4 ( 5 6 ) ))
                   

(define (removeLast L)
  (if (null? (cdr L)) '()
      (cons (car L) (removeLast (cdr L)))))

(removeLast '( (a b ) c ( ( d ) e f ( g ) ) ) )  ;( (a b ) c )

(define (replaceAtom a x L)
  (cond ((null? L) '())
        ((list? (car L))
         (cons (replaceAtom a x (car L)) (replaceAtom a x (cdr L))))
        ((eq? (car L) a)
         (cons x (replaceAtom a x (cdr L))))
        (else
         (cons (car L) (replaceAtom a x (cdr L))))))

(replaceAtom 'a 'x '( a ( b c ( a ) a ) ( a b ) ) )

(define (lengthT L bu)
  (if (null? L) bu
      (lengthT (cdr L) (+ 1 bu))))

(lengthT '(1 2 (3 4)) '0)

(define (countdown n) ; <------important
  (if (= n 0) '()
      (cons n (countdown (- n 1)))))

(countdown '10)

(define (countup n) ; <------important
  (if (= n 0 ) '()
      (append (countup (- n 1)) (list n))))

(countup '10)

(define (squareList1 L)
  (map (lambda (x) (* x x)) L))

(squareList1 '(1 2 3 4 5))

(define (squareList2 L)
  (if (null? L) '()
      (cons (* (car L) (car L)) (squareList2 (cdr L)))))

(squareList2 '(1 2 3 4 5))

(define (squareList3 L bu)
  (if (null? L) bu
      (squareList3 (cdr L) (append bu (list (* (car L) (car L)))))))

(squareList3 '(1 2 3 4 5) '())

(define (removeIf F L)
  (cond ((null? L) '())
        ((F (car L)) (removeIf F (cdr L)))
        (else
         (cons (car L) (removeIf F (cdr L))))))

(removeIf (lambda(x)(< x 0)) '(1 2 -3 0 4))

(removeIf list? '( ( a b ) c ( d e f ) g ( h i j ) ) )

(define (compute a x)
  (cond ((> a 0) (+ a x))
        ((< a 0) (* x (- 0 a)))
        (else (* x x))))

(define (buildHelper L x)
  (if (null? (cdr L)) (compute (car L) x)
      (buildHelper (cdr L) (compute (car L) x))))

(define (BuildSeries L)
  (lambda (x) (buildHelper L x)))

(define S ( BuildSeries '(5 0 -4 -2 8) ) )

(S '4)
      

