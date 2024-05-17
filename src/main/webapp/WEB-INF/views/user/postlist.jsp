<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>

<style>

  main {
    height: 100vh;
  }

  .select_box.jm_select_box.mt-5 {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: auto;
    margin-top: 10px;
  }
  
  .info-box,
  .resume-table {
    justify-content: center;
    align-items: center;
    margin: auto;
    width: 50%;
  }
  
  .resume-table,
  .resume-table tr,
  .resume-table tr td {
    border: 1px solid black;
    padding: 10px;
  }
  
  .resume-table {
    table-layout: fixed;
    border-collapse: collapse; /* 셀 간의 간격을 없애고 테두리를 합침 */
  }
  
  /* 각 셀의 너비를 고정 */
  .resume-table td:first-child {
    width: 10%;
    word-wrap: break-word; /* 텍스트가 셀을 벗어날 경우 줄 바꿈 */
  }
  .resume-table td:nth-child(2) {
    width: 20%;
    word-wrap: break-word; /* 텍스트가 셀을 벗어날 경우 줄 바꿈 */
  }
  
  
</style>

</head>

<body>

   <%@include file="/WEB-INF/views/include/pheader.jsp" %>
            
   <main>
                  
	 <section>
	   <article>
	   
	   <div class="select_box jm_select_box mt-5">
	   
		<select id="skill" class="jm_select selectpicker"
			data-style="btn-info" name="">
			<option value="none" selected>분야</option>
			<option value="Java">Java</option>
			<option value="Springboot">Springboot</option>
			<option value="C">C</option>
			<option value="CSS">CSS</option>
			<option value="html">Html</option>
			<option value="Flutter">Flutter</option>
			<option value="JavaScript">JavaScript</option>
		</select>
		
		<select id="career" class="jm_select" name="">
			<option value="none" selected>고용형태</option>
			<option value="신입">신입</option>
			<option value="경력">경력</option>
		</select>
		
		<select id="address" class="jm_select" name="">
			<option value="none" selected>근무지</option>
			<option value="경기">전국</option>
			<option value="경기">경기</option>
			<option value="서울">서울</option>
			<option value="부산">부산</option>
			<option value="경기">경남</option>
			<option value="제주">제주</option>
			<option value="울산">울산</option>
		</select>
	       <div>&nbsp;</div>
	       <button onclick="search()">검색</button>
       
       </div>
	   
	     <h2 style="text-align:center; padding-top: 2%;">공고보기</h2>
		 <hr/>
			
		 <div class="info-box">

			 <c:forEach var="postList" items="${ postList }" >
			   <table class="resume-table" >	
			   <tr>
			     <td class="table-num">${ postList.po_num }</td>
			     <td class="table-name">${ postList.region }</td>
			     <td class="table-title"><a href="/Post/View?po_num=${ postList.po_num }">${ postList.po_title }</a></td>
			   </tr>
			   </table>
			 </c:forEach>

		</div>
		
	   </article>
	 </section>
   </main>

   <%@include file="/WEB-INF/views/include/footer.jsp" %>
   
   <script>
   
   function search() {
       let region = document.getElementById("region").value;
       let skill = document.getElementById("skill").value;
       let career = document.getElementById("career").value;

       // 선택된 값들을 서버로 전송하여 검색 수행
       // AJAX 요청을 사용하여 서버와 통신하거나, 폼을 제출하여 서버로 데이터 전송 가능
       // 이 예제에서는 간단히 선택된 값을 콘솔에 출력
       console.log("Selected Region:", region);
       console.log("Selected Job Shape:", jobshape);
       console.log("Selected Career:", career);
       
       // AJAX 요청 보내기
       let xhr = new XMLHttpRequest();
       let url = "your_server_endpoint"; // 서버 엔드포인트 URL을 여기에 입력
       xhr.open("POST", url, true);
       xhr.setRequestHeader("Content-Type", "application/json");

       // 서버로 전송할 데이터를 JSON 형식으로 만듦
       let data = JSON.stringify({
           region: region,
           jobshape: jobshape,
           career: career
       });

       // AJAX 요청 보내기
       xhr.onreadystatechange = function () {
           if (xhr.readyState === 4 && xhr.status === 200) {
               // 서버에서 응답을 받았을 때 수행할 작업
               console.log("서버 응답:", xhr.responseText);
           }
       };

       // AJAX 요청 보내기
       xhr.send(data);
       
   }
   
   </script>
  

</body>
</html>