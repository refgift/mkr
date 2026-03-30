%{

#include <stdbool.h>

%}
SIMPLEEXP	[[:graph:]]+[ \n\t]*=[ \n\t]*[[:graph:]]+|[[:graph:]]+
COMPLEXEXP	\(+/SIMPLEEXP+/\)+	
EXP		SIMPLEEXP|COMPLEXEXP
OPENPAREN	[[:space:]]*\(+[[:space:]]*
CLOSEPAREN	[[:space:]]*\)+[[:space:]]*
%%
int[ \t\n]+main	{ printf("\n#include <sched.h>\n"); ECHO; }

while{OPENPAREN}+{SIMPLEEXP}{CLOSEPAREN}+\{		{
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
