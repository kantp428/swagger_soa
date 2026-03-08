# API Docs — Swagger UI

โปรเจกต์นี้ใช้สำหรับ deploy Swagger UI จาก OpenAPI spec ของคุณ

---

## 📁 โครงสร้างไฟล์

```
swagger-docs/
├── index.html        ← Swagger UI หน้าเว็บ
├── openapi.json      ← OpenAPI spec ของคุณ
├── Dockerfile        ← Docker image
├── nginx.conf        ← Nginx config (CORS + routing)
└── docker-compose.yml
```

---

## 🚀 วิธี Deploy

### วิธีที่ 1 — GitHub Pages (ฟรี ไม่ต้อง server)

1. สร้าง GitHub repo ใหม่ เช่น `my-api-docs`
2. Push ไฟล์ทั้งหมดในโฟลเดอร์นี้ขึ้นไป
3. ไปที่ **Settings → Pages**
4. เลือก Source: **Deploy from a branch**
5. เลือก branch: `main` และ folder: `/ (root)`
6. กด **Save**

✅ Swagger จะขึ้นที่: `https://<your-username>.github.io/<repo-name>/`

---

### วิธีที่ 2 — Docker (รันบน server)

```bash
# Build และรัน
docker compose up -d

# เปิด browser ที่
http://localhost:8080
```

---

### วิธีที่ 3 — Docker บน Server จริง (Production)

```bash
# SSH เข้า server แล้วรัน
git clone https://github.com/<your-username>/<repo-name>.git
cd <repo-name>
docker compose up -d
```

แล้วตั้ง reverse proxy (nginx/caddy) ชี้ไปที่ port 8080

---

## ⚙️ อัปเดต API Spec

แก้ไฟล์ `openapi.json` แล้ว push ขึ้น GitHub → GitHub Pages จะ deploy ให้อัตโนมัติ

อย่าลืมอัปเดต `servers.url` ใน `openapi.json` ให้ตรงกับ domain จริง:

```json
"servers": [
  {
    "url": "https://api.yourdomain.com",
    "description": "Production"
  }
]
```
