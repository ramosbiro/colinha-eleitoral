# Histórico de mudanças

Formato inspirado em [Keep a Changelog](https://keepachangelog.com/pt-BR/). Fase atual: **Beta**.

## [1.9] — 2026-10-05 (build 10)
- Textos de privacidade revisados; tela "Sobre" informa o backup automático do Android.
- Materiais de publicação na Google Play (política, textos, ícone, gráfico, capturas) e site do projeto.

## [1.8] — 2026-10-05 (build 9)
- Tela **Sobre o app**: versão, build, fase, canal, pacote, data da build, aparelho, novidades e aviso legal.
- **Atualização interna por APK** (somente distribuição direta): escolher o APK, validar pacote/versão e abrir o instalador.
- Builds por canal: `sideload` (APK) e `play` (AAB, sem permissão de instalar pacotes).

## [1.7] — 2026-10-05 (build 8)
- Compartilhar em **PDF** (A4), gerado no próprio app, além do texto; escolha de formato.

## [1.6] — 2026-10-05 (build 7)
- Compartilhar pelo menu nativo do Android (qualquer aplicativo) com texto formatado.

## [1.5] — 2026-10-05 (build 6)
- Nova folha de impressão A4, individual e em lote; impressão abre em A4 com margens de ~10 mm.

## [1.4] — 2026-10-05 (build 5)
- Impressão pelo gerenciador de impressão do Android (plugin nativo `PrintManager`).
- Correção da impressão em lote.

## [1.3] — 2026-10-05 (build 4)
- Campos de dígitos selecionáveis e editáveis; digitar substitui o número e avança.
- Botão ✕ para limpar cada cargo.

## [1.2] — 2026-10-04 (build 3)
- Recuperação automática das colinhas a partir da cópia no IndexedDB.

## [1.1] — 2026-10-04 (build 2)
- Dados por cargo com identificador estável (migração automática das colinhas antigas).
- Títulos escapados (proteção contra HTML), importação validada (mesclar ou substituir), zoom liberado.
- Cargo renomeado para "Deputado Estadual"; dígitos centralizados.
- Novo `appId` `br.com.ramos.colinha` e assinatura de release própria.

## [1.0] — 2026-10-04 (build 1)
- Primeira versão: colinhas por turno, backup em JSON, tema claro/escuro.
