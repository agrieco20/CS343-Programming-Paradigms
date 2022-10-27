; Author: Anthony Grieco
; Date: 10/27/2022
; Description: This program implements 3 different sorting algorithms (Bubble Sort, Merge Sort, and Quick Sort) all in Steel Bank Common Lisp to organize the data that the user sends to it.

(defun Bubble-Sort (array)
    ; (if (= (length array) 0) ;Checks to see if there are more than 0 elements in the list as a TEST
    ;     (format t "No items were found in list ~%") ;TEST
    ;     (format t "~d Items were found in the list ~%" (length array)) ;TEST
    ; )
    (if (> (length array) 0) ;Checks to see if there are more than 0 elements in the list as a TEST
        (if (> (- (length array) 1) 0)
            (if (> (car array) (car (cdr array))) ;Might need to change the second parameter ["(car (cdr array))"] so that the recursion happens then instead of the next line so that elements are always checked first even if they aren't always less than the value in the first parameter
            ; (if (> (car array) (car (Bubble-Sort (cdr array)))) ;Might need to change the second parameter ["(car (cdr array))"] so that the recursion happens then instead of the next line so that elements are always checked first even if they aren't always less than the value in the first parameter
                (append (list(car (cdr array))) (list(car array))) ;;Takes the current element in the given list and then adds 1 to it
                (append (list(car array)) (list(car (cdr array))))
                
                ; (append (Bubble-Sort (cdr array)) (list(car array))) ;;Takes the current element in the given list and then adds 1 to it
                ; (append (list(car array)) (Bubble-Sort (cdr array)))
                
                ; (append (list(car array)) (Bubble-Sort (cdr array))) ;;Takes the current element in the given list and then adds 1 to it
                ; (Bubble-Sort (cdr array))
                ; (format t "~d Items were found in the list ~%" (length array));Test
            )
        )
        ; (format t "No items were found in list ~%") ;TEST
        ; (format t "~d Items were found in the list ~%" (length array)) ;TEST
    )
)

; (defun Merge-Sort)

; Bonus:
; (defun Quick-Sort)

; Need to randomize the below sample lists

(format t "List of Items being Organized by the Bubble Sort: (5 2 1 4 3) ~%")
(format t "Result of the Above List being Organized: ~d~%" (Bubble-Sort '(5 2 1 4 3)))
; (format t "Result of the Above List being Organized: ~d~%" (Bubble-Sort #'1+ '(2 5 1 4 3)))

; (format t "List of Items being Organized by the Merge Sort: (7 6 10 9 8) ~%")
; (format t "Result of the Above List being Organized: ~d~%" (Merge-Sort #'1+ '(7 6 10 9 8)))

; Bonus:
; (format t "List of Items being Organized by the Quick Sort: (11 14 15 12 13) ~%")
; (format t "Result of the Above List being Organized: ~d~%" (Quick-Sort #'1+ '(11 14 15 12 13)))