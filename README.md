<div>
<img src="https://user-images.githubusercontent.com/80824750/208554611-f8277015-12e8-48d2-b2cc-d09d67f03c02.png" width="400"/>

# 📝 개요
  프로젝트 명 : Spring/MVC 방식을 사용한 미니 쇼핑몰 
  프로젝트 기간-2024-11-18 ~ 2024-12-05
  (K-Digital Training) 클라우드 활용 자바 개발자 양성과정 86기 1차 팀 프로젝트입니다.

# :blue_book: 첨부파일
<a href="https://app.luminpdf.com/viewer/6752b712f7ff78bf8b148b3e?credentials-id=e124a136-0814-4450-9acf-5ab668712655">스토리보드</a> <br>
<a href="https://docs.google.com/spreadsheets/d/11NJC1y1dsvDWexZ4eV6W06k6LUDjZuBRMJeBKP2Cx5I/edit?gid=0#gid=0">인터페이스 설계서</a>

# 데이터 베이스 구조


# 🗂️ 주요 기능

|기능|설명|
|---|---|
|로그인 / 로그아웃| - 정규표현식 등 을 이용하여 CUSTOMER, STAFF 로그인 구분 <br> - 로그인 아이디(이메일)을 세션에 담을 수 있도록 기능 구현 <br> - 세션 초기화 기능 구현 |
|홈(메인페이지)| - 카테고리를 여러개 선택하여 조회할 수 있도록 구현 <br> - 상품 리스트, 페이징 기능  및 상품이름 검색기능 구현 |
|상품 상세 조회| - 상품에 대한 상세 정보 출력  <br> - STAFF접속 중 일 경우 상품 수정, 후기 삭제 기능 접근이 직관적이도록 설계 <br> - CUSTOMER접속 중 일 경우 장바구니 추가 기능 접근이 직관적이도록 설계 <br> - 상품에 등록된 후기를 조회할 수 있는 리스트 구현 <br> - STAFF 접속 중 일 경우 모든 후기에 대해 삭제 가능 구현 <br> - CUSTOMER 접속 중 일 경우 구매이력이 있는 상품 한정 후기 작성, 삭제 가능토록 구현|
|STAFF - 상품 관리| - 상품 리스트, 페이징 및 상품이름 검색기능 구현 <br> - 상품 수정(정보, 상태, 이미지), 삭제, 상세정보 조회 기능 구현 및 접근이 직관적이도록 설계 |
|STAFF - 카테고리 관리| - 카테고리 리스트 출력 <br> - 카테고리 추가, 삭제 기능 구현 및 리스트에서 접근이 직관적이도록 설계 |
|STAFF - 직원 관리 | - 스태프 리스트 출력 <br> - 스태프 리스트 삭제 기능 구현 및 리스트에서 접근이 직관적이도록 설계 <br> - 스태프 등록 및 등록 시 유효성 검사(ID 중복 확인, 이름, 비밀번호) 기능 구현 |
|STAFF - 후기 관리| - 전체 후기 리스트 및 페이징 구현 <br> - 후기 삭제 기능 구현 및 리스트에서 접근이 직관적이도록 설계 |
|STAFF - 고객 관리| - 고객정보 리스트, 페이징 <br> - 고객 리스트에서 삭제 기능 접근이 직관적이도록 설계 |
|STAFF - 주문 관리| - 전체 회원 주문 목록을 최신순으로 조회할 수 있도록 리스트 및 페이징 구현 <br> - 배송상태(배송중) 수정, 결제상태 수정 기능 구현 및 리스트에서 접근이 직관적이도록 설계 |
|STAFF - 통계 페이지| - Chart.JS와 datatables를 이용한 월별 매출 차트 등 통계 구현 <br> &nbsp;&nbsp; [매출상황, 주문량, 당월 매출, 베스트 셀러(TOP 3)]|
|CUSTOMER - 장바구니|- 장바구니에 담은 상품 정보 리스트 출력 <br> - 삭제와 결제 기능 구현 및 장바구니 리스트에서 접근이 직관적이도록 설계 <br> - 장바구니 추가 기능 구현|
|CUSTOMER - 결제| - 선택한 장바구니에 대한 상품 정보 리스트와 총 결제 금액 출력 <br> - 결제 기능 구현 및 접근이 직관적이도록 설계 <br> - 결제 완료 시, 장바구니 건수를 재계산하여 세션에 반영|
|CUSTOMER - 회원 결제 이력|  - 로그인한 회원의 주문 목록을 최신순으로 조회할 수 있도록 리스트 및 페이징 구현 <br> - 결제상태(결제취소, 배송완료) 수정 기능 접근이 직관적이도록 설계 |
|CUSTOMER - 회원 가입| - 이메일 중복 검사 기능 구현 및 유효성 검사(ID 중복 확인, 성별, 비밀번호, 생일) 기능 구현 <br>  - 회원 등록 기능 구현|
|CUSTOMER - 개인정보 관리 페이지|  - 비밀번호 변경, 회원 탈퇴 기능 구현 및 회원정보 페이지에서 접근이 직관적이도록 설계 <br> - 로그인한 회원의 기본 정보 출력 <br> - 비밀번호 확인 기능 구현|




# DEPENDENCIES


# 개발 환경 및 기술 스택
// 
  <li> Language : HTML5, CSS3, Java, SQL, JavaScript </li>
  <li> Framework : SpringBoot </li>
  <li> Library : JSTL, JQuery, Lombok, MyBatis, Maven, BootStrap </li>
  <li> Database : MySQL </li>
  <li> WAS Apache : Tomcat10 </li>
  <li> OS : Windows, Mac </li>
  <li> TOOL : Spring-Tool-Suite4, HeidiSQL, Github Desktop, 피그마</li> // ( 아이콘 사용)
 



🤔 기술적 이슈와 해결 과정


## 💁‍♂️ Collaborators
<table>
  <tr>
    <td> 관리자 페이지 중심 구현 </td>
    <td> 공용 페이지 중심 구현 </td>
    <td> 회원 페이지 중심 구현 </td>
  </tr>
  
  <tr>
    <td>
      <a href="https://github.com/KHyun27">김동현</a>
    </td>
    <td>
      <a href="https://github.com/KHyun27">김문정</a>
    </td>
    <td>
      <a href="https://github.com/KHyun27">김은서</a>
    </td>
  </tr>

  
  <tr>


  </tr>
  
</table>

	
