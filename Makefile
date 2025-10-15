.PHONY: up down restart logs status clean install run help

# 기본 타겟
help:
	@echo "사용 가능한 명령어:"
	@echo "  make up       - Docker 컨테이너 시작"
	@echo "  make down     - Docker 컨테이너 종료"
	@echo "  make restart  - Docker 컨테이너 재시작"
	@echo "  make logs     - Docker 로그 확인"
	@echo "  make status   - Docker 상태 확인"
	@echo "  make clean    - Docker 볼륨 삭제"
	@echo "  make install  - Python 패키지 설치"
	@echo "  make run      - 일정 관리 프로그램 실행"

# Docker-compose 관련 명령어
up:
	docker-compose up -d

down:
	docker-compose down

restart:
	docker-compose restart

logs:
	docker-compose logs -f mysql

status:
	docker-compose ps

clean:
	docker-compose down -v
	docker system prune -f

# setup.py 등록 명령어
install:
	pip install -e .

run:
	python3 schedule_manager.py
	# python schedule_manager.py

connect:
	mycli -h localhost -P 3307 -u root -p 1234 schedule_db
