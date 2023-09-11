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
if [ $(id -u) -eq 0 ]; then
    echo 'Não rode como root.'
    exit 2
fi

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
        echo 'Deseja instalar o rf77 em sua PATH, para poder utilizar o programa simplesmente ao rodar "rf77" no terminal?'
        echo 'Se você responder que não quer instalar, poderá usar o rf77 rodando "'$0'"'
        echo 'Responda com "sim" ou "nao" (sem as aspas) e de enter.'
        read rf77INSTALL
        case $rf77INSTALL in
            sim)
                echo instalando...
                sudo cp $0 /usr/bin/rf77
                sudo chmod 755 /usr/bin/rf77
                echo 'Instalado!'
                echo 'O rf77 foi configurado!'
                echo 'Execute com "rf77 [ARQUIVO .f]"'
                ;;
            nao)
                echo Ok!
                echo 'O rf77 foi configurado!'
                echo 'Execute com "'$0' [ARQUIVO .f]"'
                ;;
            *)
                echo 'Responde direito, porra!'
                echo 'O rf77 NÃO foi configurado completamente. Rode com --install mais uma vez.'
                exit 1
        esac
        exit 0
        ;;
    --help)
        echo 'Remote f77'
        echo 'GitHub:  https://github.com/LuNeder/remote-f77'
        echo
        echo 'Uso: '$0' [ARQUIVO .f]'
        echo ' ou: '$0' [OPÇÃO]'
        echo 'Compila um arquivo .f da tua máquina local com o f77 de uma máquina remota e copia o executável para a máquina local.'
        echo
        echo '--help:    mostra esta mensagem'
        echo '--install: configura o programa'
        exit 0
esac

if [ "x$1" == "x" ]; then 
    echo 'Arquivo .f não especificado'
    echo
    $0 --help
    exit 3
fi

rf77USER=`cat ~/.config/remotef77/user`

if [ -e "~/.config/remotef77/passwd" ]; then
    rf77PASSWD=`cat ~/.config/remotef77/passwd`
else
    echo 'Qual a senha para ssh de '$rf77USER'?'
    read rf77PASSWD
fi

