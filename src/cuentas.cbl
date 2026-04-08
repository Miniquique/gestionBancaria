       IDENTIFICATION DIVISION.
       PROGRAM-ID. CREACION-CUENTAS.
       
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
               05 NOMBRE PIC X(100).
           WORKING-STORAGE SECTION.
           01 REGISTRO-CUENTA.
              02 NUMERO-CUENTA    PIC 9(6).
              02 NOMBRE-CLIENTE   PIC X(100).
              02 SALDO            PIC 9(7)V99.
       PROCEDURE DIVISION.
       OPEN EXTEND FICHERO.
           DISPLAY 'cual es el numero de cuenta?(max 6 digitos[123456])'
           ACCEPT NUMERO-CUENTA.
           MOVE NUMERO-CUENTA TO NUMERO.
           WRITE REGISTRO.
           MOVE 'DAVID' TO NOMBRE-CLIENTE.
           DISPLAY 'cual es el NOMBRE DEL CLIENTE?)'
           ACCEPT NOMBRE-CLIENTE.           
           MOVE NOMBRE-CLIENTE TO REGISTRO(1:100).
           WRITE REGISTRO.
           
       CLOSE FICHERO.
       STOP RUN.
       END PROGRAM CREACION-CUENTAS.
