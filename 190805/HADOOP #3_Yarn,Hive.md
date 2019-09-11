# HADOOP #3

[YARN: yet Another Resource Negotiator]

- Hadoop을 구성하는 컴포넌트 두가지 중 하나(다른 하나는 HDFS)

- 분산 컴퓨팅 환경을 제공

- 구성

  - Master
    - 클라이언트로부터 job을 요청받고 결과를 전달해주는 communication point로서의 역할을 수행하는 호스트
  - Woker host
    - Master 호스트로부터 working해야할 내용들을 전달받아 처리하는 역할
  - Resource Manager 
    -  Master 호스트에서 뜨는 데몬으로서 Client와 통신하는 역할
    - 클러스터에 있는 Worker 호스트들의 Resource를 트래킹하여 Job 실행에 필요한 Node Manager들을 컨트롤하는 역할
  - Node Manager
    - Worker 호스트에 존재하는 데몬
    - 실제로 Job을 처리하고 결과를 전달해주는 역할
    - 사용자가 요청한 프로그램을 실행하는 Container를 fork시키고 Container를 모니터링. 
    - Continer장애 상황 또는 COntainer가 요청한 Reource보다 많이 사용하고 있는지 감시
  - Container
    - YARN에서 쓰는 용어
    - Resource를 점유하는 하나의 단위
    - Job의 요청이 여러개의 Map/Reduce Task로 분리되어 Node Manger에게 할당되면 Node Manager는 그 요청을 처리하기 위해 하나의 Container를 실행
    - Container는 CPU, RAM 등의 자원을 점유하여 Task를 처리

- MapReduce 작업이 요청되어 처리되는 프로세스

  - YARN 클러스터에 job을 요청하는 경우(클러스터에서 Process를 Running하는) 

  1. Client가 Application을 실행하고 클러스터의 Resource Manager에게 보고
  2. Resource Manager는 Worker 노드 중에 하나를 골라 Container를 생성. 이 Container가 바로 Application Master가 된다.
  3. Application Master는 task를 실행할 컨테이너를 RM에게 요청
     - Application Master는 유휴한 자원을 소유한 노드의 Node Manager를 통해 task를 실행할 Container를 생성하
     -  task를 실행하는 Container는 task의 상태(status)를 Application Master에게 보고
  4. 모든 task가 종료 되면 AM도 종료되고 클러스터에 할당된  컨테이너의 자원도 모두 deallocated. Application client도 종료

  - YARN은 Application의 job을 분산환경에서 병렬 처리할 수 있도록 도와주는 클러스터링 서비스
  - Resource Manager, Application Master, Node Manager가 YARN에서의 주요 컴포넌트
  - 하나의 job을 처리하기 위해 여러 개의 task를 나누고, 이를 처리하기 위한  Container가 존재

- YARN에서 MapResuce 동작

  0. YARN 클러스터를 기동 start-yarn.sh

  1. Mapper, Reduce, Driver(main) 클래스 작성
  2. Driver(main) 클래스 실행
  3. YARN 환경에서는 Job별로 클러스터를 구성
  4. 요청된 MapReduce를 위한 클러스터 구성을 위해 1개의 Application Master가 필요, YARN의 ResourceManager에게 자원 요청
  5. YARN의 ResourceManager는 요청받은 ApplicationMaster를 자신이 관리하는 클러스터(여러개의 Node Manager) 중 하나의 서버를 선택하여 ApplicationMaster를 실행하고 이 서버를 client에게 보고
     - ApplicationMaster는 요청받은 Job의 종류에 따라 다르며 MapReduce에 사용되는 Application Master는 MRAppMaster(org.apache.hadoop.mapredue.v2.app)
  6. client는 ReduceManager로부터 받은 ApplicationMaster 서버에 Map Reduce 작업 요청
  7. MRAppMaster는 작업 요청을 받으면 사용자가 실행한 Mapreduce작업에 필요한 자원을 다시 ResourceManager에게 요청
  8. ResourceManager는 요청받은 자원에 대해 NodeManager를 지정하고 Container를 실행 후 Container목록을 MRAppMaster에게 준다.
  9. NodeManager에 의해 실행된 MapReduce Task를 위한 Container는 MRAppMaster와 통신을 하며 주어진 Map Task와 Reduce Task를 실행

  - 객체의 재활용은 MapReduce와 YARN의 버전업에 따라 처리 방식이 조금씩 다르다.


