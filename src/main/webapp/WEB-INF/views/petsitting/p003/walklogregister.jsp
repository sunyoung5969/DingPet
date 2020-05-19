<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../../includes/header.jsp"%>
<!-- 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/">
 -->
 
<style>

.page-title{
    font-size: 28px;
    font-weight: 600;
    padding-top: 10px;
    padding-bottom: 15px;
    width: 67%;
    left: 75px;
    display: inline-block;
    position: relative;
}

.walkform{
    display: inline-block;
    float: right;
}

.walkbtn{
	background: #fff;
    border: solid 1px #30a430 !important;
    color: #30a430 !important;
    box-shadow: none !important;
}

.info-part1{

	padding: 20px;
}

.title-container{
	padding: 25px 0;
}

.profile-pic-title{
	
	margin: 0px;
    padding-top: 10px;
    padding-bottom: 15px;
    font-size: 14px;
    line-height: 1.0909090909;
}

.profile-info-title, .license-info--title{
	display: inline-block;
	margin: 0px;
	padding-bottom: 15px;
	font-size: 14px;
   	line-height: 1.0909090909;
}

.profile-info-title{
	padding-top: 10px;
	
}

.filebox{
	display: inline-block;
	padding: 0px 20px;
}

.filebox label {
	
	display: inline-block;
    cursor: pointer;
    border: 1px solid gray;
    border-radius: .25em;
}

.filebox label:hover {
  background-color: gray;
}

.filebox label:active {
  background-color: #367c36;
}

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}

.form-group{
	display: inline-block;
	width: 75%;
	padding: 0px 20px;
}
.form-group label h3 {
	font-size: 22px;
   	line-height: 1.0909090909;
   	margin:12px 0;
}

.tit_h3 {
	font-size: 22px;
   	line-height: 1.0909090909;
   	margin:12px 0;
}


.form-control{
	width: 100%;
}

.form-control--title{
	
	width: 100%;
	margin-bottom: 10px;
}

.form-control--detail{
	height: 15vh;
    resize: none;
}

.img-text{
	background-color: gray;
	position: relative;
	width: fit-content;
	top:-140px;
	left: 20%;
}

.imgbtn{
	padding: 4px;
    margin-bottom: 10px;
}

@media screen and (max-width: 770px) {
	
	.main-raised {
	   margin: -10% 3% 7%
	}
	
	.page-title{
		font-size: 4vw !important;
		left: 0px;
    	width: 100%;
	}
	
	.form-group{
		width: 100%;
		padding: 0px
	}
	.walkform{
		text-align: center;
		width: 100%;
	}
	.walkbtn{
		width: 88%;
	}
	
}

@media screen and (max-width: 425px) {
	.page-header{
		height: 30vh;
	}
	.page-title{
		font-size: 5vw !important; 
	}

}




</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!--====  str of contents  ====-->
    <section style="padding-top:87px">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/bg/re.jpg'); transform: translate3d(0px, 0px, 0px);"></div>
        <div class="main main-raised">
			<div class="profile-content">
				<div class="container pb-5">
						<div class="title-container">
							<div class="text-center heading-section">
								<h2 class="page-title">일지 등록(산책)</h2>

							</div>
	                    </div>
               		<form action="/petsitting/p003/logregisterdata" method="post" enctype="multipart/form-data">
	                   	
						<div class="info-part1">

							<div class="info-part1--contents" align="center">
								
								<div class="form-group">
									<div class='profile-info-titleDiv' align="left">
										<h5 class="profile-info-title">일지 제목</h5>
									</div>
									<input type="hidden" name="reservation_ID" value="${walk.reservation_ID }">
									<input type="hidden" name="start_Time" value="${walk.start_Time }">
									<input type="hidden" name="end_Time" value="${walk.end_Time }">
									<input type="hidden" name="distance" value="${walk.distance }">
									<input type="hidden" name="log_Type" value="walk">
									<input type="hidden" name="path_Photo" value="">
									<input class="form-control--title" type="text" name="log_Title" maxlength="100" required><br>							
									<input type="hidden" class="locationJSON" name="locationJSON" value='${walk.locationJSON }'>
									
									<div id="map" style="width: 100%; height: 350px;"></div>
									<div class="profile-info-titleDiv" align="left">
										<h5 class="profile-info-title">일지 내용</h5>
									</div>
									<textarea class="form-control--detail" rows="8" name="log_Content" required></textarea>
								</div>
								
								<div class="filebox" align="right">
									<h5 class="profile-pic-title" align="left"> 사 진 </h5>
									<label for="logPic">
										<img id="preview_profile" style="width: 170px" src="/resources/images/petsitting/default_image.png">
										<!-- <div class="img-text"><p>사 진 등 록</p></div> -->
									</label>
									<input type="file" name="logPic" id="logPic" accept="image/*">
									
									<script>
									    var upload = document.querySelector('#logPic');
									 	
									    upload.addEventListener('change',function (e) {
									   
									        //FileReader 객체 생성
									        var reader = new FileReader();
									        
									        // reader 시작시 함수 구현
									        reader.onload = function(aImg){
										        $("#preview_profile").attr("src", aImg.target.result)
									        }
									        reader.readAsDataURL(e.target.files[0])
									    })
									</script>
								</div>
							</div>
						</div>						
						<div class="text-center">							
							<input class="btn btn-primary" type="submit" value="등록">
							<input class="btn btn-secondary" type="button" onclick="location.href='sitterlist'" value="취소">
						</div>
					</form>
				</div>
			</div>
        </div>
      </section>
      
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78d603c9ceea19aeba68479415b917d4"></script>
   	<script src="${pageContext.request.contextPath}/resources/js/pathline.js?v=11"></script>
	<script>pathLine()</script>
	
    <!--====  end of contents  ====--> 
<%@include file="../../includes/footer.jsp"%>