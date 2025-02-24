!NO CODE
!RPL

* Four digit numbers
* Number | DigitList ---> p1 | p2 | p3
::
    CK2&Dispatch
    # 15 :: (number, list)
        INNERCOMP DROP
        { LAM num LAM d3 LAM d2 LAM d1 LAM d0 }
        BIND
        LAM d3 %1001 %*
        { LAM d00d }
        BIND
        ::
            LAM num %1000 %= case ::                (type v)
                %999
                %1
                %0
            ;
            LAM num LAM d00d %= case ::
                LAM d00d
                %0
                %0
            ;
            LAM num LAM d00d %201 %+ %= case ::     (type ii)
                LAM d3 %1 %= case ::
                    %1111
                    %88
                    %3
                ;
                LAM d3 %9 %= case ::
                    %9119
                    %88
                    %3
                ;
                LAM d3 %1- %1001 %* %990 %+
                %212
                %0
            ;
            LAM num LAM d00d %> case ::
                LAM num LAM d00d %-
                DUP
                ID I2Digits
                DUP LENCOMP
                { LAM m LAM md LAM length }
                BIND
                ::
                    LAM m %10 %< case ::
                        LAM d00d
                        LAM m
                        %0
                    ;
                    LAM m %10 %= case ::
                        LAM d00d
                        %9
                        %1
                    ;
                    LAM md BINT1 NTHCOMPDROP LAM md BINT2 NTHCOMPDROP %1+ %=
                    LAM length BINT2 #= AND
                    LAM length BINT2 #<>
                    ORcase ::                         (type i)
                        (m is the sum of two palindromes - recursively call)
                        LAM m FPTR2 ^R>Z ID Palin
                        DROP (should be 0)
                        LAM d00d
                        UNROT
                    ;
                    (length = 2, md1 = md2+1, md2<>0, md2<>9)
                    LAM d3 LAM md BINT2 NTHCOMPDROP %+ LAM d0 %=
                    case ::                         (type iii.a)
                        LAM d3 %1 %=
                        ITE
                        ::                          (type iii.a.1)
                            (num = d3 0 md2+1 d0)
                            LAM d3 %1- %1001 %* %880 %+
                            %131
                            LAM md TWO NTHCOMPDROP %11 %*
                        ;
                        ::                          (type iii.a.2)
                            (num = 1 0 md2+1 md2+1)
                            %999
                            LAM md TWO NTHCOMPDROP %1+ %11 %*
                            %1
                        ;
                    ;
                    (d3 + md2 = d0 + 10)        (type iii.b)
                    LAM d3 %1- %1001 %* %880 %+
                    %131
                    LAM md TWO NTHCOMPDROP %11 %*
                ;
                ABND
            ;
            (d3 0 0 d0)
            LAM d3 %1- %1001 %* %990 %+             (type iv)
            %10 LAM d0 %+ LAM d3 %-
            %1
        ;
        ABND
        ABND
    ;
;

@
