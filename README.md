# Local Docker Setups

This repository contains various Docker Compose configurations for running different services locally for development.

## Available Setups

### [Kafka](./kafka/)

Complete Kafka setup with Zookeeper and web UI for message streaming.

**Quick Start:**

```bash
cd kafka
docker-compose up -d
```

**Access:**

- Kafka UI: http://localhost:8080
- Kafka: 127.0.0.1:9092 (with SASL auth: test/test)
- Zookeeper: localhost:2181

## Project Structure

```
local-dockers/
├── kafka/                 # Kafka with Zookeeper and UI
│   ├── docker-compose.yml
│   └── README.md
├── README.md             # This file
└── .gitignore
```

## Adding New Setups

To add a new Docker setup:

1. Create a new folder for your service
2. Add your `docker-compose.yml` file
3. Create a `README.md` with specific instructions
4. Update this main README.md to include the new setup

## Common Commands

```bash
# Start all services in a setup
docker-compose up -d

# Stop all services
docker-compose down

# View logs
docker-compose logs

# Remove volumes (clean slate)
docker-compose down -v
```

## Requirements

- Docker
- Docker Compose
