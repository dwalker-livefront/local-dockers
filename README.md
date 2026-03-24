# Local Docker Setups

Docker Compose stack for local development: Kafka (KRaft), Kafka UI, Redis, and MongoDB Atlas Local.

## Quick start

From the repository root:

```bash
docker compose up -d
```

Stop and remove containers (volumes kept):

```bash
docker compose down
```

## Services

| Service    | Port  | Notes |
| ---------- | ----- | ----- |
| Kafka      | 9092  | SASL/PLAIN on `127.0.0.1:9092` |
| Kafka UI   | 8080  | http://localhost:8080 |
| Redis      | 6379  | AOF persistence enabled |
| MongoDB    | 27017 | Atlas Local image; default DB `localdb` |

### Kafka

- **Mode:** Apache Kafka 4.x in KRaft (no Zookeeper).
- **SASL/PLAIN** credentials are defined in `kafka_server_jaas.conf`. Examples:
  - `test` / `test`
  - `admin` / `admin-secret` (used by Kafka UI for the internal listener)
- **Client bootstrap:** `127.0.0.1:9092` with `security.protocol=SASL_PLAINTEXT` and `sasl.mechanism=PLAIN`.

### Kafka UI

Open http://localhost:8080. The compose file wires the UI to the broker over the Docker network with `admin` / `admin-secret`.

### Redis

Data is stored in the `redis-data` volume with `appendonly yes`.

### MongoDB

Uses `mongodb/mongodb-atlas-local` for a local Atlas-compatible experience. Root user env vars are set empty in compose (image-dependent behavior); connect on `mongodb://localhost:27017` for typical local use.

## Project structure

```
local-dockers/
├── docker-compose.yml      # All services
├── kafka_server_jaas.conf  # Kafka SASL/PLAIN users
├── README.md
└── .gitignore
```

## Adding or changing services

1. Edit `docker-compose.yml` (and any config files you mount).
2. Document new ports, env vars, and credentials here.
3. Prefer `docker compose` (v2 plugin) syntax.

## Common commands

```bash
# Start in background
docker compose up -d

# Stop containers
docker compose down

# Logs (follow)
docker compose logs -f

# Clean slate including named volumes
docker compose down -v
```

## Requirements

- [Docker](https://docs.docker.com/get-docker/)
- Docker Compose v2 (`docker compose`)
