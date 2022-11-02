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

;Returns the list of elements that follow the two elements being swapped (in a Bubble Sort) or any remaining elements in the [left] or [right] list depending on if one of them is completely empty before the other is (in a Merge Sort)
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

;Repetitive recursive call for the Merge Sort Algorithm
; (defun Merge-Sort (lst)
;     ;To be implemented later
; )

;Implementation of the Merge Sort Algorithm (controls the "swapping" from the two separate lists passed to it)
(defun MergeLoop (currentIndex-Left currentIndex-Right left right mergeLst)
    
    ;"If Statements" before the "While Loop" in "MERGE" -> Both Fail
    ;Next 7 Lines don't work yet (but are needed)
    ; (if (= (length left) 0)
    ;     (append mergeLst (list(list-after-item 0 right)))
    ; )
    
    ; (if (= (length right) 0)
    ;     (append mergeLst (list(list-after-item 0 left)))
    ; )

    ;"If Statements" following the "While Loop" in "MERGE" -> Both Fail
    ; (if (and (< currentIndex-Left (length left) ) (= currentIndex-Right (length right)))
    ;     ; mergeLst
    ;         (MergeLoop (length left) currentIndex-Right left right (append mergeLst (list(retrieve-item currentIndex-Left left))))
    ;         mergeLst
    ;     ; (append mergeLst (list(list-after-item currentIndex-Left left))) ;Temporary
    ;     ; (format t "fail1 ") ;Temporary
    ;     ; (MergeLoop (= currentIndex-Left (length left)) currentIndex-Right left right (append mergeLst (list(retrieve-item currentIndex-Left left))))
    ; )

    ; (if (and (< currentIndex-Right (length right) (= currentIndex-Left (length left))))
    ;     ; mergeLst

    ;         (MergeLoop currentIndex-Left (length right) left right (append mergeLst (list(retrieve-item currentIndex-Right right))))
    ;         mergeLst
    ;     ; (append mergeLst (list(list-after-item currentIndex-Right right))) ;Temporary
    ;     ; (format t "fail2 ") ;Temporary
        
    ; )

    ;"If Statements" following the "While Loop" in "MERGE" -> Fails to make any changes to the outputted mergeLst at this point...
    ; (if (or (= currentIndex-Left (length left)) (= currentIndex-Right (length right)))
    ;     (if (< currentIndex-Left (length left))
    ;         ; (format t "Success ~%Left Length: ~d~%Maximum Left Length: ~d~%" currentIndex-Left (length left)) ;TEMPORARY TEST
    ;         ; (MergeLoop (length left) currentIndex-Right left right (append mergeLst (list(retrieve-item currentIndex-Left left))))
    ;         (append (list(list-after-item currentIndex-Left left)) mergeLst)
    ;         ; (format t "Failure ~%Left Length: ~d~%Maximum Left Length: ~d~%" currentIndex-Left (length left)) ;TEMPORARY TEST
         
    ;         ; (MergeLoop (length left) currentIndex-Right left right (append mergeLst (list(retrieve-item currentIndex-Left left))))
    ;     )
        
    ;     (if (< currentIndex-Right (length right))
    ;         ; (format t "Success~%Right Length: ~d~%Maximum Right Length: ~d~%" currentIndex-Right (length right)) ;TEMPORARY TEST
    ;         ; (format t "Failure~%Right Length: ~d~%Maximum Right Length: ~d~%" currentIndex-Right (length right)) ;TEMPORARY TEST
    ;         (append (list(list-after-item currentIndex-Right right)) mergeLst)

    ;         ; (MergeLoop currentIndex-Left (length right) left right (append mergeLst (list(retrieve-item currentIndex-Right right))))
    ;     )
    ; )

    ;"While Loop"  in "MERGE" -> Works
    (if (and (< currentIndex-Left (length left)) (< currentIndex-Right (length right)))
        (if (< (retrieve-item currentIndex-Left left) (retrieve-item currentIndex-Right right))
            (MergeLoop (+ currentIndex-Left 1) currentIndex-Right left right (append mergeLst (list(retrieve-item currentIndex-Left left))))
            (MergeLoop currentIndex-Left (+ currentIndex-Right 1) left right (append mergeLst (list(retrieve-item currentIndex-Right right))))
        )
        ; if statement ;(format t "end while loop ~%")
        
        (if (< currentIndex-Left (length left))
            ; (format t "Success ~%Left Length: ~d~%Maximum Left Length: ~d~%" currentIndex-Left (length left)) ;TEMPORARY TEST
            ; (MergeLoop (length left) currentIndex-Right left right (append mergeLst (list(retrieve-item currentIndex-Left left))))
            (append mergeLst (list-after-item (- currentIndex-Left 1) left) )
            ; (format t "Failure ~%Left Length: ~d~%Maximum Left Length: ~d~%" currentIndex-Left (length left)) ;TEMPORARY TEST
         
            ; (MergeLoop (length left) currentIndex-Right left right (append mergeLst (list(retrieve-item currentIndex-Left left))))
            (if (< currentIndex-Right (length right))
            ; (format t "Success~%Right Length: ~d~%Maximum Right Length: ~d~%" currentIndex-Right (length right)) ;TEMPORARY TEST
            ; (format t "Failure~%Right Length: ~d~%Maximum Right Length: ~d~%" currentIndex-Right (length right)) ;TEMPORARY TEST
                (append mergeLst (list-after-item (- currentIndex-Right 1) right) )
                mergeLst

            ; (MergeLoop currentIndex-Left (length right) left right (append mergeLst (list(retrieve-item currentIndex-Right right))))
            )
        )
    )
        ; mergeLst
        ; (format t "Left Length: ~d~%Maximum Left Length: ~d~%Right Length: ~d~%Maximum Right Length: ~d~%" currentIndex-Left (length left) currentIndex-Right (length right)) ;TEMPORARY TEST
    ; )

    ; (if (< currentIndex-Left (- (length left) 1))
    ;     ; (MergeLoop (length left) (length right) left right (append mergeLst (list(list-after-item currentIndex-Left left))))
    ;     (append mergeLst (list(list-after-item currentIndex-Left left)))
    ;     ; (format t "left list fail ~%") ;Temporary
    ;     mergeLst
    ; )

    ; (if (< currentIndex-Right (- (length right) 1))
    ;     ; (MergeLoop (length left) (length right) left right (append mergeLst (list(list-after-item currentIndex-Right right))))

    ;     (append mergeLst (list(list-after-item currentIndex-Right right)))
    ;     ; (format t "right list fail ~%") ;Temporary
    ;     mergeLst
    ; )

    ; mergeLst

)

; Bonus:
; (defun Quick-Sort)

(format t "List of Items being Organized by the Bubble Sort: (3 5 1 4 2) ~%")
(format t "Result of the Above List being Organized with a Bubble Sort: ~d~%~%" (Bubble-Sort-OuterLoop 0 '(3 5 1 4 2) 0))

(format t "List of Items being Organized by the Merge Sort: (7 6 10 9 8) ~%")
; (format t "Result of the Above List being Organized: ~d~%" (Merge-Sort '(7 6 10 9 8)))
(format t "Result of the Above List being Organized with a Merge Sort: ~d~%~%" (MergeLoop 0 0 '(3 5 10 4 2) '(7 6 1 9 8) '())) ;Temporary function call to test the "Merge" Function, will use "Merge-Sort" in the final version
; (format t "Result of the Above List being Organized with a Merge Sort: ~d~%~%" (Bubble-Sort-InnerLoop2 0 '(7 6 10 9 8))) ;Temporary function call to test the "Merge" Function, will use "Merge-Sort" in the final version

; Bonus:
; (format t "List of Items being Organized by the Quick Sort: (11 14 15 12 13) ~%")
; (format t "Result of the Above List being Organized: ~d~%" (Quick-Sort '(11 14 15 12 13)))