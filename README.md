# GolaBang(골라방)
부동산 웹 프로젝트<br>
<b>기간 : 2018.12.10 ~ 2018.12.19(10일 간 일 8시간)</b><br>
<b>환경 : Apache Tomcat 8.0, Chrome 브라우저</b><br>
<b>주제 : 쇼핑몰</b><br>
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
