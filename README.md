API caso técnico Printer Brasil

versão ruby `3.0.2`
versão rails `6.1.7.6`

## Instalação
- `git clone git@github.com/CaioBal/rails-api-with-auth.git`
- cd rails-api-auth
- bundle install

Caso não funcione direto, utilizar o comando `rails db:seed`

## Banco de Dados
Para fins práticos, foi usado a sqlite3. (DB do bundle de instalação do Rails)

## CORS
CORS está liberado para todas origens de acesso

## Como usar

É necessário fazer uma request de `POST` em `auth/sign_in` com um dos usuários já inseridos na API para conseguir o token de autorização presente no Header da response.
- `body:
{
email: user@user.com
senha: password
} `
- `body:
{
email: user1@user.com
senha: password
}`

Com o token, adicione-o no header de cada request. Ele tem um tempo de expiração curto, caso necessário, gere outro token.

## Requests

A API possui um request básicos de um CRUD, portanto:

- `GET: /api/v1/items`
- `GET: /api/v1/items/{id}`
- `DELETE: /api/v1/items/{id}`

Para os requests de criação, são esperados os campos:
- `body:{
"name": string
"description": string
}`
- `POST: /api/v1/items`
- `PUT: /api/v1/items/{id}`
