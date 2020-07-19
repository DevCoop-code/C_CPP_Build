# gcc로 컴파일 하는 방법

## 1. gcc 동작 과정
- gcc가 실행시키는 프로그램
  - cpp: 전처리기
  - cc1: 컴파일러
  - as: 어셈블러
  - ld: 링커

- 전처리 단계
  - 소스 파일(~~.c)에 gcc를 동작시키면 전처리기인 cpp가 동작, cpp는 소스 파일의 #include와 #define과 같은 #으로 시작되는 전처리기 부분을 처리. 필요한 헤더 파일을 삽입하고 실행 문장의 매크로를 상수로 변환함

- gcc working flow
<br><br>
<img src="images/gcc_pipeline.png" width="100%" height="50%">

## 2. gcc 실행하기
- gcc를 이용해 컴파일 하는 방법
  - $ gcc [source file name]
- gcc 자주 사용하는 옵션
  - '-o'
    - C 소스 코드를 컴파일 할 때 생성되는 출력 파일 이름을 지정하는 옵션
    - ex] $ gcc -o file file.c or $ gcc file.c -o file 
  - '-E'
    - 컴파일의 첫 단계인 전처리까지만 실행한 결과를 화면에 출력
    - ex] $ gcc -E file.c -o file.i
  - '-c'
    - 전처리, 컴파일, 어셈블까지 실행하여 오브젝트 파일(.o)를 생성
  - '-I'
    - 소스가 표준 디렉토리가 아닌 위치에 있는 헤더 파일을 가질 때 그 디렉토리 위치를 지정해줌
    - ex] $ gcc file.c -I [header directory path]
- 라이브러리
  - 표준 라이브러리 형태: lib{library name}.a
  - **ar** 명령어를 이용해 라이브러리가 어떠한 오브젝트 파일로 이뤄졌는지 알 수 있음
    - ex] $ ar t libc.a
  - 라이브러리 생성 방법
    - ex] 
    - $ gcc -c plus.c minus.c
    - $ ar r lib{library name}.a plus.o minus.o   // .a 파일 생성
    - $ ar s lib{library name}.a   // library 파일에 목록을 추가
  - '-ㅣ'
    - 표준 라이브러리가 아닌 라이브러리를 사용하고자 할 때 그 라이브러리를 지정해줌
    - ex] $ gcc [source filename] -l [library name]
    - library name지정시 'lib'과 '.a'는 뺀다
      - ex] -l libm.a -> -l m
  - '-L'
    - 사용할 라이브러리의 위치를 지정
    - ex] $ gcc [source file name] -L [library path]

## Reference
How to build using gcc: [Blog](https://seamless.tistory.com/2)