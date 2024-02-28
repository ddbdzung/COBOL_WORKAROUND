       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 INPUT-STRING         PIC X(100).
       01 LONGEST-LENGTH       PIC 9(03).
      *******
       PROCEDURE DIVISION.
           DISPLAY "Enter input: ".
           ACCEPT INPUT-STRING.

           CALL 'LONGEST-SUB' USING INPUT-STRING
                                    LONGEST-LENGTH.

           DISPLAY LONGEST-LENGTH.

           STOP RUN.
      *******
       END PROGRAM MAIN.
