%{
#include <stdio.h>
#include "lex.yy.h" // Include the header file generated by Flex

extern int yylex();       // Declaration of the lexing function
extern int yyparse();     // Declaration of the parsing function
extern FILE *yyin;        // Declaration of the input file for the lexer

void yyerror(const char *s); // Error handling function
%}

%union {
    int intValue;            // For integer values
    float floatValue;        // For floating-point values
    char charValue;          // For character values

    float* floatPtr;         // For pointer to float
    int* intPtr;             // For pointer to int
    char* charPtr;           // For pointer to char
}


%token PRINT
%token IF
%token IFELSE
%token ELSE
%token WHILE
%token FOR

%token <intValue> INTEGER
%token <floatValue> FLOAT
%token <charValue> CHARACTER

%token <floatPtr> FLOAT_PTR
%token <intPtr> INTEGER_PTR
%token <charPtr> CHARACTER_PTR

%token RETURN
%token DEFAULT
%token INCLUDE
%token NULL

%token <intValue> MODULUS
%token <intValue> FLOOR_DIVISION
%token <floatValue> PLUS
%token <floatValue> MINUS
%token <floatValue> MULTIPLY
%token <floatValue> DIVIDE
%token <floatValue> EXPONENT

%token LEFT_PAREN
%token RIGHT_PAREN
%token COMMA
%token SEMICOLON
%token PERIOD
%token COLON
%token QUESTION_MARK
%token EXCLAMATION_MARK
%token LEFT_BRACKET
%token RIGHT_BRACKET
%token LEFT_BRACE
%token RIGHT_BRACE

%token EQUAL_TO
%token LESS_THAN
%token GREATER_THAN
%token NOT_EQUAL_TO
%token LESS_THAN_OR_EQUAL_TO
%token GREATER_THAN_OR_EQUAL_TO

%token AND
%token OR
%token XOR

%token SINGLE_QUOTE

%token INCREMENT_BY
%token DECREASE_BY
%token DIVIDE_BY
%token MOD_BY

%token BACKSLASH


%%
/* C-like Grammar Rules */

// The entry point of your language. It could be empty or consist of function definitions and declarations
program
    : /* empty */
    | program function_definition
    | program declaration
    ;

// Rule for function definitions 
function_definition
    : type identifier '(' parameters ')' compound_statement
    ;

// Rule for declarations (like variable declarations)
declaration
    : type identifier ';'
    ;

// Rule for different types
type
    : INTEGER
    | FLOAT
    | CHARACTER
    | BOOLEAN
    | FLOAT_PTR
    | INTEGER_PTR
    | CHARACTER_PTR
    ;

// Rule for a statement. This is a placeholder and should include all possible statements in your language
statement
    : expression_statement
    | if_statement
    | while_statement
    | for_statement
    | return_statement
    ;

// Define how an expression statement looks like
expression_statement
    : expression ';'
    ;

// Placeholder for expressions. This needs to be defined according to the expressions in your language
expression
    : identifier
    |
    | type identifier '=' type expression_statement
    | type identifier

    | expression '==' expression { $$ = $1 == $3; }
    | expression '!=' expression { $$ = $1 != $3; }
    | expression '>=' expression { $$ = $1 >= $3; }
    | expression '<=' expression { $$ = $1 <= $3; }
    | expression '>' expression { $$ = $1 > $3; } 
    | expression '<' expression { $$ = $1 < $3; }

    | expression '+=' expression { $$ = $1 += $3; }
    | expression '-=' expression { $$ = $1 -= $3; }
    | expression '/=' expression { $$ = $1 /= $3; }
    | expression '%=' expression { $$ = $1 %= $3; }

    | expression '%' expression { $$ = $1 % $3; } 
    | expression '//' expression { $$ = $1 // $3; }
    | expression '+' expression { $$ = $1 + $3; }
    | expression '-' expression { $$ = $1 - $3; }
    | expression '/' expression { $$ = $1 / $3; }
    | expression '*' expression { $$ = $1 * $3; }
    | expression '**' expression { $$ = $1 * $3; }

    | expression '&&' expression { $$ = $1 && $3; }
    | expression '||' expression { $$ = $1 || $3; }
    | expression '^' expression { $$ = $1 ^ $3; }

    
    ;

// Rule for a compound statement (block of code enclosed in braces)
compound_statement
    : '{' statement_list '}'
    ;

// Rule for a list of statements
statement_list
    : /* empty */
    | statement statement_list
    ;

// Rule for if statements, including if-else
if_statement
    : IF '(' expression ')' compound_statement
    | IF '(' expression ')' compound_statement ELSE compound_statement
    | IF '(' expression ')' compound_statement IFELSE '(' expression ')' compound_statement ELSE compound_statement
    ;

// Rule for while loops
while_statement
    : WHILE '(' expression ')' compound_statement
    ;

// Rule for for loops
for_statement
    : FOR '(' expression_statement expression_statement expression ')' compound_statement
    ;

// Rule for return statements
return_statement
    : RETURN expression ';' { $$ = $2; }
    ;


// Placeholder for identifiers (variable names, function names, etc.)
identifier
    : 
    | 
    | /* Token for identifiers */
    ;

values
    : 
    | 
    | /* Token for values(numbers or strings) */
    ;



parameters
    : /* empty */
    | expression
    | expression ',' parameters
    ;


comparisons
    : AND { $$ = &&}
    | OR
    | XOR
%%

int main() {
    yyparse();
    return 0;
}