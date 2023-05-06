# 묵찌빠 게임

## 묵찌빠란?
- 묵찌빠는 가위바위보를 하고 그 승패 결과에 따라 턴을 결정하게 됩니다.
- 가위바위보를 한 번 더 해서 자신의 턴 일때 상대방과 같은것을 내면 이기고 반대로 상대의 턴 일때 같은것을 내면 지게 됩니다.

<br>


# 목차
- 팀원 소개
- 타임라인
- 다이어그램
- 실행화면
- 트러블슈팅
- 팀 회고

<br>

# 팀원과 리뷰어
### 팀원
- JusBug
![IMG_8062](https://user-images.githubusercontent.com/124647187/236610201-989894c5-484f-4e57-9725-a548643e3644.png)

<br>

- idinaloq
![스크린샷 2023-04-24 오후 4 47 09](https://user-images.githubusercontent.com/124647187/236610239-5c3bab17-dbe4-4880-b50b-306d4ef41b76.png)

<br>

### 리뷰어
- Rowan
<br>

# 타임라인
|날짜|내용|
|---|---|
|23.05.01|순서도 작성|
|23.05.02|가위바위보의 메뉴, 숫자 입력, 숫자 비교 함수 생성, 가위바위보 게임 구현|
|23.05.03|기존 main파일에 작성했던 파일들을 분할하고 묵찌빠 메뉴, 턴 결정함수 생성 및 비교함수 수정|
|23.05.04|턴 변경과 턴 출력하는 함수 추가, 묵찌빠 비교함수 수정, 가위바위보와 묵찌빠 게임시작 방식 수정|
|23.05.05|게임시작 함수 변경, 예외처리와 개항 수정, 변수, 함수 네이밍 변경, 묵찌빠 게임 구현|
|23.05.06|enum 및 네이밍, 개항 수정, 예외처리 수정|

<br>

# 다이어그램
![Rps_game_jusbug_idinaloq2](https://user-images.githubusercontent.com/124647187/236599882-3039edcd-d915-41e0-80a2-027a96df1035.png)

<br>

# 실행화면
- 가위바위보 시작화면
![스크린샷 2023-05-06 오후 2 22 48](https://user-images.githubusercontent.com/124647187/236601916-5e4e7ba0-8891-42c7-b58c-1cd370d8ea7d.png)

- 가위바위보를 이겼을 때
![스크린샷 2023-05-06 오후 2 22 59](https://user-images.githubusercontent.com/124647187/236601915-02dfaf24-a7fb-4e37-9aa5-84b0d8440f3c.png)


- 잘못된 입력일 때 
![스크린샷 2023-05-06 오후 2 23 08](https://user-images.githubusercontent.com/124647187/236601914-44eb9dbd-e6ff-4232-bee9-dde2365410fc.png)

- 승패가 결정났을 때
![스크린샷 2023-05-06 오후 2 24 06](https://user-images.githubusercontent.com/124647187/236601911-58bc2045-88b1-4f00-8613-c24472ab67ee.png)

<br>

# 트러블 슈팅

## Error raised at top level 오류
### 문제점 1
- 코드가 정상적으로 실행이 되고 있을 때는 상관없지만, 잘못 실행되는 경우 ```Erorr raised at top level``` 오류 발생
- 가위바위보 시작함수 -> 숫자 입력함수 -> 첫 번째 숫자 비교함수 순으로 진행될 때 숫자 입력함수 내에서 throw를 진행하고 다른 함수들은 try만 시도
- 맨 윗단에 try catch를 진행하고 catch 구문에 올바르지 않은 입력인 경우 다시 가위바위보 시작함수를 호출
- 몇 번 정도는 잘못 입력해도 상관없으나, 수십 번 이상 잘못 입력하게 되면  처리되지 않은 에러의 스택이 쌓여 스레드 에러가 발생

### 문제점 2
- 게임이 끝날 때 종료되지 못하는 문제 발생

### 해결방법
- try만 하고 catch를 처리하지 못한 채 다시 재귀해서 같은 함수를 불러오는 과정에서 기존의 에러가 발생한 코드는 계속 실행되고 있는 상태였기 때문에 input 함수를 제거하고 무분별하게 사용된 try 횟수를 줄이는 방향으로 수정
- 에러가 발생한 코드 블럭이 정상적으로 종료될 수 있도록 다시 함수를 불러오는 것이 아닌, while문을 이용해 함수가 정상 종료되고 다시 호출될 수 있도록 수정
- while문을 이용하는 과정에서 조건을 추가하여 게임이 정상적으로 종료될 수 있도록 수정

<br>

# 팀 회고

### 우리팀 잘한 점
- 짝프로그래밍을 함께 진행하면서 역할을 바꾸기 전에 이해가 안된 부분을 서로 질문하는 시간을가지면서 진행 과정을 빠지지 않게 캐치한 점이 좋았습니다. 
- 또한 step 1과 step2를 진행하기에 앞서 순서도를 작성해보며 생각을 정리했더니 더욱 수월하게 페어 활동을 이어갈 수 있었다고 생각합니다.

### 우리팀 개선할 점
- 디버깅 할 때 문제가 발생하면 그 문제의 원인이 무엇인지 바로 찾아내는 역량이 부족하다는 것을 느꼈습니다. 
- 기본적인 기능들을 구현하는데 있어서는 큰 문제 없이 진행했으나 예외처리 문제에서 문제의 원인을 찾지 못해 시간을 다소 소요한 점이 아쉬웠습니다.
- 이번 팀 활동을 통해서 디버깅 에러를 해석할 줄 아는 것 또한 매우 중요하다는 것을 몸소 느꼈고 다양한 에러 메시지에 대한 지식과 경험의 필요성을 깨닫게 되었습니다.

### 서로에게 좋았던 점
- 짝프로그래밍 중, 이디나로크가 네비게이터 역할을 맡을 때 단지 코드 작성에만 치중하는 것이 아니라 왜 이렇게 작성을 했는지에 대한 이유와 설명이 뒤따라와줘서 드라이버로서 저 또한 작성을 하면서 짝의 의도를 바로 캐치할 수 있었던 점이 매우 좋았습니다.
- 프로젝트를 진행할 때 가장 중요하게 생각하는게 시간 배분과 문제해결을 위한 노력이라고 생각합니다. 공식적으로 지정된 시간 이외의 시간도 활용하고, 서로 연락하면서 혼자 고민하는 것이 아닌 같이 이야기 할 수 있었다는게 정말 좋았다고 생각합니다.

### 서로에게 아쉬웠던 점
- 저는 개인적으로 프로그래밍을 하며 중간중간 휴식을 통해 스스로 생각을 정리하며 refresh 하는 것이 매우 중요하다고 생각합니다. 물론 문제들을 바로바로 해결해서 빨리 끝내는 것이 가장 이상적이지만 아무리 코딩을 잘 하는 개발자들도 언제나 문제를 직면하고 고민하는 시간을 갖기에 이디나로크도 이 부분에 있어서 너무 급박하게 느끼지 않고 여유를 가졌으면 좋겠다는 생각을 하게 되었습니다.
