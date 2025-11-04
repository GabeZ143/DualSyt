#!/usr/bin/env bash
set -euo pipefail
sudo apt update
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker "$USER" || true
newgrp docker <<'X'
  sudo apt -y install docker-compose-plugin
  git clone https://github.com/bamgitbam/DualSyt.git ~/DualSyt || true
  cd ~/DualSyt
  [ -f go2rtc.yaml ] || cp go2rtc.yaml.example go2rtc.yaml
  echo ">>> Edit go2rtc.yaml with your RTSP creds, then run: docker compose up -d"
X
