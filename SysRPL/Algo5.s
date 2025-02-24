!NO CODE
!RPL

* Algorithm applied to 'special' numbers - in turn calls
* either Algorithm 2 or Algorithm 4
* Input:
*    Level 1: number (integer)
* Output:
*    Level 3: Palindrome 1 (biggest number)
*    Level 2: Palindrome 2
*    Level 1: Palindrome 3 (smallest number)
::
    CK1&Dispatch
    # FF :: (integer)
        DUP ID I2Digits LENCOMP #2/
        { LAM num LAM m }
        BIND
        (no exponentiation available with BINTs so use reals)
        %10 LAM m UNCOERCE %^ %10 LAM m UNCOERCE %1- %^ %+ DUP (s)
        FPTR2 ^R>Z LAM num SWAP FPTR2 ^QSub  (n-s)
        DUP
        (if m'th or m+1'th digit is 0, use 2*s)
        ID I2Digits DUP
        LAM m NTHCOMPDROP %0=
        SWAP LAM m #1+ NTHCOMPDROP %0=
        OR
        IT ::
            DROP (n-s)
            %2 %* DUP (2s)
            FPTR2 ^R>Z LAM num SWAP FPTR2 ^QSub (n-2s)
        ;
        (stack has s/2s & n-s/n-2s)
        ID I2Digits     (get digits)
        ID NumType      (and classification)
        { LAM s2s LAM type LAM special LAM d LAM p1 LAM p2 LAM p3 }
        BIND
        ::
            LAM p1 LENCOMP #2 #/ DROP #0<>      (odd no. of digits)
            case ::
                (p1 p2 p3 need to be changed as if the number was classified as B1 or B2)
                LAM d xREVLIST ' LAM d STO
                LAM d LENCOMP
                { LAM n }
                BIND
                LAM d BINT2 NTHCOMPDROP
                LAM d BINT3 NTHCOMPDROP
                LAM d LAM n NTHCOMPDROP
                %0 LAM n NDUPN {}N
                3 NDUPN DROP
                { LAM d2 LAM d3 LAM dn LAM p1 LAM p2 LAM p3 }
                BIND
                LAM dn LAM d3 %- %10 %MOD %0<>
                ITE
                ::
                    (use B1 setup)
                    %1 DUP BINT1 LAM PUTLIST LAM n SWAP PUTLIST
                    LAM d2 DUP ROT BINT2 SWAP PUTLIST
                    LAM n #1- SWAP PUTLIST ' LAM p1 STO
                    LAM d3 %1- DUP
                    BINT3 LAM p2 PUTLIST LAM n SWAP PUTLIST ' LAM p2 STO
                    LAM dn LAM d3 %- %10 %MOD DUP
                    BINT4 LAM p3 PUTLIST LAM n SWAP PUTLIST ' LAM p3 STO
                ;
                ::
                    (use B2 setup)
                    %1 DUP BINT1 LAM PUTLIST LAM n SWAP PUTLIST
                    LAM d2 DUP ROT BINT2 SWAP PUTLIST
                    LAM n #1- SWAP PUTLIST ' LAM p1 STO
                    LAM d3 %2- DUP
                    BINT3 LAM p2 PUTLIST LAM n SWAP PUTLIST ' LAM p2 STO
                    %1 DUP BINT4 LAM p3 PUTLIST LAM n SWAP PUTLIST ' LAM p3 STO
                ;
                (remove leading zeros)
                LAM p1 ID CmpLst ' LAM p1 STO
                LAM p2 ID CmpLst ' LAM p2 STO
                LAM p3 ID CmpLst ' LAM p3 STO
                (and solve using Algorithm 4)
                LAM d xREVLIST LAM p1 LAM p2 LAM p3 ID Algo4
                ABND
                ABND
            ;
            LAM type #A7 #<                     (type A)
            case ::
                LAM d LAM p1 LAM p2 LAM p3 ID Algo2
            ;
            (type B)
            LAM d LAM p1 LAM p2 LAM p3 ID Algo4
        ;
        (Correct p1 by adjustment to num i.e., s or 2s)
        ROT
        LAM s2s FPTR2 ^R>Z    (s2s is a real)
        FPTR2 ^QAdd
        UNROT

        ABND
        ABND
    ;
;

@
