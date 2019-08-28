# Git Lecture

- git init
- git add .
- git commit

### Git 되돌리기

#### commit message 수정

```bash
$ git commit --amend 
```

- vim editor
- push, 원격저장소에 올린 이후에는 진행하면 충돌이 무조건 발생
- commit을 다시 하게 되면 해시값이 변경되기 때문

#### Staging area(INDEX)에서 취소하기

```bash
$ git reset HEAD programmers/
$ git status
```

#### git 이력에서 특정 파일 삭제 commit

```bash
$ git rm --cached 파일명
```

- 한번도 커밋된 이력이 없을 때에는 staging area에서 취소와 동일
- 다만, 커밋에 포함된 적 있는 경우에는 삭제 커밋이 됨(실제 파일은 삭제되지 않음)

#### 특정 파일 포함해서 다시 커밋

```bash
$ git add a.py
$ git commit -m 'a,b 추가'
$ git add b.py
$ git commit --amend
```

- commit 메시지를 수정하기 전에 staging area에 변경을 해주면, 해당 파일까지 포함하여 다시 커밋을 진행

 #### 현재 작업 내역 커밋 시점으로 되돌리기

- 특정 파일을 삭제하였거나 혹은 코드 수정 과정에서 오류가 많이 발생하여 직전 커밋 시점 상태로 돌아가고 싶을 때 사용 가능

```bash
$ git checkout -- 파일명/폴더명
```

#### 올리지 않을 파일

.gitignore : commit하지 않을 파일명, 폴더명

#### 원격 저장소(github) 활용하기

```bash
$ git remote add github {url}
```

- 원격 저장소 등록

```bash
$ git remote -v
```

- 등록된 원격저장소

```bash
$ git push origin master
```

- 원격 저장소에 push

```bash
$ git remote rm origin
```

- 등록된 원격 저장소 삭제

```bash
$ git clone {url}
```

- 원격 저장소 복사
- 로컬에 원격 저장소를 받아오고 싶다면, clone를 통해 가져온다
- 이후에는 push - pull을 통해 업데이트

###  충돌 해결하기(Merger conflict)

> 기본적으로 push-pull하는 과정에서 동일한 파일의 다른 이력이 기록될 경우 충돌이 발생
>
> 다른 파일이 수정되는 경우 fast-forwarding을 통해 자동으로 merge되기도 함
>
> 이러한 오류를 발생시키지 않으려면, 항상 작업 하기 전에 pull을 확인하고 작업 및 커밋을 한 이후에 push를 하는 습관

1. Local A에서 a.txt 작성 후 commit

2. Local A에서 원격저장소(origin)로 push

3. Local B에서 pull하지 않은 상태에서 a.txt의 동일한 라인 작성 후 commit

4. Local B에서 원격저장소(origin)로 push → push되지 않음

5. 해결(원격저장소 변경사항 Local B에서 방영)

   ```bash
   $ git pull origin master
   ```

6. 충돌 발생(동일 파일 수정시)

   - 어떤 파일에서 충돌되었는지 확인하는 명령어

   ```bash
   $ git log --online --left-right --p
   ```

   - Git에서 직접 충돌 파일에 기록을 남겨줌

   ```
   <<<<<<< HEAD
   집 수정 내용
   =======
   멀캠 수정 내용
   >>>>>>> 12dfas12sadf124fdsa
   ```

   	- HEAD : 현재 작업하고 있는 곳(Local B)
   	- 해쉬값 : pull을 통해 받아온 변경사항(origin)
   	- 해당하는 위치를 찾아서 직접 수정을 진행함

7. merge conflict 해결 commit 남기기

```bash
$ git status
$ git add .
$ git commit -m 'Merge conflict 해결'
```



### git commit message 

[blog.ull.im](https://blog.ull.im/engineering/2019/03/10/logs-on-git.html)

[meetup.toast.com](https://meetup.toast.com/posts/106)