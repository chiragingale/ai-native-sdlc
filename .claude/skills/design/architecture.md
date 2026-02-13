# Skill: /architecture - Generate Architecture Design

<command-name>architecture</command-name>

## Description
Creates comprehensive architecture documentation including system diagrams, component designs, and technical specifications. Uses the Architect Agent persona.

## Usage
```
/architecture [feature or system description]
```

## Options
```
/architecture [description]           # Full architecture design
/architecture diagram [description]   # Just diagrams
/architecture adr [decision]          # Architecture Decision Record
/architecture review [file/system]    # Review existing architecture
```

## Output Format

```markdown
# Architecture Design: [System/Feature Name]

## Overview
[High-level description of the architecture]

## System Context Diagram

```mermaid
graph TB
    subgraph "External Systems"
        ExtA[External Service A]
        ExtB[External Service B]
    end

    subgraph "Our System"
        API[API Gateway]
        Service[Core Service]
        DB[(Database)]
    end

    User[User] --> API
    API --> Service
    Service --> DB
    Service --> ExtA
    Service --> ExtB
```

## Component Diagram

```mermaid
graph TB
    subgraph "Frontend"
        Web[Web App]
        Mobile[Mobile App]
    end

    subgraph "Backend"
        Gateway[API Gateway]
        Auth[Auth Service]
        Core[Core Service]
        Worker[Background Worker]
    end

    subgraph "Data"
        PG[(PostgreSQL)]
        Redis[(Redis)]
        S3[S3 Storage]
    end

    subgraph "External"
        Email[Email Service]
        Payment[Payment Gateway]
    end

    Web --> Gateway
    Mobile --> Gateway
    Gateway --> Auth
    Gateway --> Core
    Core --> PG
    Core --> Redis
    Core --> S3
    Worker --> Core
    Core --> Email
    Core --> Payment
```

## Data Flow Diagram

```mermaid
sequenceDiagram
    participant U as User
    participant G as Gateway
    participant A as Auth
    participant S as Service
    participant D as Database

    U->>G: Request
    G->>A: Validate Token
    A-->>G: Valid
    G->>S: Process Request
    S->>D: Query Data
    D-->>S: Data
    S-->>G: Response
    G-->>U: Response
```

## Components

### [Component Name]
| Attribute | Value |
|-----------|-------|
| **Purpose** | [What it does] |
| **Technology** | [Tech stack] |
| **Scaling** | [Scaling strategy] |
| **Dependencies** | [What it depends on] |

**Responsibilities:**
- [Responsibility 1]
- [Responsibility 2]

**Interfaces:**
- `POST /api/resource` - Create resource
- `GET /api/resource/:id` - Get resource

## Data Model

```mermaid
erDiagram
    USER ||--o{ ORDER : places
    USER {
        uuid id PK
        string email
        string name
        timestamp createdAt
    }
    ORDER ||--|{ ORDER_ITEM : contains
    ORDER {
        uuid id PK
        uuid userId FK
        decimal total
        string status
        timestamp createdAt
    }
    ORDER_ITEM {
        uuid id PK
        uuid orderId FK
        uuid productId FK
        int quantity
        decimal price
    }
```

## API Contracts

### Create Resource
```yaml
POST /api/v1/resources
Request:
  Content-Type: application/json
  Body:
    name: string (required)
    type: enum[A, B, C] (required)
    metadata: object (optional)

Response:
  201 Created:
    id: uuid
    name: string
    type: string
    createdAt: timestamp

  400 Bad Request:
    error: string
    details: object

  401 Unauthorized:
    error: "Authentication required"
```

## Security Considerations

| Concern | Mitigation |
|---------|------------|
| Authentication | JWT tokens with refresh mechanism |
| Authorization | RBAC with fine-grained permissions |
| Data Protection | Encryption at rest and in transit |
| Input Validation | Schema validation on all inputs |

## Performance Requirements

| Metric | Target | Measurement |
|--------|--------|-------------|
| Response Time (p95) | < 200ms | API latency |
| Throughput | 1000 req/s | Sustained load |
| Availability | 99.9% | Uptime SLA |

## Scalability

- **Horizontal**: Stateless services behind load balancer
- **Vertical**: Database read replicas
- **Caching**: Redis for frequently accessed data
- **Async**: Queue-based processing for heavy tasks

## Monitoring & Observability

### Metrics
- Request rate, latency, error rate
- Database query performance
- Cache hit ratio
- Queue depth

### Logging
- Structured JSON logs
- Request correlation IDs
- Log aggregation via [tool]

### Alerting
- Error rate > 1%
- Latency p95 > 500ms
- Queue depth > 1000

## Deployment Architecture

```mermaid
graph TB
    subgraph "Production"
        LB[Load Balancer]
        subgraph "AZ-1"
            App1[App Server 1]
            App2[App Server 2]
        end
        subgraph "AZ-2"
            App3[App Server 3]
            App4[App Server 4]
        end
        subgraph "Data"
            DB_Primary[(DB Primary)]
            DB_Replica[(DB Replica)]
        end
    end

    LB --> App1
    LB --> App2
    LB --> App3
    LB --> App4
    App1 --> DB_Primary
    App2 --> DB_Primary
    App3 --> DB_Replica
    App4 --> DB_Replica
    DB_Primary --> DB_Replica
```

## Migration Strategy
[If applicable]

## Risks & Mitigations

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| [Risk 1] | Medium | High | [Mitigation] |

## Decision Log
- [Date]: [Decision made and rationale]
```

## Related Skills
- `/api-design` - Detailed API contract design
- `/spec` - Feature specification
- `/implement` - Implement the architecture
