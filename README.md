# mkr - Make Robust. 
- Turns a C program into a robust C program.
- Edits with a lexer that changes while, for, do loops to include sched_yield() call.
- edits int main to be prepended with #include <sched.h>
- Based on the robust rule: A yield for every loop.

# Build
- need flex version 2.6.4 at least
- use flex: flex mkr.l
- use C compiler: gcc lex.yy.c -o mkr -lfl
- invoke: ./mkr < input.c
- make it global: cd && mkdir bin && cp mkr/mkr bin

## Example
- In the example I convert a complete application to robust application, using the public domain astrolog.
- In the ~/astrolog a mkdir was used to create robust as ~/astrolog/robust: cd && cd astrolog && mkdir robust
- for i in *.cpp; do mkr <$i >robust/$i; done 
- I noticed the errors, if I had matched on first #include instead of main, it would work better. I had
  to add #include <sched.h> in astrolog.h, and delete the stray insertion in matrix.cpp.
- it compiled successfully. I copied the new astrolog into ~/astrolog and replaced the ~/astrolog/astrolog with ~/astrolog/robust/astrolog
- It runs cooperatively with the system scheduler and I can run it forever, instead a few minutes.
- I proudly set it to "Always on Top" in the right click pulldown menu on it's window frame, like I do for xclock.

