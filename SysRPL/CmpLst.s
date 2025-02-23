!NO CODE
!RPL

* Remove leading zeroes from input list
::
    CK1&Dispatch
    BINT5 :: (list)
        BEGIN
            DUP
            CARCOMP %0 %=
        WHILE
            CDRCOMP
        REPEAT
    ;
;

@
