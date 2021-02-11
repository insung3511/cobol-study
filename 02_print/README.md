# DISPLAY
## 기초 문법
굉장히 *Easy* 하면서도 이걸 *왜..?* 싶은 부분들이 많다. 사실 이 시기에 누가 코볼 공부를 하나 싶어 궁금하긴 하지만 일단 적는다.

다른 언어와 달리 코볼은 세미콜론 즉, 코드의 마무리는 **.** 으로 끝난다. 코드를 보여주면서 설명하는게 더 빠를거 같다.

__Code__
```
IDENTIFICATION DIVISION.
PROGRAM-ID. Print-dispaly.

PROCEDURE DIVISION.
    DISPLAY 'This is how print text.'.
    DISPLAY "Using by 'DISPLAY' function..".
    
STOP RUN.
```
__Result__
```
This is how print text.
Using by 'DISPLAY' function..
```
DISPLAY 함수가 바로 출력 함수이다. 별 어려운건 없다. 단, ''와 ""를 헷갈리면 코드를 짤때 골치 아플 수 있으니 주의..

위에 코드를 보면 알 수 있듯, __""__ 와 __''__ 의 차이는 별반 없다. 단 만약에 결과창에 __''__ 을 출력하고 싶다면 __""__ 을 통해 출력을 해주면 된다. ~~이래도 이해가 안되면 코드를 봐봐...~~

생각보다 설명을 더 할게 없다.