# Skill: /api-design - Design API Contracts

<command-name>api-design</command-name>

## Description
Creates detailed API contracts including endpoints, request/response schemas, error handling, and OpenAPI specifications.

## Usage
```
/api-design [resource or feature]
```

## Options
```
/api-design rest [resource]      # RESTful API design
/api-design graphql [resource]   # GraphQL schema design
/api-design websocket [feature]  # WebSocket API design
```

## Output Format

### REST API Design

```markdown
# API Design: [Resource Name]

## Base URL
`https://api.example.com/v1`

## Authentication
Bearer token required in Authorization header.

## Endpoints

### List [Resources]
`GET /[resources]`

**Query Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| page | integer | No | Page number (default: 1) |
| limit | integer | No | Items per page (default: 20, max: 100) |
| sort | string | No | Sort field (e.g., "createdAt:desc") |
| filter | string | No | Filter expression |

**Response:**
```json
{
  "data": [
    {
      "id": "res_123",
      "name": "Example",
      "status": "active",
      "createdAt": "2024-01-15T10:30:00Z"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 150,
    "totalPages": 8
  }
}
```

### Get [Resource]
`GET /[resources]/:id`

**Path Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| id | string | Resource UUID |

**Response:**
```json
{
  "data": {
    "id": "res_123",
    "name": "Example",
    "description": "Detailed description",
    "status": "active",
    "metadata": {},
    "createdAt": "2024-01-15T10:30:00Z",
    "updatedAt": "2024-01-15T10:30:00Z"
  }
}
```

### Create [Resource]
`POST /[resources]`

**Request Body:**
```json
{
  "name": "string (required, 1-100 chars)",
  "description": "string (optional, max 1000 chars)",
  "metadata": "object (optional)"
}
```

**Response:** `201 Created`
```json
{
  "data": {
    "id": "res_456",
    "name": "New Resource",
    "status": "active",
    "createdAt": "2024-01-15T10:30:00Z"
  }
}
```

### Update [Resource]
`PATCH /[resources]/:id`

**Request Body:**
```json
{
  "name": "string (optional)",
  "description": "string (optional)",
  "status": "active | inactive (optional)"
}
```

**Response:** `200 OK`

### Delete [Resource]
`DELETE /[resources]/:id`

**Response:** `204 No Content`

## Error Responses

### Standard Error Format
```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human-readable error message",
    "details": {
      "field": "Additional context"
    },
    "requestId": "req_abc123"
  }
}
```

### Error Codes
| HTTP Status | Code | Description |
|-------------|------|-------------|
| 400 | VALIDATION_ERROR | Invalid request body |
| 400 | INVALID_PARAMETER | Invalid query parameter |
| 401 | UNAUTHORIZED | Missing or invalid token |
| 403 | FORBIDDEN | Insufficient permissions |
| 404 | NOT_FOUND | Resource not found |
| 409 | CONFLICT | Resource already exists |
| 422 | UNPROCESSABLE | Business logic error |
| 429 | RATE_LIMITED | Too many requests |
| 500 | INTERNAL_ERROR | Server error |

## Rate Limiting

| Tier | Limit | Window |
|------|-------|--------|
| Free | 100 | Per minute |
| Pro | 1000 | Per minute |
| Enterprise | 10000 | Per minute |

**Headers:**
```
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1705312200
```

## Versioning
- Version in URL path: `/v1/resources`
- Major versions for breaking changes
- Deprecation notice: `Deprecation` header

## OpenAPI Specification

```yaml
openapi: 3.0.3
info:
  title: [API Name]
  version: 1.0.0
  description: [API description]

servers:
  - url: https://api.example.com/v1
    description: Production

security:
  - bearerAuth: []

paths:
  /resources:
    get:
      summary: List resources
      parameters:
        - name: page
          in: query
          schema:
            type: integer
            default: 1
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ResourceList'
    post:
      summary: Create resource
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/CreateResource'
      responses:
        '201':
          description: Created

components:
  securitySchemes:
    bearerAuth:
      type: http
      scheme: bearer
      bearerFormat: JWT

  schemas:
    Resource:
      type: object
      properties:
        id:
          type: string
          format: uuid
        name:
          type: string
        status:
          type: string
          enum: [active, inactive]
        createdAt:
          type: string
          format: date-time

    CreateResource:
      type: object
      required:
        - name
      properties:
        name:
          type: string
          minLength: 1
          maxLength: 100
        description:
          type: string
          maxLength: 1000
```
```

## Related Skills
- `/architecture` - Overall system architecture
- `/implement` - Implement the API
- `/test` - Generate API tests
