       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEER-CUENTAS.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FICHERO ASSIGN TO '../data/CUENTAS.dat'
               ORGANIZATION IS SEQUENTIAL.
       DATA DIVISION.
           FILE SECTION.
           FD FICHERO.
           01 REGISTRO.
               05 NUMERO PIC 9(6). 
               05 NOMBRE PIC X(50).
               05 SALDO PIC 9(7)V99.
           WORKING-STORAGE SECTION.
           01 WK-FIN-FICHERO PIC X VALUE 'N'.
           LINKAGE SECTION.
           01 P-OPCION PIC 9.
       PROCEDURE DIVISION USING P-OPCION.
       PERFORM LEER-CUENTA.
        GOBACK.
       LEER-CUENTA.
         OPEN INPUT FICHERO.
         PERFORM UNTIL WK-FIN-FICHERO = 'S'
              READ FICHERO
                  AT END
                      MOVE 'S' TO WK-FIN-FICHERO
                  NOT AT END
                     DISPLAY REGISTRO
              END-READ
            END-PERFORM.

       CLOSE FICHERO.
       END PROGRAM LEER-CUENTAS.
