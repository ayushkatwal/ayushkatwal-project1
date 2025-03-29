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
            [remaining-tokens (cdr tokens)]) 
        (cond
          
          ;;  history ($n)
          [(and (positive? (string-length token)) (char=? (string-ref token 0) #\$))
           (let* ([str (substring token 1)]
                  [num (string->number str)])
             ;; check if history value exists, if it doesnt then display an error message
             (if (and num (integer? num))
                 (list (history-value history num) remaining-tokens)
                 (error "Invalid Expression")))]

          ;; number
          [(string->number token)
           => (λ (num) (list num remaining-tokens))]
          
          ;; negation (-)
          [(string=? token "-")
           (let* ([val-remaining-tokens (evaluate remaining-tokens history)]
                  [val (car val-remaining-tokens)]
                  [next (cadr val-remaining-tokens)])
             (list (- val) next))]
          
          ;; addition (+)
          [(string=? token "+")
           (let* ([left (evaluate remaining-tokens history)]
                  [left-val (car left)]
                  [right (evaluate (cadr left) history)]
                  [right-val (car right)] )
             (list (+ left-val right-val) (cadr right)))]
          
          ;; multiplication (*)
          [(string=? token "*")
           (let* ([left (evaluate remaining-tokens history)]
                  [left-val (car left)]
                  [right (evaluate (cadr left) history)]
                  [right-val (car right)])
             (list (* left-val right-val) (cadr right)))]
          
          ;; division (/)
          [(string=? token "/")
           (let* ([left (evaluate remaining-tokens history)]
                  [left-val (car left)]
                  [right (evaluate (cadr left) history)]
                  [right-val (car right)])
             ;; dividing by 0 results in error
             (if (zero? right-val)
                 (error "Invalid Expression")
                 (list (quotient left-val right-val) (cadr right))))]
          
          ;; invalid tokens. if any unwanted tokens such as 'a' appear show error message
          [else (error "Invalid Expression")]))))


;; main function (read-eval-print loop)
(define (main history)
  
  ;; if interactive mode, display prompt
  (when prompt? (display "Enter prefix notation:"))
  (flush-output)

  ;; read line from user
  (let ([input (read-line)])
    (cond
      ;; if user inputs quit, exit program
      [(eof-object? input) (exit)]
      [(string=? (string-trim input) "quit") (exit)]
      ;; evaluate input safely using error handlers
      [else
       (with-handlers ([exn:fail?
                        (λ (err)
                          (when prompt? (display "Error: "))
                          (displayln "Invalid Expression")
                          (main history))])

          ;; call tokenize function to tokenize input and evaluate expression
         (let* ([tokens (tokenize input)]
                [result-and-remaining-tokens (evaluate tokens history)]
                [result (car result-and-remaining-tokens)]
                [remaining-tokens (cadr result-and-remaining-tokens)])
           ;; if all tokens are used print the result and store in history
           (if (null? remaining-tokens)
               (let ([id (+ 1 (length history))])
                 (display id)
                 (display ": ")
                 (displayln (real->double-flonum result))
                 (main (cons result history)))
               
               ;; if there are unused tokens, input is invalid so show error message
               (begin
                 (when prompt? (display "Error: "))
                 (displayln "Invalid Expression")
                 (main history)))))])))

;; run the program
(main '())
