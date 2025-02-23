!NO CODE
!RPL

* Six digit numbers
* Number | DigitList ---> p1 | p2 | p3
::
    CK2&Dispatch
    # 15 :: (number, list)
        { LAM num LAM d }
        BIND
        ::
            LAM d BINT1 NTHCOMPDROP %1 %<>
            case ::
                (six digit numbers other than those beginning with '1')
                (can be solved by Algorithm 2)
                LAM d ID NumType
                { NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM }
                BIND
                4GETLAM 3GETLAM 2GETLAM 1GETLAM ID Algo2
                ABND
            ;
            LAM d INNERCOMP DROP
            { LAM d5 LAM d4 LAM d3 LAM d2 LAM d1 LAM d0 }
            BIND
            (setup local variables)
            LAM d0 LAM d4 %- %1+ %10 %MOD
            LAM d0 LAM d4 %- %2 %+ %10 %MOD
            %0 %0 %0 %0 %0 %0 %0
            { LAM m1 LAM m2 LAM p1 LAM p2 LAM p3
              LAM x LAM y LAM z LAM c
            }
            BIND
            ::
                LAM m1 %0<> LAM m2 %0<> AND
                case ::                 (case i)
                    (x1+y1 = g+d4-1; x1, y1 > 0)
                    %9 LAM d4 %+ %2 %/ %IP ' LAM y STO
                    (x1=[9+d4]/2 + remainder)
                    %9 LAM d4 %+ LAM y %- %10001 %* ' LAM p1 STO
                    (y1=[9+d4]/2)
                    LAM y %10001 %* ' LAM p2 STO
                    (x2+y2=g+d3-1 so x2=9,y2=d3)
                    %9090 LAM p1 %+ ' LAM p1 STO
                    LAM d3 %1010 %* LAM p2 %+ ' LAM p2 STO
                    LAM m1 %101 %* ' LAM p3 STO
                    %9 LAM d4 %+ LAM m1 %+ %10 %/ %IP ' LAM c STO
                    (z2=D[d1-x2-y2-c1])
                    LAM d1 %9 %- LAM d3 %- LAM c %- %10 %MOD ' LAM z STO
                    LAM z %10 %* LAM p3 %+ ' LAM p3 STO
                    (x3+y3=g+d2-c2-z1)
                    LAM c %9 %+ LAM d3 %+ LAM z %+ %10 %/ %IP ' LAM c STO
                    %10 LAM d2 %+ LAM c %- LAM m1 %- ' LAM x STO
                    LAM x %9 %>
                    ITE
                        ::
                            %900 LAM p1 %+ ' LAM p1 STO
                            LAM x %9 %- %100 %* LAM p2 %+ ' LAM p2 STO
                        ;
                        ::
                            LAM x %100 %* LAM p1 %+ ' LAM p1 STO
                        ;
                ;
                LAM m2 %0= LAM d2 %0<> AND
                case ::                (case ii)
                    (x1+y1 = 9+d4; x1,y1 > 0)
                    %9 LAM d4 %+ %2 %/ %IP ' LAM y STO
                    (x1=[9+d4]/2 + remainder)
                    %9 LAM d4 %+ LAM y %- %10001 %* ' LAM p1 STO
                    LAM y %10001 %* ' LAM p2 STO     (y1=[9+d4]/2)
                    (x2+y2=9+d3 so x2=9,y2=d3)
                    %9090 LAM p1 %+ ' LAM p1 STO
                    LAM d3 %1010 %* LAM p2 %+ ' LAM p2 STO
                    %909 ' LAM p3 STO
                    %9 LAM d4 %+ %9 %+ %10 %/ %IP ' LAM c STO
                    LAM d1 %9 %- LAM d3 %- LAM c %- %10 %MOD ' LAM z STO
                    LAM z %10 %* LAM p3 %+ ' LAM p3 STO
                    (x3+y3=g+d2-c2-z1)
                    LAM c %9 %+ LAM d3 %+ LAM z %+ %10 %/ %IP ' LAM c STO
                    %10 LAM d2 %+ LAM c %- %9 %- ' LAM x STO
                    LAM x %9 %>
                    ITE
                        ::
                            %900 LAM p1 %+ ' LAM p1 STO
                            LAM x %9 %- %100 %* LAM p2 %+ ' LAM p2 STO
                        ;
                        ::
                            LAM x %100 %* LAM p1 %+ ' LAM p1 STO
                        ;
                ;
                LAM m2 %0= LAM d2 %0= AND
                case ::               (case iii)
                    LAM d4 %1 %<=
                    case ::                 (case iii.a)
                        LAM d4 %0= ITE %80008 %90009 ' LAM p1 STO
                        %10001 LAM d3 %1010 %* %+ ' LAM p2 STO
                        %9009 ' LAM p3 STO
                        (z2=D[d1-x2-y2-c1])
                        LAM d1 LAM d3 %- %1- %10 %MOD ' LAM z STO
                        LAM z %100 %* LAM z %10 %* %+ LAM p3 %+ ' LAM p3 STO
                        (x3+y3=g-c2-z2)
                        LAM d3 %1+ LAM z %+ %10 %/ %IP ' LAM c STO
                        %10 LAM c %- LAM z %- ' LAM x STO
                        LAM x %9 %>
                        ITE
                            ::
                                %900 LAM p1 %+ ' LAM p1 STO
                                LAM x %9 %- %100 %* LAM p2 %+ ' LAM p2 STO
                            ;
                            ::
                                LAM x %100 %* LAM p1 %+ ' LAM p1 STO
                            ;
                    ;
                    LAM d4 %2 %=
                    case ::                 (case iii.c)
                        %90009 ' LAM p1 STO
                        %20002 LAM d3 %1010 %* %+ ' LAM p2 STO
                        %9009 ' LAM p3 STO
                        (c1==2 by definition)
                        LAM d1 LAM d3 %- %2 %- %10 %MOD ' LAM z STO
                        LAM z %110 %* LAM p3 %+ ' LAM p3 STO
                        (x3+y3=g-c2-z2)
                        %2 LAM d3 %+ LAM z %+ %10 %/ %IP ' LAM c STO
                        LAM c %2 %<>
                        ITE
                            ::
                                %10 LAM c %- LAM z %- ' LAM x STO
                                LAM x %9 %>
                                ITE
                                    ::
                                        %900 LAM p1 %+ ' LAM p1 STO
                                        LAM x %9 %- %100 %* LAM p2 %+ ' LAM p2 STO
                                    ;
                                    ::
                                        LAM x %100 %* LAM p1 %+ ' LAM p1 STO
                                    ;
                            ;
                            ::
                                %128821 ' LAM p1 STO
                                %171 ' LAM p2 STO
                                %8 ' LAM p3 STO
                            ;
                    ;
                    (case iii.d)
                    LAM d3 %1 %- %10 %MOD %1+ LAM d3 %- %10 %/ %IP ' LAM c STO      (c4)
                    %1 LAM c %- ' LAM x STO
                    %100001 LAM x %10010 %* %+ ' LAM p1 STO
                    LAM d4 %1- %10001 %* ' LAM p2 STO
                    %808 ' LAM p3 STO
                    LAM d3 %1- %10 %MOD ' LAM y STO
                    LAM y %1010 %* LAM p2 %+ ' LAM p2 STO
                    LAM d1 LAM d3 %- %1- LAM c %+ %10 %MOD ' LAM z STO
                    LAM z %10* LAM p3 %+ ' LAM p3 STO
                    %2 LAM c %- LAM y %+ LAM z %+ LAM d1 %- %10 %/ %IP ' LAM c STO
                    %2 LAM c %- %100 %* LAM p2 %+ ' LAM p2 STO
                ;
                LAM m1 %0= LAM d3 %0<> AND
                case ::                (case iv)
                    LAM d4 %9 %<>
                    case ::                 (case iv.a)
                        (x1+y1=10+d4; x1,y1 > 0)
                        %10 LAM d4 %+ %2 %/ %IP ' LAM y STO
                        (x1=[10+d4]/2 + remainder)
                        %10 LAM d4 %+ LAM y %- %10001 %* ' LAM p1 STO
                        LAM y %10001 %* ' LAM p2 STO     (y1=[10+d4]/2)
                        (x2+y2=d3-1; x2,y2 >= 0)
                        LAM d3 %1- %1010 %* LAM p1 %+ ' LAM p1 STO
                        %90009 LAM d3 %1- %1010 %* %+ ' LAM p1 STO
                        LAM d4 %1+ %10001 %* ' LAM p2 STO
                        %909 ' LAM p3 STO
                        %19 LAM d4 %+ %10 %/ %IP ' LAM c STO
                        LAM d1 LAM d3 %- %1+ LAM c %- %10 %MOD ' LAM z STO
                        LAM z %10 %* LAM p3 %+ ' LAM p3 STO
                        LAM c LAM d3 %+ %1- LAM z %+ %10 %/ %IP ' LAM c STO
                        LAM d2 %1+ LAM c %- ' LAM x STO
                        LAM x %9 %>
                        ITE
                            ::
                                %900 LAM p1 %+ ' LAM p1 STO
                                LAM x %9 %- %100 %* LAM p2 %+ ' LAM p2 STO
                            ;
                            ::
                                LAM x %100 %* LAM p1 %+ ' LAM p1 STO
                            ;
                    ;
                    0 0 0 0
                    { LAM c1 LAM c2 LAM c3 LAM mu } (temp vars)
                    BIND
                    %0 ' LAM y STO
                    BEGIN
                        LAM y %1+ ' LAM y STO
                        LAM d1 %3 %- LAM y %- %10 %MOD %8 %<
                    UNTIL
                    LAM d3 LAM y %- %10 %MOD ' LAM x STO
                    %3 LAM y %+ LAM d1 %3 %- LAM y %- %10 %MOD %+ LAM d1 %- %10 %/ %IP ' LAM c1 STO
                    LAM d2 LAM x %- %1- LAM c1 %- %10 %MOD LAM x %+ LAM c1 %+ %1+ LAM d2 %- %10 %/ %IP ' LAM c2 STO
                    LAM c2 %1 %>
                    IT ::
                        %1 ' LAM mu STO
                        %1 ' LAM c2 STO
                        %9 ' LAM x STO
                    ;
                    LAM x LAM y %+ LAM d3 %- %10 %/ %IP ' LAM c3 STO
                    %100001 %3 LAM c3 %- %10010 %* %+ LAM x LAM mu %- %1100 %* %+ ' LAM p1 STO
                    %60006 LAM y LAM c2 %- LAM mu %+ %1010 %* %+
                        LAM d2 LAM x %- %1- LAM c1 %- LAM mu %+ %10 %MOD %100 %* %+ ' LAM p2 STO
                    LAM d1 %3 %- LAM y %- %10 %MOD LAM c2 %+ LAM mu %- LAM c3 %+ %10 %*
                        %101 %+ ' LAM p3 STO
                    ABND
                ;
                LAM m1 %0= LAM d3 %0= AND
                case ::               (case v)
                    LAM d4 %0=
                    case ::                 (case v.a)
                        LAM d2 %0<>
                        case ::
                            %100001 ' LAM p1 STO
                            LAM num %100001 %- FPTR2 ^R>Z ID Palin
                            DROP
                            ' LAM p3 STO
                            ' LAM p2 STO
                        ;
                        LAM d2 %0= LAM d1 %0<> AND
                        LAM d1 %9 %<> AND
                        case ::
                            %100001 ' LAM p1 STO
                            LAM num %100001 %- FPTR2 ^R>Z ID Palin
                            DROP
                            ' LAM p3 STO
                            ' LAM p2 STO
                        ;
                        LAM d2 %0= LAM d1 %0= AND
                        case ::
                            %100001 ' LAM p1 STO
                            %8 ' LAM p2 STO
                            %0 ' LAM p3 STO
                        ;
                        (d2=0, d1=9)
                        %90109 ' LAM p1 STO
                        %9889 ' LAM p2 STO
                        %101 ' LAM p3 STO
                    ;
                    LAM d4 %1 %=
                    case ::                 (case v.b)
                        LAM d2 %1 %>
                        LAM d2 %1 %= LAM d1 %0<> AND
                        OR
                        case ::
                            %110011 ' LAM p1 STO
                            LAM num %110011 %- FPTR2 ^R>Z ID Palin
                            DROP
                            ' LAM p3 STO
                            ' LAM p2 STO
                        ;
                        LAM d2 %1 %= LAM d1 %0= AND
                        case ::
                            %109901 ' LAM p1 STO
                            %191 ' LAM p2 STO
                            %8 ' LAM p3 STO
                        ;
                        LAM d2 %1 %= LAM d1 %1 %= AND
                        case ::
                            %110011 ' LAM p1 STO
                            %99 ' LAM p2 STO
                            %0 ' LAM p3 STO
                        ;
                        LAM d2 %0= LAM d1 %1 %> AND
                        case ::
                            %110011 ' LAM p1 STO
                            LAM d1 %2 %- %11 %*
                            %11 LAM d1 %-
                            2DUP
                            %< IT SWAP
                            ' LAM p3 STO
                            ' LAM p2 STO
                        ;
                        LAM d2 %0= LAM d1 %1 %= AND
                        case ::
                            %100001 ' LAM p1 STO
                            %10001 ' LAM p2 STO
                            %8 ' LAM p3 STO
                        ;
                        %100001 ' LAM p1 STO
                        %9999 ' LAM p2 STO
                        %0 ' LAM p3 STO
                    ;
                    LAM d4 %2 %=
                    case ::                 (case v.c)
                        LAM d2 %1 %>
                        LAM d2 %1 %= LAM d1 %1 %> AND
                        OR
                        case ::
                            %120021 ' LAM p1 STO
                            LAM num %120021 %- FPTR2 ^R>Z ID Palin
                            DROP
                            ' LAM p3 STO
                            ' LAM p2 STO
                        ;
                        LAM d2 %1 %= LAM d1 %0= AND
                        case ::
                            %119911 ' LAM p1 STO
                            %181 ' LAM p2 STO
                            %9 ' LAM p3 STO
                        ;
                        LAM d2 %1 %= LAM d1 %1 %= AND
                        case ::
                            %119911 ' LAM p1 STO
                            %191 ' LAM p2 STO
                            %9 ' LAM p3 STO
                        ;
                        LAM d2 %0= LAM d1 %2 %> AND
                        case ::
                            %120021 ' LAM p1 STO
                            LAM d1 %3 %<>
                            ITE
                                ::
                                    LAM d1 %3 %- %11 %*
                                    %13 LAM d1 %-
                                    2DUP
                                    %< IT SWAP
                                    ' LAM p3 STO
                                    ' LAM p2 STO
                                ;
                                ::
                                    %9 ' LAM p2 STO
                                    %1 ' LAM p3 STO
                                ;
                        ;
                        LAM d2 %0= LAM d1 %2 %= AND
                        case ::
                            %119911 ' LAM p1 STO
                            %101 ' LAM p2 STO
                            %9 ' LAM p3 STO
                        ;
                        LAM d2 %0= LAM d1 %1 %= AND
                        case ::
                            %100001 ' LAM p1 STO
                            %20002 ' LAM p2 STO
                            %8 ' LAM p3 STO
                        ;
                        %119911 ' LAM p1 STO
                        %88 ' LAM p2 STO
                        %2 ' LAM p3 STO
                    ;
                    LAM d4 %3 %=
                    case ::                 (case v.d)
                        0 0
                        { LAM c1 LAM c2 } (temp vars)
                        BIND
                        0 ' LAM y STO
                        BEGIN
                            LAM y %1+ ' LAM y STO
                            LAM d1 %1- LAM y %- %10 %MOD
                            DUP %0<> SWAP %9 %<> AND
                            AND
                        UNTIL
                        %2 LAM y %+ LAM d1 %1- LAM y %- %10 %MOD %+ LAM d1 %- %10 %/ %IP ' LAM c1 STO
                        %9 LAM y %- LAM d2 LAM y %+ %2 %+ %10 %MOD %+ %9 %+ LAM d2 %- %10 %/ %IP ' LAM c2 STO
                        %100001 %9 LAM y %- LAM c1 %- %1100 %* %+ ' LAM p1 STO
                        %20002 LAM y LAM c2 %- %1+ LAM c1 %+ %1010 %* %+
                            LAM d2 LAM y %+ %2 %+ %10 %MOD %100 %* %+ ' LAM p2 STO
                        LAM d1 %1- LAM y %- %10 %MOD LAM c2 %+ %1- LAM c1 %- %10 %*
                            %909 %+ ' LAM p3 STO
                        ABND
                    ;
                    (case v.e)
                    0 0
                    { LAM c1 LAM c2 }
                    BIND
                    0 ' LAM y STO
                    BEGIN
                        LAM y %1+ ' LAM y STO
                        LAM d1 %1- LAM y %- %10 %MOD
                        DUP %0<> SWAP %9 %<> AND
                        AND
                    UNTIL
                    LAM y %1+ LAM d1 %1- LAM y %- %10 %MOD %+ LAM d1 %- %10 %/ %IP ' LAM c1 STO
                    %11 LAM y %- LAM d2 LAM y %+ %1- %10 %MOD %+ LAM d2 %- %10 %/ %IP ' LAM c2 STO
                    %120021 %10 LAM y %- LAM c1 %- %1100 %* %+ ' LAM p1 STO
                    LAM d4 %3 %- %10001 %* LAM y LAM c2 %- LAM c1 %+ %1010 %* %+
                        LAM d2 LAM y %+ %1- %10 %MOD %100 %* %+ ' LAM p2 STO
                    LAM d1 %2 %- LAM y %- %10 %MOD LAM c2 %+ LAM c1 %- %10 %* %101 %+ ' LAM p3 STO
                    ABND
                ;
            ;
            LAM p1
            LAM p2
            LAM p3
            ABND
            ABND
        ;
        ABND
    ;
;

@
