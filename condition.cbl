       IDENTIFICATION DIVISION.
       PROGRAM-ID. IF_ELSE_EXAMPLE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01  A   PIC 9(2) VALUE 20.
           01  B   PIC 9(2) VALUE 20.
           01  C   PIC 9(2) VALUE 30.
       
       PROCEDURE DIVISION.
           IF A + B > C
                DISPLAY 'A + B IS GREATER THAN C'
           ELSE IF A + B = C
                DISPLAY 'A + B IS EQUAL THAN C'
           ELSE
                DISPLAY 'A + B IS LESS THAN C'
           END-IF. *> REMEMBER TO END THE IF STATEMENT WITH END-IF AND A DOT (.)

           IF A > B OR A = B
                DISPLAY 'A IS GREATER THAN OR EQUAL TO B'
           ELSE
                DISPLAY 'A IS LESS THAN B'
           END-IF. *> REMEMBER TO END THE IF STATEMENT WITH END-IF AND A DOT (.)

       STOP RUN.
