# HADOOP #4_Spark

- DAG(Directed Acyclic Graph)
  - 방향성 비 사이클, 방향을 가지고 루프를 생성하지 않는 그래프

[Apache Spark]

- 오픈 소스 클러스터 컴퓨팅 프레임워크
- spark 하나를 설치하면 batch, streaming, graph processing, sql 등의 처리가 가능
- Java, Scala, python, SQL, R언어의 API를 제공하기 때문에 언어적인 선택의 폭이 넓다

[Spark 특징]

- High-Level Tools
- Spark SQL for SQL
- Hadoop의 Hive가 아닌 Spark SQL을 통해 SQL을 MapReduce없이 빠르게 처리 가능
- 구조적 데이터 프로세싱
  - Json, Parquet, DataFrame
    - Parquet : 파켓, Apache Parquet은 Apache Hadoop 에코 시스템의 무료 오픈 소스 열 기반 데이터 저장 형식
- MLib for machine learning
  - Classification, Regression, Abnormal Detection, Clustering 등의 다양한 machine learning algorithm을 제공
- GraphX for graph processing
  - graph processing을 지원하는 GraphX를 제공
- Spark Streaming
  - batch processing 외에도 streaming 처리가 가능
- Launching on a Cluster
  - Sparks를 클러스터에도 동작하게 하기 위해서는 cluster manager(yarn) 가 필요

[Spark 종류]

- Standalone Deploy Mode
- Apache Mesos
- Hadoop Yarn
- Kubernetes
- Cloude

[RDD]

- Resilient Distributed Datasets

  -  A Fault-Tolerant Abstraction for In-Memory Cluster Computing
- disk 기반 데이터 처리의 성능 문제 해결

  - 인메모리 기반 데이터 처리
- 간단한 인터페이스 지원

  - Spark에서는 내부적으로 연산하는 데이터들을 모두 RDD 타입으로 처리
  - Spark application 개발은 3가지 부분에 대한 이해가 바탕
    - RDD
    - RDD 변환 API (Scala / Python / java / R interface)
    - RDD 변환 API로 만들어진 SQL/ML/graph/stream Library (Scala / Python / java / R interface)
- 분산처리, scalability, reliability 보장

  - Immutable, partitioned collections of record
  - 변하지 않는, 분산된 레코드들의 집합
    - Immutable : 만들어진 뒤엔 불변
    - Partitioned : 데이터 셋을 잘라 분산
- RDD를 제어하는 API operation 

  - Transformation : RDD에서 새로운 RDD를 생성하는 함수
    - 연산의 수행 결과가 RDD
  - 변환, 필터링 등의 작업들 : map, flatMap, filter, groupByKey, reduceByKey, mapValues, sample, union, distinct, sortByKey, ...
    - lineage를 만들어가는 과정, 관련 메서드를 호출하여 연산을 요청해도 실제 수행은 되지 않고 연산 정보만 보관
- Action : RDD에서 RDD가 아닌 타입의 data로 변환하는 함수
    - 연산의 수행결과가 정수, 리스트, 맵 등 RDD가 아닌 타입
    - first, count, collect, reduce
    - Linage를 실행하고 결과를 생성
  

- Lineage : operation의 순서를 기록해 DAG로 표현하는 것

  1. fault-tolerant 확보
     - 계보(lineage)기록 → 동일한 RDD를 생성 가능
     - RDD의 copy가 아니라, Lineage만 보관해도 복구가 가능
     - 일부 계산 코스트가 큰 RDD는 디스트에 Check pointing
     - reliability  확보
  2. Lazy-execution 가능
     - 인터프리터에서 Transformation 명령어를 읽어 들일 때는 단순히 lineage만 생성
     - Action 연산이 실행되기 전에는 Tranformation 연산이 처리되지 않는 것을 의미
     - Action 명령어가 읽히면, 쌓여있던 linage 실행

  - Lazy-execution과 Lineage를 활용함으로써 처리 효율을 높이고 클러스터 중 일부 고장으로 작업이 실패해도 Lineage를 통해 데이터를 복구

