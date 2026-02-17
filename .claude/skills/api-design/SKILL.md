---
name: api-design
description: Creates detailed API contracts including endpoints, request/response schemas, error handling, and OpenAPI specifications
---

## Usage
```
/api-design [resource or feature]
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

## Endpoints

### List [Resources]
`GET /[resources]`

**Query Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| page | integer | No | Page number (default: 1) |
| limit | integer | No | Items per page (default: 20, max: 100) |
| sort | string | No | Sort field (e.g., "createdAt:desc") |

### Create [Resource]
`POST /[resources]`

**Request Body:**
```json
{
  "name": "string (required, 1-100 chars)",
  "description": "string (optional, max 1000 chars)"
}
```

**Response:** `201 Created`

## Error Responses

### Standard Error Format
```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human-readable error message",
    "requestId": "req_abc123"
  }
}
```

### Error Codes
| HTTP Status | Code | Description |
|-------------|------|-------------|
| 400 | VALIDATION_ERROR | Invalid request body |
| 401 | UNAUTHORIZED | Missing or invalid token |
| 403 | FORBIDDEN | Insufficient permissions |
| 404 | NOT_FOUND | Resource not found |
| 429 | RATE_LIMITED | Too many requests |
| 500 | INTERNAL_ERROR | Server error |

## Rate Limiting

| Tier | Limit | Window |
|------|-------|--------|
| Free | 100 | Per minute |
| Pro | 1000 | Per minute |
```

## Related Skills
- `/architecture` - Overall system architecture
- `/implement` - Implement the API
- `/test` - Generate API tests
