; Author: Anthony Grieco
; Date: 10/27/2022
; Description: This program implements 3 different sorting algorithms (Bubble Sort, Merge Sort, and Quick Sort) all in Steel Bank Common Lisp to organize the data that the user sends to it.

(defun IndexSetter (lst)
    (* (length lst) (- (length lst) 1))
)

; (defun Bubble-Sort (lst)
(defun Bubble-Sort (currentIndex lst)
    ; (if (= (length lst) 0) ;Checks to see if there are more than 0 elements in the list as a TEST
    ;     (format t "No items were found in list ~%") ;TEST
    ;     (format t "~d Items were found in the list ~%" (length lst)) ;TEST
    ; )
    ; (if (> (length lst) 0) ;Checks to see if there are more than 0 elements in the list as a TEST
    (if (/= currentIndex 0)
        (if (> (- (length lst) 1) 0)
            (if (> (car lst) (car (cdr lst))) ;Might need to change the second parameter ["(car (cdr lst))"] so that the recursion happens then instead of the next line so that elements are always checked first even if they aren't always less than the value in the first parameter
            ; (if (> (car lst) (car (Bubble-Sort (cdr lst)))) ;Might need to change the second parameter ["(car (cdr lst))"] so that the recursion happens then instead of the next line so that elements are always checked first even if they aren't always less than the value in the first parameter
                ; (append (list(car (cdr lst))) (list(car lst))); (Bubble-Sort currentIndex (cdr lst))) ;;Takes the current element in the given list and then adds 1 to it
                ; (append (list(car lst)) (list(car (cdr lst)))); (Bubble-Sort currentIndex (cdr lst)))

                (list(car (cdr lst)) (Bubble-Sort (- currentIndex 1) (cdr lst))); (Bubble-Sort currentIndex (cdr lst))) ;;Takes the current element in the given list and then adds 1 to it
                (list(car lst) (Bubble-Sort (- currentIndex 1) (cdr lst))); (Bubble-Sort currentIndex (cdr lst)))

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
        )
        ; (Bubble-Sort (cdr lst))

        ; (format t "No items were found in list ~%") ;TEST
        ; (format t "~d Items were found in the list ~%" (length lst)) ;TEST
    )

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

(format t "List of Items being Organized by the Bubble Sort: (5 2 1 4 3) ~%")
; (format t "Result of the Above List being Organized: ~d~%" (Bubble-Sort '(5 2 1 4 3)))
(format t "Result of the Above List being Organized: ~d~%" (Bubble-Sort '(IndexSetter '(5 2 1 4 3)) '(5 2 1 4 3)))
(format t "Number of Recursive Iterations the Above List would require to be Bubble Sorted: ~d~%" (IndexSetter '(5 2 1 4 3)))

; (format t "Result of the Above List being Organized: ~d~%" (Bubble-Sort #'1+ '(2 5 1 4 3)))

; (format t "List of Items being Organized by the Merge Sort: (7 6 10 9 8) ~%")
; (format t "Result of the Above List being Organized: ~d~%" (Merge-Sort #'1+ '(7 6 10 9 8)))

; Bonus:
; (format t "List of Items being Organized by the Quick Sort: (11 14 15 12 13) ~%")
; (format t "Result of the Above List being Organized: ~d~%" (Quick-Sort #'1+ '(11 14 15 12 13)))