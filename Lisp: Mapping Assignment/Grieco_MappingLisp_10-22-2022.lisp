; Author: Anthony Grieco
; Date: 10/22/2022
; Description: This basic program written in Steel Bank Common Lisp takes two arguments (a function and a list of items) and then adds "1" to each of the items in the list. The program then outputs the results.

(defun iterator (func val)
    
    ; (func (car lst) 1) ;Takes first element in the current list and then adds 1 to it       ;Error Here
    ; (func val 1)
    ;  (append(apply func (list (car val)) 1)) ;Error Here


    ;  (append(list(apply func (car val) 1)) ) ;Error Here -+-


    ;  append(apply iterator(list(car val)))

    ; (apply + (list (car val)) 1)
    ; append (list val)

    ; (apply + (list (car val)) 1) ;Error Here
    ; append(val)


;     ; (integer func (car lst) 1)
;     ; (+ (car lst) 1)
;     ; (apply integer (func (car lst) 1))

;(apply #'f (list (car '123)))

;   

    (if val
        ; (func (car lst) 1) ;Takes first element in the current list and then adds 1 to it       ;Error Here
         (append(list(apply func (list(car val)) )) (iterator func (cdr val))) ;Error Here
         
         ;(iterator func (cdr val)) ;Recursive Call to iterate to the next element in the list    ;Error Here (Solved) -+-
;         ; (break)
        ; val
        ; (lst)
    )
    
)

(format t "List of Items being Iterated: (1, 2, 3, 4, 5) ~%")
(format t "Result of the Above List being Iterated: ~d~%" (iterator #'1+ '(1 2 3 4 5)))         ;Error Here Caused by Line 9


; (defun iterator (lst)
;     (
;     ; (+ (car lst) 1) ;Takes first element in the current list and then adds 1 to it       ;Error Here
;     (apply func (list (car lst))) ;Error Here
; ;     ; (integer func (car lst) 1)
; ;     ; (+ (car lst) 1)
; ;     ; (apply integer (func (car lst) 1))

; ;(apply #'f (list (car '123)))

; ;   

;     if lst (
;         ; (func (car lst) 1) ;Takes first element in the current list and then adds 1 to it       ;Error Here
;         (iterator func (cdr lst)) ;Recursive Call to iterate to the next element in the list    ;Error Here
; ;         ; (break)
;         ; (lst)
;     )
;     )
; )

; (format t "List of Items being Iterated: (1, 2, 3, 4, 5) ~%")
; (format t "Result of the Above List being Iterated: ~d~%" (iterator #'+ 1 2 3 4 5))         ;Error Here Caused by Line 8

; (defun addFive(x)(+ x 5)
; ( funcName #'addfive '(1 2 3)
    ;append(apply iterator(list(car lst)))
    
    ;Recursion (check to see if list is empty, if so -> spit out current new list, else -> trigger recursion)
;)
