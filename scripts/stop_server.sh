#!/bin/bash
set -e

# FastAPI 서비스 중지 (없을 경우 무시)
systemctl stop fastapi || true

echo "✅ FastAPI 서비스 중지 완료"
