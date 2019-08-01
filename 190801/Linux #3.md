# Linux #3

- 데몬(daemon) :백그라운드에서 수행중인 프로그램. xxxxd
- start-dfs.sh 
- ps -ef : 시스템에서 실행되고 있는 모든 프로세스 정보 --> jps(JVM process Status)

[예제 : 4개의 머신]

- master : NameNode
- slave1 : ScondaryNameNode, DataNode
- slave2 : DataNode
- slave3 : DataNode

<hr>

- HDFS : 저장소



- 리눅스의 명령어

  - ln : 하드링크 생성 (원본 파일의 inode와 같은 inode)
    - -s : 심볼릭 링크 생성(data에 원본 파일 포인터가 저장)

  파일압축

  - xz : 확장면 xz로 합축 / 해제
    - -d : 해제
    - -l : 압축 파일에 포함된 파일 목록과 압축률 등을 출력
    - -k : 원본 파일 보존
  - bzip2 : 확장명 bz2로 압축
    - -d  : 해제 = bunzip2
  - gzip : 확장명 gz 압축
    - -d : 해제 = gunzip
  - zip : Windows용과 호환되는 확장명 zip으로 압축
    - unzip : 해제

  파일 묶기

  - tar : 확장명 tar로 묶음 파일(아카이브)을 만들거나 묶음을 푼다.
    - c 새로운 묶음
    - x 묶인 파일을 푼다
    - t 묶음을 풀기 전에 묶인 경로를 보여준다.
    - C 지정된 디렉터리에 압축을 푼다.
    - f (필수) 묶음 파일 이름 지정
    - v 과정을 보여준다
    - J tar +xz
    - z tar+gzip
    - j tar+bzip2

  파일 위치 검색

  - find : 특정 파일의 위치를 검색하는 명령어
    - -name 이름, -user 소유자, -newer 전, 후, -perm 허가권, -size 크기
    - -print (defalut), -exec (외부명령 실행)
  - which : PATH에 설정된 디렉터리만 검색
  - whereis : 실행 파일, 소스, man 페이지 파일까지 검색
  - locate : updatedb명령어를 1회 실행 후 실행. 파일 목록 DB에서 검색하기에 빠르고 유용

