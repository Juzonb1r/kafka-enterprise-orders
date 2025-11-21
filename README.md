kafka-enterprise-orders/
├── docker-compose.yml
├── .env
├── db/
│   └── init.sql
├── connect/
│   ├── Dockerfile
│   └── connectors/
│       ├── jdbc-source.json
│       └── couchbase-sink.json
├── ksql/
│   └── streams.sql
├── producer/
│   ├── Dockerfile
│   ├── requirements.txt
│   └── order_producer.py
└── consumers/
    ├── fraud-service/
    │   ├── Dockerfile
    │   ├── requirements.txt
    │   └── fraud_consumer.py
    ├── payment-service/
    │   ├── Dockerfile
    │   ├── requirements.txt
    │   └── payment_consumer.py
    └── analytics-service/
        ├── Dockerfile
        ├── requirements.txt
        └── analytics_consumer.py
