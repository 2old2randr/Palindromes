!NO CODE
!RPL

* Classify a number to decide which algorithm to apply. Also, construct
* the three palindromic numbers that will sum to the given number with
* one or two (i.e., two or four) digits filled in.
* One Input: List of digits of input number.
* Six Outputs:
*     Level 6: Type of algorithm applicable (A1..A6, B1..B7)
*     Level 5: Special? TRUE/FALSE
*     Level 4: input list reversed (for convenience - used later)
*     Level 3: Candidate palindrome 1 (biggest number)
*     Level 2: Candidate palindrome 2
*     Level 1: Candidate palindrome 3 (smallest number)
::
    CK1&Dispatch
    BINT5 ::
        DUP LENCOMP
        { LAM d LAM n }
        BIND
        (p1..p3 are initially 0-filled lists of the same length as the input)
        %0 LAM n NDUPN {}N
        DUPDUP
        { LAM p1 LAM p2 LAM p3 }
        BIND
        (the digits of interest are saved to avoid repeated list accesses)
        LAM d ONE NTHCOMPDROP
        LAM d TWO NTHCOMPDROP
        LAM d THREE NTHCOMPDROP
        LAM d LAM n NTHCOMPDROP
        { LAM d1 LAM d2 LAM d3 LAM dn }
        BIND
        ' :: (save value in list at given two positions)
            { LAM lst LAM val LAM pos1 LAM pos2 }
            BIND
            LAM val DUP
            (save val at first position)
            LAM pos1 LAM lst PUTLIST
            (and second position)
            LAM pos2 SWAP PUTLIST
            ABND
        ;
        { LAM SaveInList }
        BIND
        ::
            (Classify into types A1..A6, B1..B7 and setup p1, p2, p3)
            LAM d2 %2 %>
            LAM dn LAM d1 %- LAM d2 %- %1+ %10 %MOD %0<>
            AND
            case :: (A1)
                #A1
                LAM p1 LAM d1 BINT1 LAM n LAM SaveInList EVAL ' LAM p1 STO
                LAM p2 LAM d2 %1- BINT2 LAM n LAM SaveInList EVAL ' LAM p2 STO
                LAM p3
                    LAM dn LAM d1 %- LAM d2 %- %1+ %10 %MOD
                    BINT3 LAM n LAM SaveInList EVAL ' LAM p3 STO
            ;
            LAM d2 %2 %>
            LAM dn LAM d1 %- LAM d2 %- %1+ %10 %MOD %0=
            AND
            case :: (A2)
                #A2
                LAM p1 LAM d1 BINT1 LAM n LAM SaveInList EVAL ' LAM p1 STO
                LAM p2 LAM d2 %2 %- BINT2 LAM n LAM SaveInList EVAL ' LAM p2 STO
                LAM p3 %1 BINT3 LAM n LAM SaveInList EVAL ' LAM p3 STO
            ;
            LAM d2 %2 %<=
            LAM d1 %1 %<>
            AND
            LAM dn LAM d1 %- %2 %+ %10 %MOD %0<>
            AND
            case :: (A3)
                #A3
                LAM p1 LAM d1 %1- BINT1 LAM n LAM SaveInList EVAL ' LAM p1 STO
                LAM p2 %9 BINT2 LAM n LAM SaveInList EVAL ' LAM p2 STO
                LAM p3
                    LAM dn LAM d1 %- %2 %+ %10 %MOD
                    BINT3 LAM n LAM SaveInList EVAL ' LAM p3 STO
            ;
            LAM d2 %2 %<=
            LAM d1 %1 %<>
            AND
            LAM dn LAM d1 %- %2 %+ %10 %MOD %0=
            AND
            case :: (A4)
                #A4
                LAM p1 LAM d1 %1- BINT1 LAM n LAM SaveInList EVAL ' LAM p1 STO
                LAM p2 %8 BINT2 LAM n LAM SaveInList EVAL ' LAM p2 STO
                LAM p3 %1 BINT3 LAM n LAM SaveInList EVAL ' LAM p3 STO
            ;
            LAM d1 %1 %=
            LAM d2 %0=
            AND
            LAM d3 %3 %<=
            AND
            LAM dn LAM d3 %- %10 %MOD %0<>
            AND
            case :: (A5)
                #A5
                LAM p1 %9 BINT2 LAM n LAM SaveInList EVAL ' LAM p1 STO
                LAM p2 LAM d3 %1+ BINT3 LAM n LAM SaveInList EVAL ' LAM p2 STO
                LAM p3 LAM dn LAM d3 %- %10 %MOD
                    BINT4 LAM n LAM SaveInList EVAL ' LAM p3 STO
            ;
            LAM d1 %1 %=
            LAM d2 %0=
            AND
            LAM d3 %2 %<=
            AND
            LAM dn LAM d3 %- %10 %MOD %0=
            AND
            case :: (A6)
                #A5
                LAM p1 %9 BINT2 LAM n LAM SaveInList EVAL ' LAM p1 STO
                LAM p2 LAM d3 %1+ BINT3 LAM n LAM SaveInList EVAL ' LAM p2 STO
                LAM p3 LAM dn LAM d3 %- %10 %MOD
                    BINT4 LAM n LAM SaveInList EVAL ' LAM p3 STO
            ;
            LAM d1 %1 %=
            LAM d2 %2 %<=
            AND
            LAM d3 %4 %>=
            AND
            LAM dn LAM d3 %- %10 %MOD %0<>
            AND
            case :: (B1)
                #B1
                LAM p1 %1 BINT1 LAM n LAM SaveInList EVAL ' LAM p1 STO
                LAM p1 LAM d2 BINT2 LAM n #1- LAM SaveInList EVAL ' LAM p1 STO
                LAM p2 LAM d3 %1- BINT3 LAM n LAM SaveInList EVAL ' LAM p2 STO
                LAM p3 LAM dn LAM d3 %- %10 %MOD
                    BINT4 LAM n LAM SaveInList EVAL ' LAM p3 STO
            ;
            LAM d1 %1 %=
            LAM d2 %2 %<=
            AND
            LAM d3 %3 %>=
            AND
            LAM dn LAM d3 %- %10 %MOD %0=
            AND
            case :: (B2)
                #B2
                LAM p1 %1 BINT1 LAM n LAM SaveInList EVAL ' LAM p1 STO
                LAM p1 LAM d2 BINT2 LAM n #1- LAM SaveInList EVAL ' LAM p1 STO
                LAM p2 LAM d3 %2 %- BINT3 LAM n LAM SaveInList EVAL ' LAM p2 STO
                LAM p3 %1 BINT4 LAM n LAM SaveInList EVAL ' LAM p3 STO
            ;
            LAM d1 %1 %=
            LAM d2 %0<>
            AND
            LAM d2 %3 %<
            AND
            LAM d3 %2 %<
            AND
            LAM dn %0=
            AND
            case :: (B3)
                #B3
                LAM p1 %1 BINT1 LAM n LAM SaveInList EVAL ' LAM p1 STO
                LAM p1 LAM d2 %1- BINT2 LAM n #1- LAM SaveInList EVAL ' LAM p1 STO
                LAM p2 %8 BINT3 LAM n LAM SaveInList EVAL ' LAM p2 STO
                LAM p3 %1 BINT4 LAM n LAM SaveInList EVAL ' LAM p3 STO
            ;
            LAM d1 %1 %=
            LAM d2 %0<>
            AND
            LAM d2 %3 %<
            AND
            LAM d3 %1 %>
            AND
            LAM d3 %4 %<
            AND
            LAM dn %0=
            AND
            case :: (B4)
                #B4
                LAM p1 %1 BINT1 LAM n LAM SaveInList EVAL ' LAM p1 STO
                LAM p1 LAM d2 BINT2 LAM n #1- LAM SaveInList EVAL ' LAM p1 STO
                LAM p2 %1 BINT3 LAM n LAM SaveInList EVAL ' LAM p2 STO
                LAM p3 %8 BINT4 LAM n LAM SaveInList EVAL ' LAM p3 STO
            ;
            LAM d1 %1 %=
            LAM d2 %0<>
            AND
            LAM d2 %3 %<
            AND
            LAM d3 %3 %<
            AND
            LAM dn %0<>
            AND
            case :: (B5)
                #B5
                LAM p1 %1 BINT1 LAM n LAM SaveInList EVAL ' LAM p1 STO
                LAM p1 LAM d2 %1- BINT2 LAM n #1- LAM SaveInList EVAL ' LAM p1 STO
                LAM p2 %9 BINT3 LAM n LAM SaveInList EVAL ' LAM p2 STO
                LAM p3 LAM dn BINT4 LAM n LAM SaveInList EVAL ' LAM p3 STO
            ;
            LAM d1 %1 %=
            LAM d2 %0<>
            AND
            LAM d2 %3 %<
            AND
            LAM d3 %3 %=
            AND
            LAM dn %3 %- %10 %MOD %0<>
            AND
            case :: (B6)
                #B6
                LAM p1 %1 BINT1 LAM n LAM SaveInList EVAL ' LAM p1 STO
                LAM p1 LAM d2 BINT2 LAM n #1- LAM SaveInList EVAL ' LAM p1 STO
                LAM p2 %2 BINT3 LAM n LAM SaveInList EVAL ' LAM p2 STO
                LAM p3 LAM dn %3 %- %10 %MOD
                    BINT4 LAM n LAM SaveInList EVAL ' LAM p3 STO
            ;
            LAM d1 %1 %=
            LAM d2 %0<>
            AND
            LAM d2 %3 %<
            AND
            LAM d3 %3 %=
            AND
            LAM dn %3 %=
            AND
            case :: (B7)
                #B7
                LAM p1 %1 BINT1 LAM n LAM SaveInList EVAL ' LAM p1 STO
                LAM p1 LAM d2 BINT2 LAM n #1- LAM SaveInList EVAL ' LAM p1 STO
                LAM p2 %1 BINT3 LAM n LAM SaveInList EVAL ' LAM p2 STO
                LAM p3 %1 BINT4 LAM n LAM SaveInList EVAL ' LAM p3 STO
            ;
        ;

        (stack has type on it; add rest of outputs starting with the 'special' flag)
        (special processing is required if p1 has an even number)
        (of digits and one of the middle positions in the input)
        (is zero)
        LAM p1 ID CmpLst        (remove any leading zeroes)
        DUP LENCOMP SWAP ' LAM p1 STO
        BINT2 #/ SWAP
        #0<>
        ITE
            ::
                DROP (quotient)
                FALSE (not special)
            ;
            ::
                (special if either digit at len/2 is zero)
                DUP
                LAM d SWAP NTHCOMPDROP %0=
                SWAP LAM d SWAP #1+ NTHCOMPDROP %0=
                OR
            ;
        LAM d INNERCOMP reversym {}N (input list reversed)
        LAM p1
        LAM p2 ID CmpLst
        LAM p3 ID CmpLst

        ABND (local fns)
        ABND (d1, d2, d3, dn)
        ABND (p1, p2, p3)
        ABND (input)
    ;
;

@
