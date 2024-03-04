char hello[] = "hello\0";
char* hp = &hello[0];

void sprint(char* str_p) {
    __asm__(" 
        move.l  8(%a7),%a1
        move.b  #14,%d0   
        trap    #15
        rts
                ");
}

//program is not starting at main
extern int __main(){
    sprint(hp);
    return 0;
}