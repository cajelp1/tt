<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%@ include file="/WEB-INF/views/include/open_header.jsp" %> --%>

<body>
  <div class="content-wrapper">
	<!-- Content Header (Page header) -->
	  <section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>회원상세</h1>
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
				        <li class="breadcrumb-item">
				        	<a href="lis">
					        	<i class="fa fa-dashboard"></i> 회원관리
					        </a>
				        </li>
				        <li class="breadcrumb-item active">
				        	상세보기
				        </li>
   	  				</ol>
 				</div>
 			</div>
		</div>
	</section>
  
    <section class="content register-page" style="height: 586.391px;">       
		<div class="register-box" style="min-width:450px;">
	    	<form role="form" class="form-horizontal" action="modify" method="post">
	        	<input type="hidden" name="picture" value="${member.picture }"/>
	        	<div class="register-card-body" >
	        		<div class="row">
<%-- 						<input type="hidden" name="oldPicture" value="${member.picture }" /> --%>
						<div class="input-group col-md-12">
							<div class="col-md-12" style="text-align: center;">
								<div class="" id="pictureView" style="border: 1px solid green; height: 140px; width: 140px; margin: 0 auto; margin-bottom:5px;"></div>														
								<div class="input-group input-group-sm">
									<label for="inputFile" class=" btn btn-warning btn-sm btn-flat input-group-addon">파일선택</label>
									<input id="inputFileName" class="form-control" type="text" value="${member.picture }"/>
									<span class="input-group-append-sm">											
										<button type="button" class="btn btn-info btn-sm btn-append" onclick="upload_go();">업로드</button>											
									</span>
								</div>
							</div>
						 </div>
					</div>
					<br />
	                <div class="form-group row" >
	                  <label for="inputEmail3" class="col-sm-3 control-label text-right">아이디</label>
	                  <div class="col-sm-9">
	                    <input name="id" type="text" readonly class="form-control" id="inputEmail3" value="${member.id }">
	                  </div>
	                </div>
	
	                <div class="form-group row">
	                  <label for="inputPassword3" class="col-sm-3 control-label text-right">패스워드</label>
	                  <div class="col-sm-9">
	                    <input name="pwd" type="password" class="form-control" id="inputPassword3" value="${member.pwd }">
	                  </div>
	                </div>
	                <div class="form-group row">
	                  <label for="inputPassword3" class="col-sm-3 control-label text-right">이&nbsp;&nbsp;름</label>
	                  <div class="col-sm-9">
	                    <input name="name" type="text" class="form-control" id="inputPassword3" value="${member.name }">
	                  </div>
	               </div>
	                <div class="form-group row">
	                  <label for="inputPassword3" class="col-sm-3 control-label text-right">이메일</label>
	                  <div class="col-sm-9">
	                    <input name="email" type="email" class="form-control" id="inputPassword3" value="${member.email }">
	                  </div>
	                </div>
	                <div class="form-group row">
	                  <label for="inputPassword3" class="col-sm-3 control-label text-right">전화번호</label>
	                  <div class="col-sm-9">   
	                  	<input name="phone" type="text" class="form-control" id="inputPassword3" value="${member.phone.substring(0,3)}">	                
	                    <input name="phone" type="text" class="form-control" id="inputPassword3" value="${member.phone.substring(3,7)}">
	                    <input name="phone" type="text" class="form-control" id="inputPassword3" value="${member.phone.substring(7) }">
	                  </div>                  
	                </div>   
	                <div class="form-group row">
						<label for="inputPassword3" class="col-sm-3 control-label text-right">권한</label>
	                  <div class="col-sm-9">
	                    <input name="authority" type="email" class="form-control" id="inputPassword3" value="${member.authority }">
	                  </div>
					</div>            
	              </div> <!-- card body -->
	              <div class="card-footer">
	              	<div class="row">
			          	<button type="button" onclick="SubmitMember('form');" 
			          		    class="btn btn-warning col-sm-4 text-center" >수정하기</button>
						<div class="col-sm-4"></div>
						<button type="button" onclick="Cancel();"
						        class="btn btn-default pull-right col-sm-4 text-center">취 소</button>
		          	</div>  	
	              </div> 		          	     
	      	  </form>
      	  </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<form role="imageForm" action="upload/picture" method="post" enctype="multipart/form-data">
	<input id="inputFile" name="pictureFile" type="file" class="form-control" style="display:none;" />
	<input type="hidden" id="oldFile" name="oldPicture" value="${member.picture}" />
	<input type="hidden" name="checkUpload" value="${empty member.picture ? '0' : '1'}" />
	
	<%-- 위는 el문에서 쓰는 삼항연산자. 하지만 jstl에서도 삼항 연산자를 쓸 수 있다.  --%>
	
	<%-- 	
	<input type="hidden" name="checkUpload" value="
		<c:choose>
			<c:when test="${empty member.picture}">
				0
			</c:when>
			<c:otherwise>
				1
			</c:otherwise>
		</c:choose>
	" /> 
	--%>
</form>

<%-- <%@ include file="/WEB-INF/views/include/open_footer.jsp" %> --%>

<%@ include file="picture_js.jsp" %>

<script>
	var imageURL="picture/get?picture=${member.picture}";
	$('div#pictureView').css({'background-image':'url('+imageURL+')',
							  'background-position':'center',
							  'background-size':'cover',
							  'background-repeat':'no-repeat'
	});
	
<%--//이하는 js에 추가됨

	//수정하기 눌렀을 때 update하기
	function SubmitMember(formRole){
		var uploadCheck = $('input[name="checkUpload"]').val();
		if(!(uploadCheck>0)){
			alert("사진을 업로드 해주세요.");
			//('input[name=pictureFile]').click();
			return;
		}
		var form = $('form[role="'+formRole+'"]');
		form.submit();
	}

	//취소하기는 뒤로가기
	function Cancel(){
		history.go(-1);
	}

--%>

</script>

</body>




