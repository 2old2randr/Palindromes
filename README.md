This set of User RPL programs implement the algorithms described in
the paper "Every positive integer is a sum of three palindromes" by
Javier Cilleruelo, Florian Luca and Lewis Baxter.

For any given integer, the program returns three palindromic numbers
that sum up to the given number. The numbers returned are not
necessarily distinct and one or two may be zero.

Although the algorithms described in the paper work for any base >= 5,
this implementation is for base 10 only.

The code has been tested on an HP 50g calculator and minor fixes will
be required to run the code on earlier hardware such as the HP
48sx. For example, there are trivial dependencies on the CAS (function
IDIV2 is used).

To avoid external dependencies, the functions I->NL and NL->I are
implemented locally in User RPL. Much faster versions exist in the
ListExt library so NL2I.txt and I2NL.txt are not required if that
library is installed.

The original paper can be found at https://arxiv.org/abs/1602.06208
