---
name: noco-db-scaffold
description: Generuj 5 štandardných CRUD workflows (get/list/insert/update/delete) pre NocoDB tabuľku na základe existujúcich template WF v n8n.
disable-model-invocation: true
argument-hint: "[nocodb-base-slug] [table-name]"
---

# noco-db-scaffold — Generovanie CRUD WF

⚠️ **SIDE EFFECT**: Vytvára 5 nových workflowov v n8n. Vyžiadaj potvrdenie pred spustením.

## Postup

1. **Získaj informácie o tabuľke od nocodb-agent**:
   - `table_id`, zoznam stĺpcov, typy, povinné polia
   - NocoDB base slug (techgarden / efix / general / kassa / skladan)

2. **Urči target folder v n8n** podľa base:
   - Formát: `{Projekt} / Database / {TableName}`
   - Príklad: `Techgarden / Database / Products`
   - Vytvor folder ak neexistuje cez `mcp__n8n__create_folder`

3. **Nájdi template WF** v n8n:
   - Vyhľadaj WF s názvom obsahujúcim `template` a `database`
   - Alebo vyhľadaj: `template-database-get`, `template-database-insert` atď.
   - Načítaj JSON každého template cez `mcp__n8n__get_workflow`

4. **Pre každú z 5 operácií** (get, list, insert, update, delete):
   - Naklonuj template JSON
   - Nahraď parametre:
     - `TABLE_NAME` → skutočný názov tabuľky
     - `TABLE_ID` → NocoDB table ID
     - `BASE_SLUG` → nocodb-{base-slug}
     - `FOLDER_PATH` → cieľový folder
   - Pomenuj WF: `{Projekt} - {TableName} - {Operácia}`
   - Vytvor cez `mcp__n8n__create_workflow`

5. **Validuj** každý vytvorený WF cez `mcp__n8n__validate_workflow`

6. **Report** — zoznam vytvorených WF s ID a URL

## Operácie

Všetky CRUD WF používajú **Execute Workflow Trigger** — sú volané ako sub-workflow, parametre prichádzajú cez `$json` od volajúceho WF.

| WF | Popis |
|----|-------|
| get | Načítaj jeden záznam |
| list | Načítaj zoznam záznamov |
| insert | Vytvor nový záznam |
| update | Aktualizuj existujúci záznam |
| delete | Zmaž záznam |
