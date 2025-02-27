!NO CODE
!RPL

* Algorithm applied to numbers of type A1..A4 with an even number
* of digits or A5..A6 with and odd number of digits.
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
        LAM m #1+ LAM m #1-
        { LAM m+1 LAM m-1 }
        BIND
        ::
            LAM x LAM y %+ LAM z %+ %10 %/ %IP DUP ' LAM ci STO
            LAM c SWAP BINT1 PUTEL ' LAM c STO
            LAM m #2* DUP
            #2- LAM d GETATELN DROP ' LAM d1 STO
            #1- LAM d GETATELN DROP ' LAM d2 STO
            LAM d2 LAM y %- LAM z LAM d1 %>= IT %1- %10 %MOD DUPDUP ' LAM x STO
            LAM p1 SWAP BINT2 PUTEL SWAP LAM l1 #1- PUTEL ' LAM p1 STO
            LAM d1 LAM z %- %1- %10 %MOD DUPDUP ' LAM y STO
            LAM p2 SWAP BINT2 PUTEL SWAP LAM l2 #1- PUTEL ' LAM p2 STO
            BINT2 LAM d GETATELN DROP LAM x %- LAM y %- LAM ci %- %10 %MOD DUPDUP ' LAM z STO
            LAM p3 SWAP BINT2 PUTEL SWAP LAM l3 #1- PUTEL ' LAM p3 STO
            LAM x LAM y %+ LAM z %+ LAM ci %+ %10 %/ %IP DUP ' LAM ci STO
            LAM c SWAP BINT2 PUTEL ' LAM c STO
            LAM m THREE #>
            IT ::
                LAM m THREE
                DO
                    LAM m #2* INDEX@ #- LAM d GETATELN DROP ' LAM d1 STO
                    LAM z LAM d1 %< ITE %1 %0 DUPDUP ' LAM x STO
                    LAM p1 SWAP INDEX@ PUTEL SWAP LAM l1 INDEX@ #- #1+ PUTEL ' LAM p1 STO
                    LAM d1 LAM z %- %1- %10 %MOD DUPDUP ' LAM y STO
                    LAM p2 SWAP INDEX@ PUTEL SWAP LAM l2 INDEX@ #- #1+ PUTEL ' LAM p2 STO
                    INDEX@ LAM d GETATELN DROP LAM x %- LAM y %- LAM ci %- %10 %MOD DUPDUP ' LAM z STO
                    LAM p3 SWAP INDEX@ PUTEL SWAP LAM l3 INDEX@ #- #1+ PUTEL ' LAM p3 STO
                    LAM x LAM y %+ LAM z %+ LAM ci %+ %10 %/ %IP DUP ' LAM ci STO
                    LAM c SWAP INDEX@ PUTEL ' LAM c STO
                LOOP
            ;
            LAM p1 %0 LAM m PUTEL ' LAM p1 STO
            LAM m LAM d GETATELN DROP LAM z %- LAM ci %- %10 %MOD DUP ' LAM y STO
            LAM p2 SWAP LAM m PUTEL ' LAM p2 STO
            (Adjust center digits if the carry in m is 0 or 2)
            LAM y LAM z %+ LAM ci %+ %10 %/ %IP
            DUP
            %0= casedrop ::
                LAM y %0<> case ::                              (type II.2.i)
                    %1 DUP LAM p1 SWAP LAM m PUTEL SWAP LAM m+1 PUTEL ' LAM p1 STO
                    LAM p2 LAM y %1- LAM m PUTEL ' LAM p2 STO
                ;
                LAM m-1 LAM p2 GETATELN DROP ' LAM y STO
                LAM y %0<> case ::                              (type II.2.ii.a)
                    %1 DUP LAM p1 SWAP LAM m PUTEL SWAP LAM m+1 PUTEL ' LAM p1 STO
                    %8 LAM y %1- DUP
                    LAM p2 SWAP LAM m-1 PUTEL SWAP LAM m+1 PUTEL SWAP LAM m PUTEL  ' LAM p2 STO
                    LAM m-1 LAM p3 GETATELN DROP %1+ DUP
                    LAM p3 SWAP LAM m PUTEL SWAP LAM m-1 PUTEL ' LAM p3 STO
                ;
                LAM z %0<> case ::                              (type II.2.ii.b)
                    %1 DUPDUP LAM p2 SWAP LAM m+1 PUTEL SWAP LAM m PUTEL SWAP LAM m-1 PUTEL ' LAM p2 STO
                    LAM m-1 LAM p3 GETATELN DROP %1- DUP
                    LAM p3 SWAP LAM m PUTEL SWAP LAM m-1 PUTEL ' LAM p3 STO
                ;
                LAM m-1 LAM c GETATELN DROP %0<> case ::        (type II.2.ii.c when >6-digit number)
                    %1 DUP
                    LAM m-1 LAM p1 GETATELN DROP %1- DUP
                    LAM p1 SWAP LAM m-1 PUTEL SWAP LAM m #2+ PUTEL
                    SWAP LAM m PUTEL SWAP LAM m+1 PUTEL ' LAM p1 STO
                    %6 %9 DUP
                    LAM p2 SWAP LAM m-1 PUTEL SWAP LAM m+1 PUTEL SWAP LAM m PUTEL ' LAM p2 STO
                    %2 DUP LAM p3 SWAP LAM m PUTEL SWAP LAM m-1 PUTEL ' LAM p3 STO
                ;
                (type II.2.ii.c called from Sml6 for 6-digit numbers)
                BINT2 LAM p1 GETATELN DROP %0<> case ::
                    %9 DUP
                    BINT2 LAM p1 GETATELN DROP %1- DUP
                    LAM p1 SWAP BINT2 PUTEL SWAP BINT5 PUTEL
                    SWAP BINT3 PUTEL SWAP BINT4 PUTEL ' LAM p1 STO
                    %1 DUPDUP LAM p2 SWAP BINT2 PUTEL SWAP BINT3 PUTEL SWAP BINT4 PUTEL ' LAM p2 STO
                    %0 DUP LAM p3 SWAP BINT2 PUTEL SWAP BINT3 PUTEL ' LAM p3 STO
                ;
                BINT1 LAM p1 GETATELN DROP %1 %= case ::
                    %2 %0 %0 %0 %0 %2 { %6 } FPTR2 ^XEQ>ARRY ' LAM p1 STO
                    %1 %1 { %2 } FPTR2 ^XEQ>ARRY ' LAM p2 STO
                    %6 { %1 } FPTR2 ^XEQ>ARRY ' LAM p3 STO
                ;
                BINT1 LAM p2 GETATELN DROP %9 %= case ::
                    %9 DUP
                    BINT1 LAM p1 GETATELN DROP %1- DUP
                    LAM p1 SWAP BINT1 PUTEL SWAP BINT6 PUTEL
                    SWAP BINT2 PUTEL SWAP BINT5 PUTEL ' LAM p1 STO
                    %8 BINT1 LAM p2 GETATELN DROP %1+ DUP
                    LAM p2 SWAP BINT1 PUTEL SWAP BINT5 PUTEL SWAP BINT3 PUTEL ' LAM p2 STO
                    %1 DUP LAM p3 SWAP BINT2 PUTEL SWAP BINT3 PUTEL ' LAM p3 STO
                ;
                BINT1 LAM p1 GETATELN DROP %1+ DUP
                LAM p1 BINT1 PUTEL SWAP BINT6 PUTEL ' LAM p1 STO
                %1 %1 { %2 } FPTR2 ^XEQ>ARRY ' LAM p2 STO
                %6 { %1 } FPTR2 ^XEQ>ARRY ' LAM p3 STO
            ;
            %2 %= case ::                                       (type II.3)
                %1 DUP LAM p1 SWAP LAM m+1 PUTEL SWAP LAM m PUTEL ' LAM p1 STO
                %8 LAM m-1 LAM p2 GETATELN DROP %1- DUP
                LAM p2 SWAP LAM m-1 PUTEL SWAP LAM m+1 PUTEL SWAP LAM m PUTEL ' LAM p2 STO
                %0 DUP LAM p3 SWAP LAM m PUTEL SWAP LAM m-1 PUTEL ' LAM p3 STO
            ;
        ;

        LAM p1 ID Digits2I
        LAM p2 ID Digits2I
        LAM p3 ID Digits2I
        ABND
        ABND
        ABND
    ;
;

@
