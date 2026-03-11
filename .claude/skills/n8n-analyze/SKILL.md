---
name: n8n-analyze
description: Hĺbková analýza n8n workflow štruktúry — komplexnosť, závislosti, potenciálne problémy, návrhy na optimalizáciu.
argument-hint: "[workflow-id]"
---

# n8n-analyze — Analýza workflow

## Postup

1. **Načítaj WF** cez `mcp__n8n__get_workflow`

2. **Štruktúrna analýza**:
   - Počet nodes, typy nodes
   - Trigger typ a konfigurácia
   - Branches / conditional paths
   - Error handling (Error Trigger node?)
   - Sub-workflow volania

3. **Závislostianalýza**:
   - Externé services (HTTP Request nodes)
   - NocoDB tabuľky (read/write)
   - Credentials použité
   - Iné WF (Execute Workflow nodes)

4. **Identifikácia problémov**:
   - Chýbajúci error handling
   - Hardcoded values (malo by byť v env/params)
   - Príliš dlhý chain bez error recovery
   - Nepoužité nodes (disabled, odpojené)
   - N+1 problém (loop s individuálnymi API calls)

5. **Posledné executions** cez `mcp__n8n__get_executions`:
   - Success rate
   - Priemerný čas behu
   - Opakujúce sa chyby

6. **Výstup** — štruktúrovaný report:
   - Súhrn WF účelu
   - Mapa závislostí
   - Zoznam problémov (kritické / varovania / návrhy)
   - Odporúčania na optimalizáciu
