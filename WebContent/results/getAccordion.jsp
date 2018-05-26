<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="type" items="${types}">
 	<div class="accordion ${mode}" id="${type}">${type}</div>
 	<div class="panel"></div>
</c:forEach>
<script>
var acc = document.querySelectorAll(".accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
      if(this.classList.contains("spaceType")){
    		console.log("spacetype")
    		$.ajax({
    	        url : "controller?cmd=getTaskTypesBySpaceTypeAction", 
    	        data: {
    				spaceType : this.id, 
    			},
    	        success : function(result){
    	        	panel.innerHTML = result;
    	        }
    	    });
    	}


      if(this.classList.contains("taskType")){
    		console.log("tasktype")
    		$.ajax({
    	        url : "controller?cmd=getSpaceTypesByTaskTypeAction", 
    	        data: {
    				taskType : this.id, 
    			},
    	        success : function(result){
    	        	panel.innerHTML = result;
    	        }
    	    });
    	}
    } 
  });
}

var subAcc = document.querySelectorAll(".subAccordion");

for (i = 0; i < subAcc.length; i++) {
	subAcc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
    
    var motherPanel = this.parentNode;
    motherPanel.style.maxHeight = motherPanel.scrollHeight + panel.scrollHeight + "px";

  });
}




</script>