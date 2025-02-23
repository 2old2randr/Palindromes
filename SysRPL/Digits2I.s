!NO CODE
!RPL

* Construct a number given a list of digits
* list --> number

::
    CK1&Dispatch
    BINT5 ::
        ZINT 0
        SWAP
        BEGIN
           DUPNULLCOMP? NOT
        WHILE ::
            SWAP
            ZINT 10
            FPTR2 ^QMul
            SWAP
            DUP CARCOMP
            DUPTYPEREAL?
            IT :: FPTR2 ^R>Z ;
            ROT
            FPTR2 ^QAdd
            SWAP
            CDRCOMP
        ;
        REPEAT
        DROP
    ;
;

@
