!NO CODE
!RPL

* Construct a number given an array of digits
* array --> number

::
    CK1&Dispatch
    BINT4 :: (array)
        DUP
        FPTR2 ^ARSIZE
        ZINT 0 SWAP
        #1+_ONE_DO
            ZINT 10 FPTR2 ^QMul
            SWAP
            DUP INDEX@ SWAP GETATELN DROP
            DUPTYPEREAL?
            IT :: FPTR2 ^R>Z ;
            ROT
            FPTR2 ^QAdd
        LOOP
        SWAP DROP
    ;
;

@
