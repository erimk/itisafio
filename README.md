# Itisafio

WIP

## Proposal Problem

Construir uma aplicação que exponha uma api web que valide se uma senha é válida.

Input: Uma senha (string).
Output: Um boolean indicando se a senha é válida.

Considere uma senha sendo válida quando a mesma possuir as seguintes definições:

- Nove ou mais caracteres
- Ao menos 1 dígito
- Ao menos 1 letra minúscula
- Ao menos 1 letra maiúscula
- Ao menos 1 caractere especial
  - Considere como especial os seguintes caracteres: !@#$%^&*()-+
- Não possuir caracteres repetidos dentro do conjunto

Exemplo:  

```c#
IsValid("") // false  
IsValid("aa") // false  
IsValid("ab") // false  
IsValid("AAAbbbCc") // false  
IsValid("AbTp9!foo") // false  
IsValid("AbTp9!foA") // false
IsValid("AbTp9 fok") // false
IsValid("AbTp9!fok") // true
```

> **_Nota:_**  Espaços em branco não devem ser considerados como caracteres válidos.

## Deps for Linux

- `sudo apt update`
- `sudo apt upgrade`
- `sudo apt install -y build-essential libssl-dev zlib1g-dev automake autoconf libncurses5-dev`
- `asdf install`

## In loco Setup

- Install dependencies and create and migrate your database with `mix setup`
- Start Phoenix endpoint with `mix phx.server`
- Run complete tests `mix test`

## Docker

- docker-compose build
- docker-compose run --rm web mix setup
- docker-compose run --rm web mix test
- docker-compose up -d

## Database

  PostgreSQL

  ```text
  username: postgres
  password: postgres
  ```

## Using

 You can use postman, or a similar app, to send json to this API.

### Endpoint

 Verificar senha  (post /api/verify_pass )

  ```json
  {
    "password": "AbTp9!fok"
  }
  ```

## Made by

  Erica M. Kanashiro <https://github.com/erimk>
