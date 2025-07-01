# Local Kafka Docker Setup

This Docker Compose setup provides a local Kafka environment with Zookeeper and a web-based UI for easy management.

## Services

- **Zookeeper**: Required for Kafka coordination (port 2181)
- **Kafka**: Message broker (port 9092) with SASL authentication
- **Kafka UI**: Web interface for managing Kafka (port 8080)

## Quick Start

1. **Start the services:**

   ```bash
   docker-compose up -d
   ```

2. **Check if services are running:**

   ```bash
   docker-compose ps
   ```

3. **Access Kafka UI:**
   Open your browser and go to `http://localhost:8080`

4. **Stop the services:**
   ```bash
   docker-compose down
   ```

## Connection Details

- **Kafka Bootstrap Servers:** `127.0.0.1:9092`
- **Zookeeper:** `localhost:2181`
- **Kafka UI:** `http://localhost:8080`

## Authentication Configuration

The Kafka setup uses SASL PLAIN authentication with the following settings:

```json
{
  "SaslMechanism": "Plain",
  "SecurityProtocol": "Plaintext",
  "SaslUsername": "test",
  "SaslPassword": "test"
}
```

## Environment Variables

The setup includes the following key configurations:

- Single broker setup (suitable for development)
- Auto-creation of topics enabled
- Topic deletion enabled
- JMX monitoring enabled on port 9101
- SASL PLAIN authentication enabled

## Data Persistence

Data is persisted using Docker volumes:

- `zookeeper-data`: Zookeeper data
- `zookeeper-logs`: Zookeeper logs
- `kafka-data`: Kafka data

To completely remove all data:

```bash
docker-compose down -v
```

## Troubleshooting

1. **Check logs:**

   ```bash
   docker-compose logs kafka
   docker-compose logs zookeeper
   ```

2. **Restart services:**

   ```bash
   docker-compose restart
   ```

3. **Clean restart:**
   ```bash
   docker-compose down
   docker-compose up -d
   ```

## Example Usage

### Using kafka-console-producer with SASL:

```bash
docker exec -it kafka kafka-console-producer \
  --bootstrap-server 127.0.0.1:9092 \
  --topic test-topic \
  --producer.config /etc/kafka/producer.properties
```

### Using kafka-console-consumer with SASL:

```bash
docker exec -it kafka kafka-console-consumer \
  --bootstrap-server 127.0.0.1:9092 \
  --topic test-topic \
  --from-beginning \
  --consumer.config /etc/kafka/consumer.properties
```

### List topics:

```bash
docker exec -it kafka kafka-topics \
  --bootstrap-server 127.0.0.1:9092 \
  --list \
  --command-config /etc/kafka/admin.properties
```

## Client Configuration

When connecting from your applications, use these settings:

```properties
bootstrap.servers=127.0.0.1:9092
security.protocol=PLAINTEXT
sasl.mechanism=PLAIN
sasl.username=test
sasl.password=test
```
