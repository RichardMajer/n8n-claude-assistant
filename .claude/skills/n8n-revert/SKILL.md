---
name: n8n-revert
description: Revert n8n workflow na predchádzajúcu verziu z git histórie backup repozitára.
disable-model-invocation: true
argument-hint: "[workflow-id] [optional: commit-hash]"
---

# n8n-revert — Revert workflow z git

⚠️ **UPOZORNENIE**: Táto akcia prepíše aktuálny WF. Vždy si vyžiadaj potvrdenie pred revertom.

## Postup

1. **Nájdi WF v git histórii**:
   ```bash
   git log --oneline -- "workflows/{workflow-id}-*.json"
   ```

2. **Zobraz dostupné verzie** — vypíš posledných 10 commitov pre daný WF:
   - Commit hash, dátum, správa

3. **Ak nie je zadaný commit-hash** — spýtaj sa na ktorú verziu reverzovať

4. **Zobraz diff** medzi aktuálnou a cieľovou verziou:
   ```bash
   git diff HEAD {commit-hash} -- "workflows/{workflow-id}-*.json"
   ```

5. **Vyžiadaj explicitné potvrdenie** od používateľa:
   - Zobraziť: WF ID, názov, cieľový commit, dátum verzie
   - Čakať na "áno" / "potvrdzujem"

6. **Po potvrdení** — aktualizuj WF cez n8n API:
   - Načítaj JSON zo súboru v git histórii
   - `mcp__n8n__update_workflow` s načítaným JSON

7. **Verifikuj** — skontroluj že WF bol správne aktualizovaný

## Poznámky

- Backup repo: `myrsolutions/n8n-workflows-backup`
- Naming: `{id}-{slug-name}.json`
- Ak WF nie je v backup repo → záloha neexistuje, revert nie je možný
