      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SOLUTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  M                       PIC 9(3)   VALUE 1.
       01  N                       PIC 9(3)   VALUE 1.
       01  K                       PIC 9(3)   VALUE 1.
       01  A                       PIC S9(5)V9(03).
       01  B                       PIC S9(5)V9(03).
       01  AB                      PIC S9(5)V9(03).
      **
       LINKAGE SECTION.
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
       01  MEDIAN                  PIC S9(5)V9(03).
      *
       PROCEDURE DIVISION USING NUM1-ARR-TBL NUM2-ARR-TBL MEDIAN.
       MAIN-PROCEDURE.
           DISPLAY "**************SOLUTION******************"
           MOVE NUM1-ARR-SIZE TO M.
           MOVE NUM2-ARR-SIZE TO N.
      *****CALL F
           COMPUTE K = (M + N + 1) / 2
           CALL 'F' USING 1 1 K A NUM1-ARR-TBL NUM2-ARR-TBL M N
           DISPLAY "A = [" A "]"
      *    COMPUTE K = (M + N + 2) / 2
      *    CALL 'F' USING 1 1 K B
      *********
           COMPUTE AB = (A + B) / 2.
           MOVE AB TO MEDIAN.
           DISPLAY "**************END-SOLUTION**************"
           GOBACK.
       END PROGRAM SOLUTION.
