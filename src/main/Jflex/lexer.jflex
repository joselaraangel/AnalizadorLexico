import java.util.ArrayList;
import java.util.List;
import java.io.FileReader;
%%
%public
%class Lexer
%standalone

        
%{
            private List<String> tokens = new ArrayList<>();
%}
        

%{
            public List<String> analizar(String archivo){
    FileReader in = null;
    try{
    in = new FileReader(archivo);
    Lexer lexer = new Lexer(in);
    while(!lexer.zzAtEOF){
    lexer.yylex();
                        }
    }catch(Exception ex){
        System.out.println("Error al analizar el archivo.");
        }finally{
                try{
                       in.close();
                   }catch(Exception ex){
                    System.out.println("Error al cerrar el archivo");
                }
           }
                return tokens;
       }
%}
        
%%
[0-9]|"-" [0-9]+|"+" [0-9]+ {tokens.add("INT"); System.out.println("Entero");}
[0-9] "E" [0-9]|[0-9] "e" [0-9]|[0-9] "." [0-9] "e" [0-9]|[0-9] "." [0-9] "E" [0-9] {tokens.add("PTO_FLOT"); System.out.println("Punto flotante");}
"'" [A-Za-z0-9&_]+ "'"|[a-z]+ "_" [a-z0-9]+|[!$&]+ {tokens.add("ATOM"); System.out.println("Atomo");}
"_" [A-Z0-9]+|[A-Z]|"A-Z" [a-z0-9]+ {tokens.add("VAR"); System.out.println("Variable");}
"=="    {tokens.add("=="); System.out.println("Igual");}
[0-9]+ "." [0-9]+|[0-9]+ "." {tokens.add("PTO_FIJO"); System.out.println("Punto fijo");}
">"     {tokens.add(">"); System.out.println("Mayor que");}
"%%"     {tokens.add("%%"); System.out.println("Mod");}
