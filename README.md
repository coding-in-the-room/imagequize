# 누구나 문제를 만들어서 공유하고 풀수있는 스케치퀴즈!

# 프로세스

회원가입(register.html) → 회원가입 유효성 검사(regcheck.jsp) → 로그인(login.jsp) → 로그인 유효성 검사(logincheck.jsp) →

인덱스페이지(index.jsp) → 문제 제작(canvas.jsp) → 문제 제출(send.jsp) → 문제 풀기(viewquize.jsp) → 로그 제출 → 문제 정답 여부 확인(answercheck.jsp) →

다음 문제 이동(viewquize.jsp) 및 해당 계정 스코어 +1;

# DB Structure

imagedata [id(varchar(30)),src(longtext),num(int),answer(varchar(30))]
userinfo [id(varchar(30)),pw(varchar(30)),score(int)]
quizelog [num(int),id(varchar(30)),quizenum(int),userinput(varchar(30)),answer(varchar(30)),result(varchar(4)),time(datetime)]

# Update Log

#### 2020-09-15 첫 업로드

- 로그인 기능 구현.
- 회원가입 기능 구현.
- Canvas로 이미지 문제 제작 구현.
- 문제 맞추기 페이지 구현.

#### 2020-09-16

- 이미지저장방식 변경(Base64 → PNG로 저장.)
- 내 스코어 표시.
- 모바일 문제 제작 404페이지 제작(모바일에서 Canvas작동X).
- 로그인 및 회원가입시 패스워드에 SHA256 암호화 적용.
- 회원가입 아이디 중복 검사 적용.

#### 2020-09-17

- 문제 제출시 로그 남기도록 수정 [문제번호,아이디,퀴즈번호,입력값,정답여부,결과,시간]
- 패스워드 저장방식 변경 기존SHA256 인코딩 → SHA 인코딩 후 문자열 SubString(3,15)

#### 2020-09-18

- Undo기능 추가(= 오류덩어리)
- 펜 ColorPicker 추가
- 배경채우기 색상 및 UI 수정
