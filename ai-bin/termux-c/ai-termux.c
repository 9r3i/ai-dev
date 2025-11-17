#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int main(int argc, char* argv[]){
  char spaceA[4] = " \"";
  char spaceB[4] = "\" ";
  char args[65535] = "php /sdcard/9r3i/ai/auto.ai %~dp1 \"-9r3i -php\" ";
  for(int i=1;i<argc;i++){
    strcat(args,spaceA);
    strcat(args,argv[i]);
    strcat(args,spaceB);
  }system(args);
  return 0;
}
