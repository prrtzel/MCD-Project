HELLO
    MOVE    #14, D0
    LEA     OUTPUTTEXT, A1
    TRAP    #15

OUTPUTTEXT
    DC.B    'HELLO',$D,$A,0
    
    END     HELLO