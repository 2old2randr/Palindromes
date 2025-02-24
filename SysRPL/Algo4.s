!NO CODE
!RPL

* Algorithm applied to numbers of type B with an even number
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
            LAM d SWAP #3- NTHCOMPDROP ' LAM d1 STO
            LAM d SWAP #2- NTHCOMPDROP ' LAM d2 STO
            LAM d2 LAM y %- LAM z LAM d1 %>= IT %1- %10 %MOD DUPDUP ' LAM x STO
            (p1 has two digits populated - both 1;)
            (so the subscript is 1 more than the one for p2 and p3)
            BINT3 LAM p1 PUTLIST LAM l1 #2- SWAP PUTLIST ' LAM p1 STO
            LAM d1 LAM z %- %1- %10 %MOD DUPDUP ' LAM y STO
            BINT2 LAM p2 PUTLIST LAM l2 #1- SWAP PUTLIST ' LAM p2 STO
            LAM d BINT2 NTHCOMPDROP LAM p1 BINT2 NTHCOMPDROP %-
            LAM y %- LAM ci %- %10 %MOD DUPDUP ' LAM z STO
            BINT2 LAM p3 PUTLIST LAM l3 #1- SWAP PUTLIST ' LAM p3 STO
            LAM p1 BINT2 NTHCOMPDROP LAM y %+ LAM z %+ LAM ci %+ %10 %/ %IP DUP ' LAM ci STO
            BINT2 LAM c PUTLIST ' LAM c STO
            LAM m FOUR #>
            IT ::
                LAM m #1- THREE
                DO
                    LAM d LAM m #2* INDEX@ #- #1- NTHCOMPDROP ' LAM d1 STO
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
            LAM d LAM m NTHCOMPDROP ' LAM d1 STO
            LAM d LAM m #1- NTHCOMPDROP ' LAM d2 STO
            LAM z LAM d1 %< ITE %1 %0 DUP
            LAM m LAM p1 PUTLIST LAM m #1+ SWAP PUTLIST ' LAM p1 STO
            LAM d1 LAM z %- %1- %10 %MOD DUPDUP ' LAM y STO
            LAM m #1- LAM p2 PUTLIST LAM m SWAP PUTLIST ' LAM p2 STO
            LAM d2 LAM p1 LAM m #1- NTHCOMPDROP %- LAM y %- LAM ci %- %10 %MOD DUP ' LAM z STO
            LAM m #1- LAM p3 PUTLIST ' LAM p3 STO

            LAM x LAM y %+ LAM z %+ LAM ci %+ %10 %/ %IP DUP ' LAM ci STO
            LAM m #1- LAM c PUTLIST ' LAM c STO


            LAM p1 LAM m NTHCOMPDROP LAM c LAM m #1- NTHCOMPDROP %+ %0=
            LAM p2 LAM m #1- NTHCOMPDROP %9 %<>
            ANDcase ::                             (type IV.2)
                LAM p3 LAM m #1- NTHCOMPDROP %0<> case ::        (type IV.2.i)
                    LAM p2 LAM m NTHCOMPDROP %1+ DUP
                    LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p2 STO
                    LAM p3 LAM m #1- NTHCOMPDROP %1- LAM m #1- LAM p3 PUTLIST ' LAM p3 STO
                ;
                LAM p2 LAM m #2- NTHCOMPDROP %0<> case ::         (type IV.2.ii)
                    :: (nested secondary to execute common code later)
                        LAM p2 LAM m #1- NTHCOMPDROP %1 %<>
                        LAM p3 LAM m #2- NTHCOMPDROP %9 %<>
                        ANDcase ::                 (type IV.2.ii.a)
                            %1 DUP LAM m #1+ LAM p1 PUTLIST LAM m SWAP PUTLIST ' LAM p1 STO
                            LAM p2 LAM m NTHCOMPDROP %1- DUP
                            LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p2 STO
                            LAM p3 LAM m NTHCOMPDROP %1+ DUP
                            LAM m LAM p3 PUTLIST LAM m #2- SWAP PUTLIST
                            %1 SWAP LAM m #1- SWAP PUTLIST ' LAM p3 STO
                        ;
                        LAM p2 LAM m #1- NTHCOMPDROP %1 %<> case ::       (type IV.2.ii.b)
                            %2 DUP LAM m #1+ LAM p1 PUTLIST LAM m SWAP PUTLIST ' LAM p1 STO
                            LAM p2 LAM m NTHCOMPDROP %2 %- DUP
                            LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p2 STO
                            %0 DUP LAM m LAM p3 PUTLIST LAM m #2- SWAP PUTLIST
                            %3 SWAP LAM m #1- SWAP PUTLIST ' LAM p3 STO
                        ;
                        (type IV.2.ii.c)
                        %1 DUP LAM m #1+ LAM p1 PUTLIST LAM m SWAP PUTLIST ' LAM p1 STO
                        %9 DUP LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p2 STO
                        %0 DUP LAM m LAM p3 PUTLIST LAM m #2- SWAP PUTLIST
                        %3 SWAP LAM m #1- SWAP PUTLIST ' LAM p3 STO
                    ;
                    (common to .a, .b, .c)
                    LAM p2 LAM m #1+ NTHCOMPDROP %1- DUP
                    LAM m #1+ LAM p2 PUTLIST LAM m #2- SWAP PUTLIST ' LAM p2 STO
                ;
                LAM p3 LAM m #1- NTHCOMPDROP %0=
                LAM p2 LAM m #2- NTHCOMPDROP %0=
                ANDcase ::                         (type IV.2.iii)
                    ::
                        LAM p3 LAM m #2- NTHCOMPDROP %9 %<> case ::     (type IV.2.iii.a)
                            %1 DUP LAM m #1+ LAM p1 PUTLIST LAM m SWAP PUTLIST ' LAM p1 STO
                            %9 DUP
                            LAM p2 LAM m NTHCOMPDROP %1- DUP
                            LAM m LAM p2 PUTLIST LAM m #- SWAP PUTLIST
                            LAM m #1+ SWAP PUTLIST LAM m #2- SWAP PUTLIST ' LAM p2 STO
                            LAM p3 LAM m NTHCOMPDROP %1+ DUP
                            LAM m LAM p3 PUTLIST LAM m #2- SWAP PUTLIST
                            %1 SWAP LAM m #1- SWAP PUTLIST ' LAM p3 STO
                        ;
                        LAM p2 LAM m #1- NTHCOMPDROP %1 %<> case ::     (type IV.2.iii.b)
                            %2 DUP LAM m #1+ LAM p1 PUTLIST LAM m SWAP PUTLIST ' LAM p1 STO
                            %9 DUP
                            LAM p2 LAM m NTHCOMPDROP %2- DUP
                            LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST
                            LAM m #1+ SWAP PUTLIST LAM m #2- SWAP PUTLIST ' LAM p2 STO
                            %0 DUP LAM m LAM p3 PUTLIST LAM m #2- SWAP PUTLIST
                            %3 SWAP LAM m #1- SWAP PUTLIST ' LAM p3 STO
                        ;
                        (type IV.2.iii.c)
                        %1 DUP LAM m #1+ LAM p1 PUTLIST LAM m SWAP PUTLIST ' LAM p1 STO
                        %9 FOUR NDUPN DROP
                        LAM m #1+ LAM p2 PUTLIST LAM m SWAP PUTLIST
                        LAM m #1- SWAP PUTLIST LAM m #2- SWAP PUTLIST ' LAM p2 STO
                        %0 DUP LAM m LAM p3 PUTLIST LAM m #2- SWAP PUTLIST
                        %3 SWAP LAM m #1- SWAP PUTLIST ' LAM p3 STO
                    ;
                    (common to .a, .b, .c)
                    LAM p1 LAM m #2+ NTHCOMPDROP %1- DUP
                    LAM m #2+ LAM p1 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p1 STO
                ;
            ;
            LAM p1 LAM m NTHCOMPDROP LAM c LAM m #1- NTHCOMPDROP %+ %0=
            case ::                                                    (type IV.3)
                %1 DUP LAM m #1+ LAM p1 PUTLIST LAM m SWAP PUTLIST ' LAM p1 STO
                %8 DUP
                LAM p2 LAM m #1+ NTHCOMPDROP %1- DUP
                LAM m #1+ LAM p2 PUTLIST LAM m #2- SWAP PUTLIST
                LAM m SWAP PUTLIST LAM m #1- SWAP PUTLIST ' LAM p2 STO
                LAM p3 LAM m NTHCOMPDROP %1+ DUP
                LAM m LAM p3 PUTLIST LAM m #2- SWAP PUTLIST
                %1 SWAP LAM m #1- SWAP PUTLIST ' LAM p3 STO
            ;
            LAM p1 LAM m NTHCOMPDROP LAM c LAM m #1- NTHCOMPDROP %+ %2 %=
            LAM p1 LAM m NTHCOMPDROP %0=
            ANDcase ::                               (type IV.4)
                LAM p3 LAM m #1- NTHCOMPDROP %9 %<> case ::              (type IV.4.i)
                    LAM p2 LAM m NTHCOMPDROP %1- DUP
                    LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p2 STO
                    LAM p3 LAM m #1- NTHCOMPDROP %1+
                    LAM m #1- LAM p3 PUTLIST ' LAM p3 STO
                ;
                LAM p3 LAM m #2- NTHCOMPDROP %9 %<> case ::        (type IV.4.ii)
                    LAM p2 LAM m #2- NTHCOMPDROP %0<>
                    ITE
                    ::                     (type IV.4.ii.a)
                        LAM p2 LAM m #1+ NTHCOMPDROP %1- DUP
                        LAM m #1+ LAM p2 PUTLIST LAM m #2- SWAP PUTLIST ' LAM p2 STO
                    ;
                    ::                      (type IV.4.ii.b)
                        LAM p1 LAM m #1- NTHCOMPDROP %1- DUP
                        LAM m #2+ LAM p1 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p1 STO
                        %9 DUP LAM m #1+ LAM p2 PUTLIST LAM m #2- SWAP PUTLIST ' LAM p2 STO
                    ;
                    (common to .a and .b)
                    %1 DUP LAM m LAM p1 PUTLIST LAM m #1+ SWAP PUTLIST ' LAM p1 STO
                    LAM p2 LAM m NTHCOMPDROP %2- DUP
                    LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p2 STO
                    LAM p3 LAM m NTHCOMPDROP %1+ DUP
                    LAM m LAM p3 PUTLIST LAM m #2- SWAP PUTLIST
                    %1 SWAP LAM m #1- SWAP PUTLIST ' LAM p3 STO
                ;
                (type IV.4.iii)
                LAM p2 LAM m #1- NTHCOMPDROP %7 %<= case ::         (type IV.4.iii.a)
                    LAM p2 LAM m #2- NTHCOMPDROP %9 %<>
                    ITE
                    ::              (type IV.4.iii.a.1)
                        LAM p1 LAM m #2+ NTHCOMPDROP %1- DUP
                        LAM m #2+ LAM p1 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p1 STO
                        LAM p2 LAM m #1+ NTHCOMPDROP %1+ DUP
                        LAM m #1+ LAM p2 PUTLIST LAM m #2- SWAP PUTLIST ' LAM p2 STO
                    ;
                    ::                    (type IV.4.iii.a.2)
                        %0 DUP LAM m #1+ LAM p2 PUTLIST LAM m #2- SWAP PUTLIST ' LAM p2 STO
                    ;
                    (common to .1 and .2)
                    %8 DUP LAM m #1+ LAM p1 PUTLIST LAM m SWAP PUTLIST ' LAM p1 STO
                    LAM p2 LAM m NTHCOMPDROP %2 %+ DUP
                    LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p2 STO
                    %8 DUPDUP LAM m LAM p3 PUTLIST LAM m #1- SWAP PUTLIST
                    LAM m #2- SWAP PUTLIST ' LAM p3 STO
                ;
                (type IV.4.iii.b)
                LAM p2 LAM m #1- NTHCOMPDROP %7 %>
                ITE
                ::                        (type IV.4.iii.b.1)
                    LAM p2 LAM m #1+ NTHCOMPDROP %1- DUP
                    LAM m #1+ LAM p2 PUTLIST LAM m #2- SWAP PUTLIST ' LAM p2 STO
                ;
                ::                      (type IV.4.iii.b.2)
                    LAM p1 LAM m #2+ NTHCOMPDROP %1- DUP
                    LAM m #2+ LAM p1 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p1 STO
                    %9 DUP LAM m #1+ LAM p2 PUTLIST LAM m #2- SWAP PUTLIST ' LAM p2 STO
                ;
                (common to .1 and .2)
                %2 DUP LAM m #1+ LAM p1 PUTLIST LAM m SWAP PUTLIST ' LAM p1 STO
                LAM p2 LAM m NTHCOMPDROP %3 %- DUP
                LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p2 STO
                %0 DUP LAM m LAM p3 PUTLIST LAM m #2- SWAP PUTLIST
                %3 SWAP LAM m #1- SWAP PUTLIST ' LAM p3 STO
            ;
            LAM p1 LAM m NTHCOMPDROP LAM c LAM m #1- NTHCOMPDROP %+ %2 %=
            LAM p1 LAM m NTHCOMPDROP %1 %=
            ANDcase ::                                (type IV.5)
                LAM p3 LAM m #1- NTHCOMPDROP %9 %<>
                LAM p2 LAM m #1- NTHCOMPDROP %0<>
                ANDcase ::                         (type IV.5.i)
                    LAM p2 LAM m NTHCOMPDROP %1- DUP
                    LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p2 STO
                    LAM p3 LAM m #1- NTHCOMPDROP %1+
                    LAM m #1- LAM p3 PUTLIST ' LAM p3 STO
                ;
                LAM p3 LAM m #1- NTHCOMPDROP %9 %<>
                LAM p2 LAM m #1- NTHCOMPDROP %0=
                ANDcase ::                         (type IV.5.ii)
                    %0 DUP LAM m LAM p1 PUTLIST LAM m #1+ SWAP PUTLIST ' LAM p1 STO
                    %9 DUP LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p2 STO
                    LAM p3 LAM m #1- NTHCOMPDROP %1+
                    LAM m #1- LAM p3 PUTLIST ' LAM p3 STO
                ;
                LAM p3 LAM m #1- NTHCOMPDROP %9 %=
                LAM p3 LAM m #2- NTHCOMPDROP %0<>
                ANDcase ::                         (type IV.5.iii)
                    LAM p2 LAM m #2- NTHCOMPDROP %9 %<> case ::      (type IV.5.iii.a)
                        %0 DUP LAM m #1+ LAM p1 PUTLIST LAM m SWAP PUTLIST ' LAM p1 STO
                        LAM p2 LAM m #1+ NTHCOMPDROP %1+ DUP
                        LAM p2 LAM m NTHCOMPDROP %1+ DUP
                        LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST
                        LAM m #1+ SWAP PUTLIST LAM m #2- SWAP PUTLIST ' LAM p2 STO
                        LAM p3 LAM m NTHCOMPDROP %1- DUP
                        LAM m LAM p3 PUTLIST LAM m #2- SWAP PUTLIST
                        %8 SWAP LAM m #1- SWAP PUTLIST ' LAM p3 STO
                    ;
                    LAM p2 LAM m #1- NTHCOMPDROP %1 %> case ::       (type IV.5.iii.b)
                        %2 DUP LAM m #1+ LAM p1 PUTLIST LAM m SWAP PUTLIST ' LAM p1 STO
                        %8 DUP
                        LAM p2 LAM m NTHCOMPDROP %2 %- DUP
                        LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST
                        LAM m #1+ SWAP PUTLIST LAM m #2- SWAP PUTLIST ' LAM p2 STO
                        LAM p3 LAM m NTHCOMPDROP %1+ DUP
                        LAM m LAM p3 PUTLIST LAM m #2- SWAP PUTLIST
                        %1 SWAP LAM m #1- SWAP PUTLIST ' LAM p3 STO
                    ;
                    LAM p2 LAM m #1- NTHCOMPDROP %0= case ::         (type IV.5.iii.c)
                        %1 DUP LAM m #1+ LAM p1 PUTLIST LAM m SWAP PUTLIST ' LAM p1 STO
                        %8 FOUR NDUPN DROP
                        LAM m #1+ LAM p2 PUTLIST LAM m SWAP PUTLIST
                        LAM m #1- SWAP PUTLIST LAM m #2- SWAP PUTLIST ' LAM p2 STO
                        LAM p3 LAM m NTHCOMPDROP %1+ DUP
                        LAM m LAM p3 PUTLIST LAM m #2- SWAP PUTLIST
                        %1 SWAP LAM m #1- SWAP PUTLIST ' LAM p3 STO
                    ;
                    (type IV.5.iii.d)
                    %8 DUP %9 DUP
                    LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST
                    LAM m #1+ SWAP PUTLIST LAM m #2- SWAP PUTLIST
                    ' LAM p2 STO
                    LAM p3 LAM m NTHCOMPDROP %1+ DUP
                    LAM m LAM p3 PUTLIST LAM m #2- SWAP PUTLIST
                    %1 SWAP LAM m #1- SWAP PUTLIST ' LAM p3 STO
                ;
                LAM p3 LAM m #1- NTHCOMPDROP %9 %=
                LAM p3 LAM m #2- NTHCOMPDROP %0= AND
                LAM p2 LAM m #2- NTHCOMPDROP %0<>
                ANDcase ::                          (type IV.5.iv)
                    ::
                        LAM p2 LAM m #1- NTHCOMPDROP %1 %> case ::       (type IV.5.iv.a)
                            %2 DUP LAM m LAM p1 PUTLIST LAM m #1+ SWAP PUTLIST ' LAM p1 STO
                            LAM p2 LAM m NTHCOMPDROP %2 %- DUP
                            LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p2 STO
                        ;
                        LAM p2 LAM m #1- NTHCOMPDROP %0= case ::         (type IV.5.iv.b)
                            %8 DUP LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p2 STO
                        ;
                        (type IV.5.iv.c)
                        %9 DUP LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p2 STO
                    ;
                    (common to .a, .b, .c)
                    LAM p2 LAM m #1+ NTHCOMPDROP %1- DUP
                    LAM m #1+ LAM p2 PUTLIST LAM m #2- SWAP PUTLIST ' LAM p2 STO
                    %1 DUPDUP LAM m LAM p3 PUTLIST LAM m #1- SWAP PUTLIST
                    LAM m #2- SWAP PUTLIST ' LAM p3 STO
                ;
                (type IV.5.v)
                ::
                    LAM p2 LAM m #1- NTHCOMPDROP %1 %> case ::       (type IV.5.v.a)
                        %2 DUP LAM m #1+ LAM p1 PUTLIST LAM m SWAP PUTLIST ' LAM p1 STO
                        %9 DUP
                        LAM p2 LAM m NTHCOMPDROP %2- DUP
                        LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST
                        LAM m #1+ SWAP PUTLIST LAM m #2- SWAP PUTLIST ' LAM p2 STO
                    ;
                    LAM p2 LAM m #1- NTHCOMPDROP %0= case ::        (type IV.5.v.b)
                        %1 DUP LAM m #1+ LAM p1 PUTLIST LAM m SWAP PUTLIST ' LAM p1 STO
                        %8 DUP %9 DUP
                        LAM m #1+ LAM p2 PUTLIST LAM m #2- SWAP PUTLIST
                        LAM m SWAP PUTLIST LAM m #1- SWAP PUTLIST ' LAM p2 STO
                    ;
                    (type IV.5.v.c)
                        %1 DUP LAM m #1+ LAM p1 PUTLIST LAM m SWAP PUTLIST ' LAM p1 STO
                        %9 DUP 2DUP
                        LAM m #1+ LAM p2 PUTLIST LAM m #2- SWAP PUTLIST
                        LAM m SWAP PUTLIST LAM m #1- SWAP PUTLIST ' LAM p2 STO
                ;
                (common to IV.5.v.a, .b, ,c)
                LAM p1 LAM m #2+ NTHCOMPDROP %1- DUP
                LAM m #2+ LAM p1 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p1 STO
                %1 DUPDUP
                LAM m LAM p3 PUTLIST LAM m #1- SWAP PUTLIST
                LAM m #2- SWAP PUTLIST ' LAM p3 STO
            ;
            LAM p1 LAM m NTHCOMPDROP LAM c LAM m #1- NTHCOMPDROP %+ %3 %=
            case ::                                             (type IV.6)
                LAM p2 LAM m NTHCOMPDROP %1- DUP
                LAM m LAM p2 PUTLIST LAM m #1- SWAP PUTLIST ' LAM p2 STO
                %0 LAM m #1- LAM p3 PUTLIST ' LAM p3 STO
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
