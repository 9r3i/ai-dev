#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int main(int argc, char* argv[]){
  char fname[32]="/9r3i/ai/auto.ai";
  FILE *file;
  if((file=fopen(fname,"r"))==NULL){
    printf("Error: File \"%s\" does not exist.\r\n",fname);
    return 1;
  }fclose(file);
  char spaceA[4]=" \"";
  char spaceB[4]="\" ";
  char boundary[32]=" %~dp1 \"-9r3i -php\" ";
  char args[65535]="php ";
  strcat(args,fname);
  strcat(args,boundary);
  for(int i=1;i<argc;i++){
    strcat(args,spaceA);
    strcat(args,argv[i]);
    strcat(args,spaceB);
  }system(args);
  return 0;
}
