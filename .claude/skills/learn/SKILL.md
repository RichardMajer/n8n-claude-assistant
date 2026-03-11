---
name: learn
description: Ulož nový poznatok, pattern alebo konvenciu do príslušného knowledge/ súboru pre budúce sessions.
disable-model-invocation: true
argument-hint: "[popis poznatku]"
---

# learn — Uloženie poznatku

## Postup

1. **Analyzuj poznatok** — o čom je?
   - WF pattern / štruktúra → `knowledge/workflow-patterns.md`
   - NocoDB tabuľka / schéma → `knowledge/nocodb-schema.md`
   - n8n konvencia / naming → `knowledge/n8n-conventions.md`
   - Node konfigurácia / gotcha → `knowledge/node-configs.md`
   - Nápad na zlepšenie → `knowledge/improvements.md`

2. **Skontroluj existujúci obsah** cieľového súboru — neduplicuj

3. **Pridaj poznatok** do správnej sekcie v správnom súbore:
   - Formát: stručný nadpis + kontext + príklad
   - Dátum nie je potrebný (git história to zachytí)

4. **Potvrď** — vypíš čo bolo pridané a do ktorého súboru

## Pravidlá

- Jeden poznatok = jeden záznam (nie dump celej session)
- Faktické informácie overené v praxi, nie špekulácie
- Ak sa poznatok týka viacerých súborov, pridaj do každého relevantného
