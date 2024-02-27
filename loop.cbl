       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOOP.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 COUNTER PIC 9(3) VALUE 1.
           01 IDX PIC 9(3) VALUE 1.

       PROCEDURE DIVISION.

       PARA-COUNTER-NOT-EQUAL-TO-FIVE.
           IF COUNTER = 5
              DISPLAY "I'VE BEEN HERE"
              ADD 1 TO COUNTER
           END-IF
           EXIT.

      *> cobol-lint CL002 main-processing
       MAIN-PROCESSING.
           PERFORM UNTIL COUNTER > 10
               *> OTHER LANGUAGES'S 'CONTINUE' STATEMENT EQUIVALENT
               PERFORM PARA-COUNTER-NOT-EQUAL-TO-FIVE 1 TIMES 
               
               DISPLAY "COUNTER = " COUNTER
               ADD 1 TO COUNTER
           END-PERFORM.
           STOP RUN.
       
