#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <ctype.h>
#include <wchar.h>

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

typedef struct Token {
   TokenType type;
   wchar_t *value; 
   struct Token *next;
} Token;

Token *create_token(TokenType type, const wchar_t *value) {
   Token *token = (Token *)malloc(sizeof(Token));
   token->type = type;
   token->value = wcsdup(value); 
   token->next = NULL;
   return token;
}

void free_token(Token *token) {
   free(token->value);
   free(token);
}

Token *lexer(const wchar_t *input) {
   Token *tokens = create_token(END, L"");
   Token *current_token = tokens;

   while (*input != L'\0') {
       if (iswspace(*input)) {
           input++;
           continue; // Skip spaces
       }

       if (iswdigit(*input)) {
           // Handle numbers here
           const wchar_t *start = input;
           while (iswdigit(*(++input)));
           wchar_t *value = (wchar_t *)malloc((input - start + 1) * sizeof(wchar_t));
           wcsncpy(value, start, input - start); // Changed to wcsncpy
           value[input - start] = L'\0';
           current_token->next = create_token(LITERAL, value);
           current_token = current_token->next;
           free(value);
           continue;
       }

       if (iswalnum(*input)) {
           // Handle words, functions, keywords here
           const wchar_t *start = input;
           while (iswalnum(*(++input)));
           wchar_t *value = (wchar_t *)malloc((input - start + 1) * sizeof(wchar_t));
           wcsncpy(value, start, input - start); 
           value[input - start] = L'\0';

           TokenType type = FUNCTION; // Default type
           if (wcscmp(value, L"print") == 0 || wcscmp(value, L"calculate") == 0) {
               type = FUNCTION;
           } else { // No special keywords handled here, so treat everything else as words.
               type = WORD;
           }

           current_token->next = create_token(type, value);
           current_token = current_token->next;
           free(value);
           continue;
       }

       if (*input == L'(' || *input == L')' || *input == L',') {
           // Handle symbols here
           wchar_t symbol[2] = {*input, L'\0'};
           current_token->next = create_token(SYMBOL, symbol);
           current_token = current_token->next;
           input++;
           continue;
       }

       input++; // Skip unknown characters
   }
   return tokens;
}

void execute(Token *tokens) {
   Token *current_token = tokens;
   while (current_token->type != END) {
       if (current_token->type == WORD) {
           if (wcscmp(current_token->value, L"print") == 0) {
               printf("Printing: ");
           } else if (wcscmp(current_token->value, L"calculate") == 0) {
               // For simplicity, assume the next token is always a number
               if (current_token->next->type == LITERAL) {
                    wchar_t *endptr;
                    long num = wcstol(current_token->next->value, &endptr, 10);
                    if (*endptr != L'\0') {
                        printf("Error converting string to integer\n");
                    } else {
                        printf("Calculation: %ld\n", num * 2); // Perform some operation
                    }
               }
           }
       } else if (current_token->type == SYMBOL) {
           printf("Symbol: %ls\n", current_token->value);
       } else if (current_token->type == WORD) {
           printf("Word: %ls\n", current_token->value);
       }
       current_token = current_token->next;
   }
}


