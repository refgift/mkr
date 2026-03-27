%{

#include <stdbool.h>

%}

%%
int[ \t\n]+main	{ printf("\n#include <sched.h>\n"); ECHO; }

while[ \t\n]*\(+.+\)+[ \t\n]*\{		{
 					ECHO;
 	   				printf ("\n\t\tsched_yield();\n");   
					}
for[ \t\n]*\(+.+\)+[ \t\n]*\{		{
 					ECHO;
 	   				printf ("\n\t\tsched_yield();\n");   
					}
do[ \t\n]*\{ 	{
 			ECHO; 	  
 			printf ("\n\t\tsched_yield();\n");   
		}
.	ECHO;
%%
