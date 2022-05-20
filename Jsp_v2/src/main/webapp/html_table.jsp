<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테이블 만들기</title>
<style>
	body {
		font-size: 16px;
	}
	table {
		width : 1000px;
		border-collapse:collapse;
	}
	table td, table th {
		text-align: center;
		padding : 5px;
		border : 1px solid lightgray;
	}
	table th {
		background-color: dodgerblue;
	}
</style>
</head>
<body>
<!-- tr : 테이블 row(가로), td : 테이블 data -->
	<table border="1"/>
		<tr>
			<th>상품명</th>
			<th>월정액</th>
			<th>제공혜택</th>
		</tr>
		<tr>
			<td>지상파 무제한 즐기기</td>
			<td>14,300원</td>
			<td>우리 가족 취향 저격</td>
		</tr>
		<tr>
			<td>CJ ENM 무제한 즐기기</td>
			<td>14,300원</td>
			<td>세상의 모든 즐거움!</td>
		</tr>
		<tr>
			<td>JTBC 무제한 즐기기</td>
			<td>7,700원</td>
			<td>부담 없는 가격으로 JTBC의 드라마, 예능 프로그램을 무제한으로!</td>
		</tr>
	</table>

</body>
</html>