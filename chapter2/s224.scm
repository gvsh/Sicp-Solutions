
(list 1 (list 2 (list 3 4)))


Evaluator:
(1 (2 (3 4)))


Box and Pointer Notation:
    ___    ___
   |_|_|--|_|_|--nil
   \      \ ___    ___
    1      |_|_|--|_|_|--nil
           \      \ ___    ___
            2      |_|_|--|_|_|--nil
                   \      \
                    3      4


Tree:
                       x
                      / \
                     /   \
                    1     x
                         / \
                        /   \
                       2     x
                            / \
                           /   \
                          3     4







