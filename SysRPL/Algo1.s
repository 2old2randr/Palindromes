!NO CODE
!RPL

* Algorithm applied to numbers of type A1..A4 with an odd number
* of digits or A5..A6 with an even number of digits
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
    # 5555 :: (4 lists)
        { LAM d LAM p1 LAM p2 LAM p3 }
        BIND
        LAM p3 LENCOMP
        LAM p2 LENCOMP
        LAM p1 LENCOMP DUPDUP
        #2/ SWAP                 (list midpoint)
        %0 SWAP NDUPN {}N        (carry list)
        LAM p1 BINT1 NTHCOMPDROP (temp vars to avoid repeated NTHCOMPDROPs)
        LAM p2 BINT1 NTHCOMPDROP
        LAM p3 BINT1 NTHCOMPDROP
        %0 %0 %0
        { LAM l3 LAM l2 LAM l1 LAM m                  (BINTs)
          LAM c                                       (list)
          LAM x LAM y LAM z LAM d1 LAM d2 LAM ci      (reals)
        }
        BIND
        ::
            LAM x LAM y %+ LAM z %+ %10 %/ %IP DUP ' LAM ci STO
            BINT1 LAM c PUTLIST ' LAM c STO     (carry from column 1)
            LAM m #2* DUP
            LAM d SWAP #1- NTHCOMPDROP ' LAM d1 STO
            LAM d SWAP NTHCOMPDROP ' LAM d2 STO
            LAM d2 LAM y %-
            LAM z LAM d1 %>= IT %1- %10 %MOD DUPDUP ' LAM x STO
            BINT2 LAM p1 PUTLIST LAM l1 #1- SWAP PUTLIST ' LAM p1 STO
            LAM d1 LAM z %- %1- %10 %MOD DUPDUP ' LAM y STO
            BINT2 LAM p2 PUTLIST LAM l2 #1- SWAP PUTLIST ' LAM p2 STO
            LAM d BINT2 NTHCOMPDROP LAM x %- LAM y %- LAM ci %- %10 %MOD DUPDUP ' LAM z STO
            BINT2 LAM p3 PUTLIST LAM l3 #1- SWAP PUTLIST ' LAM p3 STO
            LAM x LAM y %+ LAM z %+ LAM ci %+ %10 %/ %IP DUP ' LAM ci STO
            BINT2 LAM c PUTLIST ' LAM c STO
            (fill in the rest of the digits in the middle)
            LAM m THREE #< NOT
            IT ::
                LAM m #1+ THREE
                DO
                    LAM d LAM m #2* INDEX@ #- #1+ NTHCOMPDROP ' LAM d1 STO
                    LAM z LAM d1 %< ITE %1 %0 DUPDUP ' LAM x STO
                    INDEX@ LAM p1 PUTLIST LAM l1 INDEX@ #- #1+ SWAP PUTLIST ' LAM p1 STO
                    LAM d1 LAM z %- %1- %10 %MOD DUPDUP ' LAM y STO
                    INDEX@ LAM p2 PUTLIST LAM l2 INDEX@ #- #1+ SWAP PUTLIST ' LAM p2 STO
                    LAM d INDEX@ NTHCOMPDROP LAM x %- LAM y %- LAM ci %- %10 %MOD DUPDUP ' LAM z STO
                    INDEX@ LAM p3 PUTLIST LAM l3 INDEX@ #- #1+ SWAP PUTLIST ' LAM p3 STO
                    LAM x LAM y %+ LAM z %+ LAM ci %+ %10 %/ %IP DUP ' LAM ci STO
                    INDEX@ LAM c PUTLIST ' LAM c STO
                LOOP
            ;
            %0 LAM m #1+ LAM p1 PUTLIST ' LAM p1 STO
            (adjust if carry in position m is 0 or 2)
            LAM c LAM m NTHCOMPDROP DUP
            %0= case ::
                %1 LAM m #1+ LAM p1 PUTLIST ' LAM p1 STO    (case I.2)
                DROP
            ;
            %2 %= case ::
                LAM p3 LAM m NTHCOMPDROP %9 %=
                case ::                                     (case I.3.i)
                    %1 LAM m #1+ LAM p1 PUTLIST ' LAM p1 STO
                    LAM p2 LAM m NTHCOMPDROP %1- DUPDUP
                    LAM m #1+ LAM p2 PUTLIST LAM m SWAP PUTLIST ' LAM p2 STO
                    %0 LAM m LAM p3 PUTLIST ' LAM p3 STO
                ;
                (case I.3.ii)
                LAM p2 LAM m NTHCOMPDROP %1- DUPDUP
                LAM m #1+ LAM p2 PUTLIST LAM m SWAP PUTLIST ' LAM p2 STO
                LAM p3 LAM m NTHCOMPDROP %1+ LAM m LAM p3 PUTLIST ' LAM p3 STO
            ;
        ;
        LAM p1 ID Digits2I
        LAM p2 ID Digits2I
        LAM p3 ID Digits2I
        ABND (temp vars)
        ABND (inputs)
    ;
;

@
