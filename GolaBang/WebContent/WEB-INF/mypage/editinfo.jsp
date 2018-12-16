<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/asset.jsp"%>
<style>
</style>
<script>
	
</script>
</head>
<body>
	<!-- 정보수정 -->
	<div style="margin: 0 auto; width: 800px;">
		<form id="editForm">
			<table class="mdl-data-table mdl-js-data-table" id="edittbl">
				<tbody>
					<tr>
						<th class="mdl-data-table__cell--non-numeric"><h5>이름</h5></th>
						<td class="mdl-data-table__cell--non-numeric">
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input" type="text" id="orgname"
									name="orgname"> <label class="mdl-textfield__label"
									for="orgname">이름을 입력해주세요.</label>
							</div>
						</td>
					</tr>
					<tr>
						<th class="mdl-data-table__cell--non-numeric"><h5>전화번호</h5></th>
						<td class="mdl-data-table__cell--non-numeric">
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input" type="text" id="orgtel"
									name="orgtel"> <label class="mdl-textfield__label"
									for="orgtel">휴대폰 번호를 입력해주세요.</label>
							</div>
						</td>
					</tr>
					<tr>
						<th class="mdl-data-table__cell--non-numeric"><h5>이메일</h5></th>
						<td class="mdl-data-table__cell--non-numeric">
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input" type="text" readonly
									id="orgemail" name="orgmail">
							</div>
						</td>
					</tr>
					<tr>
						<th class="mdl-data-table__cell--non-numeric"><h5>비밀번호
								확인</h5></th>
						<td class="mdl-data-table__cell--non-numeric">
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input" type="password" id="inputpw"
									name="inputpw"> <label class="mdl-textfield__label"
									for="inputpw">현재 비밀번호를 입력해주세요.</label>
							</div>
							<div id="pwcheck_comment"></div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div style="width: 190px; margin: 30px auto;">

			<input type="button"
				class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"
				value="취소" onclick="history.back();" /> <input type="button"
				id="btnEdit"
				class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored"
				value="정보수정" style="float: right;" />
			<div style="clear: both"></div>
		</div>
	</div>






</body>
</html>