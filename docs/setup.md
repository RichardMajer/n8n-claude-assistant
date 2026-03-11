# Setup

## Prerequisites

- Node.js 18+ (pre `npx`)
- Git + GitHub CLI (`gh`)
- [direnv](https://direnv.net/) — odporúčané pre auto-načítanie `.env`
- Claude Code CLI

## 1. Vyplniť .env

Skopíruj `.env.example` → `.env` a doplň hodnoty:

```bash
cp .env.example .env
```

### n8n API Key
1. Otvoriť `https://n8n.myrsolutions.dev`
2. Settings → API → Create API Key
3. Vložiť do `N8N_API_KEY`

### NocoDB MCP tokeny (per base)
Pre každú base (`Techgarden`, `Efix`, `General`, `Kašša`, `Skladan`):
1. Otvoriť NocoDB → príslušná base
2. Settings → MCP → kopírovať Base ID z URL (`/mcp/{base-id}`) a MCP Token
3. Vložiť do `.env` ako `NOCODB_BASE_ID_XXX` a `NOCODB_MCP_TOKEN_XXX`

### GitHub Token
1. GitHub → Settings → Developer settings → Personal access tokens → Fine-grained
2. Scope: `Contents: Read & Write` pre repo `myrsolutions/n8n-workflows-backup`
3. Vložiť do `GITHUB_TOKEN`

## 2. direnv (odporúčané)

```bash
brew install direnv
# Pridať do ~/.zshrc:
eval "$(direnv hook zsh)"
# Potom v adresári projektu:
direnv allow
```

Bez direnv treba manuálne: `source .env` pri každom otvorení terminálu.

## 3. Vytvoriť GitHub backup repo

```bash
gh repo create myrsolutions/n8n-workflows-backup --private
```

## 4. Test MCP pripojení

Otestuj n8n MCP:
```bash
N8N_API_URL=https://n8n.myrsolutions.dev/api/v1 \
N8N_API_KEY=<tvoj-key> \
MCP_MODE=stdio \
npx -y n8n-mcp
```

Otestuj NocoDB MCP (Techgarden):
```bash
npx mcp-remote https://noco-db.myrsolutions.dev/mcp/ncqr5fh2r8rdv7vy \
  --header "xc-mcp-token: <tvoj-token>"
```

## 5. Otvoriť projekt v Claude Code

```bash
cd /Users/Richard/Projekty/n8n-claude-assistant
claude
```

Projekt automaticky načíta `.mcp.json` a `.claude/CLAUDE.md`.

## 6. Backup WF v n8n (voliteľné)

Vytvor WF v n8n ktorý každú hodinu commituje zmenené WF do `myrsolutions/n8n-workflows-backup`:
- Trigger: Schedule (každú hodinu)
- HTTP Request: `GET /api/v1/workflows` — načítaj všetky WF
- Compare: porovnaj `versionId` s predchádzajúcim stavom
- GitHub API: commit zmenené JSON súbory

## Štruktúra projektu

```
.mcp.json              # MCP servery (n8n + NocoDB per-base)
.env                   # Secrets — GITIGNORED
.claude/
  CLAUDE.md            # Hlavný kontext pre Claude
  settings.json        # Hooks + permissions
  settings.local.json  # Env vars — GITIGNORED
  agents/              # Doménoví špecialisti
  skills/              # Slash commands (/n8n-create, /learn, ...)
  hooks/               # Bezpečnostné skripty
knowledge/             # Self-improvement — Claude tu píše poznatky
docs/                  # Táto dokumentácia
```