[Apache Hive]

- 데이터웨어 하우스 소프트웨어는 SQL을 사용하여 분산 스토리지(HDFS)에 있는 대규모 데이터 세트의 읽기, 쓰기 및 관리를 용이하게

- 스토리지에 있는 데이터에 스키마를 정의, 스키마 기반의 SQL을 사용해서 데이터 처리가 가능

- Hive에 연결하기 위한 명령과 JDBS 드라이버가 제공

- MapReduce 가반의 High-level abstration

  - SQL-like 언어 사용
  - Hadoop 클러스터에서 MapReduce job을 생성
  - Face Book에서 데이터 웨어하우스를 위해 개발

- Client Machine에서 동작

  - HiveQL 질의문을 MapReduce job으로 변환
  - jobs을 클러스터 등록

- 데이터 포맷과 위치를 가지고 있는 metastrore

  - 질의문 자체는 파일 시스템(HDFS)에 저장되어 있는 데이터에게 질의

- 데이터 레이크 

  - 조직에서 누구나 분석할 때 필요한 모든 원시 데이터를 저장하는 단일 저장소를 갖는 것
  - 데이터가 어떤 형태든, 데이터 소스가 제공하는 그대로의 원시 데이터를 저장, 분석하는 시점에 정의
  - 데이터 스키마에 대한 가정은 없으며, 각 데이터 소스는 원하는 스키마를 사용가능
  - 카탈로그 기능 : 어떤 데이터가 어디에 저장돼 있는지 카탈로그를 만들어 놓고, 분석이 필요할 때 그것을 보고 필요한 데이터가 있는 곳의 데이터에 접근하는 것

  - AWS의 데이터 레이크 S3(Simple Storage Service) : 데이터의 종류와 규모에 관계없이 담아둘 수 있다. 카탈로그 기능 Glue

- 데이터 웨어하우스(DW)

  - 사용자의 의사 결정에 도움을 주기 위해, 기간 시스템의 DB에 축척된 데이터를 공통의 형식으로 변환해서 관리하는 DB
  - 데이터만이 아닌 분석 방법까지도 포함하여 조직 내 의사 결정을 지원하는 정보 관리 시스템
  - 구성 : 관리 하드웨어, 관리 소프트웨어, 추출 변환 정렬 도구, 데이터 베이스 마케팅 시스템, 메타 데이터, 등
  - 특징 
    - 주제지향적(subjectoriented) : 데이터를 주제별로 구성함으로써 최종 사용자와 전산에 약한 분석자라도 이해하기 쉬운 형태가 되는 것
    - 통합적(integrated) : 데이터가 데이터 웨어하우스에 들어갈 때는 일관적인 형태로 변환되는 것
    - 시계열적(timevarient) : 데이터 웨어하우스의 데이터는 일정 기간 동안 정확성을 표현
    - 비휘발적(nonvolatile) : 데이터 웨어하우스에 일단 데이터가 적재되면 일괄 처리 작업에 의한 갱신 이외에는 insert나 delete 등의 변경이 수행되징 않는다.

- 데이터 마트

  - 데이터 웨어하우스 환경에서 정의된 접근계층, 데이터 웨어하우스에서 데이터를 꺼내 사용자에게 제공하는 역할
  - 데이터 워어하우스의 부분이며, 대개 특정한 조직 혹은 팀에서 사용하는 것이 목적

  - DW는 중앙 집중식 데이터 집합체를 의미, 데이터 마트는 데이터 저장소의 역할
  - 사용 목적에 맞는 접근성과 사용성을 강조
  - 즉각적인 요구를 충족시킨다는 목표

