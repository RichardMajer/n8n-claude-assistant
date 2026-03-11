#!/bin/bash
# Blokuje nebezpečné príkazy

CMD=$(echo "$CLAUDE_TOOL_INPUT" | python3 -c "import sys,json; print(json.load(sys.stdin).get('command',''))" 2>/dev/null)
UPPER=$(echo "$CMD" | tr '[:lower:]' '[:upper:]')

for DANGEROUS in "DROP TABLE" "TRUNCATE TABLE" "RM -RF" "DELETE FROM" "FORMAT C:"; do
  if echo "$UPPER" | grep -q "$DANGEROUS"; then
    echo "BLOCKED: Nebezpečný príkaz detegovaný: $DANGEROUS" >&2
    exit 2
  fi
done

exit 0