-  RDD객체
  - Spark 에서 처리되는 데이터는 RDD객체로 생성하여 처리
    - 생성 방법 2가지
      1. Collection 객체 생성
      2. HDFS의 파일 read
  - 특징
    - Read Only
    - 1~n개의 partition으로 구성 가능
    - RDD의 연산은 Transformation 연산과 Action 연산으로 구분
      - Transformation : Lazy-execution 지원
      - lineage : fault tolerant를 확보
- SparkContext 객체
  - Spark 애플리케이션과 클러스터의 연결을 관리하는 객체
  - RDD 등 Spark에서 사용되는 주요 객체는 SparkContext객체를 통해 생성

| API             |                                 |                                                       |
| --------------- | ------------------------------- | ----------------------------------------------------- |
| Transformations | map(f : T ⇒ U)                  | RDD[T] ⇒ RDD[U]                                       |
|                 | filter(f : T ⇒ Bool)            | RDD[T] ⇒ RDD[T]                                       |
|                 | flatMap(f : T ⇒ seq[U])         | RDD[T] ⇒ RDD[U]                                       |
|                 | sample(fraction : Float)        | RDD[T] ⇒ RDD[T] (Deterministic sampling)              |
|                 | groupByKey()                    | RDD[(K, V)] ⇒ RDD[(K, Seq[V])]                        |
|                 | reduceByKey(f : (V, V) ⇒ V)     | RDD[(K, V)] ⇒ RDD[(K, V)]                             |
|                 | union()                         | (RDD[T], RDD[T]) ⇒ RDD[T]                             |
|                 | join()                          | (RDD[(K, V)], RDD[(K, W)]) ⇒ RDD[(K, (V, W))]         |
|                 | cogroup()                       | (RDD[(K, V)], RDD[(K, W)]) ⇒ RDD[(K, Seq[V], Seq[W])] |
|                 | crossProduct()                  | (RDD[T], RDD[U]) ⇒ RDD[(T, U)]                        |
|                 | mapValue(f : V ⇒ W)             | RDD[(K, V)] ⇒ RDD[(K, W)] (Preserves partitioning)    |
|                 | sort(c : Comparator[K])         | RDD[(K, V)] ⇒ RDD[(K, V)]                             |
|                 | partitionBy(p : Partitioner[K]) | RDD[(K, V)] ⇒ RDD[(K, V)]                             |
| Actions         | count()                         | RDD[T] ⇒ Long                                         |
|                 | collect()                       | RDD[T] ⇒ Seq[T]                                       |
|                 | reduce(f : (T, T) ⇒ T)          | RDD[T] ⇒ T                                            |
|                 | lookup(k: K)                    | RDD[(K, V)] ⇒ Seq[V] (On hash/range partitioned RDDs) |
|                 | save(path : String)             | Outputs RDD to a storage ssystem, e.g., HFDS          |

[예시]

- mapreduce

  ```scala
  scala> textFile = sc.textFile("HDFSFilepath")
  scala> words = textFile.flatMap(line => line.split(" ")) //transformation 
  scala> mapWords = words.map(word => (word,1)) //transformation 
  scala> redWords = mapWords.reduceByKey((a,b) => a+b) //transformation 
  scala> collection = redWords.collect() //action
  ```

  - "Dataset" → flatMap → map → reduceMap → collect → "output"

    "File:README.md" → RDD&lt;String>:textFile → RDD&lt;String>:words → RDD<(String,int)>:words → RDD<(String,int)>:words → array[(String, int)]:collection

- filter

  ```scala
  scala> textFile = sc.textFile("HDFSFilepath")
  scala> SparkLine = textFile.filter(line => line.contains("Spark")) //transformation 
  scala> lineCnt = SparkLine.count() //action
  ```

  - "Dataset" → Filter → Count → "output"

    "File:README.md" → RDD&lt;String>:textFile → RDD&lt;String>:SparkLine → int:lineCnt