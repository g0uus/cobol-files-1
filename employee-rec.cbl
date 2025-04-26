       FD EMPLOYEE
      *    these are all defaults or ignored
           is external
           record contains 65 characters
           block contains 1 records
           label records are standard.
      *    Recording mode is not supported by gcobol
      *    RECORDING MODE IS V.
           01 EMPLOYEE-RECORD.
             03 HDR.
               05 HDR-CHK pic x(11). *> EMPLOYEE-ID for header record
               05 filler pic x(35).
             03 REC redefines HDR.
               05 EMPLOYEE-ID PIC 9(3).
               05 FILLER PIC X(10).
               05 EMPLOYEE_NAME PIC X(6).
               05 FILLER PIC X(9).
               05 EMPLOYEE_AGE PIC 9(2).
               05 FILLER PIC X(3).
               05 EMPLOYEE_GRADE PIC X(1).
               05 FILLER PIC X(6).
               05 EMPLOYEE_SALARY PIC 9(5).