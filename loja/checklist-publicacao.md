# Checklist de publicação — Colinha Eleitoral na Google Play

Status em 05/10/2026: **v1.9 (build 10) em fase Beta**. Itens marcados já estão prontos no repositório.

## Pronto
- [x] App em Capacitor 8 / Android, `targetSdk 36`, `minSdk 24`
- [x] Pacote próprio `br.com.ramos.colinha` (sem "gov")
- [x] Build de release assinado com chave própria (`~/.colinha-keystore`)
- [x] Canal Play separado: `./build.sh play` gera o AAB sem a permissão de instalar pacotes
- [x] Tela "Sobre", versão e fase visíveis no app
- [x] Aviso de que o app é independente e não é oficial
- [x] Ícone 512, gráfico 1024×500, 5 capturas, textos, política de privacidade (rascunho)

## Falta você decidir/fazer
- [ ] **Testar no celular** a v1.9 inteira (ver roteiro abaixo)
- [ ] Criar a conta de desenvolvedor no Google Play Console (taxa única; verifique valor e a verificação de identidade vigentes)
- [ ] Preencher **e-mail e nome** na política e **hospedá-la em URL pública**
- [ ] **Backup da chave** `~/.colinha-keystore` (já copiada para o Windows; guardar também em local seguro). Com o Play App Signing, essa chave vira a *chave de envio (upload key)*.
- [ ] Conferir a política do Google Play sobre **aplicativos relacionados a eleições** e declarações exigidas na seção de conteúdo do app (as regras mudam; confirmar na Central de Políticas antes de enviar). O app não simula a urna nem registra voto, e traz aviso de independência.
- [ ] Rodar **teste fechado/interno** com testadores antes da produção. Contas pessoais novas podem ter exigência mínima de testadores e de dias de teste: **confirmar no Console**.
- [ ] Revisar o nome "Colinha Eleitoral" e o ícone (uma urna estilizada) para não sugerir app oficial
- [ ] Subir `versionCode` a cada envio (hoje 10)

## Roteiro de teste no celular (v1.9)
1. Instalar o APK `Cola_Eleitoral_Ramos_v1.9.apk` e abrir (migração das colinhas antigas, se houver)
2. Criar colinha, digitar, trocar um dígito no meio (substitui), usar o ✕ do cargo
3. Salvar; fechar e reabrir o app (dados mantidos)
4. Compartilhar → Texto → conferir menu do Android e mensagem no WhatsApp
5. Compartilhar → PDF → conferir o arquivo
6. Imprimir (individual e lote): o gerenciador abre, A4, margens
7. Exportar backup, importar com *Mesclar* e *Substituir*
8. Menu → Sobre o app → conferir versão, fase, canal; **Buscar APK e atualizar** com um APK de versão maior
9. 2º turno: só Governador e Presidente; alternar tema claro/escuro

## Fluxo de release
```bash
# 1) subir versionCode/versionName em ~/colinha-app/android/app/build.gradle
# 2) APK de distribuição direta:
./build.sh
# 3) AAB para a Play:
./build.sh play
```
Saídas em `~/projects/`: `Cola_Eleitoral_Ramos_v<versao>.apk` e `..._v<versao>_play.aab`.

## Fases sugeridas para o campo `FASE_APP`
Beta (agora) → Release Candidate (após testes fechados) → Estável (produção).
