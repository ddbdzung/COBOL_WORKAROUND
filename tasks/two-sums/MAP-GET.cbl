       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAP-GET.

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
       01  KEY-ID-SEARCH        PIC S9(5).
       01  FOUND                PIC X(01).
       01  REC-RES.
           03 KEY-ID-RES        PIC S9(5).
           03 KEY-VALUE-RES     PIC S9(5).
      ******
       PROCEDURE DIVISION USING MAP-DATA KEY-ID-SEARCH FOUND REC-RES.
           SEARCH-MAP.
               MOVE 'N' TO FOUND.
               PERFORM VARYING I FROM 1 BY 1 UNTIL I > MAP-SIZE
      *            DISPLAY "[" KEY-ID(I) "] - [" KEY-ID-SEARCH "]"
                   IF KEY-ID(I) = KEY-ID-SEARCH
                   AND KEY-ID(I) NOT = -99999 THEN
                       MOVE KEY-ID(I) TO KEY-ID-RES
                       MOVE KEY-VALUE(I) TO KEY-VALUE-RES
                       MOVE 'Y' TO FOUND
                       EXIT PERFORM
                   END-IF
               END-PERFORM.
           GOBACK.
       END PROGRAM MAP-GET.
