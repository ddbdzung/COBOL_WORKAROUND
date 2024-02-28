       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAP-ADD.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  I   PIC 9(03).
      ******
       LINKAGE SECTION.
      ******
       01  MAP-DATA.
           03 MAP-SIZE PIC 9(03).
           03 MAP-TBL OCCURS 256 TIMES DEPENDING ON MAP-SIZE.
               05 KEY-ID        PIC S9(5).
               05 KEY-VALUE     PIC S9(5).
      *******
       01  REC-ADD.
           03 KEY-ID-ADD        PIC S9(5).
           03 KEY-VALUE-ADD     PIC S9(5).
      ******
       PROCEDURE DIVISION USING MAP-DATA REC-ADD.
           ADD-TO-MAP.
               PERFORM VARYING I FROM 1 BY 1 UNTIL I > MAP-SIZE
                   IF KEY-ID(I) = -99999
                       OR KEY-ID(I) = KEY-ID-ADD THEN
      *                DISPLAY "PUT " KEY-ID-ADD " TO POS " I
                       MOVE KEY-ID-ADD TO KEY-ID(I)
                       MOVE KEY-VALUE-ADD TO KEY-VALUE(I)
                       EXIT PERFORM
                   END-IF
               END-PERFORM.
           GOBACK.
       END PROGRAM MAP-ADD.
