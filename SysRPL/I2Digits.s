!NO CODE
!RPL

* Return a list of digits of an integer
* number --> list

::
    CK1&Dispatch
    #FF ::
        FPTR2 ^ZABS     (ensure positive)
        ROMPTR 58F 68
    ;
    BINT1 ::
        %ABS %0 RNDXY   (ensure positive integer)
        FPTR2 ^R>Z
        ROMPTR 58F 68
    ;
;

@
