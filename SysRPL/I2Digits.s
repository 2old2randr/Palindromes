!NO CODE
!RPL

* Return a list of digits of an integer
* number --> list

::
    CK1
    DUPTYPEREAL? IT ::
        %IP         (ensure the real is an integer)
        FPTR2 ^R>Z
    ;
    DUPTYPEZINT? NcaseTYPEERR
    FPTR2 ^ZABS

    DUP
    ZINT 0
    Z= casedrop ::
        %0
        ONE{}N
    ;

    BINT0
    SWAP
    FPTR2 ^Z>S
    BEGIN
        DUPNULL$? NOT
    WHILE ::
        DUP
        CAR$ CHR># BINT48 #- UNCOERCE   (digit)
        ROT #1+                         (digit count)
        ROT CDR$                        (rest of digits)
    ;
    REPEAT
    DROP
    {}N
;

@
