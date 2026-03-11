---
name: n8n-create
description: Vytvor nový n8n workflow podľa konvencií projektu. Použiť pri každom novom WF.
argument-hint: "[folder-path] [workflow-name] [popis]"
---

# n8n-create — Vytvorenie nového workflow

## Postup

1. **Urči folder** — podľa `knowledge/n8n-conventions.md`:
   - Formát: `{Klient} / {Doména} / {Entita}`
   - Ak folder neexistuje, vytvor ho cez `mcp__n8n__create_folder`

2. **Skontroluj existujúce WF** v cieľovom foldri:
   - `mcp__n8n__list_workflows` s filter na folder
   - Upozorni ak existuje WF s podobným názvom

3. **Pomenuj WF** podľa konvencie:
   - Formát: `{Projekt} - {Entita} - {Operácia}`
   - Príklad: `Efix - Customers - Get`

4. **Vytvor WF** cez `mcp__n8n__create_workflow`:
   - Nastav správny folder ID
   - Pridaj základné nodes podľa typu WF (Webhook/Schedule/Manual trigger)

5. **Validuj štruktúru** cez `mcp__n8n__validate_workflow`

6. **Reportuj** — vráť WF ID, názov, URL na editor

## Trigger typy

| Typ | Kedy použiť |
|-----|-------------|
| Webhook | Externý HTTP request |
| Schedule | Pravidelné spúšťanie (cron) |
| Manual | Manuálne spustenie / sub-workflow |
| Form | Webový formulár |
| Chat | Chat rozhranie |
