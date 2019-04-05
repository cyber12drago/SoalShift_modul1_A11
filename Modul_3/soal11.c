#include<stdio.h>
#include<string.h>
#include<pthread.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>

pthread_t tid[105];
int counter;
void* cek_factorial(void *arg){
     int i,n;

     counter=0; 
     n= (intptr_t) arg;
     long long hasil=1;
     for(i=1;i<=n;i++){
         hasil=hasil*i;
     }
     counter=1;
    while(counter!=1){
     }
     printf("%d! = %lld\n",n,hasil);
     
}


int main(int argc, char *argv[]){
    int  A[105],i,temp,j,err;
    for(i=1;i<argc;i++){
      A[i]=atoi(argv[i]);
    }
  for(i=1;i<argc;i++){
	printf("%d ",A[i]);
  }
printf("\n");
   
    for(i=1;i<argc;i++){
       for(j=i+1;j<argc;j++){
            if(A[j] < A[j-1]){
                 temp=A[j];
                 A[j]=A[j-1];
                 A[j-1]=temp;
	    }
	}
     }

   for(i=1;i<argc;i++){
		printf("%d ",A[i]);
   }
printf("\n");

    for(i=1;i<argc;i++){
		err=pthread_create(&(tid[i]),NULL,cek_factorial, (void*)(intptr_t) A[i]); //membuat thread
		if(err!=0) //cek error
		{
			
		}
		else
		{
			
		}
      }
      for(i=1;i<argc;i++){
	pthread_join(tid[i],NULL);
      } 

	
}
