       IDENTIFICATION DIVISION.
       PROGRAM-ID. MOVIMIENTOS-CUENTAS.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FICHERO-IN ASSIGN TO '../data/CUENTAS.dat'
               ORGANIZATION IS SEQUENTIAL.
           SELECT FICHERO-OUT ASSIGN TO '../data/TEMP.dat'
               ORGANIZATION IS SEQUENTIAL.
       DATA DIVISION.
           FILE SECTION.
           FD FICHERO-IN.
           01 REGISTRO-IN.
               05 NUMERO-I PIC 9(6).
               05 NOMBRE-I PIC X(50).
               05 SALDO-I PIC 9(7)V99.
           FD FICHERO-OUT.
           01 REGISTRO-OUT.
               05 NUMERO-O PIC 9(6).
               05 NOMBRE-O PIC X(50).
               05 SALDO-O PIC 9(7)V99.
           WORKING-STORAGE SECTION.
           01 WK-FIN-FICHERO PIC X VALUE 'N'.
           01 WK-PAUSA PIC X.
           01 WK-NUMERO-CUENTA PIC 9(6).
           01 WK-MOVIMIENTO PIC 9(7)V99 VALUE ZERO.
           LINKAGE SECTION.
           01 P-OPCION PIC 9.
       PROCEDURE DIVISION USING P-OPCION.
       PERFORM MODIFICAR-CUENTA.
        GOBACK.
       MODIFICAR-CUENTA.
         MOVE 'N' TO WK-FIN-FICHERO.
         DISPLAY 'INGRESE EL NUMERO DE CUENTA A MODIFICAR'.
         ACCEPT WK-NUMERO-CUENTA.
         OPEN INPUT FICHERO-IN.
         OPEN OUTPUT FICHERO-OUT.
         PERFORM UNTIL WK-FIN-FICHERO = 'S'
              READ FICHERO-IN
                  AT END
                      MOVE 'S' TO WK-FIN-FICHERO
                  NOT AT END
                     IF NUMERO-I = WK-NUMERO-CUENTA
                       DISPLAY 'INGRESE EL MOVIMIENTO'
                       'POSITIVO+|NEGATIVO- '
                       ACCEPT WK-MOVIMIENTO
                       ADD WK-MOVIMIENTO TO SALDO-I
                     ELSE
                       DISPLAY 'CUENTA NO ENCONTRADA'
                     END-IF
                     MOVE REGISTRO-IN TO REGISTRO-OUT
                     WRITE REGISTRO-OUT
              END-READ

            END-PERFORM.
      *PARAPODER EJECUTAR EL SCRIPT HAY QUE DARLE PERMISOS DE EJECUCION
              CALL "SYSTEM" USING "../scripts/COPIAR.sh"
       DISPLAY 'PRESIONE ENTER PARA CONTINUAR...'
       ACCEPT WK-PAUSA.

       CLOSE FICHERO-IN.
       CLOSE FICHERO-OUT.
       END PROGRAM MOVIMIENTOS-CUENTAS.
