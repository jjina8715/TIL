# Thread

1. 프로세스&쓰레드(process&thread)

   - 프로세스 : 실행중인 프로그램(메모리), 자원(resource)과 쓰레드로 구성
     - 싱글 쓰레드 프로세스 : 자원 + 쓰레드
     - 멀티 쓰레드 프로세스 : 자원 + 쓰레드 + ... +쓰레드
   - 쓰레드 : 프로세스 내에서 실제 작업을 수행
     - 모든 프로세스는 하나 이상의 쓰레드를 보유

2. 멀티 프로세스 vs. 멀티 쓰레드

   - 하나의 새로운 프로세스를 생성하는 것보다 하나의 새로운 쓰레드를 생성하는 것이 더 적은 비용
   - 멀티 쓰레드 
     - 장점 
       - 자원을 보다 효율적으로 사용 가능
       - 사용자에 대한 응답성(responseness)이 향상
       - 작업이 분리되어 코드가 간결
     - 단점
       - 동기화(synchronization)에 주의
       - 교착상태(dead-lock)가 발생하지 않도록 주의
       - 각 쓰레드가 효율적으로 고르게 실행될 수 있게 해야 한다.

3. 쓰레드의 구현방법과 실행

   1. Thread Class를 상속(getName())
   2. Runnable Interface를 구현 (Thread.currentThread().getName())
      1. Runnable r = new RunnableClass();
      2. Thread t = new Thread(r);

   - start() : 실행 함수, java.lang.Thread
   - run() : 오버라이딩 함수

4. 쓰레드의 우선 순위(priority of thread)

   - 작업의 중요도에 따라 쓰레드의 우선순위를 다르게 하여 특정 쓰레드가 더 많은 작업을 갖도록 할 수 있다.

5. 쓰레드 그룹(Thread Group)

   - 서로 관련된 쓰레드를 그룹으로 묶어서 다루기 위한 것
   - 모든 쓰레드는 반드시 하나의 쓰레드 그룹에 포함되어 있어야 한다.
   - 그룹을 지정하지 않으면 생성한 쓰레드는 main 쓰레드 그룹에 속한다
   - 자신을 생성한 쓰레드(조상 쓰레드)의 그룹과 우선순위를 상속받는다.

   | 생성자/메서드                                | 설명                                                         |
   | -------------------------------------------- | ------------------------------------------------------------ |
   | ThreadGroup(String name)                     | 지정된 이름의 새로운 쓰레드 그룹을 생성                      |
   | ThreadGroup(ThreadGroup parent, String name) | 지정된 쓰레드 그룹에 포함되는 새로운 쓰레드 그룹을 생성      |
   | int activeCount()                            | 쓰레드 그룹에 포함된 활성 상태에 있는 쓰레드의 수를 반환     |
   | void destroy()                               | 쓰레드 그룹과 하위 쓰레드 그룹까지 모두 삭제(비어있으면)     |
   | int getMaxPriority()                         | 쓰레드 그룹의 최대우선순위를 반환                            |
   | String getName()                             | 쓰레드 그룹의 이름의 반환                                    |
   | ThreadGroup getParent()                      | 쓰레드 그룹의 상위 쓰레드 그룹을 반환                        |
   | void interrupt()                             | 쓰레드 그룹에 속한 모든 쓰레드를 interrupt                   |
   | boolean isDaemon()                           | 쓰레드 그룹이 데몬 쓰레드 그룹인지 확인                      |
   | boolean isDestroyed()                        | 쓰레드 그룹이 삭제되었는지 확인                              |
   | void list()                                  | 쓰레드 그룹에 속한 쓰레드와 하위 쓰레드 그룹에 대한 정보 출력 |
   | boolean parentOf(ThreadGroup g)              | 지정된 쓰레드 그룹의 상위 쓰레드 그룹인지 확인               |
   | void setDeamon(boolean daemon)               | 쓰레드 그룹을 데몬 쓰레드 그룹으로 설정/해제                 |
   | void setMaxPriority(int pri)                 | 쓰레드 그룹의 최대우선순위를 설정                            |

6. 데몬 쓰레드(daemon thread)

   - 일반 쓰레드의 작업을 돕는 보조적인 역할을 수행
   - 일반 쓰레드가 모두 종료되면 자동적으로 종료
   - garbage collector, 자동 저장, 화면자동갱신 등에 사용
   - 무한루프와 조건문을 이용해서 실행 후 대기하다가 특정 조건이 만족되면 작업을 수행하고 다시 대기하도록 작성
   - boolean isDaemon() : 데몬쓰레드이면 true 반환
   - void setDaemon(boolean on) : 쓰레드를 데몬 쓰레드 또는 사용자 쓰레드로 변경(on이 true이면 데몬 쓰레드)
     - 반드시 start()를 호출하기 전에 실행
     - 그렇지 않으면 IllegalThreadStateException발생

7. 쓰레드의 실행제어

   | 생성자/메서드                                                | 설명                                                         |
   | ------------------------------------------------------------ | ------------------------------------------------------------ |
   | void interrupt()                                             | sleep()이나 join()에 의해 일시정지상태인 쓰레드를 실험대기상태로 만든다. InteruptedException이 발생 |
   | void join() / void join(long millis) / void join(long millis, int nanos) | 지정된 시간동안 쓰레드가 실행.                               |
   | void  resume()                                               | suspend()에 의해 일시정지상태에 있는 쓰레드를 실행대기상태로 |
   | static void sleep(long millis) / static void sleep(long millis, int nanos) | 지정된 시간동안 쓰레드를 일시정시                            |
   | void stop()                                                  | 쓰레드를 즉시 종료                                           |
   | void suspend()                                               | 쓰레드를 일시정지''                                          |
   | static void yield()                                          | 실행 중에 다른 쓰레드에세 양보하고 실행대기 상대             |

8. 쓰레드의 상태(Thread status)

   - NEW : 쓰레드가 생성되고 아직 start()가 호출되지 않은 상태
   - RUNNABLE : 실행 중 또는 실행 가능한 상태
   - BLOCKED : 동기화 블럭에 의해서 일시정지된 상태(lock이 풀릴 때까지 기다리는 상태)
   - WAITING, TIMED_WAITING : 쓰레드의 작업이 종료되지 않았지만 실행가능하지 않은(unrunnable) 일시정지상태. TIMED_WAITING은 일시정지시간이 지정된 경우를 의미
   - TERMINATED : 쓰레드의 작업이 종료된 상태

9. 쓰레드의 동기화 

   - synchronized : 한 번에 하나의 쓰레드만 객체에 접근할 수 있도록 객체에 lock을 걸어서 데이터의 일관성을 유지하는 것
     - synchronized (객체의 참조 변수) { .......... }
     - public synchronized void methodname() { ............ }
   - 동기화 효율 상승 
     - Object 클래스에 정의되어 있으며, 동기화 블록 내에서만 사용 가능
     - wait() : 객체의 lock을 풀고 해당 객체의 쓰레드를 waiting pool에 넣는다.
     - notify() : waiting pool에서 대기중인 쓰레드 중의 하나를 깨운다.
     - notifyAll() : waiting pool에서 대기중인 모든 쓰레드를 깨운다.