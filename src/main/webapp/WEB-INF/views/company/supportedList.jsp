<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>
<!-- 부트스트랩 CDN 링크 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
<style>

    /* 본문 */
    .page {
     margin-top:50px;
     margin-left: 250px;
    }
   /* 마이페이지*/
   .form-floating {
      
      margin : 0 auto;
      padding-top : 20px;
      width : 50%;
      font-size: 15px;
      
   }
   .btn {
   padding : 15px;
   cursor: pointer;
   margin: 20px;
   }
   .flex-container{
   display: flex;
   justify-content:center;
   padding : 20px;
   }
		.hidden {
       display: none;
   }
</style>


</head>
<body>
	
	<%@include file="/WEB-INF/views/include/cheader.jsp"%>

	<!-- 사이드 바 -->
	<div class="container d-flex">
		<div class="list-group mx-2">
			<a href="/Company/Info?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item   shadow" style="width: 150px;">회사정보</a> <a
				href="/Company/PostForm?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item hs_list_effect shadow">공고관리 관리</a> <a
				href="/Company/SupportedList?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item shadow">받은 이력서 관리</a> <a href="#"
				class="list-group-item shadow">스크랩</a>
		</div>
	</div>
	<!-- 페이지 내용 -->
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<div class="col-sm-9 page">
			<section class="content inner">
				<div class="list">
					<div class="tab-content">
						<h4>저희 회사에 지원한 이력서 목록입니다</h4>
						<ul class="job-list">
							<li>
								<table>
									<thead>
										<tr>
											<th>이력서순서</th>
											<th>공고번호</th>
											<th>제목</th>
											<th>이력서제목</th>
											<th>유저아이디</th>

											<th>지원일자</th>

											<th>결과</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${applyedList}" varStatus="loop">
										    <tr>
										        <td>${loop.index + 1}</td> <!-- 이력서 번호 -->
										        <td>${item.po_num }</td>
										        <td><a href="/Company/PostView?po_num=${ item.po_num }&com_id=${ sessionScope.clogin.com_id }">${item.po_title }</a></td>
										        <td><a href="/Users/ResumeView?re_num=${item.re_num}&user_id=${item.user_id}&com_id=${ sessionScope.clogin.com_id }">${item.re_title }</a></td>
										        <td>${item.user_id }</td>
										        <td>${item.ap_date }</td>
										        <td>
										            <c:choose>
										                <c:when test="${item.result == 0}">
										                    <button id="waitButton_${loop.index + 1}" type="button" class="btn btn-secondary" onclick="showDecisionButtons(${loop.index + 1})">대기</button>
										                </c:when>
										                <c:when test="${item.result == 1}">
										                    <button id="rejectButton_${loop.index + 1}" type="button" class="btn btn-danger" >불합격</button>
										                </c:when>
										                <c:when test="${item.result == 2}">
										                    <button id="acceptButton_${loop.index + 1}" type="button" class="btn btn-info">합격</button>
										                </c:when>
										            </c:choose>
										            <div id="decisionButtons_${loop.index + 1}" style="display: none;">
																    <button id="accept_${loop.index + 1}" type="button" class="btn btn-info" onclick="accept(${loop.index + 1})">합격</button>
																    <button id="reject_${loop.index + 1}" type="button" class="btn btn-danger" onclick="reject(${loop.index + 1})">불합격</button>
																</div>
										        </td>
										    </tr>
										</c:forEach>
									</tbody>
								</table>
							</li>
						</ul>
					</div>
				</div>
			</section>
		</div>
		<!-- 내용 추가 -->
	</main>
	
<script>
		    //문서의 최상위 요소에 클릭 이벤트 리스너 추가
		    document.addEventListener('click', function(event) {
		        // 클릭한 요소가 대기 버튼인지 확인
		        if (event.target.matches('[id^="waitButton_"]')) {
		            // 대기 버튼 클릭 처리
		            const buttonId = event.target.id; // 클릭된 버튼의 ID 가져오기
		            const resumeSequence = buttonId.split('_')[1]; // 이력서 순서 추출
		
		            // 이력서 순서를 사용하여 필요한 작업 수행
		            console.log('클릭한 이력서 순서:', resumeSequence);
		            // 해당 이력서에 대한 결정 버튼 요소에 직접 접근하여 작업 수행
		            const decisionButtonsDiv = document.getElementById(`decisionButtons_${resumeSequence}`);
		            
		         
		     }
		        
		      function showDecisionButtons(resumeSequence) {
	            // 대기 버튼 숨기기
	            const waitButton = document.getElementById(`waitButton_${resumeSequence}`);
	            waitButton.style.display = 'none';

	            // 합격과 불합격 버튼 보이기
	            const acceptButton = document.getElementById(`acceptButton_${resumeSequence}`);
	            const rejectButton = document.getElementById(`rejectButton_${resumeSequence}`);
	            acceptButton.style.display = 'block';
	            rejectButton.style.display = 'block';
		      }
    });
</script>
	
</body>
</html>