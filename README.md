Implements the algorithms described in the paper "Every positive
integer is a sum of three palindromes" by Javier Cilleruelo, Florian
Luca and Lewis Baxter in User RPL for the HP 50g calculator.

For any given integer, the program returns three palindromic numbers
that sum up to the given number. The numbers returned are not
necessarily distinct and one or two may be zero.

Although the algrithms described in the paper work for any base >= 5,
this implementation is for base 10 only. Uses the functions I→NL,
NL→I, LPOP and REV from the excellent ListExt library that can be
found at https://www.hpcalc.org/details/7971.

The original paper can be found at https://arxiv.org/abs/1602.06208
