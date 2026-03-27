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

