*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:          
    MOVE.L #$01, D2
    MOVE.L #$01, D2
    MOVE.L #$82, D0
    TRAP #15


    SIMHALT             



    END    START 

*~Font name~Courier New~
*~Font size~16~
*~Tab type~1~
*~Tab size~4~
