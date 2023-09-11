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
        echo 'Qual o usuário de ssh? (Exemplo (se seu num usp for 1234): a1234@basalto.ifsc.usp.br)'
        read USER
        mkdir ~/.config
        echo $

esac