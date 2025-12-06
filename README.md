 <p align="center"><b>МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС</b></p>
 <p align="center">
 <b>Звіт з лабораторної роботи 3</b><br/>
 "Конструктивний і деструктивний підходи до роботи зі списками"<br/>
 дисципліни "Вступ до функціонального програмування"
 </p>
 <p align="right"><b>Студент(-ка)</b>: Приймак Юліанна Павлівна КВ-23</p>
 <p align="right"><b>Рік</b>: 2025</p>
 
 ## Загальне завдання
 Реалізуйте алгоритм сортування чисел у списку двома способами: функціонально і
 імперативно.
 1. Функціональний варіант реалізації має базуватись на використанні рекурсії і
 конструюванні нових списків щоразу, коли необхідно виконати зміну вхідного
 списку. Не допускається використання: псевдо-функцій, деструктивних операцій,
 циклів . Також реалізована функція не має бути функціоналом (тобто приймати на
 вхід функції в якості аргументів).
2. Імперативний варіант реалізації має базуватись на використанні циклів і
 деструктивних функцій (псевдофункцій). Не допускається використання функцій
 вищого порядку або функцій для роботи зі списками/послідовностями, що
 використовуються як функції вищого порядку. Тим не менш, оригінальний список
 цей варіант реалізації також не має змінювати, тому перед виконанням
 деструктивних змін варто застосувати функцію 
copy-list (в разі необхідності).
 Також реалізована функція не має бути функціоналом (тобто приймати на вхід
 функції в якості аргументів).

 ## Варіант 1 (21)
 Алгоритм сортування вибором за незменшенням
 
 ## Лістинг функції з використанням конструктивного підходу
 ```lisp
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
 ```
 ### Тестові набори та утиліти
 ```lisp
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
 ```
 ### Тестування
 ```lisp
 Functional Selection
[Test 1] passed
[Test 2] passed
[Test 3] passed
[Test 4] passed
[Test 5] passed
[Test 6] passed
 ```
 ## Лістинг функції з використанням деструктивного підходу
 ```lisp
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
 ```
 ### Тестові набори та утиліти
 ```lisp
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
 ```
### Тестування
 ```lisp
 Imperative Selection
[Test 1] passed
[Test 2] passed
[Test 3] passed
[Test 4] passed
[Test 5] passed
[Test 6] passed
 ```
