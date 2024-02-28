       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  INPUTSTR1               PIC X(1000).
       01  NUM1-ARR-TBL.
           03  NUM1-ARR-SIZE       PIC 9(3)   VALUE 1.
           03  NUM1-TBL.
               05  NUM1-ARR-ELM    PIC S9(5)
                   OCCURS 256 TIMES DEPENDING ON NUM1-ARR-SIZE
                   INDEXED BY NUM1-ARR-IDX.
      *
       01  INPUTSTR2               PIC X(1000).
       01  NUM2-ARR-TBL.
           03  NUM2-ARR-SIZE       PIC 9(3)   VALUE 1.
           03  NUM2-TBL.
               05  NUM2-ARR-ELM    PIC S9(5)
                   OCCURS 256 TIMES DEPENDING ON NUM2-ARR-SIZE
                   INDEXED BY NUM2-ARR-IDX.
      *
       01  RESULT                  PIC S9(5)V9(03).
      *
       PROCEDURE DIVISION.

           DISPLAY "ENTER ARRAY 1: ".
           ACCEPT INPUTSTR1.
           CALL 'PARSE-ARRAY' USING INPUTSTR1 NUM1-ARR-TBL.
      *    DISPLAY "NUM1-TBL: [" NUM1-TBL "]".
      ******
      *    DISPLAY "ENTER ARRAY 2: ".
           ACCEPT INPUTSTR2.
           CALL 'PARSE-ARRAY' USING INPUTSTR2 NUM2-ARR-TBL.
      *    DISPLAY "NUM2-TBL: [" NUM2-TBL "]".
      ******

           DISPLAY "Median: " RESULT.
           STOP RUN.
      ******************
       END PROGRAM MAIN.
