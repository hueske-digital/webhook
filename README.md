# Webhook Docker-Container

Aktueller Alpine-Container für [adnanh/webhook](https://github.com/adnanh/webhook).

## Verwendung

1. Lege im Host-Verzeichnis `hooks` deine `hooks.json` ab.
2. Beim ersten Start wird, falls noch keine vorhanden, eine Beispiel-Datei aus `/default/hooks.json` kopiert.
3. Der Dienst läuft als Nicht-Root-Benutzer `webhook:1000`.
4. Aufrufbar ist der Webhook über Port `9000`.
5. Änderungen an der `hooks.json` werden automatisch erkannt und neu geladen.

### Per Docker CLI
```sh
docker run -d \
  --name webhook \
  -e TZ=Europe/Berlin \
  -v $PWD/hooks:/config/webhook \
  -p 9000:9000 \
  ghcr.io/hueske-digital/webhook:latest
```

### Per Docker Compose
```yaml
services:
  webhook:
    image: ghcr.io/hueske-digital/webhook:latest
    environment:
      - TZ=Europe/Berlin
    volumes:
      - ./hooks:/config/webhook
    ports:
      - "9000:9000"
    restart: unless-stopped
```

## Weiterführende Links
- [Webhook Docs](https://github.com/adnanh/webhook#readme)