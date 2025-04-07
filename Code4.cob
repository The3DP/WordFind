       IDENTIFICATION DIVISION.
       PROGRAM-ID. WordSearch.
       AUTHOR. OpenAI.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 GRID-SIZE            PIC 9(02) VALUE 10.
       01 WORDS                 PIC X(100) VALUE 'apple,banana,orange,grape'.
       01 GRID.
           05 FILLER OCCURS 100 TIMES.
               10 ROW.
                   05 COL   PIC X(10).
       01 WORD-LIST            PIC X(100).
       01 I                     PIC 9(02).
       01 J                     PIC 9(02).
       01 ROW-START             PIC 9(02).
       01 COL-START             PIC 9(02).
       01 WORD-LENGTH           PIC 9(02).
       01 DIRECTION             PIC X.

       PROCEDURE DIVISION.

       BEGIN.
           PERFORM INITIALIZE-GRID
           PERFORM PLACE-WORDS
           PERFORM FILL-EMPTY-CELLS
           PERFORM PRINT-GRID
           STOP RUN.

       INITIALIZE-GRID.
           MOVE SPACES TO GRID.

       PLACE-WORDS.
           MOVE 'apple,banana,orange,grape' TO WORD-LIST
           UNSTRING WORD-LIST DELIMITED BY ',' INTO WORDS
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 4
               MOVE FUNCTION TRIM(WORDS(I)) TO WORD-LENGTH
               PERFORM PLACE-WORD (WORDS(I), WORD-LENGTH)
           END-PERFORM.

       PLACE-WORD USING WORD-IN WORD-LENGTH-IN.
           MOVE 'N' TO DIRECTION.
           MOVE 0 TO ROW-START.
           MOVE 0 TO COL-START.
           PERFORM UNTIL DIRECTION = 'Y'
               MOVE FUNCTION RANDOM(0, 1) TO DIRECTION
               IF DIRECTION = '0' THEN
                   PERFORM PLACE-HORIZONTAL-WORD
               ELSE
                   PERFORM PLACE-VERTICAL-WORD
               END-IF
           END-PERFORM.

       PLACE-HORIZONTAL-WORD.
           MOVE FUNCTION RANDOM(1, GRID-SIZE) TO ROW-START.
           MOVE FUNCTION RANDOM(1, GRID-SIZE - WORD-LENGTH-IN) TO COL-START.
           PERFORM VARYING J FROM 0 BY 1 UNTIL J = WORD-LENGTH-IN
               IF GRID(ROW-START + J, COL-START) = SPACES
                   MOVE FUNCTION SUBSTRING(WORD-IN, J + 1, 1) TO GRID(ROW-START + J, COL-START)
               END-IF
           END-PERFORM.

       PLACE-VERTICAL-WORD.
           MOVE FUNCTION RANDOM(1, GRID-SIZE - WORD-LENGTH-IN) TO ROW-START.
           MOVE FUNCTION RANDOM(1, GRID-SIZE) TO COL-START.
           PERFORM VARYING J FROM 0 BY 1 UNTIL J = WORD-LENGTH-IN
               IF GRID(ROW-START, COL-START + J) = SPACES
                   MOVE FUNCTION SUBSTRING(WORD-IN, J + 1, 1) TO GRID(ROW-START, COL-START + J)
               END-IF
           END-PERFORM.

       FILL-EMPTY-CELLS.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > GRID-SIZE
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > GRID-SIZE
                   IF GRID(I, J) = SPACES
                       MOVE FUNCTION RANDOM(97, 122) TO GRID(I, J)
                   END-IF
               END-PERFORM
           END-PERFORM.

       PRINT-GRID.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > GRID-SIZE
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > GRID-SIZE
                   DISPLAY GRID(I, J)
               END-PERFORM
           END-PERFORM.
