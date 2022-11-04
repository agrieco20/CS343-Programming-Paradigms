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
        ; (cons (car lst) (list-before-item (- currentIndex 1) (cdr lst)))
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

;Original Implementation (runs an infinite loop):
        ; ; ;Implementation of the Merge Sort Algorithm (controls the "swapping" of elements from the two separate lists that are passed to it)
        ; (defun MergeLoop (currentIndex-Left currentIndex-Right left right mergeLst)
            
        ;     ; Compares which element in the "left" or "right" list is less than the other and then adds it to the new "mergeLst"
        ;     (if (and (< currentIndex-Left (length left)) (< currentIndex-Right (length right)))
        ;         (if (< (retrieve-item currentIndex-Left left) (retrieve-item currentIndex-Right right))
        ;             (MergeLoop (+ currentIndex-Left 1) currentIndex-Right left right (append mergeLst (list(retrieve-item currentIndex-Left left))))
        ;             (MergeLoop currentIndex-Left (+ currentIndex-Right 1) left right (append mergeLst (list(retrieve-item currentIndex-Right right))))
        ;         )
                
        ;         ;Checks if there are any remaning elements in either the "left" or "right" list (and if there are the rest of those elements are immediataley added to the end of the new "mergeLst" list)
        ;         (if (< currentIndex-Left (length left))
        ;             ; (format t "Success ~%Left Length: ~d~%Maximum Left Length: ~d~%" currentIndex-Left (length left)) ;TEMPORARY TEST
        ;             ; (MergeLoop (length left) currentIndex-Right left right (append mergeLst (list(retrieve-item currentIndex-Left left))))
        ;             (append mergeLst (list-after-item (- currentIndex-Left 1) left) )
        ;             ; (format t "Failure ~%Left Length: ~d~%Maximum Left Length: ~d~%" currentIndex-Left (length left)) ;TEMPORARY TEST
                
        ;             ; (MergeLoop (length left) currentIndex-Right left right (append mergeLst (list(retrieve-item currentIndex-Left left))))
        ;             (if (< currentIndex-Right (length right))
        ;             ; (format t "Success~%Right Length: ~d~%Maximum Right Length: ~d~%" currentIndex-Right (length right)) ;TEMPORARY TEST
        ;             ; (format t "Failure~%Right Length: ~d~%Maximum Right Length: ~d~%" currentIndex-Right (length right)) ;TEMPORARY TEST
        ;                 (append mergeLst (list-after-item (- currentIndex-Right 1) right) )
        ;                 mergeLst

        ;             ; (MergeLoop currentIndex-Left (length right) left right (append mergeLst (list(retrieve-item currentIndex-Right right))))
        ;             )
        ;         )
        ;     )
        ; )

        ; ;Repetitive recursive call for the Merge Sort Algorithm
        ; (defun Merge-Sort (lst); currentIndex-Left currentIndex-Right left right mergeLst)
        ;     (print lst)
        ;     (if (<= (length lst) 1)
        ;         ; (append lst (MergeLoop 0 0 (Merge-Sort(list-before-item (floor (length lst) 2) lst)) (Merge-Sort(list-after-item (- (floor (length lst) 2) 1) lst) '())))
        ;         ; (append lst (MergeLoop 0 0 (list-before-item (floor (length lst) 2) lst) (list-after-item (- (floor (length lst) 2) 1) lst) '()))
        ;         ; (MergeLoop 0 0 (list-before-item (floor (length lst) 2) lst) (list-after-item (- (floor (length lst) 2) 1) lst) '())
                
        ;         lst

        ;         ; (if (> (floor (length lst) 2) 1) 
        ;         ; (if (> (length lst) 1)
        ;         (MergeLoop 
        ;             0
        ;             0
        ;             (Merge-Sort 
        ;                 (list-before-item
        ;                     (+ (floor (length lst) 2) 1)
        ;                     lst
        ;                 )
        ;             )
        ;             (Merge-Sort
        ;                 (list-after-item
        ;                     (- (floor (length lst) 2) 0)
        ;                     lst
        ;                 )
        ;             )
        ;             '()
        ;         ) ;RUNTIME ERROR HERE (NO ERROR MESSAGE, BUT PROGRAM RUNS FOREVER)
        ;             ; lst
        ;         ; )
        ;         ; (Merge-Sort (list-before-item (floor (length lst) 2) lst))
        ;             ; (Merge-Sort (list-after-item (- (floor (length lst) 2) 1) lst))
        ;             ; lst
                
        ;         ; (list-before-item (floor (length lst) 2) lst) ;Prints out first 2 elements of the list
        ;         ; (list-after-item (- (floor (length lst) 2) 1) lst) ;Prints out final 3 elements in the list

        ;         ; lst
        ;         ; )
        ;     )

        ;     ; (MergeLoop 0 0 (Merge-Sort (list-before-item (floor (length lst) 2) lst)) (Merge-Sort(list-after-item (- (floor (length lst) 2) 1) lst)) '())

        ;     ; lst
        ; )


;Implementation of the Merge Sort Algorithm (controls the "swapping" of elements from the two separate lists that are passed to it)
(defun MergeLoop (currentIndex-Left currentIndex-Right left right mergeLst)
    
    ; (if (= (length left) 0)
    ;     (append mergeLst right)
    ;     (if (= (length right) 0)
    ;         (append mergeLst left)
    ;         mergeLst
    ;     )
    ;     ;;;;;;;; mergeLst
    ; )
    ; ;;;;;; mergeLst

    ; ; Compares which element in the "left" or "right" list is less than the other and then adds it to the new "mergeLst"
    ; (if (and (< currentIndex-Left (length left)) (< currentIndex-Right (length right)))
    ;     (if (< (retrieve-item currentIndex-Left left) (retrieve-item currentIndex-Right right))
    ;         (MergeLoop (+ currentIndex-Left 1) currentIndex-Right left right (append mergeLst (list(retrieve-item currentIndex-Left left))))
    ;         (MergeLoop currentIndex-Left (+ currentIndex-Right 1) left right (append mergeLst (list(retrieve-item currentIndex-Right right))))
    ;     )
        
    ;     ;Checks if there are any remaning elements in either the "left" or "right" list (and if there are the rest of those elements are immediataley added to the end of the new "mergeLst" list)
    ;     (if (< currentIndex-Left (length left))
    ;         ; (format t "Success ~%Left Length: ~d~%Maximum Left Length: ~d~%" currentIndex-Left (length left)) ;TEMPORARY TEST
    ;         ; (MergeLoop (length left) currentIndex-Right left right (append mergeLst (list(retrieve-item currentIndex-Left left))))
    ;         (append mergeLst (list-after-item (- currentIndex-Left 1) left) ) ;(cdr left))
    ;         ; (format t "Failure ~%Left Length: ~d~%Maximum Left Length: ~d~%" currentIndex-Left (length left)) ;TEMPORARY TEST
         
    ;         ; (MergeLoop (length left) currentIndex-Right left right (append mergeLst (list(retrieve-item currentIndex-Left left))))
    ;         (if (< currentIndex-Right (length right))
    ;         ; (format t "Success~%Right Length: ~d~%Maximum Right Length: ~d~%" currentIndex-Right (length right)) ;TEMPORARY TEST
    ;         ; (format t "Failure~%Right Length: ~d~%Maximum Right Length: ~d~%" currentIndex-Right (length right)) ;TEMPORARY TEST
    ;             (append mergeLst (list-after-item (- currentIndex-Right 1) right) ) ;(cdr right))
    ;             mergeLst

    ;         ; (MergeLoop currentIndex-Left (length right) left right (append mergeLst (list(retrieve-item currentIndex-Right right))))
    ;         )
    ;     )
    ; )

    ; Compares which element in the "left" or "right" list is less than the other and then adds it to the new "mergeLst"
    ; (if (= (length left) 0)
    ;     (append mergeLst right)
    ;     (if (= (length right) 0)
    ;         (append mergeLst left)
    ;         mergeLst
    ;     )
    ; )

    ; (if (or (= (length left) 0) (= (length right) 0))
    ;     (if (= (length left) 0)
    ;         (append mergeLst right)
    ;         (append mergeLst left)
            ;)

    ; )

    (if (or (= (length left) 0) (= (length right) 0)) ;Checks if one of the two lists are empty (if so, return the list that isn't empty)
        (if (= (length left) 0)
            ;;; (print "zero length: right")
            ;;; (print "zero length: left")
            (append mergeLst right)
            (append mergeLst left)
        )
        
        ; ; Compares which element in the "left" or "right" list is less than the other and then adds it to the new "mergeLst"
        (if (and (< currentIndex-Left (length left)) (< currentIndex-Right (length right)))
            (if (< (retrieve-item currentIndex-Left left) (retrieve-item currentIndex-Right right))
                (MergeLoop (+ currentIndex-Left 1) currentIndex-Right left right (append mergeLst (list(retrieve-item currentIndex-Left left))))
                (MergeLoop currentIndex-Left (+ currentIndex-Right 1) left right (append mergeLst (list(retrieve-item currentIndex-Right right))))
            )
            
            ;Checks if there are any remaning elements in either the "left" or "right" list (and if there are, the rest of those elements are immediataley added to the end of the new "mergeLst" list)
            (if (< currentIndex-Left (length left))
                ; (format t "Success ~%Left Length: ~d~%Maximum Left Length: ~d~%" currentIndex-Left (length left)) ;TEMPORARY TEST
                ; (MergeLoop (length left) currentIndex-Right left right (append mergeLst (list(retrieve-item currentIndex-Left left))))
                (if (> currentIndex-Left 0)
                    ; (print "Left Length: "(length left)) ;TEMPORARY
                    (append mergeLst (list-after-item (- currentIndex-Left 1) left) ) ;(cdr left))
                    ; (append mergeLst (list (retrieve-item (- currentIndex-Left 0) left) ))
                    (append mergeLst left)
                    ; (append mergeLst (list-after-item (- currentIndex-Left 0) left) )
                )
                ; (format t "Failure ~%Left Length: ~d~%Maximum Left Length: ~d~%" currentIndex-Left (length left)) ;TEMPORARY TEST
            
                ; (MergeLoop (length left) currentIndex-Right left right (append mergeLst (list(retrieve-item currentIndex-Left left))))
                (if (< currentIndex-Right (length right))
                ; (format t "Success~%Right Length: ~d~%Maximum Right Length: ~d~%" currentIndex-Right (length right)) ;TEMPORARY TEST
                ; (format t "Failure~%Right Length: ~d~%Maximum Right Length: ~d~%" currentIndex-Right (length right)) ;TEMPORARY TEST
                    (if (> currentIndex-Right 0)

                        ; (print "Right Length: "(length right)) ;TEMPORARY
                        (append mergeLst (list-after-item (- currentIndex-Right 1) right) ) ;(cdr right))
                        ; (append mergeLst (list (retrieve-item (- currentIndex-Right 0) right)))
                        (append mergeLst right)
                        ; (append mergeLst (list-after-item (- currentIndex-Right 0) right))
                    )
                    mergeLst

                ; (MergeLoop currentIndex-Left (length right) left right (append mergeLst (list(retrieve-item currentIndex-Right right))))
                )
            )
        )
    )
)

;Repetitive recursive call for the Merge Sort Algorithm
(defun Merge-Sort (lst); currentIndex-Left currentIndex-Right left right mergeLst)
    (print lst) ;Temporary
    (if (<= (length lst) 1)
        ; (append lst (MergeLoop 0 0 (Merge-Sort(list-before-item (floor (length lst) 2) lst)) (Merge-Sort(list-after-item (- (floor (length lst) 2) 1) lst) '())))
        ; (append lst (MergeLoop 0 0 (list-before-item (floor (length lst) 2) lst) (list-after-item (- (floor (length lst) 2) 1) lst) '()))
        ; (MergeLoop 0 0 (list-before-item (floor (length lst) 2) lst) (list-after-item (- (floor (length lst) 2) 1) lst) '())
        
        lst

        ; (if (> (floor (length lst) 2) counter)
        ;     (MergeLoop 0 0 (Merge-Sort (+ counter 1) (append left (list(car lst))) right (cdr lst)) right '())
        ;     (MergeLoop 0 0 left (Merge-Sort 0 left lst left) '())

        ;     ; (Merge-Sort (+ counter 1) (append left (list(car lst))) right (cdr lst) copylst)
        ;     ; (Merge-Sort 0 left lst left copylst)
        ; )

        ;---------------------------------------------------

        ;;;;;;;;;; (if (> (floor (length lst) 2) 1) 
        ;;;;;;;;;; (if (> (length lst) 1)
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
        ) ;RUNTIME ERROR HERE (NO ERROR MESSAGE, BUT PROGRAM RUNS FOREVER)

        ;---------------------------------------------------
            ; lst
        ; )
        ; (Merge-Sort (list-before-item (floor (length lst) 2) lst))
            ; (Merge-Sort (list-after-item (- (floor (length lst) 2) 1) lst))
            ; lst
        
        ; (list-before-item (floor (length lst) 2) lst) ;Prints out first 2 elements of the list
        ; (list-after-item (- (floor (length lst) 2) 1) lst) ;Prints out final 3 elements in the list

        ; lst
        ; )
    )
    ; lst

    ; (MergeLoop 0 0 (Merge-Sort (list-before-item (floor (length lst) 2) lst)) (Merge-Sort(list-after-item (- (floor (length lst) 2) 1) lst)) '())

    ; lst
)

; Bonus:
; (defun Quick-Sort)
; (defun Partition (indexCounter lst left pivot right)

;     ; (append pivot (list(retrieve-item 0 lst)))

;     (if (< indexCounter (- (length lst) 1))
;         (if (<= (retrieve-item (+ indexCounter 1) lst) pivot)
;             ; (append left (list(retrieve-item indexCounter lst)))
;             (Partition 0 lst (append left (list(retrieve-item indexCounter lst))) pivot right)
            
;             (if (> (retrieve-item (+ indexCounter 1) lst) pivot)
;                 ; (append right (list(retrieve-item indexCounter lst)))
;                 (Partition 0 lst left pivot (append right (list(retrieve-item indexCounter lst))))
;                 (append (list left) (list pivot) (list right))
;             )
;         )
;     )
;     ; Partition
; )

(format t "List of Items being Organized by the Bubble Sort: (3 5 1 4 2) ~%")
(format t "Result of the Above List being Organized with a Bubble Sort: ~d~%~%" (Bubble-Sort-OuterLoop 0 '(3 5 1 4 2) 0))

(format t "List of Items being Organized by the Merge Sort: (7 6 10 9 8) ~%")
(format t "Result of the Above List being Organized: ~d~%~%" (Merge-Sort '(7 6 10 9 8)))
; (format t "Result of the Above List being Organized with a Merge Sort: ~d~%~%" (MergeLoop 0 0 '(6 7) '(8 9 10) '())) ;Temporary function call to test the "Merge" Function, will use "Merge-Sort" in the final version ; (2 3 5 6 10) '(1 4 7 8 9)

; ; (format t "Result of the Above List being Organized with a Merge Sort: ~d~%~%" (MergeLoop 0 0 (list-before-item (floor (length lst) 2)) (list-after-item (- (floor (length lst) 2)) 1) '())) ;Temporary function call to test the "Merge" Function, will use "Merge-Sort" in the final version

; Bonus:
; (format t "List of Items being Organized by the Quick Sort: (11 14 15 12 13) ~%")
; ; (format t "Result of the Above List being Organized: ~d~%" (Quick-Sort '(11 14 15 12 13)))
; (format t "Result of the Above List being Organized: ~d~%" (Partition 0 '(11 14 15 12 13) '() (retrieve-item 0 '(11 14 15 12 13)) '()))