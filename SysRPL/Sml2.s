!NO CODE
!RPL

* Two digit numbers
* Number | DigitList ---> p1 | p2 | p3

::
    CK2&Dispatch
    # 15 :: (number, list)
        INNERCOMP DROP
        { NULLLAM NULLLAM NULLLAM } (number, d1, d0)
        BIND

        ::
            3GETLAM %10 %= case ::
                %9 %1 %0
            ;
            2GETLAM 1GETLAM %= case ::
                3GETLAM
                %0
                %0
            ;
            2GETLAM 1GETLAM %< case ::
                2GETLAM %11 %*
                1GETLAM 2GETLAM %-
                %0
            ;
            2GETLAM 1GETLAM %1+ %> case ::
                2GETLAM %1- %11 %*
                %10 1GETLAM %+ 2GETLAM %- %1+
                %0
            ;
            (d1 = d0 + 1 and d0 >= 1)
            1GETLAM %11 %*
            %9
            %1
        ;

        ABND
    ;
;

@
