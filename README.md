# API Docs - Swagger UI

Project นี้ใช้สำหรับ deploy Swagger UI จาก OpenAPI spec ในไฟล์ `new.openapi.json`

## Files

```text
swagger_soa/
|-- index.html
|-- new.openapi.json
|-- Dockerfile
|-- nginx.conf
`-- docker-compose.yml
```

## Run with Docker

```bash
docker compose up -d
```

เปิดที่ `http://localhost:8080`

## Deploy Notes

- หน้า Swagger โหลด spec จาก `new.openapi.json`
- ถ้าจะเปลี่ยน base URL ของ API ให้แก้ `servers.url` ใน `new.openapi.json`
- `docker-compose.yml` และ `Dockerfile` ถูกตั้งให้ใช้ `new.openapi.json` แล้ว
