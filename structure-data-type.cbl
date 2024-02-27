       IDENTIFICATION DIVISION.
       PROGRAM-ID. StructureDataType.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 Employee-Details.
               05  Employee-Name    PIC X(30).
               05  Employee-ID      PIC 9(5).
               05  Employee-Salary  PIC 9(7)V99.
               05  Employee-Address OCCURS 3 TIMES.
                   10  Address-Line PIC X(50).
       
       PROCEDURE DIVISION.
           DISPLAY 'Hello, World!'.
       STOP RUN.
