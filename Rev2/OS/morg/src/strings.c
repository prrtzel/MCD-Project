#include "strings.h"
#include "morgio.h"

//---------------------------------------------------
// Menu Display
extern void print_menu();
const char menu_name[] = "Morg Monitor System\n\r\0";
const char menu_distribute[] = "Distribute at your own risk!\n\r\0";
const char menu_version[] = "ver 2.0\n\rType 'help' for a list of commands\r\n\0";

//-------------------------------------------------
// Shell thing
const char shell_pretty_thing[] = "\n\r>>\0";

void print_menu() {
    serial_print(&menu_name[0]);
    serial_print(&menu_distribute[0]);
    serial_print(&menu_version[0]);
}