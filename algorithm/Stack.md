# Stack

"접시를 쌓듯이 자료를 차곡차곡 쌓아 올린 형태의 구조"

- 후입선출(Last-In-First-Out)의 구조
  - push() : 삽입 연산 
    1. top>=max(stack의 크기)라면 OverFlow
    2. 아니라면 top의 위치에 삽입, top++
  - pop() : 삭제 연산
    1. top<=0이라면 EmptyStack
    2. 아니라면 top--, top의 위치의 원소를 반환

**①** stack 인터페이스

```java
puvlic interface Stack{
    int push(int x);
    int pop();
    void clear();
    int peek;
    boolean isEmpty();
}
```

**②** 1차원 배열로 구현한 stack

- 크기 변경이 어렵고, 메모리의 낭비가 생길 수 있다.

- isFull()는 연결리스트로 구현하는 경우 필요하지 않게 된다.

  *ArrayStack.java*

  ```java
  public class ArrayStack implements Stack{
  	private int max;			
  	private int top;	
  	private int[] stk;		
  	public class EmptyStackException extends RuntimeException {
  		public EmptyStackException() { }
  	}
  	public class OverflowStackException extends RuntimeException {
  		public OverflowStackException() { }
  	}
  	public ArrayStack(int capacity) {
  		top = 0;
  		max = capacity;
  		try {
  			stk = new int[max];			
  		} catch (OutOfMemoryError e) {	
  			max = 0;
  		}
  	}	
      @Override
  	public int push(int x) throws OverflowStackException {// 스택에 x를 푸시
  		if (top >= max)									
  			throw new OverflowStackException();
  		return stk[top++] = x;
  	}
  	@Override// 스택에서 데이터를 팝(정상에 있는 데이터를 꺼냄)
  	public int pop() throws EmptyStackException {
  		if (top <= 0)									
  			throw new EmptyStackException();
  		return stk[--top];
  	}
  	@Override// 스택에서 데이터를 피크(정상에 있는 데이터를 들여다봄) 
  	public int peek() throws EmptyStackException {
  		if (top <= 0)									
  			throw new EmptyStackException();
  		return stk[top - 1];
  	}
      @Override
  	public void clear() {// 스택을 비움
  		top = 0;
  	}
      @Override
  	public boolean isEmpty() {// 스택이 비어 있는가?
  		return top <= 0;
  	}
  	public boolean isFull() {// 스택이 가득 찼는가?
  		return top >=  max;
  	}
      // 스택 안의 모든 데이터를 바닥 → 꼭대기 순서로 출력
  	public void dump() throws EmptyStackException{
  		if (top <= 0)
  			throw new EmptyStackException();
          System.out.println("<Stack>");
  		for (int i = 0; i < top; i++)
  			System.out.print(stk[i] + " ");
  		System.out.println();
  		
  	}
  }
  ```

**③** 연결리스트로 구현한 스택

- 배열로 구현한 스택의 단점을 해결할 수 있다.

  *StackNode.java*

  ```java
  public class StackNode{
  	int data;
      StackNode next;
  }
  ```

  *LinkedStack.java*

  ```java
  public class LinkedStack implements Stack{
      private StackNode top;
      public LinkedStack(){
  		this.top = null;
      }
      public class EmptyStackException extends RuntimeException {
  		public EmptyStackException() { }
  	}
      @Override
      public void push(int data) {
          StackNode node = new StackNode();
          node.data = data;
          node.next = top;
          top = node;
      }
  	@Override
      public int pop() throws EmptyStackException{
  		if(isEmpty())
              throw new EmptyStackException();
          StackNode node = top;
          top = node.next;            
          return node.data; 
      }
      @Override
      public void clear() throws EmptyStackException{
  		if(isEmpty())
              throw new EmptyStackException();
          top = top.next;
      }
      @Override
      public int peek() throws EmptyStackException {
  		if (isEmpty)									
  			throw new EmptyStackException();
  		return top.data;	
      	
      }
  	@Override
  	public boolean isEmpty(){
          return (top==null);
      }
  	public void dump()throws EmptyStackException{
  		if(isEmpty())
              throw new EmptyStackException();
          StackNode node = top;
          System.out.println("<Stack>");
          while(node.next!=null){
              System.out.print(node.data+ " ");
              node = node.next;
          }
          System.out.println(node.next);
      }
  }
  ```

### stack의 응용

1. **역순 문자열 만들기**

   - 스택의 LIFO 성질을 이용하여 역순 문자열을 생성할 수 있다.

