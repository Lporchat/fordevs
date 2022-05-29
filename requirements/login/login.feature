Feature: Login
Como um cliente
Quero poder cessar minha conta e me manter logado
Para que eu possa responder mais rápido

Cenário: Credenciais Válidas
Dado que o cliente informou credenciais válidas
Quando solicitar para fazer o Login
Então o sistema deve enviar o usuário para a tela de pesqusas
E mante ro usuário logado

Cenário: Credenciais inválidas
Dado que o cliente informou credenciais inválidas
Quando solicitar para fazer o Login
Então o sistema deve retornar uma mensagem de error