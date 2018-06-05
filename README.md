# Docker_Issabel-BR
### En - Description: ###
- This is a Dockerfile for a building an Issabel Linux with g729 codec, audios PTBR, translations and more features.

### BR - Descrição: ###
- Este é um Dockerfile para a construção de um Issabel, com codec g729, áudios PT-BR, tradução entre outras melhorias.

### Sobre ###
- CentOS 7 [https://store.docker.com/images/centos]
- Inclusão do tema original Elastix
- Chan Dongle já instalado
- Fop2 e RoomX adicionados
- Utilização do Netinstall (Ver Seção Issabel), porém com alterações para o funcionamento dentro do conteiner.
- Inclusão do Path [https://github.com/ibinetwork/IssabelBR]
(Obrigado Rafael Tavares!)
    - Correção da Tradução da Pagina Backup/Restauração
    - Correção da Tradução da Pagina Gravações (download funcionando)
    - Correção da Tradução da Pagina Uso de Canais
    - Patch na Pagina Relatórios de Ligação com Status em Português
    - Patch na Pagina Billing Report para Calcular cadencia brasileira 30/6
    - Instalação do Audio em Português Brasileiro
    - Instalação do Codec g729 Free
    - Correção do patch para Audio em Português no Protocolo IAX
    - Adicionado patch para tratar Hangup Cause - SIP para Ocupado e Numero Inexistente
    - Backup do arquivo original do Relatório de Ligações e do Relatório de Faturamento
    - Tradução do Faturamento
    - Adicionado traduções para módulo Call Center
    - Adicionado patch para Monitoramento da Campanha exibir o nome do Agente e não o numero
    - [Veja lista completa no github oficial.]

## Outras Informações ##
- CentOS 7
- Asterisk 11
- Tamanho total da imagem: 2.35 Gb
- Testado/Compilado em Host Debian 9
- Se colocar em produção, crie um volume para salvar as gravações no HOST (e não perder as gravações quando remover o contêiner):
```
Salvar Gravações: 
-v "$PWD/monitor:/var/spool/asterisk/monitor"
```

## Chan Dongle ##
- Se usar chan dongle, realizar esta tarefa no HOST (não no contêiner):
```
Liberar Acesso às portas TTY
    nano /etc/udev/rules.d/92-dongle.rules
Adicionar: 
    KERNEL=="ttyUSB*", MODE="0666", OWNER="asterisk", GROUP="uucp"
Salvar, Sair, Reiniciar.
```

## Modo de Uso ##
```
docker run --name issabel \
--device=/dev/ttyUSB* --privileged \
-d -t --net=host \
--restart=always renatosiqueira/issabel
```

## Troca de Senha Padrão ##
```
docker exec -it issabel issabel-admin-passwords --cli change 'issabel-4' 'YoUrNeWpAsSw0rD!@#'
```

## Outros Comandos ##
### Recuperando as tabelas ###
```
docker exec -it issabel mysqlcheck --repair --use-frm --all-databases -u root -pissabel-4

docker exec -it issabel mysqlcheck -o -A -u root -pissabel-4
```

# Criação de Novo User - Mysql
```
docker exec -it issabel bash

mysql -u root -pissabel-4
CREATE USER 'newuser'@'%' IDENTIFIED BY 'SenhaDoNovoUser';
GRANT ALL PRIVILEGES ON *.* TO 'newuser'@'%' IDENTIFIED BY 'SenhaDoNovoUser';
FLUSH PRIVILEGES;
exit
exit
```

## ISSABEL ##
Você pode instalar o Issabel a partir de um script diretamente num CentOS mínimo com os seguintes comandos:
```
sudo wget -O - http://repo.issabel.org/issabel4-netinstall.sh | bash
```
Obs: Requer yum install -y wget

Altamente Recomendável executar o Path:
```
wget -O - https://github.com/ibinetwork/IssabelBR/raw/master/patch-issabelbr.sh | bash
```

## Como eu posso ajudar? ##
Ajude-nos a entregar um conteúdo de qualidade. Toda ajuda é bem vinda.

## Autor ##
Renato Siqueira (renatoelysiqueira@gmail.com)
