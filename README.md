# Setup Docker para projetos Laravel 

Olá! Eu me chamo Marcos, e este é um projeto que criei para facilitar a criação de ambientes de desenvolvimento para projetos Laravel utilizando o Docker. Eu fiz esse projeto com intuito de ajudar todos que estão tendo dificuldades para configurar o ambiente de desenvolvimento com o Docker. Náo esqueça de deixar sua estrela no repositório, isso ajuda muito!

# Instruções de uso

- *SEMPRE QUE FOR UTILIZAR ALGUMA FUNÇÃO DO LARAVEL FAÇA DENTRO DO CONTAINER, EXECUTE O COMANDO "docker-compose exec app bash" PARA ACESSAR O CONTAINER E APÓS ISSO EXECUTE SEUS COMANDOS. Exemplo de comando: php artisan make:controller*
- Para utilizar este projeto, você precisa ter o WSL 2, Docker e o Docker Compose instalados em sua máquina. Para instalar o Docker, siga as instruções do site oficial: https://docs.docker.com/desktop/install/windows-install/
- Altere as variáveis de ambiente no arquivo .env e no arquivo Dockerfile. No Dockerfile você irá alterar apenas o "ARG uid"
- Verifique o arquivo docker-compose.yml, caso ache que falta alguma configuração, fique a vontade para alterar, porém siga com cautela.

# Passo a Passo
Clonando o repositório
```sh
git clone https://github.com/marcosantdm/Setup-Docker-PHP.git
```

Opção 1: Clonando o repositório do Laravel
```sh

git clone https://github.com/laravel/laravel nome-do-projeto
```

Opção 2: Utilizando composer para instalar as dependências do Laravel
```sh
composer create-project laravel/laravel nome-do-projeto
```

Copie os arquivos do setup para o projeto Laravel
```sh
cp -rf Setup-Docker-PHP/* nome-do-projeto/
```

```sh
cd nome-do-projeto
```

Suba os containers
```sh
docker-compose up -d
```

Acesse o container
```sh
docker-compose exec app bash
```

Instale as dependências do projeto
```sh
composer install
```

Gere a chave do projeto
```sh
php artisan key:generate
```

O link para acessar o projeto é: http://localhost:8989

# Considerações finais

Todo esse projeto foi desenvolvido por mim, sinta-se a vontade para utilizar, replicar e modificar da forma que desejar. Caso tenha alguma dúvida, entre em contato comigo pelo meu e-mail: *marcos.antoniodm039@gmail.com*

Pronto! Agora você já pode começar a desenvolver seu projeto Laravel utilizando o Docker! Espero que esse projeto tenha te ajudado, não esqueça de deixar sua estrela no repositório, isso ajuda muito! Obrigado!