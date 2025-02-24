!NO CODE
!RPL

* Three digit numbers
* Number | DigitList ---> p1 | p2 | p3
::
    CK2&Dispatch
    # 15 :: (number, list)
        INNERCOMP DROP
        { LAM num LAM d2 LAM d1 LAM d0 }
        BIND
        ::
            LAM num %201 %= case ::
                %101
                %99
                %1
            ;
            LAM num %100 %= case ::
                %99
                %1
                %0
            ;
            LAM d2 LAM d0 %> NOTcase ::
                LAM d2 %101 %* LAM d1 %10* %+
                LAM d0 LAM d2 %-
                %0
            ;
            LAM d2 LAM d0 %1+ %>=
            LAM d1 %0<>
            ANDcase ::
                LAM d2 %101 %* LAM d1 %1- %10* %+
                %10 LAM d0 %+ LAM d2 %-
                %0
            ;
            LAM d2 LAM d0 %1+ %>=
            LAM d1 %0=
            AND
            LAM d2 LAM d0 %- %1- %10 %MOD %0<>
            ANDcase ::
                LAM d2 %1- %101 %* %90 %+
                %10 LAM d0 %+ LAM d2 %- %1+
                %0
            ;
            (d2 >= d0+1, d1=0, D[d2-d0-1]=0)
            (100 and 201 already handled as special cases)
            LAM d2 %2 %- %101 %* %90 %+
            %111
            %0
        ;
        ABND
    ;
;

@
