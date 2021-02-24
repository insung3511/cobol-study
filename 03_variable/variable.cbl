       identification division.
       program-id. Variable-study.

       data division.
       WORKING-STORAGE SECTION.
           01 person-record.
               05 name     PIC A(20)   VALUE 'InSung Bahk'.
               05 number   PIC A(10)    VALUE '01035110256'.
               05 weight   PIC 9(2)    VALUE '80'.
       
       procedures division.
           display 'your name is ' name.
           display 'and your number is ' number.
           display 'Lastly, your weight is ' weight.

       STOP RUN.