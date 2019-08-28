# Telegram Chatbot

## 사전 설정

- python 3.7

  - 가상환경 설정

    ```bash
    $ python -m venv venv
    $ source venv/Scripts/activate
    (venv) $
    ```

    - 항상 프로젝트 코드를 작성할 때에는 가상환경 활성화 여부를 확인할 것

  - pip

    - requests

    - python-decouple

    - flask

    - 현재 상태 기록

      ```bash
      $ pip freeze > requirements.txt
      ```

    - requirements.txt 내용 설치하기

      ```bash
      $ pip install -r requirements.txt
      ```

- git

  - .gitignore

    - venv/ : 가상환경 설정(Python)
    - .env : 환경변수
    - .vscode : IDE 설정

    등 프로젝트 소스코드와 무관한 내용들을 설정

- 환경변수

  - API Key 값이나, DB설정 혹은 github에 공개되면 안되는 값들
  - python에서 활용되는 python-decouple을 활용하여 .env 파일로부터 설정된 환경변수를 가져올 수 있음

## Telegram Webhook 설정

사용자가 보내는 메시지를 받아오기 위해서는 Flask 서버와 Telegram의 서버를 웹훅(webhook) 설정을 해야 한다.

`https://api.telegram.org/bot{token}/setWebhook?url={url}`

- URL 패턴 예시

  `https://nsdf33.ngrok.io/{token값}
  https://my-project.herokuapp.com/{token값}`

url을 만들기 위해서는 배포 및 도메인이 필요하지만, `ngrok`이라는 서비스를 통해서 로컬 서버에 도메인을 부여할 수 있다

```bash
$ ngrok http 5000
```

## Heroku에 배포하기

flask 서버가 24시간 동작하게끔 하기 위해서 배포 작업을 반드시 해야 한다. 헤로쿠를 통해 간단하게 `git`을 이용한 배포를 다음과 같이 진행한다.

### 1. 설정

 1. `Procfile` 생성

    `web: python app.py`

    Procfile은 확장자가 없다!

 2. `rumtime.txt` 생성

    `python-3.7.3`

### 2. 헤로쿠 서버 배포

```bash
$ heroku login
$ heroku create {프로젝트명}
```

- 중복된 프로젝트 명이나, 대문자 혹은 특수문자 사용시 프로젝트가 생성되지 않으므로 실행 결과를 반드시 확인
- 배포를 위해서는 현재까지 작성된 내용을 커밋

```bash
$ git push heroku master
```

- 배포가 완료된 이후에도 코드 수정 사항이 있으면 항상 커밋하고 push!
- 이후에 웹훅 설정을 heroku 주소로 변경하면, 24시간 동작하는 챗봇이 된다.
- 만약, 코드 수정사항이 있으면 개발을 위해 ngrok 주소를 웹훅 설정을 변경하고, 개발이 완료되면 heroku에 재배포 이후 heroku 주소로 웹훅 설정을 변경