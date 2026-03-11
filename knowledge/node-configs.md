# Node Configs

Overené konfigurácie n8n nodes — šablóny a gotchas.

## NocoDB Node

<!-- Príklad:
### NocoDB — Get Record
```json
{
  "operation": "get",
  "tableId": "{{ $json.tableId }}",
  "recordId": "{{ $json.id }}"
}
```
-->

## HTTP Request Node

<!-- Príklad:
### n8n API — Get Workflow
```json
{
  "method": "GET",
  "url": "={{ $env.N8N_API_URL }}/workflows/{{ $json.workflowId }}",
  "authentication": "genericCredentialType",
  "genericAuthType": "httpHeaderAuth"
}
```
-->

## Code Node

<!-- Často používané snippety -->

## Gotchas

_Pridávaj overené konfigurácie a problémy cez `/learn`_
