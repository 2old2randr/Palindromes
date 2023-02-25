Implements the algorithms described in the paper "Every positive integer is a sum of three palindromes"
by Javier Cilleruelo, Florian Luca and Lewis Baxter in User RPL.

Although the algrithms described in the paper work for any base >= 5, ths implementation is
for base 10 only. Uses the functions I→NL, NL→I and REV from the excellent ListExt library that
can be found at [this location]: https://www.hpcalc.org/details/7971.

For numbers with less than seven digits, a brute force search with backtracking is used. This
was originally written by "peruna" (see [this thread]: https://www.hpmuseum.org/forum/thread-19563.html).
