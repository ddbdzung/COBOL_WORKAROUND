       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOOP.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 COUNTER PIC 9(3) VALUE 1.
           01 IDX PIC 9(3) VALUE 1.

       PROCEDURE DIVISION.
           PERFORM LOOPING UNTIL COUNTER > 10
           STOP RUN.
           
       *> This program will display the value of COUNTER from 1 to 10
       *> using PERFORM UNTIL statement. Like DO WHILE in other languages.
           PERFORM UNTIL COUNTER > 10
                DISPLAY "COUNTER = " COUNTER
                ADD 1 TO COUNTER
           END-PERFORM.

           DISPLAY "1-----------------"

       *> This program will display the value of COUNTER from 1 to 10
       *> using PERFORM VARYING statement. Like FOR in other languages.
           PERFORM VARYING COUNTER FROM 1 BY 1 UNTIL COUNTER > 10
                DISPLAY "COUNTER = " COUNTER
           END-PERFORM.
           
           DISPLAY "2-----------------"
       
       *> This program will display the value of COUNTER from 10 to 1
       *> using PERFORM VARYING statement. Like FOR in other languages.
       *> with a decrement of 1, and using CONTINUE statement.
           PERFORM VARYING COUNTER FROM 10 BY -1 UNTIL COUNTER < 1
                IF COUNTER = 5
                    CONTINUE
                ELSE
                   DISPLAY "COUNTER = " COUNTER
                END-IF
           END-PERFORM.
           STOP RUN.
