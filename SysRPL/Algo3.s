!NO CODE
!RPL

* Algorithm applied to numbers of type B with an odd number
* of digits.
* Input:
*    Level 4: list of digits of number (reversed)
*    Level 3: Palindrome 1 skeleton
*    Level 2: Palindrome 2 skeleton
*    Level 1: Palindrome 3 skeleton
* Output:
*    Level 3: Palindrome 1 (biggest number)
*    Level 2: Palindrome 2
*    Level 1: Palindrome 3 (smallest number)
::
    CK4&Dispatch
    # 4444 :: (4 arrays)
        { LAM d LAM p1 LAM p2 LAM p3 }
        BIND
        LAM p3 FPTR2 ^ARSIZE
        LAM p2 FPTR2 ^ARSIZE
        LAM p1 FPTR2 ^ARSIZE
        DUPDUP
        #2/ SWAP                   (list midpoint)
        %0 SWAP NDUPN
        UNCOERCE ONE{}N
        FPTR2 ^XEQ>ARRY            (carry list)
        BINT1 LAM p1 GETATELN DROP (temp vars to avoid repeated array access)
        BINT1 LAM p2 GETATELN DROP
        BINT1 LAM p3 GETATELN DROP
        %0 %0 %0
        { LAM l3 LAM l2 LAM l1 LAM m                  (BINTs)
          LAM c                                       (list)
          LAM x LAM y LAM z LAM d1 LAM d2 LAM ci      (reals)
        }
        BIND
        (commonly used indexes - compute only once)
        LAM m #1+ LAM m #1- LAM m #2+
        { LAM m+1 LAM m-1 LAM m+2 }
        BIND
        ::
            LAM x LAM y %+ LAM z %+ %10 %/ %IP DUP ' LAM ci STO
            LAM c SWAP BINT1 PUTEL ' LAM c STO
            LAM m #2* DUP
            #2- LAM d GETATELN DROP ' LAM d1 STO
            #1- LAM d GETATELN DROP ' LAM d2 STO
            LAM d2 LAM y %- LAM z LAM d1 %>= IT %1- %10 %MOD DUPDUP ' LAM x STO
            (p1 has two digits populated - both 1 so)
            (the subscript is 1 more than the one for p2 and p3)
            LAM p1 SWAP BINT3 PUTEL SWAP LAM l1 #2- PUTEL ' LAM p1 STO
            LAM d1 LAM z %- %1- %10 %MOD DUPDUP ' LAM y STO
            LAM p2 SWAP BINT2 PUTEL SWAP LAM l2 #1- PUTEL ' LAM p2 STO
            BINT2 LAM d GETATELN DROP BINT2 LAM p1 GETATELN DROP %-
            LAM y %- LAM ci %- %10 %MOD DUPDUP ' LAM z STO
            LAM p3 SWAP BINT2 PUTEL SWAP LAM l3 #1- PUTEL ' LAM p3 STO
            BINT2 LAM p1 GETATELN DROP LAM y %+ LAM z %+ LAM ci %+ %10 %/ %IP DUP ' LAM ci STO
            LAM c SWAP BINT2 PUTEL ' LAM c STO
            LAM m THREE #>
            IT ::
                LAM m THREE
                DO
                    LAM m #2* INDEX@ #- LAM d GETATELN DROP ' LAM d1 STO
                    LAM z LAM d1 %< ITE %1 %0 DUPDUP ' LAM x STO
                    LAM p1 SWAP INDEX@ #1+ PUTEL SWAP LAM l1 INDEX@ #- PUTEL ' LAM p1 STO
                    LAM d1 LAM z %- %1- %10 %MOD DUPDUP ' LAM y STO
                    LAM p2 SWAP INDEX@ PUTEL SWAP LAM l2 INDEX@ #- #1+ PUTEL ' LAM p2 STO
                    INDEX@ LAM d GETATELN DROP INDEX@ LAM p1 GETATELN DROP %-
                    LAM y %- LAM ci %- %10 %MOD DUPDUP ' LAM z STO
                    LAM p3 SWAP INDEX@ PUTEL SWAP LAM l3 INDEX@ #- #1+ PUTEL ' LAM p3 STO
                    INDEX@ LAM p1 GETATELN DROP LAM y %+ LAM z %+ LAM ci %+ %10 %/ %IP DUP ' LAM ci STO
                    LAM c SWAP INDEX@ PUTEL ' LAM c STO
                LOOP
            ;
            LAM p1 %0 LAM m #1+ PUTEL ' LAM p1 STO
            LAM m LAM d GETATELN DROP LAM z %- LAM x %- LAM ci %- %10 %MOD DUP ' LAM y STO
            LAM p2 SWAP LAM m PUTEL ' LAM p2 STO
            (Adjust middle digits if carry in m is 0 or 2)
            LAM x LAM y %+ LAM z %+ LAM ci %+ %10 %/ %IP ' LAM ci STO
            LAM ci %0= case ::                (type III.2)
                LAM p1 %1 LAM m+1 PUTEL ' LAM p1 STO
            ;
            LAM ci %2 %= case ::
                LAM m-1 LAM p2 GETATELN DROP ' LAM y STO
                LAM m-1 LAM p3 GETATELN DROP ' LAM z STO
                LAM y %0<> LAM z %9 %<> ANDcase ::      (type III.3.i)
                    LAM y %1- DUP
                    LAM p2 SWAP LAM m-1 PUTEL SWAP LAM m+1 PUTEL ' LAM p2 STO
                    LAM m LAM p2 GETATELN DROP %1-
                    LAM p2 SWAP LAM m PUTEL ' LAM p2 STO
                    LAM z %1+ DUP
                    LAM p3 SWAP LAM m-1 PUTEL SWAP LAM m PUTEL ' LAM p3 STO
                ;
                LAM y %0<> LAM z %9 %= ANDcase ::       (type III.3.ii)
                    LAM p1 %1 LAM m+1 PUTEL ' LAM p1 STO
                    LAM y %1- DUP
                    LAM p2  SWAP LAM m-1 PUTEL SWAP LAM m+1 PUTEL ' LAM p2 STO
                    %0 DUP LAM p3 SWAP LAM m PUTEL SWAP LAM m-1 PUTEL ' LAM p3 STO
                ;
                LAM y %0= LAM z %9 %<> ANDcase ::       (type III.3.iii)
                    LAM m LAM p1 GETATELN DROP %1- DUP
                    LAM p1 SWAP LAM m PUTEL SWAP LAM m+2 PUTEL ' LAM p1 STO
                    %9 DUP LAM m LAM p2 GETATELN DROP %1-
                    LAM p2 SWAP LAM m PUTEL SWAP LAM m-1 PUTEL SWAP LAM m+1 PUTEL ' LAM p2 STO
                    LAM z %1+ DUP
                    LAM p3 SWAP LAM m-1 PUTEL SWAP LAM m PUTEL ' LAM p3 STO
                ;
                (type III.3.iv)
                %1 LAM m LAM p1 GETATELN DROP %1- DUP
                LAM p1 SWAP LAM m PUTEL SWAP LAM m+2 PUTEL SWAP LAM m+1 PUTEL ' LAM p1 STO
                %9 DUP LAM p2 SWAP LAM m-1 PUTEL SWAP LAM m+1 PUTEL ' LAM p2 STO
                %0 DUP LAM p3 SWAP LAM m-1 PUTEL SWAP LAM m PUTEL ' LAM p3 STO
            ;
        ;

        LAM p1 ID Digits2I
        LAM p2 ID Digits2I
        LAM p3 ID Digits2I
        ABND
        ABND
    ;
;

@
