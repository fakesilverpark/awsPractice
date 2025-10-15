#!/bin/bash
set -e

# 배포 타임스탬프 환경변수 설정
export DEPLOY_TIME=$(date +%Y%m%d%H%M%S)

# FastAPI 릴리스 폴더 생성
mkdir -p /home/ubuntu/fastapiapp/releases/${DEPLOY_TIME}

echo "✅ FastAPI 배포 디렉터리 생성 완료: /home/ubuntu/fastapiapp/releases/${DEPLOY_TIME}"
