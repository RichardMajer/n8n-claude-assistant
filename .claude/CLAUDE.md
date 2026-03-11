# n8n Claude Assistant

## Kontext projektu

n8n self-hosted na VPS, Docker, verzia 1.123.16.
- **n8n**: `https://n8n.myrsolutions.dev` (MCP server: `/mcp-server/http`)
- **NocoDB**: `https://noco-db.myrsolutions.dev`
- **Backup repo**: `myrsolutions/n8n-workflows-backup` (private GitHub)

## Infraštruktúra

- **n8n postgres** (`n8n-hub-postgres`) — interná DB, nie je exponovaná navonok
- **NocoDB DB** (`postgres-vector`, pgvector:pg17) — NocoDB + vector store, nie je exponovaná
- **Externá project DB** — `173.249.63.64:5433` (SOCIAL_AUTOMATION_DB)
- Pre postgres MCP prístup k n8n/NocoDB DB je potrebný SSH tunel

## n8n Folder konvencie

Štruktúra folderov v n8n:
```
{Klient/Projekt} / {Doména} / {Tabuľka/Entita} / {Operácia}
```

Príklady:
- `Efix / Database / Customers / get`
- `Efix / Database / Orders / upsert`
- `MyrSolutions / Automation / Leads / insert`

Operácie: `get`, `update`, `upsert`, `insert`, `delete`, `list`, `webhook`, `trigger`

## NocoDB

NocoDB MCP (`edwinbernadus/nocodb-mcp-server`) podporuje len record CRUD (nie schema management).
Pre schema operácie použiť PostgreSQL MCP cez SSH tunel.

Schéma: → [knowledge/nocodb-schema.md](../knowledge/nocodb-schema.md)

## Pravidlá

1. **Nikdy nemazať aktívny WF** bez explicitného potvrdenia od používateľa
2. **Vždy zálohovať pred úpravou** — hook `pre-wf-modify.sh` sa spustí automaticky
3. **Folder štruktúra** — dodržiavať konvencie pri každom novom WF
4. **Naming** — WF názov musí zodpovedať folder štruktúre: `{Projekt} - {Entita} - {Operácia}`

## Knowledge base

Aktuálny kontext a naučené vzory:
- [workflow-patterns.md](../knowledge/workflow-patterns.md) — opakujúce sa WF vzory
- [nocodb-schema.md](../knowledge/nocodb-schema.md) — NocoDB tabuľky a schéma
- [n8n-conventions.md](../knowledge/n8n-conventions.md) — konvencie pomenovania a štruktúry
- [node-configs.md](../knowledge/node-configs.md) — konfigurácie n8n nodes
- [improvements.md](../knowledge/improvements.md) — nápady na zlepšenie projektu

## Self-improvement

Po každej session kde bol objavený nový pattern, konvencia alebo riešenie:
1. Spusti `/learn` skill s popisom poznatku
2. Skill uloží poznatok do správneho knowledge/ súboru
3. Knowledge súbory sú automaticky načítané do kontextu pri ďalšej session

## Agenti

- **n8n-agent** — workflow operácie (create/edit/debug/analyze)
- **nocodb-agent** — NocoDB CRUD + scaffold
- **git-agent** — verzovanie a backup WF
- **browser-agent** — Playwright testovanie Form WF
