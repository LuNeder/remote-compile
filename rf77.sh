#!/usr/bin/env sh
  # rf77.sh
  # Copyright 2023 Luana Neder
  #
  # This work may be distributed and/or modified under the
  # conditions of the LaTeX Project Public License, either version 1.3
  # of this license or (at your option) any later version.
  # The latest version of this license is in
  #   http://www.latex-project.org/lppl.txt
  # and version 1.3 or later is part of all distributions of LaTeX
  # version 2005/12/01 or later.
  #
  # This work has the LPPL maintenance status `maintained'.
  #
  # The Current Maintainer of this work is Luana Neder
  #
  # This work consists of the file rf77.sh

# 

case $1 in
    --install)
        echo 'Instalando o Remote f77'
        echo 'Qual o usuário completo do ssh? (Exemplo (se seu num usp for 1234 digite o seguinte e de enter): a1234@basalto.ifsc.usp.br)'
        read rf77USER
        mkdir ~/.config/remotef77
        echo $rf77USER > ~/.config/remotef77/user
        echo 'Deseja salvar a senha do Basalto num arquivo? Se sim, digite a senha que você usa para conectar por ssh agora. Se não quiser, deixe em branco e de enter - nesse caso o programa irá perguntar sua senha toda vez que for rodado.'
        read rf77PASSWD
        if [ "x$rf77PASSWD" != "x" ]; then 
            echo $rf77PASSWD > ~/.config/remotef77/passwd
            echo 'Senha salva'
        fi
        echo 'Deseja instalar o rf77 em sua PATH, para poder utilizar o programa simplesmente ao rodar "rf77"?'
        echo 'Para instalar, tenha certeza que você rodou o rf77 --install como root("sudo '$0 $1'")' 
        echo 'Se você responder que não quer instalar, poderá usar o rf77 rodando "'$0
        echo 'Responda com "sim" ou "nao" (sem as aspas) e de enter.' 

 


esac