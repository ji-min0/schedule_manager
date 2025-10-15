# 📅 일정 관리 프로그램 (MySchedule)

**MySchedule**은 간단한 **터미널 기반 일정 관리 프로그램**입니다.  
일정을 추가하고, 조회하고, 완료 처리할 수 있으며, MySQL과 연동하여 데이터베이스에 안전하게 저장됩니다.

---

## 🛠️ 주요 기능

- 일정 추가: 제목, 설명, 시작/종료 시간 입력
- 일정 조회: 등록된 일정 목록 확인
- 일정 완료 처리: 특정 일정 완료 상태로 변경
- MySQL DB 연동
- Docker 기반 개발 환경 제공
- CLI 명령어를 통한 실행 지원

---

## 📂 프로젝트 구조

```bash
.
├── schedule_manager.py       # 메인 애플리케이션 로직
├── setup.py                  # 패키지 설치 설정 파일
├── requirements.txt          # 의존성 명세 파일
├── docker-compose.yaml       # Docker 설정
├── init.sql                  # 초기 DB 스키마 및 데이터 생성 스크립트
└── Makefile                  # 편리한 명령어 모음
```

---


## 🚀 빠른 시작
### 1. 환경 준비

- Docker & Docker Compose 설치
- Python 3.7 이상 설치 권장
- make 명령어 사용 가능한 환경 (Unix 계열 OS 권장)

### 2. 프로젝트 클론
```
git clone https://github.com/jimin-0/schedule_manager.git
cd schedule_manager
```

### 3. Docker로 MySQL 실행
```
make up
```

초기 설정:
포트: 3307
사용자: root
비밀번호: 1234
DB 이름: schedule_db
초기 데이터는 init.sql을 통해 자동 생성됩니다.

### 4. 패키지 설치
```
make install
```

### 5. 프로그램 실행
```
make run
```

또는 CLI 명령어로 실행:
```
myschedule
```

---


## 💾 데이터베이스 스키마
```
CREATE TABLE schedules (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(200) NOT NULL,
  description TEXT,
  start_datetime DATETIME NOT NULL,
  end_datetime DATETIME,
  is_completed BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---


## 🧪 사용 예시
```
1. 일정 추가
2. 일정 보기
3. 일정 완료
4. 종료
선택: 1
제목: 회의
설명: 프로젝트 회의
시작 시간(yyyymmddhhmmss): 20251016140000
종료 시간(yyyymmddhhmmss): 20251016150000
일정이 추가됨.
```

---


## ⚙️ Makefile 명령어 요약

### 명령어	설명
- make up	Docker 컨테이너 시작
- make down	Docker 컨테이너 종료
- make restart	Docker 컨테이너 재시작
- make logs	로그 확인
- make status	컨테이너 상태 확인
- make clean	볼륨 포함 완전 삭제
- make install	파이썬 패키지 설치
- make run	프로그램 실행

---


## 📦 패키지 정보

setup.py에 등록된 정보:
- 이름: myschedule
- 버전: 1.0.0
- 설명: 일정 관리 프로그램
- 설치 필요: pymysql, cryptography
- 콘솔 명령어: myschedule

---


## 📌 참고 사항
- start_datetime과 end_datetime은 yyyymmddhhmmss 형식으로 입력
- 완료된 일정은 is_completed 플래그로 표시
- DB 연동 실패 시 예외 메시지를 출력하고 종료
