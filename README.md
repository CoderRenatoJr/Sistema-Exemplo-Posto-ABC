# Software Posto ABC
 - Software para gerenciamento de Posto de Combustível.

## Tecnologias utilizadas:
 - Delphi 12 Community Edition.
 - Firebird 3.0 (Version 3.0.12).

## Dependência
- FortesReport Community Edition 4.0.1.3.

## Como instalar
### Criação do Banco de Dados:
- Utilize o script create_database.sql, localizado na pasta arquivos_auxiliares, para criar o banco de dados.
- Altere o caminho no comando ```CREATE DATABASE``` conforme o local onde deseja criar o banco.
- Se necessário, ajuste também o parâmetro ```CLIENTELIB```.

### Configuração do INI:
- Na pasta arquivos_auxiliares, edite o arquivo **INI** com o usuário e senha do Firebird.
- Altere o campo **Path** para o caminho onde o banco de dados foi criado.
- Renomeie o arquivo para database.ini e coloque-o na mesma pasta que o executável (EXE).

### Configuração do Firebird Client:
- Coloque o arquivo **fbclient.dll** na mesma pasta do executável (EXE).

## Funcionalidade
- Permite registrar os abastecimentos diários, especificando o tipo de combustível, a bomba utilizada, a quantidade abastecida e o valor pago.
- Permite gerar relatórios diários dos abastecimentos realizados.

## Observações Adicionais
- Esse projeto foi desenvolvido na versão 12 do Delphi Community Edition, por isso utiliza alguns recursos disponíveis apenas a partir dessa versão.
- Ao compilar o projeto, o executável será criado em uma pasta anterior, no mesmo nível da pasta **Fonte**.
