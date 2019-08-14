#문제1
exam1<-function(x,y){
  if(x<y){
    tmp<-y
    y<-x
    x<-tmp
  }
  return(x-y)
}
exam1(10,20); exam1(20,5);
#문제2
exam2<-function(x, y, z){
  if(y=="+"){
    result<-x+z
  }else if(y=="-"){
    result<-x-z
  }else if(y=="*"){
    result<-x*z
  }else if(y=="%/%"|y=="%%"){
    if(x==0)
      result<-"오류1"
    else if(z==0)
      result<-"오류2"
    else {
      if(y=="%/%"){
        result<-x%/%z
      }else{
        result<-x%%z
      }
    }
  }else{
    result<-"규격의 연산자만 전달하세요"
  }
  return(result)
}
exam2(1,"+",3)
exam2(0,"*",2)
exam2(0,"%/%",2)
exam2(1,"%%", 0)
exam2(8,"%/%",2)
exam2(5,"%%", 2)
#문제3
exam3<-function(x, y="#"){
  if(x>0){
    for(i in 1:x)
      cat(y);
  }
}
exam3(2)
exam3()
exam3(5, "$")
exam3(-2, "@")
#문제4
exam4<-function(x){
  for(i in x){
    if(is.na(i)){
      print("NA는 처리불가")
    }else {
      if(i>=85&i<=100){
        result<-"상"
      } else if(i>=70&&i<=84){
        result<-"중"
      }else if(i>=0&&i<=69){
        result<-"하"
      }
      print(paste(i,"점은 ",result,"등급입니다.", sep=""));
    }
  }
}
exam4(c(36, 3, 4,NA , 66, 67,97))
#문제5
countEvenOdd<-function(x){
  if(!is.numeric(x)){
    return()
  }
  even<-0
  odd<-0
  for(i in x)
    if(i%%2==0){
      even<-even+1
    } else{
      odd<-odd+1
    }
  return(list("even"=even, "odd"=odd))
}
countEvenOdd(c(2,3,4,5))
countEvenOdd(c(2,3,4,"d"))
#문제6
vmSum<- function(x){
  tryCatch({
    if(is.vector(x)&&!is.list(x)){
      if(is.numeric(x)){
        result<-0
        for(i in x)
          result<-result+i
        return(result)
      }else{
        warning("숫자 벡터를 전달하숑!")
      }
    }else{
      stop("벡터만 전달하숑")
    }
  },warning = function(w){
    print(w)
    return(0)
  }, error = function(e){
    print(e)
  })
}
vmSum(c(4,5,6))
vmSum(list(3,3,4))
vmSum(array(1:30, dim=c(2,3,5)))
vmSum(c("3", "2"))
#문제7
createVector<-function(...){
  x<-list(...)
  if(is.null(x))
    return(x)
  else{
    for(i in x){
      if(is.character(i))
        char<-append(char,i)
      else if(is.numeric(i))
        num<-append(num, i)
      else if(is.logical(i))
        lo<-append(lo, i)
    }
    return(list("char"=char, "num"=num, "lo"=lo))
  }
}
createVector(3,4,5,"ee", TRUE, "abc")
createVector()
#문제8
data<-scan("iotest1.txt")
cat("오름차순 :", sort(data),
    "\n내림차순 :", sort(data, decreasing = TRUE),
    "\n합 :",sum(data),
    "\n평균 :",mean(data))
#문제9
text<-scan("iotest2.txt", what="")
count<-table(text)
name<-names(sort(count, decreasing = TRUE))[1]
cat("가장 많이 등장한 단어는 ",name,"입니다.",sep="")
