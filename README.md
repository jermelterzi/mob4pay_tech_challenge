# Mob4Pay Tech Challenge

Este repositório contém um aplicativo Flutter desenvolvido como parte de um desafio técnico para a Mob4Pay. O objetivo é criar um aplicativo que consuma uma API para exibir uma lista de clientes e seus detalhes.

## Funcionalidades

- **Splash Screen**: Tela inicial exibida ao iniciar o aplicativo, contendo uma imagem.
- **Lista de Clientes**: Exibição de uma lista rolável de clientes com ID, Nome e Estado.
- **Detalhes do Cliente**: Ao selecionar um cliente, é exibida uma tela com informações detalhadas adicionais.

## Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado.
- Editor de código de sua preferência configurado para desenvolvimento Flutter (VSCode, Android Studio, etc.).

## Como Executar o Projeto

1. **Clone o repositório ou baixe o código**:

   ```bash
   git clone https://github.com/seu-usuario/mob4pay-tech-challenge.git
   ```

   Para baixar basta clicar [aqui](https://drive.google.com/file/d/1kykGX9Y4zkWkhkiEhKiDA59qeuQGlgJ7/view?usp=share_link).

2. **Navegue até o diretório do projeto**:

   ```bash
   cd mob4pay-tech-challenge
   ```

3. **Instale as dependências**:

   ```bash
   flutter pub get
   ```

4. **Execute o aplicativo**:

   - Em um dispositivo físico:

     Certifique-se de que a depuração USB está ativada e o dispositivo está conectado ao computador. Execute:

     ```bash
     flutter run
     ```

   - Em um emulador:

     Inicie o emulador e execute:

     ```bash
     flutter run
     ```

   Para mais detalhes sobre como executar o aplicativo em dispositivos físicos ou emuladores, consulte este [artigo da Alura](https://www.alura.com.br/artigos/como-integrar-rodar-o-flutter-no-vscode).

## Regras de Arquitetura

Antes de implementar novas funcionalidades, alguns pontos devem ser validados:

- O projeto deve ter uma cobertura de testes mínima de 70%.
- Cada camada é organizada dentro de uma pasta e possui sua determinada resposabilidade.
- Na camada de domain deve estar contidas a implementação das entidades e casos de uso listados abaixo.
- Na camada de data deve estar contidas as seguites classe:
        - Services e DataSources: Classes responsáveis por encapsular as bibliotecas utilizadas para se comunicar com fatores externos, sejam eles locais ou remotos
        - Repositories: Classe responsável por realizar o gerenciamento de como obter a informação externa e nela os possíveis erros devem ser tratados
- Na camada de ui deve estar contidas as páginas, widgets e suas respectivas viewmodels. Nesta camada também podem existir services que realizam o encapsulamento de dependências que serão utilizadas na tela, como por exemplo, a fluttertoast.
- Dentro da pasta de config estão as classes necessárias para a configuração do projeto com a gerência de dependências e gerenciamento de rotas, entre outros.
- Não é permitida dependência de classes concretas entre as camadas.
- Pacotes devem ser validados antes de serem incluídos no projeto.

## Entidades

### Customer

Esta entidade é utilizada para representar os clientes que são exibidos no aplicativo.

**Atributos:**

```Dart
    final int id;
    final String name;
    final int age;
    final String email;
    final String address;
    final String city;
    final String state;
```

## Casos de Uso

### Sincronização

Este caso de uso é chamado quando o usuário precisa realizar a sincronização dos clientes salvos. Este caso de uso é utilizado tanto na tela de Splash quando na tela de listagem de clientes.

## Pacotes

Os pacotes utilizados neste projeto e suas respectivas finalidades:

- **auto_route** → Utilizada para gerenciamento das rotas.
- **dio** → Utilizada para realizar as conexões HTTP.
- **equatable** → Utilizada para melhorar a capacidade de comparar objetos.
- **fluttertoast** → Utilizada para exibir avisos de erro ao usuário.
- **get_it** → Utilizada para o gerenciamento e injeção de dependências do projeto.
- **mockito** → Utilizada para gerar as cópias das classes dependentes e utilizá-las durante os testes.
- **path** → Utilizada para obter o caminho da tabela do banco de dados no aparelho do usuário.
- **provider** → Utilizada para disponibilizar instâncias de classes através do contexto.
- **result_dart** → Utilizada para transmitir possíveis erros através das camadas do projeto.
- **retrofit** → Utilizada para gerar um cliente HTTP com integração com o dio.
- **sqflite** → Utilizada para gerenciar o armazenamento interno.
