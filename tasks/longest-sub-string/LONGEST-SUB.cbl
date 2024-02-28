       IDENTIFICATION DIVISION.
       PROGRAM-ID. LONGEST-SUB.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  LS-P            PIC X(100).
       01  SS-TBL.
           03 SS           PIC X(01) VALUE LOW-VALUE
           OCCURS 100 TIMES
           INDEXED BY IDX.
       01  C               PIC X(01).
       01  XX              PIC X(01).
      *******
       01  I               PIC 9(05).
       01  J               PIC 9(05).
       01  K               PIC 9(05).
       01  L               PIC 9(05).
       01  M               PIC 9(05).
      *******
       01  ANS             PIC 9(05).
      ******
       01  SEARCH-SET-TBL.
           03 SEARCH-KEY      PIC X(01) VALUE LOW-VALUE.
           03 SEARCH-FOUND    PIC X(01) VALUE 'N'.
       01  REMOVE-KEY         PIC X(01) VALUE LOW-VALUE.
      ********
       LINKAGE SECTION.
       01  LS                           PIC X(100).
       01  LENGTHX                      PIC 9(03).

       PROCEDURE DIVISION USING LS LENGTHX.

      *    UNSTRING LS INTO C DELIMITED BY SIZE
      *    PERFORM VARYING J FROM 1 BY 1 UNTIL J > 128
      *        MOVE SPACE TO SS(J)
      *    END-PERFORM.

           MOVE 1 TO I.
           MOVE 1 TO ANS.
           MOVE LS TO LS-P.

           PERFORM VARYING J FROM 1 BY 1
             UNTIL J >= FUNCTION LENGTH(LS-P) OR LS-P(J:1) = LOW-VALUE
               MOVE LS-P(J:1) TO C
      *        DISPLAY "********************* C = " C
      ****** CHECK C IS CONTAINING IN SET
               MOVE C TO SEARCH-KEY
               PERFORM WITH TEST AFTER UNTIL SEARCH-FOUND = 'N'
      *            DISPLAY "HEREEEEEEEEEEEEEEEEEEEE"
                   MOVE C TO SEARCH-KEY
                   PERFORM IS-CONTAIN-IN-SET
                   IF SEARCH-FOUND = 'Y' THEN
      *                DISPLAY "DO REMOVE " C " IN SS-TBL"
                       MOVE  LS-P(I:1) TO XX
      *                DISPLAY "REMOVE " XX
                       COMPUTE I = I + 1
      *        ****** REMOVE FROM SET
      *                DISPLAY "BEFORE RM [" SS-TBL "]"
                       MOVE XX TO REMOVE-KEY
                       PERFORM REMOVE-IN-SET
      *                DISPLAY "AFTER RM [" SS-TBL "]"
                       MOVE LOW-VALUE TO REMOVE-KEY
                   END-IF
      *            DISPLAY 'SEARCH-FOUND: ' SEARCH-FOUND
               END-PERFORM
      ****** ADD TO SET
               PERFORM ADD-TO-SET
      *        DISPLAY "SET [" SS-TBL "]"
      ******* CALCULATE ANS.
               COMPUTE L = J - I + 1
               IF L > ANS
                   MOVE L TO ANS
               END-IF
           END-PERFORM.

      *    DISPLAY "[" SS-TBL "]"
      *    DISPLAY "ANS: [" ANS "]"

           MOVE ANS TO LENGTHX.
      ********
           GOBACK.
      ********
       REMOVE-IN-SET SECTION.
           PERFORM VARYING K FROM 1 BY 1 UNTIL K > 100
      *        DISPLAY "---> REMOVE KEY " REMOVE-KEY
               IF REMOVE-KEY = SS(K) AND SS(K) NOT = LOW-VALUE THEN
      *            DISPLAY "---> REMOVE " SS(K)
                   MOVE LOW-VALUE TO SS(K)
                   EXIT PERFORM
               END-IF
           END-PERFORM.
      **********
       IS-CONTAIN-IN-SET SECTION.
           MOVE 'N' TO SEARCH-FOUND.
           PERFORM VARYING K FROM 1 BY 1 UNTIL K > 100
               IF SEARCH-KEY = SS(K) AND SS(K) NOT = LOW-VALUE THEN
                   MOVE 'Y' TO SEARCH-FOUND
                   EXIT PERFORM
               END-IF
           END-PERFORM.
      **********
       ADD-TO-SET SECTION.
           PERFORM VARYING K FROM 1 BY 1 UNTIL K > 100
               IF C NOT = SS(K) THEN
                   IF SS(K) = LOW-VALUE THEN
                       MOVE C TO SS(K)
                       EXIT PERFORM
                   ELSE
                       CONTINUE
                   END-IF
               ELSE
                   EXIT PERFORM
               END-IF
           END-PERFORM.
       END PROGRAM LONGEST-SUB.
