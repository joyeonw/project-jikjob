<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <link rel="icon" type="image/x-icon" href="/img/favicon.ico"> -->
<link href="/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet"  />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script src="/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>

<style>
input:not(input[type=submit]) { width:100%; }
   input[type=submit] { width : 100px; }
   #goList  { width : 80px; }
   main {
   	height: 150vh;
   }
   
   td { 
      padding:10px;
      width: 700px;
      text-align: center;
   }
   td:nth-of-type(1) {
      width : 200px;
   }
   
   td:not([colspan]):first-child {
      background: black;
      color : white;
      font-weight: bold;
   }
   
   input[readonly] {
      background: #EEE;
   } 
   
   #table {
      width: 800px;    
      margin-bottom: 20px; 
      
     td {
      text-align :center;
      padding :10px;
      
      &:nth-of-type(1) { 
          width : 150px; 
          background-color : black;
          color            : white; 
      }
      &:nth-of-type(2) { width : 250px;  }
      &:nth-of-type(3) { 
          width : 150px; 
          background-color : black;
          color            : white;
      }
      &:nth-of-type(4) { width : 250px;  }    
     }
     
    tr:nth-of-type(3) td:nth-of-type(2) {
    	text-align: left;	
    }
    tr:nth-of-type(4) td[colspan] {
           height : 250px;
           width  : 600px;   
           text-align: left;
           vertical-align: baseline;
    }
    tr:last-child td {
           background-color : white;
           color            : black;   
    }
   }
   
      
   textarea  {
      width : 100%;
      height: 250px;
   }
   
   #comments {
   	
   }
   .thumb-icon {
   	font-size: 10px;
   }

</style>
</head>
<body>
  <main>
    
    <%@include file="/WEB-INF/views/include/pheader.jsp" %>
  
	<h2>게시글 등록</h2>
	<form action="/Community/Update" method="POST">
	<input type="hidden" name="com_id" value="${ com_id }" />
	<input type="hidden" name="ccomu_bno" value="${ ccomu_bno }" />
	
	<table id="table">
	 <tr>
      <td>글번호</td>
      <td>${ vo.ccomu_bno }</td>
      <td>조회수</td>
      <td>${ vo.ccomu_hit }</td>      
    </tr>
	 <tr>
      <td>작성자</td>
      <td>${ vo.com_id }</td>
      <td>작성일</td>
      <td>${ vo.ccomu_date }</td>
    </tr>
	 <tr>
      <td>제목</td>
      <td colspan="3">
        <input type="text" name="ccomu_title" value="${ vo.ccomu_title }"/></td>
       
    </tr>
    <tr>
		  <td>내용</td>
		  <td colspan="3">
		    <textarea name="ccomu_content" rows="10" cols="50">${ vo.ccomu_content }</textarea>
		  </td>
		</tr>
    <tr>
      <td colspan="2"> 
       <input type="submit" value="글 수정" /> 
       <a class = "btn btn-info btn-sm" 
          href  = "javascript:history.back()">이전으로</a>&nbsp;&nbsp;
      </td>  
    </tr>	
	 
	
	</table>	
	</form>   
	
  </main>
  <%@include file="/WEB-INF/views/include/footer.jsp"%>
  <script>
  	const  goListEl  = document.getElementById('goList');
  	goListEl.addEventListener('click', function(e) {
  		location.href = '/Community/ComuHome';
  	})
  
  </script>
  
</body>
</html>





