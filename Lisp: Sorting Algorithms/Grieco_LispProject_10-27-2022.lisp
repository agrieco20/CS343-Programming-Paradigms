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

;Returns the list of elements that precede the two elements being swapped (in Bubble Sort) or otherwise compared (in Merge Sort)
(defun list-before-item (currentIndex lst)
    (if (<= currentIndex 0)
        nil
        (append (list(car lst)) (list-before-item (- currentIndex 1) (cdr lst)))
    )
)

;Returns the list of elements that follow the two elements being swapped (in a Bubble Sort) or any remaining elements in the [left] or [right] list depending on if one of them is completely empty before the other is (in a Merge Sort)
(defun list-after-item (currentIndex lst)
    (if (<= currentIndex 0)
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

;Implementation of the Merge Sort Algorithm (controls the "swapping" of elements from the two separate lists that are passed to it)
(defun MergeLoop (currentIndex-Left currentIndex-Right left right mergeLst)

    ;Checks if one of the two lists are empty (if so, return the list that isn't empty)
    (if (or (= (length left) 0) (= (length right) 0))
        (if (= (length left) 0)
            (append mergeLst right)
            (append mergeLst left)
        )
        
        ;Compares which element in the "left" or "right" list is less than the other and then adds it to the new "mergeLst"
        (if (and (< currentIndex-Left (length left)) (< currentIndex-Right (length right)))
            (if (< (retrieve-item currentIndex-Left left) (retrieve-item currentIndex-Right right))
                (MergeLoop (+ currentIndex-Left 1) currentIndex-Right left right (append mergeLst (list(retrieve-item currentIndex-Left left))))
                (MergeLoop currentIndex-Left (+ currentIndex-Right 1) left right (append mergeLst (list(retrieve-item currentIndex-Right right))))
            )
            
            ;Checks if there are any remaning elements in either the "left" or "right" list (and if there are, the rest of those elements are immediataley added to the end of the new "mergeLst" list)
            (if (< currentIndex-Left (length left))

                ;Checks Left list
                (if (> currentIndex-Left 0)
                    (append mergeLst (list-after-item (- currentIndex-Left 1) left))
                    (append mergeLst left)
                )

                ;Checks Right list
                (if (< currentIndex-Right (length right))
                    (if (> currentIndex-Right 0)
                        (append mergeLst (list-after-item (- currentIndex-Right 1) right))
                        (append mergeLst right)
                    )
                    mergeLst ;Return
                )
            )
        )
    )
)

;Repetitive recursive call for the Merge Sort Algorithm (to compare and organize all elements within the list)
(defun Merge-Sort (lst)

    (if (<= (length lst) 1)
        lst

        (MergeLoop 
            0
            0
            (Merge-Sort 
                (list-before-item
                    (+ (floor (length lst) 2) 0)
                    lst
                )
            )
            (Merge-Sort
                (list-after-item
                    (- (floor (length lst) 2) 1)
                    lst
                )
            )
            '()
        )
    )
)

; Bonus:

;Repetitive recursive call for the Quick Sort Algorithm (to compare and organize all elements within the list)
(defun Quick-Sort (lst)
    (if (<= (length lst) 1)
        lst
        (append (Quick-Sort (retrieve-item 0 (Partition 0 0 lst '() (retrieve-item 0 lst) '() 0)) ) (retrieve-item 1 (Partition 0 0 lst '() (retrieve-item 0 lst) '() 0)) (Quick-Sort (retrieve-item 2 (Partition 0 0 lst '() (retrieve-item 0 lst) '() 0)) ))
    )    
)

;Implementation of the Quick Sort Algorithm (controls the "swapping" of elements using the pivot as the determiner as to whether elements should be added to the "left" or "right" sublist)
(defun Partition (indexCounter loopCounter lst left pivot right pivotIndex)

    (if (< loopCounter (length lst))
        (if (> (+ indexCounter 1) (- (length lst) 1))

            ;Splits "left", "pivot", and "right" into three different "sub-lists" within the same list
            (append (list left) (list (list pivot)) (list right))

            ;If the given item in the list is less than or equal to the pivot, assign it to the left "sublist". Otherwise, assign the value to the right "sublist".
            (if (<= (retrieve-item (+ indexCounter 1) lst) pivot)
                (Partition (+ indexCounter 1) loopCounter lst (append left (list (retrieve-item (+ indexCounter 1) lst))) pivot right (+ pivotIndex 1))
                (Partition (+ indexCounter 1) loopCounter lst left pivot (append right (list (retrieve-item (+ indexCounter 1) lst))) (+ pivotIndex 1))
            )
        )
        lst ;Return
    )
)

(format t "List of Items being Organized by the Bubble Sort: ~d~%" '(3 5 1 4 2))
(format t "Result of the Above List being Organized with a Bubble Sort: ~d~%~%" (Bubble-Sort-OuterLoop 0 '(3 5 1 4 2) 0))

(format t "List of Items being Organized by the Merge Sort: ~d~%" '(7 6 10 9 8))
(format t "Result of the Above List being Organized: ~d~%~%" (Merge-Sort '(7 6 10 9 8)))

; Bonus:
(format t "List of Items being Organized by the Quick Sort: ~d~%" '(14 11 15 13 12))
(format t "Result of the Above List being Organized: ~d~%" (Quick-Sort '(14 11 15 13 12) ))