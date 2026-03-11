# n8n Konvencie

## Folder štruktúra

```
{Klient/Projekt} / {Doména} / {Tabuľka/Entita} / {Operácia}
```

Príklady:
- `Efix / Database / Customers / get`
- `Efix / Database / Orders / upsert`
- `MyrSolutions / Automation / Leads / insert`
- `Techgarden / Database / Products / list`

## WF Naming

Formát: `{Projekt} - {Entita} - {Operácia}`

Príklady:
- `Efix - Customers - Get`
- `Techgarden - Products - Upsert`

## Operácie (štandardné)

| Operácia | Popis |
|----------|-------|
| `get` | Načítaj jeden záznam podľa ID |
| `list` | Načítaj zoznam záznamov (s filtrami) |
| `insert` | Vytvor nový záznam |
| `update` | Aktualizuj existujúci záznam |
| `upsert` | Vytvor alebo aktualizuj |
| `delete` | Zmaž záznam |
| `webhook` | Príjem externého eventu |
| `trigger` | Spúšťač iného WF |

## Webhook konvencie

- Webhook path: `/{projekt}/{entita}/{akcia}` (lowercase, kebab-case)
- Príklad: `/efix/customers/create`

## Poznámky

_Pridávaj objavené konvencie cez `/learn`_
