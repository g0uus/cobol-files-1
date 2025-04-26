       FD EMPLOYEE
      *    default of ignores
           record contains 65 characters
           block contains 1 record
           label records are standard
           is external.
      *    Recording mode is not supported!
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