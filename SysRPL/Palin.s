!NO CODE
!RPL

* Every positive integer can be represented as the sum of three
* palindromes.
* Implementation of the proof in the paper by Javier Cilleruelo,
* Florian Luca and Lewis Baxter
* number --> palidrome-1 | palindrome-2 | palindrome-3

::
    CK1NOLASTWD

    (CK1&DISPATCH is not used so that both ZINTs and integers)
    (entered as reals can be handled. The latter is useful e.g., when)
    (the calculator is in approximate mode and an integer cannot be)
    (entered on the stack)
    DUPTYPEREAL? IT ::
        %IP         (ensure the real is an integer)
        FPTR2 ^R>Z
    ;
    DUPTYPEZINT? NcaseTYPEERR
    
    DUP ID I2Digits
    { LAM num LAM digits }
    BIND

    LAM num ZINT 1000000 Z<
    ITE
    ::
        (trivial case)
        LAM num ZINT 10 Z< case :: LAM num ZINT 0 ZINT 0 ;

        LAM num LAM digits (arguments for each Algo)
        LAM num ZINT 100 Z< case ID Sml2
        LAM num ZINT 1000 Z< case ID Sml3
        LAM num ZINT 10000 Z< case ID Sml4
        LAM num ZINT 100000 Z< case ID Sml5
        ID Sml6
    ;
    ::
        LAM digits LENCOMP BINT2 #/ DROP #0= (no. of digits even?)
        LAM digits ID NumType
        { LAM evenDigits LAM type LAM special LAM revdig LAM p1 LAM p2 LAM p3 }
        BIND
        ::
            LAM special case ::
                (all special numbers go through Algorithm 5)
                LAM num ID Algo5
            ;
            (arguments on stack are same for all algorithms)
            LAM revdig LAM p1 LAM p2 LAM p3
            (call algorithm that works for the number type)
            LAM type #A5 #< LAM evenDigits NOT AND
            LAM type DUP #A4 #> SWAP #A7 #< AND LAM evenDigits AND
            OR
            case ::
                (types A1..A4 with odd no. of digits & A5..A6 with even no. of digits)
                ID Algo1
            ;
            LAM type #A7 #<
            case ::
                (types A1..A4 with even no. of digits & A5..A6 with odd no. of digits)
                ID Algo2
            ;
            LAM evenDigits NOT
            case ::
                (type B with odd number of digits)
                ID Algo3
            ;
            (type B with even no. of digits)
            ID Algo4
        ;
        ABND
    ;

    ABND

    (Sml2..Sml6 return reals/integers - ensure all integers)
    DUPTYPEREAL? IT FPTR2 ^R>Z
    ROT
    DUPTYPEREAL? IT FPTR2 ^R>Z
    ROT
    DUPTYPEREAL? IT FPTR2 ^R>Z
    ROT
;

@
