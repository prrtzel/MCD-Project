
//---------------------------------------------------
// Menu Display
extern void print_menu();
const char menu_name[] = "Morg Monitor System\n\r\0";
const char menu_distribute[] = "Distribute at your own risk!\n\r\0";
const char menu_version[] = "ver 2.0\n\rType 'help' for a list of commands\r\n\0";
const char help_menu[] = "Morg Monitor System\n\r
'help' -- gives a list of commands\n\r
'1'    -- read memory Ex: 1 00ff00ff\n\r
'2'    -- dump memory Ex: 2 00000000 00001000\n\r
'3'    -- write to memory Ex: 3 00ff0012 32\n\r
'4'    -- read a register Ex: 4 d0\n\r
'5'    -- write to a register Ex: 5 d4 0000ffff
\n\r";

void print_menu() {
    serial_print(&menu_name[0]);
    serial_print(&menu_distribute[0]);
    serial_print(&menu_version[0]);
}

//-------------------------------------------------
// Shell thing
const char shell_pretty_thing[] = "\n\r>>\0";