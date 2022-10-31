; Author: Anthony Grieco
; Date: 10/27/2022
; Description: This program implements 3 different sorting algorithms (Bubble Sort, Merge Sort, and Quick Sort) all in Steel Bank Common Lisp to organize the data that the user sends to it.

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

;Returns the list of elements that follow the two elements being swapped (in a Bubble Sort)
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

;Acts as the outer "for loop" in a regular Bubble Sort in any Procedural or Object-Oriented Language
(defun Bubble-Sort-OuterLoop (currentIndex lst currentLoop)
    (if (< currentLoop (length lst))
        (Bubble-Sort-OuterLoop currentIndex (Bubble-Sort-InnerLoop currentIndex lst) (+ currentLoop 1))
        lst
    )
)

;Acts as the inner "for loop" in a regular Bubble Sort in any Procedural or Object-Oriented Language
;Responsible for iterating through each index of the given list and also checks if elements can be swapped (based on if the current element being looked at with "currentIndex" is greater than the next item in the list)
(defun Bubble-Sort-InnerLoop (currentIndex lst)
    
    ;Checks to see if currentIndex is less than the total length of the list (and if it is, the current item is checked to see if it needs to be swapped)
    (if (< currentIndex (- (length lst) 1))

        ;Conditional Statement to check if the current item is greater than the next item in the list
        (if (> (retrieve-item currentIndex lst) (retrieve-item (+ currentIndex 1) lst))
            (Bubble-Sort-InnerLoop (+ currentIndex 1) (swap currentIndex lst))
            (Bubble-Sort-InnerLoop (+ currentIndex 1) lst)
        )
        lst
    )
)

; (defun Merge-Sort)

; Bonus:
; (defun Quick-Sort)

(format t "List of Items being Organized by the Bubble Sort: (3 5 1 4 2) ~%")
(format t "Result of the Above List being Organized: ~d~%" (Bubble-Sort-OuterLoop 0 '(3 5 1 4 2) 0))

; (format t "List of Items being Organized by the Merge Sort: (7 6 10 9 8) ~%")
; (format t "Result of the Above List being Organized: ~d~%" (Merge-Sort #'1+ '(7 6 10 9 8)))

; Bonus:
; (format t "List of Items being Organized by the Quick Sort: (11 14 15 12 13) ~%")
; (format t "Result of the Above List being Organized: ~d~%" (Quick-Sort #'1+ '(11 14 15 12 13)))