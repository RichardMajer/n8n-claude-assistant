#!/bin/bash
# Spustí sa pred každou úpravou/zmazaním WF
# Exportuje aktuálny WF JSON do git repozitára ako zálohu

WF_ID=$(echo "$CLAUDE_TOOL_INPUT" | python3 -c "import sys,json; print(json.load(sys.stdin).get('workflowId','unknown'))" 2>/dev/null)
echo "[HOOK] Workflow $WF_ID bude upravený — záloha pred zmenou odporúčaná"
# Tu môže byť volanie backup skriptu keď bude pripravený
