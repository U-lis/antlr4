# Use visitor to evaluate parse tree with logic

t.expr 에 있는 내용들을 parsing 해보자.  
Expr.g4를 보면 기본적으로 항상 사용하던 grammar 가 있다.  
이를 Lexer 와 Parser 로 나누기 위해 LabeledLexer 를 만들었다.
```shell
antlr4 -no-listener -visitor LabeleedExpr.g4
```
`-visitor` 옵션을 주면 모든 rule 에 대응되는 visitor interface 를 만들어준다.  
이를 이용해 `visit()` 함수로 parse tree 를 순회하며 각각의 경우에 대해 원하는 기능을 추가할 수 있다.  
`LabeledExprBaseVisitor` 를 상속받아 `EvalVisitor` 를 만들고, 이를 `Calc.java` 에서 이용한다.  
`EvalVisitor` 안에서는 각각의 경우에 대해 어떤 행동을 할 지를 정해놓았기 때문에 parse tree 를 순회하는 것만으로도 연산을 처리할 수 있다.
