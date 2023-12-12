extern void sprintTest(void);
extern void sprint(char*string);

int main(){
    char difStr[50] = "this is a different string";
    char str[20] = "YIPPEE\n\rWOW";
    sprint(str); 
    sprint(difStr);
    return 9;
}

