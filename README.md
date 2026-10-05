# Colinha Eleitoral

Aplicativo Android **independente** para o eleitor anotar e organizar os números de cada cargo antes de votar, na mesma ordem da urna. Funciona sem internet, não coleta dados e permite compartilhar em texto ou PDF e imprimir em A4.

> **Fase:** Beta · **Versão:** 1.9 (build 10) · **Android 7.0+**
> Site: <https://ramosbiro.github.io/colinha-eleitoral/> · Política de privacidade: <https://ramosbiro.github.io/colinha-eleitoral/privacidade.html>

O app **não** é oficial, não tem vínculo com a Justiça Eleitoral/TSE, partidos ou candidatos, e não simula a urna nem registra voto.

## Recursos
- Várias colinhas, 1º e 2º turno, ordem personalizada, seleção em lote
- Campos de dígitos por cargo com avanço automático, substituição fácil e botão de limpar
- Compartilhar como texto formatado ou PDF (menu nativo do Android)
- Impressão A4 (individual e em lote) pelo gerenciador de impressão
- Backup em arquivo (exportar/importar, mesclar ou substituir) e recuperação automática
- Tela **Sobre** com versão, fase e novidades; atualização interna por APK (distribuição direta)

## Estrutura do projeto
Este repositório contém a **aplicação web** (arquivo único) e os materiais de publicação. O projeto Android/Capacitor que empacota o app fica no repositório irmão [`colinha-eleitoral-android`](https://github.com/ramosbiro/colinha-eleitoral-android).

```
index.html        # o app inteiro (HTML + CSS + JS, sem dependências)
build.sh          # gera o APK/AAB usando o projeto Capacitor (~/colinha-app)
docs/             # site (GitHub Pages) e política de privacidade
loja/             # textos, ícone, gráfico, capturas e checklist da Google Play
CHANGELOG.md
```

## Como compilar
Requisitos: Node 20+, JDK 21, Android SDK (variável `ANDROID_HOME`), o projeto `colinha-eleitoral-android` clonado em `~/colinha-app` e uma keystore de release em `~/.colinha-keystore/` (`key.properties` + `.jks`, **nunca versionados**).

```bash
./build.sh          # APK de distribuição direta (com atualização interna)
./build.sh play     # AAB para a Google Play (sem REQUEST_INSTALL_PACKAGES)
```
Saída em `~/projects/`: `Cola_Eleitoral_Ramos_v<versão>.apk` e `Cola_Eleitoral_Ramos_v<versão>_play.aab`. A versão vem do `build.gradle` do projeto Android (`versionName`/`versionCode`).

## Fluxo de versões
1. Alterar `index.html`.
2. Subir `versionCode` e `versionName` em `colinha-eleitoral-android/android/app/build.gradle` e adicionar a entrada no `CHANGELOG.md` e no array `CHANGELOG` do `index.html`.
3. `./build.sh` (e `./build.sh play` quando for para a loja).
4. Commit, tag `vX.Y` e *release* no GitHub com o APK anexado.

## Privacidade
Nada é coletado, enviado ou compartilhado pelo app. As colinhas ficam no aparelho. Detalhes em [`docs/privacidade.html`](docs/privacidade.html).

## Autor
Leandro Ramos · ramosbiro@gmail.com