2. **수식의 괄호 검사**

   - 수식은 일반적으로 연산자와 피연산자로 구성되어 있고, 왼쪽에서 오른쪽으로 처리한다.
   - 연산자의 우선순위에 따라 높은 우선순위를 가진 연산자를 먼저 처리한다.
   - () -> {} -> [] 으로 우선순위를 가진다.
   - 여러개의 괄호가 중첩된 경우 가장 안쪽의 괄호를 먼저 처리한다.

   - 수식을 읽으면서

     ​	a. 왼쪽 괄호를  만나면 스택에 *push*

     ​	b. 오른쪽 괄호를 만나면 스택을 *pop*

     ​		if  현재 검사중인 괄호와 pop한 괄호의 종류가 다르다면 틀린 수식

     ​		else 같다면 옳은 수식

     ​	c. 읽는 게 모두 끝났을 때 스택에 남아있는 수식이 없다면 모든 괄호가 올바르게 쌍을 이루고 있는 			것이므로 수식이 올바르다 할 수 있다.

   - *Formula.java*

   ```java
   public class Fomula{
       private String exp;
       private int expSize;
       private char testCh, openPair;
       public boolean testPair(String exp){
   		this.exp = exp;
           LinkedStack stack = new LinkedStack();
           expSize = this.exp.length();
           
           for(int i = 0; i<expSize;i++){
               testCh = exp.charAt(i);
               
               switch(testCh){
                   case '(':
                   case '[':
                   case '{' :
                       stack.push(testCh);
                       break;
                   case ')':
                   case ']':
                   case '}':
                       if(stack.isEmpty()){
                           return false;
                       }else{
                           openPair = stack.pop();
                            if((openPair=='(') && (testCh!=')') || 
                          		(openPair=='[') && (testCh!=']') || 
                        		(openPair=='{') && (testCh!='}')){
                          	 	return false;
                            }else{
   							break;	
                            }
                       }
               }
           }
           if(stack.isEmpty()){
   			return true;
           }else{
               return false;
           }
       }
   }
   ```

3. **수식의 포기법 - 전위, 후위 중위**

   - 연산자의 위치에 따라 표기법이 나뉜다. 서로 변환 가능하다.
   - 컴퓨터 내부에서 수식을 처리하기에 가장 효율적인 방법은 후위 표기법이다.
     1. 전위 표기법(Prefix Notation) +AB
        - 연산자를 앞에 표기하고 그 다음에 피연산자를 표기하는 방법
     2. 중위 표기법(Infix Notation) A+B 
        - 연사자를 피연산자의 가운데에 표기하는 방법
     3.  후위 표기법(Postfix Notation) AB+
        - 연산자를 피연산자 뒤에 표기하는 방법

   - 중위 표기법 -> 전위표기법

     1. 수식의 각 연산자에 대해서 우선순위에 따라 괄호를 사용하여 다시 표현한다.

        ((A*B)-(C/D))

     2. 각 연산자를 그에 대응하는 왼쪽 괄호의 앞으로 이동시킨다.

        -( *(A B) / (C D))

     3. 괄호를 제거한다.

   - 중위 표기법 ->후위표기법

     1. 수식의 각 연산자에 대해서 우선순위에 따라 괄호를 사용하여 다시 표현한다.

        ((A*B)-(C/D))

     2. 각 연산자를 그에 대응하는 오른쪽 괄호의 뒤로 이동시킨다.

        ((A B) * (C D) / ) - 

     3. 괄호를 제거한다.

        AB*CD/-

        - *Formula.java*

          ```java
          public void toPostfix(String infix){
              char testCh;
              exp = infix;
              int expSize = exp.length();
              LinkedStack stack = new LinkedStack();
              
              for(int i = 0; i<expSize; i++){
                  testCh = exp.charAt(i);
                  switch(testCh){
                      case '0': case '1': case '2': case '3': case '4':
                      case '5': case '6': case '7': case '8': case '9':
                          System.out.print(testCh);
                          break;
                      case '+': case '-': case '/': case '*':
                          stack.push(testCh);
                          break;
                      case ')' : 
                          System.out.println(stack.pop());
                          break;
                      default:
                  }
              }
              while(!stack.isEmpty())
                  System.out.print(stack.pop());
          }
          ```

   - 후위 표기 수식의 연산

     1. 피연산자를 만나면 스택에 삽입한다.
     2. 연산자를 만나면 필요한 만큼의 피연산자를 스택에서 pop하여 연산하고, 연산 결과를 다시 스택에서 삽입한다.
     3. 수식이 끝나면, 마지막으로 스택을 pop하여 출력한다.

     - *Test.java*

       ```java
       public class Test{
           public static void main(String[] args){
       		String postfix = "35*62/-";
               evalPostfix(postfix);
           }
           public static void evalPostfix(String postfix){
               char testCh='';
               int expSize = postfix.length();
               int num1 = 0, num2 = 0;
               LinkedStack stack = new LinkedStack();
               for(int i =0; i<expSize; i++){
                   testCh= postfix.charAt(i);
                   if(testCh=='+'||testCh=='-'||testCh'*'||testCh=='/'){
                       num2 = stack.pop();
                       num1 = stack.pop();
                       
                       switch(testCh){
                           case '+' :
                               stack.push(num1+num2);
                               break;
                           case '-' :
                               stack.push(num1-num2);
                               break;
                           case '*' :
                               stack.push(num1*num2);
                               break;
                           case '/' :
                               stack.push(num1/num2);
                               break;
                       }
                   }else{
                       stack.push(testCh-'0');
                   }
               }
               System.out.println("결과값: "+stack.pop());
           }
       }
       ```

       

[출처] https://songeunjung92.tistory.com/18 