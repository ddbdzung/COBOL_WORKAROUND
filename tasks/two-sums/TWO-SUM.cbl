       IDENTIFICATION DIVISION.
       PROGRAM-ID. TWO-SUM.

       DATA DIVISION.
      *******
       WORKING-STORAGE SECTION.
       01  I                   PIC 9(3) VALUE 1.
       01  J                   PIC 9(3) VALUE 1.
       01  X                   PIC S9(5).
       01  Y                   PIC S9(5).
      *******
       01  NUM-IDX-GR.
           03 MAP-SIZE         PIC 9(03).
           03 NUM-MAP      OCCURS 256 DEPENDING ON MAP-SIZE
                   INDEXED BY TEMP-IDX.
               05 NUM-VAL      PIC S9(5) VALUE -99999.
               05 NUM-POST     PIC S9(5) VALUE -99999.
      *******
       01  REC-ADD.
           03 KEY-ID-ADD       PIC S9(5).
           03 KEY-VALUE-ADD    PIC S9(5).
      *******
       01  FOUND               PIC X VALUE 'N'.
       01  REC-RES.
           03 KEY-ID-RES        PIC S9(5) VALUE -99999.
           03 KEY-VALUE-RES     PIC S9(5) VALUE -99999.
      ******
       LINKAGE SECTION.
       01  NUMBER-ARRAY.
           03  ARRAY-SIZE      PIC 9(3)   VALUE 1.
           03  ARRAY-TBL.
               05  ARRAY-ELM   PIC S9(5)
                   OCCURS 999 TIMES DEPENDING ON ARRAY-SIZE
                   INDEXED BY ARRAY-IDX.
       01  TARGET              PIC S9(05).
       01  RESULT-TBL.
           03 RESULT OCCURS 2 TIMES      PIC 9(5).
      ******
       PROCEDURE DIVISION USING NUMBER-ARRAY TARGET RESULT-TBL.
      ******
       PROCESS-NUMS.
           MOVE ARRAY-SIZE TO MAP-SIZE.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > ARRAY-SIZE
               MOVE ARRAY-ELM(I) TO X
               COMPUTE Y = TARGET - X
               CALL 'MAP-GET' USING NUM-IDX-GR
                                    Y
                                    FOUND
                                    REC-RES
               IF FOUND = 'Y' THEN
      *            DISPLAY 'FOUNDDDDDDD ' REC-RES
                   MOVE KEY-VALUE-RES TO RESULT(1)
                   MOVE I TO RESULT(2)
                   EXIT PERFORM
               END-IF
               SET TEMP-IDX TO I
               MOVE X TO KEY-ID-ADD
               MOVE I TO KEY-VALUE-ADD
               CALL 'MAP-ADD' USING NUM-IDX-GR
                                    REC-ADD
           END-PERFORM.
      *    PERFORM DISPLAY-NUM-IDX-GR.
           GOBACK.
      ********
       DISPLAY-NUM-IDX-GR.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > ARRAY-SIZE
               DISPLAY NUM-VAL OF NUM-MAP(I)
                       ":" NUM-POST OF NUM-MAP(I)
           END-PERFORM.


        END PROGRAM TWO-SUM.
