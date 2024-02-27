       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOOP.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 COUNTER PIC 9(3) VALUE 1.
           01 IDX PIC 9(3) VALUE 1.

       PROCEDURE DIVISION.
           PERFORM UNTIL COUNTER > 10
               DISPLAY ""
               DISPLAY "HERE: " IDX
               ADD 1 TO IDX
    
               IF COUNTER = 5
                   DISPLAY "I'VE BEEN HERE"
                   ADD 1 TO COUNTER
               ELSE
                   DISPLAY "I'VE BEEN STILL HERE"
                   DISPLAY "COUNTER: " COUNTER
                   ADD 1 TO COUNTER
               END-IF
           END-PERFORM.
           
           STOP RUN.
