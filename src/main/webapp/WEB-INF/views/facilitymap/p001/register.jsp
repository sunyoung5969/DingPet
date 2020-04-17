<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>
</head>
<body>
    <!--====  str of contents  ====-->
    <section style="padding-top:87px">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);"></div>
        <div class="main main-raised">
            <div class="row">
            <div class="col-lg-12 col-lg-offset-2 ">
                <div class="cotainer">
                    <div class="row justify-content-center pt-3 aos-init aos-animate" data-aos="fade-up">
                        <div class="text-center heading-section">
                          <h2 class="text-black mb-4">시설 상세 정보 입력</h2>
                        </div>
                    </div>
                    
                    <div class="row justify-content-center">
                        <div class="col-md-10  pb-5">
                            <div class="card">
                                <div class="card-body pd40">
                                    <form role="form" action="/facilitymap/p001/register" method="post" enctype="multipart/form-data">
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">시설명</label>
                                            <div class="col-md-7">
                                                <input type="text" id="place_name" class="form-control" name="place_name">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">주소</label>
                                            <div class="col-md-7">
                                                <input type="text" id="adress_name" class="form-control" name="adress_name">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">시설 종류</label>
                                            <div class="col-md-7">
                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <select class="form-control">
                                                        <optgroup label="시설 종류" name="categoty_name">
                                                            <option value="ground">운동장</option>
                                                            <option value="shopping">쇼핑몰</option>
                                                            <option value="Restaurant">동반식당</option>
                                                            <option value="width_cafe">동반카페</option>
                                                            <option value="dog_cafe">애견카페</option>
                                                            <option value="hotel">호텔</option>
                                                        </optgroup>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">휴대전화</label>
                                            <div class="col-md-7">
                                                <input type="text" id="phone" class="form-control" name="phone">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">위도</label>
                                            <div class="col-md-7">
                                                <input type="text" id="Latitude" class="form-control" name="X">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">경도</label>
                                            <div class="col-md-7">
                                            	<input type="text" id="longitude" class="form-control" name="Y">
                                            	<hidden type="text" id="place_url" class="form-control" name="place_url" value="https://www.dingpet.shop/facilitymap/p001/infopage/?site_id=">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">시설 소개</label>
                                            <div class="col-md-7">
                                                <textarea id="place_text" name="place_text" class="form-control" rows="4" ></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">시설사진</label>
                                            <div class="col-md-7">
                                                <div id='View_area' class="img_up"></div>                                               
                                                <input type="file" name="placePic" id="placePic"  accept="image/*" maxlength="5" onchange="previewImage(this,'View_area')">       
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">상세소개사진</label>
                                            <div class="col-md-7">
                                                <div class='uploadResult'> 
          										<ul></ul>
										        </div>
                                            	<br><br><br>
                                                <input type="file" name='uploadFile' multiple>
                                            </div>
                                        </div>
                                        
                                        <div class="text-center pd40">
                                            <button type="submit" class="btn btn-primary">등록</button>
                                        </div>
                                </form></div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
      </section>
    <!--====  end of contents  ====-->
<script>
$(document).ready(function(){

	var fileInput = $(".fileInput");
	
	var fileInputCopy = fileInput.clone();
	
	var uploadResult = $(".uploadResult");
	
	uploadResult.on("click", ".delBtn", function() {
		console.log(this);
		var obj = $(this);
		var targetDiv = obj.closest("div");
		console.log(obj.attr("data-file"));
		targetDiv.remove();
		
	});
	  
	  $("#uploadBtn").on("click", function(e){
	 
	    var formData = new FormData();
	    
	    var inputFile = $("input[name='uploadFile']");
	    
	    var files = inputFile[0].files;
	    
	    console.log(files);
	    
	   	for(var i = 0; i < files.length; i++){
		
		 formData.append("uploadFile", files[i]);
		
		}
	   	
	   	$.ajax({
	        url: '/facilitymap/p001/upload/uploadAjaxAction',
	          processData: false,
	          contentType: false,
	          data: formData,
	          type: 'POST',
	          success: function(arr){
	              alert("Uploaded");
	              console.log(arr);
	              
	              var str = "";
	              for(var i= 0; i < arr.length; i++){
	            	  str += "<div class='item'><img src='/upload/display?fname="+arr[i]+"'><button>DEL</button></div>"
	              }
	              uploadResult.append(str);
	              
	          }
	      }); //$.ajax

	    
	  });  
	});

</script> 
</body>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</html>