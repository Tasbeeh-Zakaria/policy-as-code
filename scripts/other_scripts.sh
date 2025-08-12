#!/usr/bin/env bash
# Utility helpers for local simulation. Safe-by-default: prints unless URL is set.
# Usage:
#   ./other_scripts.sh send-grafana ./integrations/grafana_alert_payload.json
#   ./other_scripts.sh send-slack ./integrations/slack_policy_alert.json
#   WEBHOOK_URL="https://hooks.slack.com/..." ./other_scripts.sh send-slack ./integrations/slack_policy_alert.json

set -euo pipefail

GREEN="$(printf '\033[32m')"
YELLOW="$(printf '\033[33m')"
RED="$(printf '\033[31m')"
RESET="$(printf '\033[0m')"

die(){ echo -e "${RED}ERROR:${RESET} $*" >&2; exit 1; }

cmd="${1:-}"; shift || true

case "${cmd}" in
  send-grafana)
    payload="${1:-}"; [ -f "${payload}" ] || die "Payload file not found: ${payload}"
    if [[ -z "${GRAFANA_WEBHOOK_URL:-}" ]]; then
      echo -e "${YELLOW}[dry-run]${RESET} Would POST Grafana alert payload to \$GRAFANA_WEBHOOK_URL"
      jq . "${payload}" || cat "${payload}"
    else
      curl -fsSL -X POST -H "Content-Type: application/json" \
        --data-binary @"${payload}" "${GRAFANA_WEBHOOK_URL}"
      echo -e "${GREEN}Sent Grafana alert payload.${RESET}"
    fi
    ;;
  send-slack)
    payload="${1:-}"; [ -f "${payload}" ] || die "Payload file not found: ${payload}"
    if [[ -z "${WEBHOOK_URL:-}" ]]; then
      echo -e "${YELLOW}[dry-run]${RESET} Would POST Slack payload to \$WEBHOOK_URL"
      jq . "${payload}" || cat "${payload}"
    else
      curl -fsSL -X POST -H "Content-Type: application/json" \
        --data-binary @"${payload}" "${WEBHOOK_URL}"
      echo -e "${GREEN}Sent Slack payload.${RESET}"
    fi
    ;;
  port-forward-grafana)
    # Convenience: forward Grafana service created by loki-stack to localhost:3000
    kubectl port-forward svc/loki-grafana -n monitoring 3000:80
    ;;
  *)
    cat <<EOF
Usage:
  ${0##*/} send-grafana ./integrations/grafana_alert_payload.json
  ${0##*/} send-slack   ./integrations/slack_policy_alert.json
  GRAFANA_WEBHOOK_URL=... ${0##*/} send-grafana ./integrations/grafana_alert_payload.json
  WEBHOOK_URL=...        ${0##*/} send-slack   ./integrations/slack_policy_alert.json
  ${0##*/} port-forward-grafana
EOF
    ;;
esac
