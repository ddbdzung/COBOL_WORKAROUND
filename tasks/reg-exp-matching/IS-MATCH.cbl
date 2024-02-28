       IDENTIFICATION DIVISION.
       PROGRAM-ID. IS-MATCH.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       LINKAGE SECTION.
       *>    SYNC GLOBAL VARIABLES
           01 LEN_OF_S PIC 9(2) VALUE 0.
           01 LEN_OF_P PIC 9(2) VALUE 0.
           01 S    PIC X(16).
           01 P    PIC X(10).
       *>    DEFINE DYNAMIC BOOLEAN ARRAY
           01 ROWS PIC 9(2).
           01 COLSX PIC 9(2).
           01 TEMP-TABLE-DATA PIC 9(1).
           01 DYNAMIC-TABLE.
               05 ROWS-DIMENSION OCCURS 1000 TIMES.
                   10 COLS-DIMENSION OCCURS 1000 TIMES.
                       15 TABLE-DATA PIC X(10).
           01 IDX-I PIC 9(2).
           01 IDX-J PIC 9(2).

       *>    S: STRING TO BE SEARCHED
       *>    P: REGEX PATTERN TO BE SEARCHED FOR
       PROCEDURE DIVISION USING S P.
           COMPUTE LEN_OF_S = FUNCTION LENGTH(FUNCTION TRIM(S TRAILING)).
           COMPUTE LEN_OF_P = FUNCTION LENGTH(FUNCTION TRIM(P TRAILING)).
           
           MOVE 1 TO IDX-I.
           MOVE 1 TO IDX-J.
           MOVE LEN_OF_S TO ROWS.
           MOVE LEN_OF_P TO COLSX.
           PERFORM UNTIL IDX-I > ROWS
               PERFORM UNTIL IDX-J > COLSX
                   MOVE 0 TO TEMP-TABLE-DATA *> EQUIVALENT TO FALSE IN JAVA
                   MOVE TEMP-TABLE-DATA TO TABLE-DATA(IDX-I, IDX-J)
                   ADD 1 TO IDX-J
               END-PERFORM
               ADD 1 TO IDX-I
               MOVE 1 TO IDX-J
           END-PERFORM.
           
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
       