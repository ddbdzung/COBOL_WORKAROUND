       IDENTIFICATION DIVISION.
       PROGRAM-ID. DYNAMIC-TWOD-NUMBER-ARRAY.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 ROWS PIC 9(3).
           01 COLSX PIC 9(3).
           01 TEMP-TABLE-DATA PIC X(10).
           01 DYNAMIC-TABLE.
               05 ROWS-DIMENSION OCCURS 1000 TIMES.
                   10 COLS-DIMENSION OCCURS 1000 TIMES.
                       15 TABLE-DATA PIC X(10).
           01 IDX-I PIC 9(3).
           01 IDX-J PIC 9(3).

       PROCEDURE DIVISION.

      *> cobol-lint CL002 main-processing
       MAIN-PROCESSING.
           DISPLAY 'DYNAMIC TWO DIMENSIONAL ARRAY'.

       DEFINE-DYNAMIC-TWO-D-ARRAY.
           DISPLAY '---DEFINE-DYNAMIC-TWO-D-ARRAY STAGE---'
           DISPLAY 'ENTER NUMBER OF ROWS : '.
           ACCEPT ROWS.

           DISPLAY 'ENTER NUMBER OF COLUMNS : '.
           ACCEPT COLSX.
       
       SET-DATA-TWO-DIMENSION-ARRAY.
           DISPLAY '---SET-DATA-TWO-DIMENSION-ARRAY STAGE---'
           MOVE 1 TO IDX-I.
           MOVE 1 TO IDX-J.
           PERFORM UNTIL IDX-I > ROWS
               PERFORM UNTIL IDX-J > COLSX
                   DISPLAY 'TABLE-DATA(' IDX-I', 'IDX-J') = ' TABLE-DATA(IDX-I, IDX-J)
                   ACCEPT TEMP-TABLE-DATA
                   MOVE TEMP-TABLE-DATA TO TABLE-DATA(IDX-I, IDX-J)
                   ADD 1 TO IDX-J
               END-PERFORM
               ADD 1 TO IDX-I
               MOVE 1 TO IDX-J
           END-PERFORM.
       
       DISPLAY-TWO-DIMENSIONS-ARRAY.
           DISPLAY '---DISPLAY-TWO-DIMENSIONS-ARRAY STAGE---'
           MOVE 1 TO IDX-I.
           MOVE 1 TO IDX-J.
           PERFORM UNTIL IDX-I > ROWS
               PERFORM UNTIL IDX-J > COLSX
                   DISPLAY 'TABLE-DATA(' IDX-I', 'IDX-J') = ' TABLE-DATA(IDX-I, IDX-J)
                   ADD 1 TO IDX-J
               END-PERFORM
               ADD 1 TO IDX-I
               MOVE 1 TO IDX-J
               DISPLAY ' '
           END-PERFORM.

       STOP RUN.
