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
            BINT1 LAM c PUTLIST ' LAM c STO
            LAM m #2* DUP
            LAM d SWAP #2- NTHCOMPDROP ' LAM d1 STO
            LAM d SWAP #1- NTHCOMPDROP ' LAM d2 STO
            LAM d2 LAM y %- LAM z LAM d1 %>= IT %1- %10 %MOD DUPDUP ' LAM x STO
            (p1 has two digits populated - both 1 so)
            (the subscript is 1 more than the one for p2 and p3)
            BINT3 LAM p1 PUTLIST LAM l1 #2- SWAP PUTLIST ' LAM p1 STO
            LAM d1 LAM z %- %1- %10 %MOD DUPDUP ' LAM y STO
            BINT2 LAM p2 PUTLIST LAM l2 #1- SWAP PUTLIST ' LAM p2 STO
            LAM d BINT2 NTHCOMPDROP LAM p1 BINT2 NTHCOMPDROP %-
            LAM y %- LAM ci %- %10 %MOD DUPDUP ' LAM z STO
            BINT2 LAM p3 PUTLIST LAM l3 #1- SWAP PUTLIST ' LAM p3 STO
            LAM p1 BINT2 NTHCOMPDROP LAM y %+ LAM z %+ LAM ci %+ %10 %/ %IP DUP ' LAM ci STO
            BINT2 LAM c PUTLIST ' LAM c STO
            LAM m THREE #>
            IT ::
                LAM m THREE
                DO
                    LAM d LAM m #2* INDEX@ #- NTHCOMPDROP ' LAM d1 STO
                    LAM z LAM d1 %< ITE %1 %0 DUPDUP ' LAM x STO
                    INDEX@ #1+ LAM p1 PUTLIST LAM l1 INDEX@ #- SWAP PUTLIST ' LAM p1 STO
                    LAM d1 LAM z %- %1- %10 %MOD DUPDUP ' LAM y STO
                    INDEX@ LAM p2 PUTLIST LAM l2 INDEX@ #- #1+ SWAP PUTLIST ' LAM p2 STO
                    LAM d INDEX@ NTHCOMPDROP LAM p1 INDEX@ NTHCOMPDROP %-
                    LAM y %- LAM ci %- %10 %MOD DUPDUP ' LAM z STO
                    INDEX@ LAM p3 PUTLIST LAM l3 INDEX@ #- #1+ SWAP PUTLIST ' LAM p3 STO
                    LAM p1 INDEX@ NTHCOMPDROP LAM y %+ LAM z %+ LAM ci %+ %10 %/ %IP DUP ' LAM ci STO
                    INDEX@ LAM c PUTLIST ' LAM c STO
                LOOP
            ;
            %0 LAM m #1+ LAM p1 PUTLIST ' LAM p1 STO
            LAM d LAM m NTHCOMPDROP LAM z %- LAM x %- LAM ci %- %10 %MOD DUP ' LAM y STO
            LAM m LAM p2 PUTLIST ' LAM p2 STO
            (Adjust middle digits if carry in m is 0 or 2)
            LAM x LAM y %+ LAM z %+ LAM ci %+ %10 %/ %IP ' LAM ci STO
            LAM ci %0= case ::                (type III.2)
            ;
            LAM ci %2 %= case ::
                LAM p2 LAM m #1- NTHCOMPDROP ' LAM y STO
                LAM p3 LAM m #1- NTHCOMPDROP ' LAM z STO
                LAM y %0<> LAM z %9 %<> ANDcase ::      (type III.3.i)
                    LAM y %1- DUP
                    LAM m #1- LAM p2 PUTLIST LAM m #1+ SWAP PUTLIST ' LAM p2 STO
                    LAM p2 LAM m NTHCOMPDROP %1- LAM m LAM p2 PUTLIST ' LAM p2 STO
                    LAM z %1+ DUP
                    LAM m #1- LAM p3 PUTLIST LAM m SWAP PUTLIST ' LAM p3 STO
                ;
                LAM y %0<> LAM z %9 %= ANDcase ::       (type III.3.ii)
                    %1 LAM m #1+ LAM p1 PUTLIST ' LAM p1 STO
                    LAM y %1- DUP
                    LAM m #1- LAM p2 PUTLIST LAM m #1+ SWAP PUTLIST ' LAM p2 STO
                    %0 DUP LAM m LAM p3 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p3 STO
                ;
                LAM y %0= LAM z %9 %<> ANDcase ::       (type III.3.iii)
                    LAM p1 LAM m NTHCOMPDROP %1- DUP
                    LAM m LAM p1 PUTLIST LAM m #2+ SWAP PUTLIST ' LAM p1 STO
                    %9 DUP LAM p2 LAM m NTHCOMPDROP %1-
                    LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST LAM m #1+ SWAP PUTLIST ' LAM p2 STO
                    LAM z %1+ DUP
                    LAM m #1- LAM p3 PUTLIST LAM m SWAP PUTLIST ' LAM p3 STO
                ;
                (type III.3.iv)
                %1 LAM p1 LAM m NTHCOMPDROP %1- DUP
                LAM m LAM p1 PUTLIST LAM m #2+ SWAP PUTLIST LAM m #1+ SWAP PUTLIST ' LAM p1 STO
                %9 DUP LAM m #1- LAM p2 PUTLIST LAM m #1+ SWAP PUTLIST ' LAM p2 STO
                %0 DUP LAM m #1- LAM p3 PUTLIST LAM m SWAP PUTLIST ' LAM p3 STO
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
