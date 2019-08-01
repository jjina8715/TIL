# HADOOP

- 클러스터
  - 여러 대의 컴퓨터들이 연결되어 하나의 시스템처럼 동작하는 컴퓨터들의 집합
- 분산 컴퓨팅 시스템
- Hadoop HDFS 명령어
  - hdfs dfs -ls /[디렉토리명 또는 파일명]
    - 지저된 디렉토리의 파일리스트 or 지정된 파일의 정보
  - hdfs dfs -lsr/[디렉토리명]
    - ls + 서브디렉토리들의 파일 리스트
  - hdfs dfs -mkdir /디렉토리명
    - 지정된 디렉토리를 생성
  - hdfs dfs -cat /[디렉토리/]파일명
    - 지정된 파일의 내용을 화면에 출력
  - hdfs dfs -put 사용자계정로컬파일 HDFS디렉터리[/파일]
    - 지정된 사용자계정 로컬 파일시스템의 파일을 HDFS 상 디렉터리의 파일로 복사
  - hdfs dfs -get HDFS디렉터리파일 사용자계정로컬 디렉터리[/파일]
    - -put 반대
  - hdfs dfs -rm /[디렉토리/]파일
    - 지정된 파일을 삭제
  - hdfs dfs -rmr /리렉토리
    - 지정된 디렉터리를 삭제. 비어 있지않은 디렉터리, 서브디렉터리도 삭제
  - hdfs dfs -tail/[디렉토리]/파일
    - 지정된 파일의 마지막 1kb 내용을 화면에 출력
  - hdfs dfs -chmod 사용자허가모드 /[디렉토리명 또는 파일명]
    - 지정된 디렉터리 또는 파일의 사용자 허가 모드를 변결

[HDFS Read Process]

1. cilent는 FileSystem(DistributeFileSystem) 객체의 open() 메소드를 호출하여 읽기 요청을 시작
2. FileSystem(DistributeFileSystem) 객체는 RPC를 사용해 NameNode에 연결하고 파일 블록의 위치 정보를 담고 있는 메타 데이터 정보를 가져온다.
3. 이 메타 데이터에는 읽고자 하는 파일의 블록에 대한 사본이 저장되어 있는 DataNode의 주소가 저장
4. DataNode의 주소를 받으면 FSDataInputStream 유형의 객체가 클라이언트에 리턴
5. FSDataInputStream 객체는 DFSInputStream을 포함하고 있으며 읽기 관련 메서드가 호출되면 가장 우선순위가 높은 데이터 노드에서 해당 블록 read
6. 블록의 끝 부분에 도달하면 DFSInputStream은 연결을 닫고 다음 블록의 다음 DataNode를 찾는다.
7. client가 읽기를 완료하면 close() 메소드를 호출

[HDFS Write Process]

1. client는 새로운 파일을 생성하는 DistributeFileSystem 객체의 create() 메소드를 호출하여 쓰기 작업을 시작
2. DistributedFileSystem 개체는 RPC 호출을 사용하여 NameNode에 연결하고 새 파일 만들기. 만들고 작업에 파일과 어떤 블록도 연관시키지 않는다. 
   - NameNode의 책임은 생성되는 파일이 이미 존재하지 않고 클라이언트가 새 파일을 생성할 수 있는 올바른 권한을 가지고 있는지 확인하는 것
   - 파일이 이미 있거나 클라이언트에 새 파일을 작성할 수 있는 충분한 권한이 없는 경우 IOException이 클라이언트에 발생
   - 그렇지 않으면 작업이 성공, NameNod에 의해 파일에 대한 새 레코드가 생성
3. NameNode의 새 레코드가 만들어지면 FSDataOutputStream 유형의 개체가 클라이언트에 반환. 클라이언트는 이를 사용하여 HDFS에 데이터를 쓴다. 데이터 쓰기 메소드가 호출
4. FSDataOutputStream은 DataNodes 및 NameNode와의 통신을 살펴 보는 DFSOutputStream 개체를 포함. 클라이언트가 계속 데이터를 쓰는 동안 DFSOutpurStram은 이 데이터로 패킷을 계속 작성. 이러한 패킷은 DataQueue라고 하는 대기열에 포함
5. DataStreamer라는 구성요소도 DataQueue를 사용. DataStreamer는 NameNode에 새 블록 할당을 요청하여 복제에 사용할 바람직한 DataNode를 선택
6. DataNode를 사용해 파이프 라인을 생성하여 복제 프로세스를 시작. 파이프라인에 복제 수준에 맞춰 DataNode가 있다.
7. DataStreamer라는 패킷을 파이프 라인의 첫번째 DataNode에 집어 넣는다. 
8. 파이프 라인의 모든 DataNode는 받은 패킷을 저장. 파이프 라인의 다음 DataNode로 전달
9. 또 다른 큐 'Ack Queue'는 DFSOutputStream 에 의해 유지되어 DataNode로부터 확인을 기다리는 패킷을 저장
10. 대기열에 있는 패킷에 대한 수신 확인이 파이프 라인에 모든 DataNode로부터 수신되면 Ack 대기열에 제거. DataNode가 실패할 경우 이 큐의 패킷을 사용해 작업을 다시 시작
11. 클라이언트가 데이터 쓰기를 완료하면 close() 메서드 를 호출하여 close()를 호출하여 남아있는 데이터  패킷을 파이프 라인을 플러시하고 승인 대기
12. 최종 승인을 받으면 NameNode에 연락하여 파일 쓰기 작업이 완료되었음을 알림