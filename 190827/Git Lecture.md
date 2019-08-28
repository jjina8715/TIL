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

### 원격 저장소(github) 활용하기

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

### 충돌 해결하기(Merger conflict)

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

```
- HEAD : 현재 작업하고 있는 곳(Local B)
- 해쉬값 : pull을 통해 받아온 변경사항(origin)
- 해당하는 위치를 찾아서 직접 수정을 진행함
```
7. merge conflict 해결 commit 남기기

```bash
$ git status
$ git add .
$ git commit -m 'Merge conflict 해결'
```

8. 원격 저장소로 push

```bash
$ git push origin push
```

### Branch 활용하기

`git init`을 하였을 때 `(master)`는 사실 master 브랜치에 있다라는 사실을 보여주고 있는 것이다.

1. branch 생성

   ``` bash
   (master) $ git branch {branch 이름}
   (master) $ git branch
   *master
   {branch 이름}
   ```

2. branch 이동

   ```bash
   $ git checkout {branch 이름}
   ```

   위 두 명령어를 동시에 실행하려면

   ```bash
   $ git checkout -b {branch 이름}
   ```

3. branch 삭제

   ```bash
   $ git branch -d {branch 이름}
   ```

4. branch 병합

   ```bash
   (master) $ git merge feature/main
   ```

   `master` branch 에 `feature/main`을 병합한다. 

   항상 병합하고 싶은 대상의 브랜치로 이동 후 진행해야 한다.

### Git merge

#### 1. Fast-fowarding

실제로 브랜치를 나눈 후 master 브랜치에 커밋이 발생하지 않았고, 단순히 커밋만 옮기면 되는 경우, merge 커밋이 발생하지는 않음.

#### 2. Auto Merge

브랜치를 나눈 이후에 master 브랜치에 커밋이 발생하였으나, 동일한 파일이 수정되지 않아서 자동으로 병합되는 경우, merge 커밋이 발생

```bash
$ git log --graph --oneline
$ git log --graph --oneline
*   85cd33b (test) Merge branch 'feature/main'
|\
| * 42df5bb Complete main feature
* | 90cf6e6 README
|/
* 98aa976 Init css/js
```

#### 3. Merge conflict 발생

브랜치를 나눈 이후에 master 브랜치에 커밋이 발생하였고, 동일한 파일이 각자 브랜치에서 수정된 경우 자동으로 merge 되지 않는다. 따라서 merge conflict가 발생하고 직접 수정 후 커밋을 해야 한다.

```bash
$ git merge feature/main
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md
Automatic merge failed; fix conflicts and then commit the result.
```

Git 은 충돌이 발생한 파일에 아래와 같이 표기를 해준다. 해당 부분을 찾아서 수동으로 해결해야 한다. 충돌 위치를 파악하기 위해서 `git status`를 통해 확인하자

```txt
<<<<<<< HEAD
Master 수정
=======
Branch 수정
>>>>>>> feature/footer
```

```bash
$ git add .
$ git commit
```

커밋을 하게 되면, merge 커밋이 발생

```bash
$ git log --graph --oneline
*   4ef20fb (HEAD -> master) Merge branch 'feature/footer'
|\
| * 9701912 (feature/footer) Complete footer
* | c932f24 README
|/
*   85cd33b (test) Merge branch 'feature/main'
```

### Git stash

현재 변경 사항을 담아 둘 수 있는 임시 공간이 존재

1. 현재 변경사항 담기

   ```bash
   $ git stash
   $ git stash list
   ```

2. 임시 저장사항 불러오기

   ```bash
   $ git stash pop
   ```

   위의 명령어는 `apply + drop`과 동일하다.

## git commit message 

[blog.ull.im](https://blog.ull.im/engineering/2019/03/10/logs-on-git.html)

[meetup.toast.com](https://meetup.toast.com/posts/106)