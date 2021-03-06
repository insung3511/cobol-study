# Variable
## 기초적인 선언문
코볼에서는 C언어 같은 선언 방식이 아닌 좀 특이한 방식의 (개인적으로는 특이하다고 생각함) 선언 방식을 지니고 있다. 하지만 오래된 언어의 특성 때문인지 변수 생성의 Type을 정해줄 때에는 확실하게 정해준다.

변수를 생성할 때 에는 __PIC__ (PICture) 란은 함수를 통해 생성을 해준다. 생성을 할 때에는 다음과 같이 한다.

```
01 any-number PIC 9(3).
```
이렇게 하면 any-number 라는 3자리 수 숫자가 하나 생성이 되는거다. 하지만 어떤 형식의 변수를 생성하냐에 따라 PIC 뒤에 오는 숫자 혹은 문자들이 달라진다.

생성자 지정은 아래 표와 같은 방식으로 진행 한다.

|생성방식|변수 형식|
|------|---------|
|9|숫자|
|A|알파벳|
|X|알파벳 및 숫자|
|S|기호|
|V|양수의 소수|
|P|소수|

사실 V와 P가 헷갈릴수 있는데 이 부분은 예재 코드를 보면서 설명하겠다. 

```
01 any-number   PIC 9(3).
01 any-num2     PIC S9(3)V9(2).
01 any-num3     PIC PP99.
01 any-word     PIC A(5).
01 any-word2    PIC X(3).
```
이렇게 총 5개의 변수를 생성을 하였다. 

any-number를 하나하나 읽어가보자. PIC 9 으로 했다는 것은 숫자를 의미한다. 그런데 그 숫자의 크기는 얼마 했는가? 코볼에서는 자리수로 따진다. C언어에서는 생성자에 따라 다르다면 코볼은 자리수 개념이다. 지금 __PIC 9(3)__ 으로 되어 있기 때문에 __총 3자리 수 숫자__ 이다. 이해가 되는가? 

any-num2 는 any-number와는 확연히 다르다. PIC S9(3)V9(2)라고 생성을 하고 출력을 하면 결과 값은 000.00 이다. 감이 오는가? S9(3)은 소수점 앞의 숫자 3자리를 말하고 V9(2)는 소수점 뒤의 숫자들을 의미한다.

any-num3는 P의 독특한 성격으로 인해 생성이 굉장히 독특하다. PP99의 출력을 하면 사실 결과값은 .0000이다.

여기서 알 수 있듯 코볼은 숫자의 크기가 따로 생성자에 따라 정해진 것이 아니라 자리수를 몇으로 하냐에 따라 다르다. 그렇기 때문에 코드를 작성할 때 조심을 해야할 것이 있다.
```
01 testing-num PIC 9(5).
```
이런 변수가 있다고 하자. 근데 만일 내가 이 변수에다가 100이라는 숫자를 넣게 되면 출력값은 어떻게 될까?

```
00100
```
으로 된다. 무슨 말인지 이해가 되는가? 오른쪽부터 숫자가 채워지고 만일 채워지지 않은 변수는 0이 그대로 있다는 것이다. 

변수 생성을 했지만 우리는 아직 변수에 숫자를 넣진 않았다. 그럼 숫자는 어떻게 넣는걸까?

## 변수에 값 넣기
__VALUE__ 라는 문법을 활용한다. 여러 위키에서 입을 모아 말을 하듯 코볼은 영어와 비슷한 문법을 지니고 있는 것이 가장 큰 특징이라고 할 수 있다. 예제를 보면서 설명하는게 가장 빠를거 같다.

```
01 exam-num1 PIC 9(3) VALUE IS 123.
01 exam-num2 PIC X(3) VALUE 'ABC'.
01 exam-zero PIC 99 VALUE ZERO.
```
총 3개의 변수가 있다. 아까와 다른 점은 VALUE 라는 문구가 추가 되었다. VALUE는 해당 변수의 값을 넣을 때 활용을 하게 된다. 

exam-num1을 예시로 보자. __VALUE IS 123__ 이라는 문구를 통해 exam-num1 이라는 변수에는 123 이라는 숫자가 들어가게 된다.

exam-num2는 보면 __IS__ 라는 단어가 없다. 사실 IS 라는 문구는 변수에 확실하게 지정을 해주고 싶다면 넣어도 되고 코드 작성자 판단하에 작성을 해주면 된다. ~~원래 자기 맘이지 뭐..~~ PIC X(3) 을 통해서 문자 형식의 3자리 문자가 들어가는데 들어간 문자는 ABC가 들어가게 된다.

exam-zero는 사실 결과 값부터 말하면 00이다. VALUE ZERO는 말 그대로 00을 짚어 넣은 것이다. NULL 같은 개념이지만 사실 코볼에는 NULL이 없다. 애초에 레코드를 따지는 언어에서 무슨 NULL을 찾는가...

## 변수의 계층 개념
코볼의 가장 특이하고 이해하는데 비교적으로 좀 오래 걸렸던 부분 중 하나인 변수 계층 개념이다. 그룹화와 개인화의 느낌이라고 생각을 하며 그나마 쉽다. 그래도 이해가 안된다면 디렉토리라고 생각을 하면 될 것 같다. 

계층을 나눌 때에는 숫자를 활용을 하는데 해당 숫자들은 아래와 같은 숫자들을 활용을 하게 된다.

|계층 번호|역할|
|-------|---|
|01|레코드|
|02 ~ 49|그룹화 변수|
|66|이름변경시 쓰임
|77|나눌 수 없는 숫자를 말함
|88|아직 뭔지 모르겠음요..|

계층 구조(?) 를 알아야 헷갈리지 않는다. 하지만 아직 77에서 88 까지는 쓰질 않아서 많이는 쓰이지 않을거 같다.

가장 이해가 빠른 예제 코드를 통해서 설명을 하겠다.

```cobol
01  some-record.                   
           05  num            PIC 9(10).  
           05  the-date.                  
               10  the-year   PIC 9(4).   
               10  the-month  PIC 99.     
               10  the-day    PIC 99.     
```
다음과 같은 코드가 있다고 할 때 그룹 항목과 기초 항목에 해당 되는 변수가 존재하게 된다.

some-record의 기초 항목은 num이 된다. 그럼 the-date는 어떻게 되는가? the-date는 the-year, the-month, the-day의 그룹항목이 되고 the-date와 some-record의 기초항목은 the-year, the-month, the-day 라고 생각하면 된다. 

이게 헷갈리면 간단히 디렉토리 구조라고 생각을 하면 쉽게 와닿게 될 거다... 폴더 안에 폴더.. 폴더 안에 파일들.. 이런 느낌..?

여기서 우리는 기초 항목과 그룹 항목을 나눌때 변수 앞에 변수의 줄 번호를 선언하여 해당 변수의 항목을 종속 시켜 주었다.

|숫자|해당 숫자의 역할|
|--|----------|
|01|레코드|
|05|그룹 항목|
|10|기초 항목|

하지만 사실 이렇게 외우는 것을 추천 하지는 못한다. 왜냐하면 반드시 기초 항목이 생성이 되어야 변수를 사용 할 수 있는 것은 아니다. 즉, 레코드(01) 또한 변수로 사용이 될 수 있고 그룹 항목 또한 기초 항목으로 쓰일 수 있다는 것이다.
