# 누구나 문제를 만들어서 공유하고 풀수있는 스케치퀴즈!

# 프로세스

회원가입(register.html) → 회원가입 유효성 검사(regcheck.jsp) → 로그인(login.jsp) → 로그인 유효성 검사(logincheck.jsp) →

인덱스페이지(index.jsp) → 문제 제작(canvas.jsp) → 문제 제출(send.jsp) → 문제 풀기(viewquize.jsp) → 문제 정답 여부 확인(answercheck.jsp) →

다음 문제 이동(viewquize.jsp) 및 해당 계정 스코어 +1;

# DB Structure

imagedata [id(varchar(30)),src(longtext),num(int),answer(varchar(30))]
userinfo [id(varchar(30)),pw(varchar(30)),score(int)] pw는 보안 적용 전 입니다.

# Update Log

#### 2020-09-15 첫 업로드

#### 2020-09-16

- 이미지저장방식 변경(Base64 → PNG로 저장.)
- 내 스코어 표시.
- 모바일 문제 제작 404페이지 제작(모바일에서 Canvas작동X).
