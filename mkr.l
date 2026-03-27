%{

#include <stdbool.h>

  bool loop = false;
  bool looped = false;
%}

%%
int[ \t\n]+main	{ printf("\n#include <sched.h>\n"); ECHO; }
while|for|do 	{
		if (loop)
  		    looped = true;
    		else {
      			looped = false;
    			loop = true;
    			ECHO;
			}
  		}
\{	{	
		ECHO;
	  	if (loop && !looped) {
 	   		printf ("\n\t\tsched_yield();\n");
  			loop = false;
  			looped = false;
		}
	}

.	ECHO;
%%
