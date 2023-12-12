extern void sprintTest(void);
extern void sprint(char*string);

int main(){
    char string[50] = "hi"; 

    for(int i=0;i<100;i++){
        sprint(string);
    }

    return 9;
}