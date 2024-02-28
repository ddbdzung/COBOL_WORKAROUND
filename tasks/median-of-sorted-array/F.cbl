      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. F.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  P    PIC S9(5).
       01  L    PIC S9(5).
       01  X   PIC 9(03).
       01  Y   PIC 9(03).
      *
       LINKAGE SECTION.
       01  I PIC 9(03).
       01  J PIC 9(03).
       01  K PIC 9(03).
       01  A PIC S9(5)V9(03).
      *
       01  NUM1-ARR-TBL.
           03  NUM1-ARR-SIZE       PIC 9(3)   VALUE 1.
           03  NUM1-TBL.
               05  NUM1-ARR-ELM    PIC S9(5)
                   OCCURS 256 TIMES DEPENDING ON NUM1-ARR-SIZE
                   INDEXED BY NUM1-ARR-IDX.
      *
       01  NUM2-ARR-TBL.
           03  NUM2-ARR-SIZE       PIC 9(3)   VALUE 1.
           03  NUM2-TBL.
               05  NUM2-ARR-ELM    PIC S9(5)
                   OCCURS 256 TIMES DEPENDING ON NUM2-ARR-SIZE
                   INDEXED BY NUM2-ARR-IDX.
      *
       01  M                       PIC 9(3).
       01  N                       PIC 9(3).
       PROCEDURE DIVISION USING I J K A NUM1-ARR-TBL NUM2-ARR-TBL M N.
           DISPLAY '[ i: ' I ' , j: ' J ' , k: ' K ' ]'.
           IF I >= M THEN
               MOVE NUM1-ARR-ELM(J + K - 1) TO L
           ELSE IF J >= N THEN
               MOVE NUM1-ARR-ELM(I + K - 1) TO L
           ELSE IF K = 1 THEN
               IF NUM1-ARR-ELM(I) < NUM2-ARR-ELM(J)
                   MOVE NUM1-ARR-ELM(I) TO L
               ELSE
                   MOVE NUM2-ARR-ELM(J) TO L
               END-IF
           ELSE
               COMPUTE P = K / 2
               COMPUTE X = I + P - 1
               COMPUTE Y = J + P - 1
               IF X < M AND Y < N THEN
                   IF NUM1-ARR-ELM(X) < NUM2-ARR-ELM(Y)
                       MOVE NUM1-ARR-ELM(X) TO L
                   ELSE
                       MOVE NUM2-ARR-ELM(Y) TO L
                   END-IF
               ELSE
                   MOVE 1 TO L
               END-IF
               IF X < Y THEN
                   DISPLAY "RESCUSE F"
               ELSE
                   DISPLAY "RESCUSE F CASE ELSE"
               END-IF
           END-IF.
           GOBACK.
       END PROGRAM F.
