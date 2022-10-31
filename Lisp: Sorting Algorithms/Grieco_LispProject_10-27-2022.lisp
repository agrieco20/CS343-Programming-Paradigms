; Author: Anthony Grieco
; Date: 10/27/2022
; Description: This program implements 3 different sorting algorithms (Bubble Sort, Merge Sort, and Quick Sort) all in Steel Bank Common Lisp to organize the data that the user sends to it.

; (defun bubble_total-Iterations-Calculator (lst)
;     (* (length lst) (- (length lst) 1))
; )

;Used to grab one of the elements intended to be swapped with another (requires a second call to this function)
(defun retrieve-item (currentIndex lst)
    (if (= currentIndex 0)
        (car lst)
        (retrieve-item (- currentIndex 1) (cdr lst))
    )
)

;Returns the list of elements that precede the two elements being swapped
(defun list-before-item (currentIndex lst)
    (if (= currentIndex 0)
        nil
        (append (list(car lst)) (list-before-item (- currentIndex 1) (cdr lst)))
        ; (cons (car lst) (list-before-item (- currentIndex 1) (cdr lst)))
    )
)

;Returns the list of elements that follow the two elements being swapped
(defun list-after-item (currentIndex lst)
    (if (= currentIndex 0)
        (cdr lst)
        (list-after-item (- currentIndex 1) (cdr lst))
    )
)

;Swaps two elements when the first element is greater than the second element
(defun swap (currentIndex lst)
    (append
        (list-before-item currentIndex lst)
        (list(retrieve-item (+ currentIndex 1) lst))
        (list(retrieve-item currentIndex lst))
        (list-after-item (+ currentIndex 1) lst)
    )
)

; (defun Bubble-Sort-OuterLoop (currentIndex lst currentLoop)
;     (if (< currentLoop (length lst))
;         (Bubble-Sort-InnerLoop currentIndex lst)
;         ; lst
;     )
; )

(defun Bubble-Sort-OuterLoop (currentIndex lst currentLoop)
    (if (< currentLoop (length lst))
        (Bubble-Sort-OuterLoop currentIndex (Bubble-Sort-InnerLoop currentIndex lst) (+ currentLoop 1))
        lst
    )
)

(defun Bubble-Sort-InnerLoop (currentIndex lst );currentIteration totalNumIterations)
    ; (if (= (length lst) 0) ;Checks to see if there are more than 0 elements in the list as a TEST
    ;     (format t "No items were found in list ~%") ;TEST
    ;     (format t "~d Items were found in the list ~%" (length lst)) ;TEST
    ; )
    ; (if (> (length lst) 0) ;Checks to see if there are more than 0 elements in the list as a TEST
    ; (if (/= currentIndex 0)

    ; (+ currentIteration 1)

    ;     ;Causes issue where lst returns "NIL":
    ;     (if (> currentIteration totalNumIterations)
    ;         (if (< (+ currentIndex 1) (- (length lst) 2))
    ;             (+ currentIndex 1)
    ;             (= currentIndex 0)
    ;         )
    ;     )
    ;     ; (Bubble-Sort currentIndex lst ) ; currentIteration totalNumIterations)
    ;     ; (append
    ;     ;     (list-before-item currentIndex lst)
    ;     ;     (list(retrieve-item (- currentIndex 1) lst))
    ;     ;     (list-after-item currentIndex lst)
    ;     ; )

        ;Checks to see if currentIndex is less than the total length of the list (and if it is, the current item is checked to see if it needs to be swapped)
        (if (< currentIndex (- (length lst) 1))

            ;Conditional Statement to check if the current item is greater than the next item in the list
            (if (> (retrieve-item currentIndex lst) (retrieve-item (+ currentIndex 1) lst))
            ; (if (> currentIndex (+ currentIndex 1))
            ; (if (> (car lst) (car (cdr lst))) ;Might need to change the second parameter ["(car (cdr lst))"] so that the recursion happens then instead of the next line so that elements are always checked first even if they aren't always less than the value in the first parameter
            ; (if (> (car lst) (+ (car lst) 1))
            ; (if (> (car lst) (car (Bubble-Sort (cdr lst)))) ;Might need to change the second parameter ["(car (cdr lst))"] so that the recursion happens then instead of the next line so that elements are always checked first even if they aren't always less than the value in the first parameter
                ; (append (list(car (cdr lst))) (list(car lst))); (Bubble-Sort currentIndex (cdr lst))) ;;Takes the current element in the given list and then adds 1 to it
                ; (append (list(car lst)) (list(car (cdr lst)))); (Bubble-Sort currentIndex (cdr lst)))
                
                ; (swap currentIndex lst)
                ; (swap (Bubble-Sort(car lst)) lst)
                (Bubble-Sort-InnerLoop (+ currentIndex 1) (swap currentIndex lst))
                (Bubble-Sort-InnerLoop (+ currentIndex 1) lst)
                ; (lst)
                ; (append (list(car lst)) (Bubble-Sort (cdr lst)))
                ; (Bubble-Sort currentIndex (cdr lst))

                ; Bubble-Sort (cdr lst))
                ; (cons (car lst) (Bubble-Sort (cdr lst)))

                ; (list(car (cdr lst)) (Bubble-Sort (- currentIndex 1) (cdr lst))); (Bubble-Sort currentIndex (cdr lst))) ;;Takes the current element in the given list and then adds 1 to it
                ; (list(car lst) (Bubble-Sort (- currentIndex 1) (cdr lst))); (Bubble-Sort currentIndex (cdr lst)))

                ; (append (Bubble-Sort (cdr lst)) (list(car lst))) ;Takes the current element in the given list and then adds 1 to it
                ; (append (list(car lst)) (Bubble-Sort (cdr lst)))

                ; (append (list(car (cdr lst))) (list(Bubble-Sort (cdr lst)))) ;;Takes the current element in the given list and then adds 1 to it
                ; (append (list(car lst)) (list(Bubble-Sort (cdr lst))))

                ; (if lst
                ;     (Bubble-Sort (cdr lst))
                ; )
                
                ; (append (Bubble-Sort (cdr lst)) (list(car lst))) ;;Takes the current element in the given list and then adds 1 to it
                ; (append (list(car lst)) (Bubble-Sort (cdr lst)))
                
                ; (append (list(car lst)) (Bubble-Sort (cdr lst))) ;;Takes the current element in the given list and then adds 1 to it
                ; (Bubble-Sort (cdr lst))
                ; (format t "~d Items were found in the list ~%" (length lst));Test
            )
            ; (Bubble-Sort (cdr lst))
            lst
        )


        ; ; NEED A RECURSIVE CALL
        ; (+ currentIteration 1)

        ; ;Causes issue where lst returns "NIL":
        ; (if (> currentIteration totalNumIterations)
        ;     (if (< (+ currentIndex 1) (- (length lst) 2))
        ;         (Bubble-Sort (+ currentIndex 1) lst currentIteration totalNumIterations)
        ;         (Bubble-Sort (= currentIndex 0) lst currentIteration totalNumIterations)
        ;     )
        ; )

        ; (Bubble-Sort currentIndex lst ) ; currentIteration totalNumIterations)
        ; (append
        ;     (list-before-item currentIndex lst)
        ;     (list(retrieve-item (- currentIndex 1) lst))
        ;     (list-after-item currentIndex lst)
        ; )

