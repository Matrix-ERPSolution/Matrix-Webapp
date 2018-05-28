<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

$.ajax({
	url:"controller?cmd=getCertifiedInfoAction",
	success: function(result) {
		var result = JSON.parse(result);
		location.href=result["result"];
	}
});
</script>