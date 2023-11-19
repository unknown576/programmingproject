
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>


// These are the tokens
typedef enum {
   WORD,      
   FUNCTION,   
   KEYWORD,  
   SYMBOL,   
   IDENTIFIER, 
   LITERAL,   
   END       
} TokenType;


// Token structure
typedef struct {
    TokenType type;
    int value; // Used for numbers
    char name; // Used for variables
} Token;