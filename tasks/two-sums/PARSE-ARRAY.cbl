       IDENTIFICATION DIVISION.
       PROGRAM-ID. PARSE-ARRAY.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  CNT-DTM                 PIC 9(3)   VALUE 0.
       01  DTM                     PIC X(01)  VALUE ','.

       01  CHAR-POS.
           03 POS-IDX              PIC 9(3) OCCURS 100.

       01  SEARCH-IDX              PIC 9(3) VALUE 1.
       01  STRING-PTR              PIC S9(5).
      *
       LINKAGE SECTION.
       01  INPUTSTR                PIC X(1000).
       01  NUMBER-ARRAY.
           03  ARRAY-SIZE          PIC 9(3)   VALUE 1.
           03  ARRAY-TBL.
               05  ARRAY-ELM       PIC S9(5)
                   OCCURS 256 TIMES DEPENDING ON ARRAY-SIZE
                   INDEXED BY ARRAY-IDX.

       PROCEDURE DIVISION USING INPUTSTR NUMBER-ARRAY.

      *    DISPLAY "Enter elements of the array separated by ,: ".
      *    ACCEPT INPUTSTR.
      *    DISPLAY "[" INPUTSTR "]".

      *** GET TOTAL LENGTH
           INSPECT INPUTSTR TALLYING CNT-DTM FOR ALL DTM.
           COMPUTE CNT-DTM = CNT-DTM + 1.
      *    DISPLAY "LENGH OF ARRAY : " CNT-DTM.

      *** SET SIZE TO DYNAMIC ARRAY
           MOVE CNT-DTM TO ARRAY-SIZE.

      *** MOVE TO LENGTH OF ARRAY
           MOVE 1 TO STRING-PTR.
           PERFORM VARYING SEARCH-IDX FROM 1 BY 1
               UNTIL SEARCH-IDX > ARRAY-SIZE
               UNSTRING INPUTSTR DELIMITED BY ','
               INTO ARRAY-ELM(SEARCH-IDX)
               WITH POINTER STRING-PTR
           END-PERFORM.

      *     DISPLAY "[" ARRAY-TBL "]".

       END PROGRAM PARSE-ARRAY.
