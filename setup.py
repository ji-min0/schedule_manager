# 파이썬의 패키지를 만들고 설치하기 위한 설정 파일
from setuptools import setup

setup(
    name="myschedule",
    version="1.0.0",
    description="일정 관리 프로그램",
    author="Your_name",
    install_requires=[
        "pymysql",
        "cryptography"
    ],
    entry_points={
        "console_scripts": [
            "myschedule=schedule_manager:main"
        ]
    }
)