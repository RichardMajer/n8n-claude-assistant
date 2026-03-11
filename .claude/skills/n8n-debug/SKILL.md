---
name: n8n-debug
description: Debuguj failed n8n execution — analyzuj chybu, nájdi príčinu, navrhni opravu.
argument-hint: "[workflow-id alebo execution-id]"
---

# n8n-debug — Debug failed execution

## Postup

1. **Získaj kontext** — ak máš len WF ID, získaj posledné execution:
   - `mcp__n8n__get_executions` pre daný WF (filter: status=error)
   - Vyber posledné failed execution

2. **Analyzuj execution** cez `mcp__n8n__get_execution`:
   - Nájdi node kde execution zlyhalo
   - Prečítaj error message + stack trace
   - Skontroluj input data daného node

3. **Diagnostikuj príčinu**:
   - Chyba v expression? (`{{ $json.xxx }}` — neexistujúce pole)
   - Chyba v HTTP request? (status code, auth, URL)
   - Chyba v NocoDB operácii? (neplatné pole, chýbajúci record)
   - Timeout? (príliš dlhá operácia)
   - Credential problém?

4. **Načítaj WF štruktúru** cez `mcp__n8n__get_workflow`:
   - Skontroluj konfiguráciu problematického node
   - Skontroluj node pred ním (odkiaľ prichádzajú dáta)

5. **Navrhni opravu** — konkrétna zmena v konfigurácii node

6. **Po oprave** — spusti test execution a verifikuj

## Časté chyby

| Chyba | Príčina | Riešenie |
|-------|---------|---------|
| `Cannot read property of undefined` | Chýbajúce pole v `$json` | Pridaj fallback: `{{ $json.field ?? '' }}` |
| `401 Unauthorized` | Expiračná credential | Obnov credential v n8n |
| `404 Not Found` | Nesprávna URL alebo ID | Skontroluj URL a parametre |
| `ECONNREFUSED` | Služba nedostupná | Skontroluj URL, firewall, Docker status |
