       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARRAY_KNOWN_AS_TABLE.

       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 WS-TABLE.
               05 WS-A OCCURS 10 TIMES.
                   10 WS-C OCCURS 5 TIMES.
                       15 WS-D PIC X(6) VALUES ' POINT'.
           01 IDX-I PIC 9(3).
           01 IDX-J PIC 9(3).
           01 TWO-D-TEMP-STR PIC A(10).

       PROCEDURE DIVISION.
       
       DISPLAY-TWO-DIMENSIONS-ARRAY.
           MOVE 1 TO IDX-I.
           MOVE 1 TO IDX-J.
           PERFORM UNTIL IDX-I > 3
               PERFORM UNTIL IDX-J > 3
                   DISPLAY 'WS-C('IDX-I', 'IDX-J') = ' WS-C(IDX-I, IDX-J)
                   ADD 1 TO IDX-J
               END-PERFORM
               ADD 1 TO IDX-I
               MOVE 1 TO IDX-J
               DISPLAY ''
           END-PERFORM.
           
       MAIN-PROCESSING.
           PERFORM DISPLAY-TWO-DIMENSIONS-ARRAY 1 TIMES.
           STOP RUN.
