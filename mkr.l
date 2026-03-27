%{

#include <stdbool.h>

  bool loop = false;
  bool looped = false;
%}

%%
int[ \t\n]+main	{ printf("\n#include <sched.h>\n"); ECHO; }
while|for|do 	{
			if (!loop) loop = true;
    			ECHO;
			
  		}
\{	{	
		ECHO;
	  	if (loop) {
 	   		printf ("\n\t\tsched_yield();\n");
  			loop = false;
		}
	}

.	ECHO;
%%
