       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPLOYEE-DATA.
       author. Graham Hanson.
       installation. My Laptop.
       date-written. 26/04/2025.
       date-compiled.
       security. None.


       ENVIRONMENT DIVISION.
       configuration section.
       source-computer. GrahamLap-01 with debugging mode.
       object-computer. GrahamLap-01.
       special-names.

        decimal-point is comma.  *> Probably dont want this


       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT EMPLOYEE
           ASSIGN TO './Employee.dat'
           ORGANISATION IS LINE SEQUENTIAL
           access mode is sequential.   *> default

       DATA DIVISION.
       FILE SECTION.
      *    Bring in the file definition
       copy employee-rec.

       WORKING-STORAGE SECTION.

           01 filler.
      *      indicates whether we have read the mandatory header record
             10 filler pic x value 'n'.
                88  hdr-found value 'Y'.
                88  hdr-not-found value 'n'.
      *      indicates when we get to End of File
             10 filler PIC X(1) VALUE 'N'.
                88 WS-EOF VALUE 'T'.

           77 WS-REC-COUNT pic 9(4) comp sync value 0.
           77 WS-REC-COUNT-D pic Z(3)9 .
           77 WS-BLANK-COUNT pic 9(3)  comp sync value 0.
           77 WS-BLANK-COUNT-D pic z(3)9 .

       PROCEDURE DIVISION.
      *> cobol-lint CL002 main-procedure
       MAIN-PROCEDURE.
      D    display 'Starting...'
           OPEN INPUT EMPLOYEE
           PERFORM READ-PROCEDURE UNTIL WS-EOF
           CLOSE EMPLOYEE

           perform RUN-STATS-PROCEDURE

      D    display 'Finished.'

           STOP RUN.

       READ-PROCEDURE.
           add 1 to WS-REC-COUNT.
      *    display 'Reading Record - 'WS-REC-COUNT
           READ EMPLOYEE
               AT END set WS-EOF to true
               NOT AT END PERFORM DISPLAY-PROCEDURE
           END-READ.


       DISPLAY-PROCEDURE.
      *     display 'display rec - 'WS-REC-COUNT.

           if HDR-CHK = 'EMPLOYEE-ID' then
      *        display 'Header Record...'
              if hdr-found then
                 set WS-EOF to true
                 display "FATAL: DUPLICATE HEADER RECORD."
                 exit paragraph
              end-if
              set hdr-found to true
              exit paragraph
           else if HDR = space or hdr = low-value then
      *        display 'empty record...'
              add 1 to WS-BLANK-COUNT
              exit paragraph
           else
              if hdr-not-found then
                set WS-EOF to true
                display 'FATAL: Header Record Missing.'
                exit section
              end-if

               DISPLAY 'EMPLOYEE ID IS     : ' EMPLOYEE-ID
               DISPLAY 'EMPLOYEE NAME IS   : ' EMPLOYEE_NAME
               DISPLAY 'EMPLOYEE AGE is    : ' EMPLOYEE_AGE
               DISPLAY 'EMPLOYEE GRADE is  : ' EMPLOYEE_GRADE
               DISPLAY 'EMPLOYEE SALARY IS : £' EMPLOYEE_SALARY

               DISPLAY '-------------------------------------'
           end-if.

       RUN-STATS-PROCEDURE.

           move WS-REC-COUNT to WS-REC-COUNT-D
           DISPLAY 'Processed ' WS-REC-COUNT-D ' records'
           if WS-BLANK-COUNT greater than 0 then
               move WS-BLANK-COUNT to WS-BLANK-COUNT-D
               display '  including ' WS-BLANK-COUNT-D ' blank records'
           end-if