; CurrentIndex must be incremented by one every time
; Keep passing an updated lst as a "copy" that will be called on when the current lst is empty
; Keep a counter (passed and updated through Bubble-Sort()) that only allows recursion to occur "x" number of times after fully cycling through the entirety of the lst (which acts as the base case) [x = "length lst" - 1]

        ; (if lst
        ;     (Bubble-Sort currentIndex (cdr lst))
        ; )

        ; (if (> currentIndex (- (length lst) 1))
        ;     (Bubble-Sort 0 (append
        ;         (list-before-item currentIndex lst)
        ;         (list(retrieve-item currentIndex lst))
        ;         (list-after-item currentIndex lst)
        ;         )
        ;     )
            
        ;     ; (Bubble-Sort (+ currentIndex 1) (
        ;     ;     (list-before-item currentIndex lst)
        ;     ;     (retrieve-item currentIndex lst)
        ;     ;     (list-after-item currentIndex lst)
        ;     ;     )
        ;     ; )
        ; )

        ; (if (< currentIndex (length lst));(- (length lst) 3))
            ; (Bubble-Sort currentIndex (cdr lst))
        ; )

        ; (Bubble-Sort (cdr lst))

        ; (format t "No items were found in list ~%") ;TEST
        ; (format t "~d Items were found in the list ~%" (length lst)) ;TEST
    ; )

    ; ;If there are still elements in the lst, pass them on to continue sorting the list
    ; (if (/= currentIndex 0)
    ;     ; Also need to Decrement currentIndex
    ;     (Bubble-Sort (- currentIndex 1) (cdr lst))
    ; )
)

; (defun Merge-Sort)

; Bonus:
; (defun Quick-Sort)

; Need to randomize the below sample lists

(format t "List of Items being Organized by the Bubble Sort: (3 5 1 4 2) ~%")
; (format t "Result of the Above List being Organized: ~d~%" (Bubble-Sort '(5 2 1 4 3)))
; (format t "Result of the Above List being Organized: ~d~%" (Bubble-Sort-InnerLoop 0 '(5 3 1 4 2) )); '0 ) (bubble_total-Iterations-Calculator '(5 3 1 4 2))))
(format t "Result of the Above List being Organized: ~d~%" (Bubble-Sort-OuterLoop 0 '(3 5 1 4 2) 0)); '0 ) (bubble_total-Iterations-Calculator '(5 3 1 4 2))))

; (format t "Result of the Above List being Organized: ~d~%" (Bubble-Sort #'1+ '(2 5 1 4 3)))

; (format t "List of Items being Organized by the Merge Sort: (7 6 10 9 8) ~%")
; (format t "Result of the Above List being Organized: ~d~%" (Merge-Sort #'1+ '(7 6 10 9 8)))

; Bonus:
; (format t "List of Items being Organized by the Quick Sort: (11 14 15 12 13) ~%")
; (format t "Result of the Above List being Organized: ~d~%" (Quick-Sort #'1+ '(11 14 15 12 13)))