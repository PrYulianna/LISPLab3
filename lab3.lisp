(defun my-min (lst)
  (cond
    ((null (cdr lst)) (car lst))
    (t (min (car lst) (my-min (cdr lst))))))

(defun remove-first (x lst)
  (cond
    ((null lst) nil)
    ((equal x (car lst)) (cdr lst))
    (t (cons (car lst) (remove-first x (cdr lst))))))

(defun selection-sort-functional (lst)
  (if (null lst)
      nil
      (let* ((m (my-min lst))
             (rest (remove-first m lst)))
        (cons m (selection-sort-functional rest)))))

(defun check-sort-functional (name input expected)
  (format t "~a ~:[FAILED~;passed~]~%"
          name
          (equal (selection-sort-functional input) expected)))

(defun test-selection-sort-functional ()
  (check-sort-functional "[Test 1]" '(5 1 4 3 2) '(1 2 3 4 5))
  (check-sort-functional "[Test 2]" '(10 9 8 7) '(7 8 9 10))
  (check-sort-functional "[Test 3]" '(1 2 3 4 5) '(1 2 3 4 5))
  (check-sort-functional "[Test 4]" '(3 3 2 1 4 4) '(1 2 3 3 4 4))
  (check-sort-functional "[Test 5]" nil nil)
  (check-sort-functional "[Test 6]" '(42) '(42)))

(defun selection-sort-imperative (lst)
  (let* ((arr (copy-list lst))
         (n (length arr)))
    (loop for i from 0 below n do
      (let ((min-index i)
            (min-value (nth i arr)))
        (loop for j from (1+ i) below n do
          (when (< (nth j arr) min-value)
            (setf min-index j
                  min-value (nth j arr))))
        (rotatef (nth i arr) (nth min-index arr))))
    arr))

(defun check-sort-imperative (name input expected)
  (format t "~a ~:[FAILED~;passed~]~%"
          name
          (equal (selection-sort-imperative input) expected)))

(defun test-selection-sort-imperative ()
  (check-sort-imperative "[Test 1]" '(5 1 4 3 2) '(1 2 3 4 5))
  (check-sort-imperative "[Test 2]" '(10 9 8 7) '(7 8 9 10))
  (check-sort-imperative "[Test 3]" '(1 2 3 4 5) '(1 2 3 4 5))
  (check-sort-imperative "[Test 4]" '(3 3 2 1 4 4) '(1 2 3 3 4 4))
  (check-sort-imperative "[Test 5]" nil nil)
  (check-sort-imperative "[Test 6]" '(42) '(42)))

(format t "Functional Selection~%")
(test-selection-sort-functional)
(format t "~%Imperative Selection~%")
(test-selection-sort-imperative)
