#kafka-enterprise-orders

```text
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
├── infra/
│   └── terraform/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       ├── ecs.tf          # ECS tasks + services
│       ├── rds.tf          # Postgres RDS
│       └── vpc.tf          # basic VPC + subnets + security groups
└── .github/
    └── workflows/
        └── ci-cd.yml
└── web/
    ├── backend/
    │   ├── Dockerfile
    │   ├── app.py
    │   └── requirements.txt
    └── frontend/
        ├── Dockerfile
        ├── nginx.conf
        └── build/ (generated)
k8s/
└── charts/
    └── webapp/
         ├── Chart.yaml
         ├── values.yaml
         ├── templates/
             ├── deployment.yaml
             ├── service.yaml
             ├── ingress.yaml
    NEW!
infra/terraform/monitoring/
  ├── amp.tf
  ├── grafana.tf
  ├── otel.tf
ansible/
  ├── inventories/
  ├── roles/
  └── playbooks/
otel/
  └── otel-config.yaml

ansible/
  ├── inventories/prod
  ├── roles/
  │   └── bastion/
  │       └── tasks/main.yml
  └── playbooks/setup-bastion.yml


