!NO CODE
!RPL

* Check palidromic sum program for various numbers to check that
* all paths are properly coded

::
    CK0NOLASTWD
    ' ::
        (check number is a palindrome)
        ID I2Digits
        DUP xREVLIST
        EQUAL
    ;
    ' ::
        (check that number is sum of palindromes)
        DUP ID Palin
        
        3PICK LAM isPalindrome EVAL
        3PICK LAM isPalindrome EVAL AND
        OVER LAM isPalindrome EVAL AND
        5UNROLL
        
        FPTR2 ^QAdd
        FPTR2 ^QAdd
        Z= AND
    ;
    ' ::
        DUP LAM doCheck EVAL
        caseDROP ::
            LAM errors SWAP
            FPTR2 ^AppendList
            ' LAM errors STO
            LAM errCnt #1+
            ' LAM errCnt STO
        ;
    ;
    ZERO
    {}
    { LAM isPalindrome LAM doCheck LAM isCorrectPartition LAM errCnt LAM errors }
    BIND

    (From original paper - examples of Algo 1, 2, 3 and 5/4)
    ZINT 314159265358979323846 LAM isCorrectPartition EVAL      (I.2)
    ZINT 2718281828459045235360 LAM isCorrectPartition EVAL     (II.2.ii.a)
    ZINT 120205690315959428539 LAM isCorrectPartition EVAL      (III.1)
    ZINT 12267420107203532444 LAM isCorrectPartition EVAL       (IV.5.iii.a)

    (2-digit numbers)
    ZINT 37 LAM isCorrectPartition EVAL
    ZINT 73 LAM isCorrectPartition EVAL

    (3-digit numbers)
    ZINT 345 LAM isCorrectPartition EVAL
    ZINT 745 LAM isCorrectPartition EVAL
    ZINT 705 LAM isCorrectPartition EVAL

    (4-digit numbers)
    ZINT 3000 LAM isCorrectPartition EVAL
    ZINT 5678 LAM isCorrectPartition EVAL
    ZINT 5002 LAM isCorrectPartition EVAL
    ZINT 5206 LAM isCorrectPartition EVAL

    (5-digit numbers - only numbers starting with 1)
    ZINT 15206 LAM isCorrectPartition EVAL
    ZINT 15678 LAM isCorrectPartition EVAL
    ZINT 15003 LAM isCorrectPartition EVAL
    ZINT 92805 LAM isCorrectPartition EVAL                      (I.3.ii)

    (6-digit numbers - only numbers starting with 1)
    ZINT 123456 LAM isCorrectPartition EVAL
    ZINT 123046 LAM isCorrectPartition EVAL
    ZINT 123446 LAM isCorrectPartition EVAL
    ZINT 123042 LAM isCorrectPartition EVAL
    ZINT 109025 LAM isCorrectPartition EVAL
    ZINT 856231 LAM isCorrectPartition EVAL                     (II.i)
    ZINT 437690 LAM isCorrectPartition EVAL                     (II.2.i)

    (Random tests to exercise various paths in code)
    ZINT 2468123 LAM isCorrectPartition EVAL                    (I.1)
    ZINT 5489613 LAM isCorrectPartition EVAL                    (I.2)
    ZINT 1010208 LAM isCorrectPartition EVAL                    (II.1)
    ZINT 29150497 LAM isCorrectPartition EVAL                   (II.2.i)
    ZINT 54896137 LAM isCorrectPartition EVAL                   (II.2.ii.a)
    ZINT 14000000 LAM isCorrectPartition EVAL                   (II.2.ii.b)
    ZINT 1234567 LAM isCorrectPartition EVAL                    (III.1)
    ZINT 123456789 LAM isCorrectPartition EVAL                  (III.2)
    ZINT 1128097 LAM isCorrectPartition EVAL                    (III.3.iii)
    ZINT 12345678 LAM isCorrectPartition EVAL                   (IV.1)
    ZINT 12300008 LAM isCorrectPartition EVAL                   (IV.4.i)
    ZINT 106700620371 LAM isCorrectPartition EVAL               (IV.5.i)
    ZINT 12300007 LAM isCorrectPartition EVAL                   (IV.5.ii)
    ZINT 12296503 LAM isCorrectPartition EVAL                   (IV.5.iii.a)
    ZINT 126189874318615808 LAM isCorrectPartition EVAL         (IV.5.iv.a)
    ZINT 12300009 LAM isCorrectPartition EVAL                   (IV.6)
*    ZINT 84079603496574400839385654909302841671928775176508136511539400366510882879682345079140714467212750577420292 LAM isCorrectPartition EVAL        (I.1)
    
    LAM errCnt #0=
    ITE
        "All tests passed"
    ::
        LAM errors
        "Test failed"
    ;
    
    ABND
;

@
