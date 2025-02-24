!NO CODE
!RPL

* Five digit numbers
* Number | DigitList ---> p1 | p2 | p3
::
    CK2&Dispatch
    # 15 :: (number, list)
        DUP INNERCOMP DROP
        { LAM num LAM d LAM d4 LAM d3 LAM d2 LAM d1 LAM d0 }
        BIND
        ::
            LAM d4 %1 %<> case ::
                (Special case - apply algorithm 1 since this is a type 'A' number)
                LAM d ID NumType
                (remove levels 5 and 6 - levels 1-4 are inputs to Algo1)
                SIX ROLL SIX ROLL 2DROP
                ID Algo1
            ;
            LAM num %10000 %= case ::               (type v)
                %9999
                %1
                %0
            ;
            (Most solutions are of the form '1 d3 . d3 1')
            LAM d3 %1010 %* %10001 %+
            { LAM d30d3 }
            BIND
            LAM num LAM d30d3 %>=
            ITE
            ::
                LAM num LAM d30d3 %-
                DUP
                ID I2Digits
                DUP LENCOMP
                { LAM m LAM md LAM mdlen }
                BIND
                ::
                    LAM m %201 %= case ::       (type ii)
                        LAM d30d3 %100 %+
                        %101
                        %0
                    ;
                    LAM m %10 %< case ::
                        LAM d30d3
                        LAM m
                        %0
                    ;
                    LAM m %10 %= case ::
                        LAM d30d3
                        %9
                        %1
                    ;
                    LAM md BINT1 NTHCOMPDROP LAM md BINT2 NTHCOMPDROP %1+ %<>
                    LAM mdlen TWO #= AND
                    LAM mdlen TWO #<>
                    ORcase ::              (type i)
                        (m is the sum of two palindromes)
                        LAM m FPTR2 ^R>Z ID Palin
                        DROP
                        LAM d30d3 UNROT
                    ;
                    LAM md BINT1 NTHCOMPDROP LAM md BINT2 NTHCOMPDROP %1+ %=
                    LAM mdlen TWO #= AND
                    LAM d3 %0<>
                    ANDcase ::             (type iii)
                        %10101 LAM d3 %1- %1010 %* %+
                        %909 LAM md BINT2 NTHCOMPDROP %1+ %10* %+
                        LAM md BINT2 NTHCOMPDROP %1+
                    ;
                    (type iv - d3=0)
                    %9999
                    LAM md BINT2 NTHCOMPDROP %1+ %11 %*
                    %1
                ;
                ABND
            ;
            ::
                (p1 is of the form '1 d3-1 9 d3-1 1')
                %10901 LAM d3 %1- %1010 %* %+
                { LAM d39d3 }
                BIND
                LAM num LAM d39d3 %-
                DUP ID I2Digits DUP LENCOMP
                { LAM m LAM md LAM mdlen }
                BIND
                ::
                    LAM mdlen TWO #<> case ::             (type vi)
                        (m is the sum of two palindromes)
                        LAM m FPTR2 ^R>Z ID Palin
                        DROP
                        LAM d39d3 UNROT
                    ;
                    LAM md BINT1 NTHCOMPDROP LAM md BINT2 NTHCOMPDROP %1+ %<>
                    LAM mdlen TWO #=
                    ANDcase ::
                        (m is the sum of two palindromes)
                        LAM m FPTR2 ^R>Z ID Palin
                        DROP
                        LAM d39d3 UNROT
                    ;
                    %10801 LAM d3 %1- %1010 %* %+
                    %101 LAM md BINT2 NTHCOMPDROP %1+ %10* %+
                    LAM md BINT2 NTHCOMPDROP %1-
                ;
                ABND
                ABND
            ;
            ABND
        ;

        ABND (inputs)
    ;
;

@
