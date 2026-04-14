       IDENTIFICATION DIVISION.
       PROGRAM-ID. GESTION-BANCARIA.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 WK-SALIR PIC X VALUE 'N'.
           01 WK-OPCION PIC 9 VALUE 0.
       PROCEDURE DIVISION.
           PERFORM UNTIL WK-SALIR = 'S'
                DISPLAY '¿QUE QUIERES HACER?'
                DISPLAY 'GESTION BANCARIA'
                DISPLAY '1. CREAR CUENTA'
                DISPLAY '2. CONSULTAR CUENTA'
                DISPLAY '3. MOVIMIENTO'
                DISPLAY '4. SALIR'
                ACCEPT WK-OPCION
                EVALUATE WK-OPCION
                    WHEN 1
                        DISPLAY 'CREAR CUENTA'
                        CALL "CREAR-CUENTAS" USING WK-OPCION
                    WHEN 2
                        DISPLAY 'CONSULTAR CUENTA'
                        CALL "LEER-CUENTAS" USING WK-OPCION
                    WHEN 3
                        DISPLAY 'MOVIMIENTO'
                    WHEN 4
                        MOVE 'S' TO WK-SALIR
                    WHEN OTHER
                        DISPLAY 'OPCION NO VALIDA'
                END-EVALUATE
           END-PERFORM.
       STOP RUN.
       END PROGRAM GESTION-BANCARIA.
