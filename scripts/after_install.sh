#!/bin/bash
set -e

# 최신 릴리스를 current로 연결
cd /home/ubuntu/fastapiapp/releases
LATEST=$(ls -1dt */ | head -n1 | tr -d '/')
ln -sfn /home/ubuntu/fastapiapp/releases/$LATEST /home/ubuntu/fastapiapp/current

# 가상환경 생성/업데이트 + 의존성 설치
python3 -m venv /home/ubuntu/fastapiapp/venv || true
source /home/ubuntu/fastapiapp/venv/bin/activate

# pip 최신화 및 의존성 설치
pip install --upgrade pip
pip install --no-cache-dir -r /home/ubuntu/fastapiapp/current/requirements.txt

# FastAPI 필수 런타임 패키지 보장 (혹시 requirements 누락 시)
pip install fastapi uvicorn[standard] gunicorn

# 권한 정리
chown -R ubuntu:ubuntu /home/ubuntu/fastapiapp

echo "✅ FastAPI after_install 완료 (릴리스: $LATEST)"
