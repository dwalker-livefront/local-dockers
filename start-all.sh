#!/bin/bash

# Create shared network if it doesn't exist
echo "Creating shared network..."
docker network create local-services 2>/dev/null || echo "Network already exists"

# Start all services with shared network
echo "Starting all services..."
docker-compose -f docker-compose.yml -f mongodb/docker-compose.yml -f kafka/docker-compose.yml -f redis/docker-compose.yml up -d

echo "Services started!"
echo "MongoDB: mongodb://localhost:27017/"
echo "Kafka: localhost:9092"
echo "Kafka UI: http://localhost:8080"
echo "Redis: localhost:6379"
