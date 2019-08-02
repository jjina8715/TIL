# HADOOP #2

[Hadoop HDFS 주요 API] [사이트](http://hadoop.apache.org/docs/r2.7.7/api/index.html?org/apache/hadoop/fs/package-summary.html)

- org.apache.hadoop.conf.Configuration
  - void addResource(String name) : 설정 리소스를 추가
  - void set(String name, String value) : key와 value 값을 설정
- org.apache.hadoop.fs.Path
  - FileSystem getFileSystem(Configuration conf) : NameNode에 의해 관리되는 FileSystem객체 리턴
- org.apache.hadoop.fs.FileSystem
  - FSDataInputStream open(Path f) / create(Path f) / create(Path f, boolean overwrite) / append(Path f) : 지정된 Path 객체에 대한 FSDataInputStream 객체를 리턴 
  - boolean delete(Path f, boolean recusive) : 경로에 해당되는 파일을 삭제
  - boolean exists(Path f) : 경로가 존재하는지 여부를 반환
  - static FileSystem get(Configuration conf) : 주어진 Configuration에 대한 FileSystem 객체를 반환
  - FileStatus getFileStatus(Path f) : FileStatus 객체를 반환
  - boolean isDirectory(Path f) : 경로가 디렉토리인지의 여부를 리턴
  - boolean isFile(Path f) : 경로가 파일인지의 여부를 리턴
  - static FileSystem newInstance(Configuration conf) : 주어진 Configuration에 대한 FileSystem 객체를 리턴
- org.apache.hadoop.fs.FileStatus
  - int getBlockSize() : 파일의 블록 사이즈를 반환
  - long getLen() : 파일의 길이(바이트 단위)를 반환

[Hadoop MapReduce]

- 구글에서 대용량 데이터 처리를 분산 병렬 컴퓨팅에서 처리하기 위한 목적으로 제작하여 2004년 발표한 소프트웨어 프레임워크
- 페타바이트 이상의 대용량 데이터를 신뢰도가 낮은 컴퓨터로 구성된 클러스터 환경에서 병령 처리를 지워하기 위해서 개발
- Hadoop 클러스터의 데이터를 처리하기 위한 시스템을 총 2개(Map, Reduce)의 단계로 구성. Map과 Reduce 사이에는 shuffle과 sort라는 단계가 존재
- 각 Map task는 전체 데이터 셋에 대해서 별개의 부분에 대한 작업을 수행. 기본적으로 하나의 HDFS block을 대상으로 수행
- 모든 Map task가 종료되면, MapReduce 시스템은 중간(intermediate) 데이터를 Reduce단계를 수행할 노드로 분산하여 전송
- Distributed File System에서 수행되는 MapReduce 작업이 끝나면 HDFS에 파일이 써지고, MapReduce 작업이 시작할 때는 HDFS로부터 파일을 가져오는 작업이 수행
- 처리개념 
  1. 데이터를 분할해서 각각 Map 태스크에 전달
  2. Map 태스크가 병행하여 각 데이터를 처리, 작업 분답을 위한 키(key) 설정
  3. 각 Map 태스크별로 같은 키를 가진 데이터를 가진 데이터를 모은 후, 다시 한 번 전체적으로 키별로 데이터를 모은다.
  4. Reduce 태스크가 병행하여 키별 데이터 처리를 수행
- 응용
  1. 비슷한 특성의 사람 찾기
     - 사용자 속성 정보로부터 특성을 계산
     - (특성, 사용자) key-value 중간 데이터 생성
     - 같은 특성을 가진 사용자 집한 출력
  2. 키워드를 추출한 문서 인덱스 작성
     - 포함된 키워드와 문서 쌍에서 키워드별로 병합
     - 키워드를 포함하는 문서 리스트
  3. 이미지 데이터 분산처리(개인 정보 모자이크 처리)
     - 각각의 이미지 처리에 다른 이미지가 필요 없으므로 
       - 독립적으로 처리 가능
       - map 함수만으로 처리가 완결
- 정리
  - MapReduce는 데이터를 개별로 가공 및 필터링하거나, 어떤 키 값에 기반해 데이터를 분류하거나, 분류한 데이터를 통계치를 계산하는 등, 수많은 데이터 처리에서 사용되고 있는 기법들을 일반화하고 있다. 
  - map() : 처리 대상 데이터 전체를 하나씩,  하나씩 처리. 처리 대상 데이터 간에 의존관계가 없고 독립적으로 실행가능하며 처리나 순서를 고려하지 않아도 되는 처리에 적합 (전처리)
  - map : (K1, V1) -> list(K2, V2)
    - 
  - reduce() : 키와 연관된 복수의 데이터가 전달. 함수에 전달되는 데이터는 키값으로 정렬. 그룹화된 복수의 데이터를 필요로 하는 처리 또는 순서를 고려해야 하는 처리에 적합(그룹별 합계)
  - reduce : (K2, list(V2)) -> list(K3, V3)

