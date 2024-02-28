       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  INPUT-STR                           PIC X(1000).
       01  NUMBER-ARRAY.
           03  ARRAY-SIZE                      PIC 9(3)   VALUE 1.
           03  ARRAY-TBL.
               05  ARRAY-ELM                   PIC S9(5)
                   OCCURS 256 TIMES DEPENDING ON ARRAY-SIZE
                   INDEXED BY ARRAY-IDX.
       01  RESULT-TBL.
           03 RESULT OCCURS 2 TIMES            PIC 9(5).
       01  TARGET                              PIC S9(05).
      *******
       PROCEDURE DIVISION.
           DISPLAY "Enter input array: ".
           ACCEPT INPUT-STR.
      *    DISPLAY "INPUTED STR: [" INPUT-STR "]".
      ******
           CALL 'PARSE-ARRAY' USING INPUT-STR NUMBER-ARRAY.
      *    DISPLAY "PARSE STR TO ARR: [" ARRAY-TBL "]".
      ******
           DISPLAY "Enter target: ".
           ACCEPT TARGET.
      *    DISPLAY "TARGET: [" TARGET "]".
      ******
           CALL 'TWO-SUM' USING NUMBER-ARRAY TARGET RESULT-TBL.
      ******
           PERFORM CONVERT-TO-BASE-0-IDX.
           DISPLAY '[' RESULT(1) ', ' RESULT(2) ']'.
      ******
           STOP RUN.
       CONVERT-TO-BASE-0-IDX.
           COMPUTE RESULT(1) = RESULT(1) - 1.
           COMPUTE RESULT(2) = RESULT(2) - 1.
