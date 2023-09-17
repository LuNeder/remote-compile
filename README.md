# Remote f77
Compila um arquivo .f no servidor do basalto-lef-ifsc com o f77 e copia o resultado de volta para a maquina local, como se tivesse sido compilado localmente

## Dependências
- ssh
- sshpass

No OpenSUSE:
````bash
sudo zypper in sshpass openssh-clients
````

## Instalação
- Instale as dependências
- Baixe o script [aqui](https://github.com/LuNeder/remote-f77/releases/latest/download/rf77.sh)
- Permita a execução do arquivo com chmod 755
- Rode o script com `--install` e siga as instruções na tela. Por exemplo, se o script estiver na sua pasta de downloads:
````bash
chmod 755 ~/Downloads/rf77.sh
~/Downloads/rf77.sh --install
````
- Pronto!

## Uso
````bash
rf77 [ARQUIVO .f]
````
Por exemplo, para compilar um arquivo 'teste.f' que está no diretório atual:
````bash
rf77 ./teste.f
````

## Licença
Este projeto é licenceado sob a [LPPL >=1.3c](https://github.com/LuNeder/remote-f77/blob/strawberry/LICENSE)

##
Agradecimentos especial à galera do GELOS que me ajudou com a sintaxe do sh: Gabriel, Victor, Natan

Este projeto não possui qualquer relação com os desenvolvedores do f2c ou f77.
