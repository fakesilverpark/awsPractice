#!/bin/bash
set -e

# FastAPI Health Check
# /health 엔드포인트가 있으면 우선 확인, 없으면 루트(/) 확인
curl -fsS http://127.0.0.1:8000/health || curl -fsS http://127.0.0.1:8000/

echo "✅ FastAPI 서비스 검증 완료"
