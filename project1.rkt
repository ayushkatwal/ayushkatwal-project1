#lang racket

;; function provided by Professor Salazar to let program run either batch or interactive
(define prompt?
   (let [(args (current-command-line-arguments))]
     (cond
       [(= (vector-length args) 0) #t]
       [(string=? (vector-ref args 0) "-b") #f]
       [(string=? (vector-ref args 0) "--batch") #f]
       [else #t])))


;; tokenize input string into a list of tokens
(define (tokenize inputstr)
  (filter (λ (input) (not (string=? input ""))) (string-split inputstr)))


;; get history values and make sure list is reversed so references are correct
(define (history-value history n)
  (let* ([in-order (reverse history)]
         [index (- n 1)])
    (if (or (< index 0) (>= index (length in-order)))
           (error "Invalid Expression")
           (list-ref in-order index))))


;; function that processes a list of tokens and returns evaluation results
(define (evaluate tokens history)
  (if (null? tokens)
      (error "Invalid Expression")
      (let ([token (car tokens)]
            [rest (cdr tokens)]) 
        (cond
  