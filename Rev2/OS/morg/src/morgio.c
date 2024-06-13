// #include "startup.h"
// extern void serial_print(char* str_ptr);



// char* str_ptr_buffer;
// void serial_print(char* str_ptr) {
//     str_ptr_buffer = str_ptr;
// #ifdef SIM
//     __asm__(" 
//         move.l  str_ptr_buffer, %a1
//         move.b  #14, %d0   
//         trap    #15
//     ");
// #endif
// #ifdef HW

// #endif
// }