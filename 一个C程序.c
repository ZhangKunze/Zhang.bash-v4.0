#include <stdio.h>
#include <unistd.h>
#include <string.h>

int main(){
    char name[9999];
    
    printf("Java or Bedrock?\n");
    sleep(2);
    printf("我说MC\n");
    sleep(2);
    printf("所以呢?\n");
    sleep(2);
    printf("Java还是基岩!\n回答我!\n");
    
    fgets(name, sizeof(name), stdin);
    
    printf("好,你win了\n");
    return 0;
}