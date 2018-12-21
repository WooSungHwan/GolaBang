# GolaBang(골라방)
부동산 웹 프로젝트<br>
<b>기간 : 2018.12.10 ~ 2018.12.19(10일 간 일 8시간)</b><br>
<b>환경 : Apache Tomcat 8.0, Chrome 브라우저</b><br>
<b>주제 : 부동산 거래 </b><br>
<b>개발 : Eclipse Photon, Oracle</b><br>
<b>사용 언어 : JAVA(JDK 1.8), Oracle SQL(11g Express), Html5, CSS3, Javascript, JSP&Servlet</b><br>
<b>사용 기술 : JDBC, MVC모델2, jQuery, Ajax, Open API(다음카카오,네이버), Mail API, hightchart</b><br>
<b>디자인 프레임워크 : Material Design Lite</b><br>

# 프로젝트 상세내용
## 주제
<pre>
* 맞춤형 방 찾기 웹 서비스<br>
</pre>

## 목적
<pre>
1. 매물 열람 시, 다른 매물과 세분화된 매물 비교 불편함<br>
 - 관심목록에 있는 매물끼리 실시간 비교 가능<br>
2. 관리자만 열람할 수 있는 허위 매물 리스트<br>
 - 신고된 허위매물을 다른 세입자도 열람 가능<br>
3. 기존 웹에서는 제공하지 않는 계약서 서비스<br>
 - 거래 계약서까지 제공<br>
</pre>

## 구현 목표
* 일반 회원
<pre>
* 세입자는 방 종류와 월세, 전세까지 다양한 집 정보 확인 가능<br>
* 매물, 교통, 편의시설 등 방 선택에 필요한 모든 정보를 확인 가능<br>
* 원하는 조건의 방만 확인할 수 있도록 맞춤검색 필터 세분화<br>
* 데이터를 기반으로 지역대비 편의성, 안전성 등 분석한 차트 확인 가능<br>
* 세입자는 등록된 매물을 보고 공인 중개사에게 연락해서 계약 가능<br>
* 해당 매물에 연락한 세입자들에 한해서 허위 매물을 신고할 수 있고, 다른 세입자들도 열람 가능<br>
</pre>
* 공인 중개사
<pre>
* 세입자로부터 거래 신청이 오면 계약서가 자동 생성되어 거래 진행 가능<br>
* 자신이 등록한 매물을 수정/삭제할 수 있다.<br>
* 자신이 등록한 매물의 조회수와 찜 등록수를 확인할 수 있다.<br>
</pre>

## Exerd 테이블 명세
![Alt Text](https://github.com/WooSungHwan/GolaBang/blob/master/erd.png)

## 구동 화면
* 골라방 메인화면<br><br>
![Alt text](https://github.com/WooSungHwan/GolaBang/blob/master/8.%20%ED%99%94%EB%A9%B4%20%EC%BA%A1%EC%B3%90/01.%EB%A1%9C%EA%B7%B8%EC%9D%B8%2C%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85%20%EB%B0%8F%20%EB%A9%94%EC%9D%B8%EB%A9%94%EB%89%B4/1-1.%EB%A9%94%EC%9D%B8%ED%99%94%EB%A9%B4.jpg)
* 방 검색<br><br>
![Alt text](https://github.com/WooSungHwan/GolaBang/blob/master/8.%20%ED%99%94%EB%A9%B4%20%EC%BA%A1%EC%B3%90/02.%EB%B0%A9%20%EC%B0%BE%EA%B8%B0/1-2.%EB%B0%A9%20%EA%B2%80%EC%83%89.jpg)
* 방 비교하기<br><br>
![Alt text](https://github.com/WooSungHwan/GolaBang/blob/master/8.%20%ED%99%94%EB%A9%B4%20%EC%BA%A1%EC%B3%90/03.%EA%B4%80%EC%8B%AC%EB%AA%A9%EB%A1%9D/3.%EB%B0%A9%20%EB%B9%84%EA%B5%90%ED%95%98%EA%B8%B0.jpg)
* 방 등록하기<br><br>
![Alt text](https://github.com/WooSungHwan/GolaBang/blob/master/8.%20%ED%99%94%EB%A9%B4%20%EC%BA%A1%EC%B3%90/04.%EB%B0%A9%20%EB%82%B4%EB%86%93%EA%B8%B0/1.%EB%B0%A9%20%EB%82%B4%EB%86%93%EA%B8%B0.jpg)
* 계약서<br><br>
![Alt text](https://github.com/WooSungHwan/GolaBang/blob/master/8.%20%ED%99%94%EB%A9%B4%20%EC%BA%A1%EC%B3%90/05.%EA%B1%B0%EB%9E%98%20%EA%B4%80%EB%A6%AC/2-3.%EA%B1%B0%EB%9E%98%20%EC%A7%84%ED%96%89%EC%83%81%ED%99%A9(%EA%B3%84%EC%95%BD%EC%84%9C).jpg)
* 방 정보 보기<br><br>
![Alt text](https://github.com/WooSungHwan/GolaBang/blob/master/8.%20%ED%99%94%EB%A9%B4%20%EC%BA%A1%EC%B3%90/06.%EB%A7%A4%EB%AC%BC%20%EC%A0%95%EB%B3%B4/1.%EB%A7%A4%EB%AC%BC%EC%A0%95%EB%B3%B4.jpg)
