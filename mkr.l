%{

#include <stdbool.h>

%}
OPENPAREN	[[:space:]]*\(+[[:space:]]*
CLOSEPAREN	[[:space:]]*\)+[[:space:]]*
OPENBRACE	[[:space:]]*\{+
%%
int[ \t\n]+main	{ printf("\n#include <sched.h>\n"); ECHO; }

while{OPENPAREN}.+{CLOSEPAREN}{1}{OPENBRACE}{1}	{
						ECHO;
						printf ("\n\t\tsched_yield();\n");   
						}
for{OPENPAREN}+.+{CLOSEPAREN}+{OPENBRACE}{1}	{
 						ECHO;
 	   					printf ("\n\t\tsched_yield();\n");   
						}	
do{OPENBRACE}{1} 	{
 			ECHO; 	  
 			printf ("\n\t\tsched_yield();\n");   
			}
[[:space:]]	ECHO;
.		ECHO;
%%
