       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       *>    DEFINE GLOBAL VARIABLES
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

       PROCEDURE DIVISION.
           
           ACCEPT S.
           ACCEPT P.

           CALL 'IS-MATCH' USING S P.

       STOP RUN.
       