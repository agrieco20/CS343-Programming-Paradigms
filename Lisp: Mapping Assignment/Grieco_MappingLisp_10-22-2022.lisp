; Author: Anthony Grieco
; Date: 10/22/2022
; Description: This basic program written in Steel Bank Common Lisp takes two arguments (a function and a list of items) and then adds "1" to each of the items in the list. The program then outputs the results.

(defun iterator (func val)
    ;Acts as a Recursive Call to iterate to the next element in the list
    (if val
         (append(list(apply func (list(car val)) )) (iterator func (cdr val))) ;;Takes the current element in the given list and then adds 1 to it
    )
)

(format t "List of Items being Iterated: (1 2 3 4 5) ~%")
(format t "Result of the Above List being Iterated: ~d~%" (iterator #'1+ '(1 2 3 4 5)))