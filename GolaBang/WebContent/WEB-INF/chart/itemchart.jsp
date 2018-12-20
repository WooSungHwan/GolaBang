<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골라방</title>
<%@ include file="/inc/asset.jsp" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="<%=request.getContextPath() %>/asset/js/highcharts.js"></script>
<script src="<%=request.getContextPath() %>/asset/js/highcharts-more.js"></script>
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>

<style>
.demo-layout-transparent {
	/* background: url('images/dog01.jpg') center/cover; 배경 */
}

.demo-layout-transparent .mdl-layout__header, .demo-layout-transparent .mdl-layout__drawer-button
	{
	/* This background is dark, so we set text to white. Use 87% black instead if
     your background is light. */
	color: white;
}
i{
 color:black;
}
	
</style>
<script>

$(document).ready(function() {
	

	Highcharts.chart('container', {

	    chart: {
	        polar: true,
	        type: 'line'
	    },

	    title: {
	        text: 'Budget vs spending',
	        x: -80
	    },

	    pane: {
	        size: '80%'
	    },

	    xAxis: {
	        categories: ['Sales', 'Marketing', 'Development', 'Customer Support',
	            'Information Technology'],
	        tickmarkPlacement: 'on',
	        lineWidth: 0
	    },

	    yAxis: {
	        gridLineInterpolation: 'polygon',
	        lineWidth: 0,
	        min: 0
	    },

	    tooltip: {
	        shared: true,
	        pointFormat: '<span style="color:{series.color}">{series.name}: <b></b><br/>'
	    },

	    legend: {
	        align: 'right',
	        verticalAlign: 'top',
	        y: 70,
	        layout: 'vertical'
	    },

	    series: [{
	        name: 'Allocated Budget',
	        data: [43000, 19000, 60000, 35000, 17000],
	        pointPlacement: 'on'
	    }, {
	        name: 'Actual Spending',
	        data: [50000, 39000, 42000, 31000, 26000],
	        pointPlacement: 'on'
	    }]

	});
	
	
	
});	//ready
</script>

</head>
<body>
	<div class="demo-layout-transparent mdl-layout mdl-js-layout"> 

		<!-- header -->
		<jsp:include page="/inc/header.jsp"></jsp:include>
		
		
		<div id="container"></div>
		
		<!-- footer -->
		<%-- <jsp:include page="/inc/footer.jsp"></jsp:include> --%>
	</div>
</body>
</html>