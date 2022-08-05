PROGRAM example
LOGICAL :: var1, var2,...
!(bloco de execução)

logical_var_name = logical_expr

IF (logical_expr) THEN
  !Declaração 1     !
  !Declaração 2     !Bloco de código
  !...              !
END IF

IF (logical_expr_1) THEN
  !Declaração 1
  !Declaração 2
  !...
ELSE IF (logical_expr_2) THEN 
  !Declaração 1
  !Declaração 2
  !...
ELSE 
  !Declaração 1
  !Declaração 2
  !...
END IF

[name:] IF (logical_expr_1) THEN
  !Declaração 1
  !Declaração 2
  !...
ELSE IF (logical_expr_2) THEN [name]
  !Declaração 1
  !Declaração 2
  !...
ELSE [name]
  !Declaração 1
  !Declaração 2
  !...
END IF [name]


SELECT CASE (case_expr)
CASE (case_selector_1)
  !Declaração
CASE (case_selector_2)
  !Declaração
!...
CASE DEFAULT 
  !Declaração
END SELECT

END PROGRAM