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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
                                                <input type="text" id="place_name" class="form-control" name="place_name"  required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">시설 종류</label>
                                            <div class="col-md-7">
                                                <div class="row">
                                                    <div class="col-sm-7">
                                                        <select class="form-control" name="category_name" >
                                                        <optgroup label="시설 종류" >
                                                            <option value="hospital">동물병원</option>
                                                            <option value="medicenter">동물약국</option>
                                                            <option value="restaurant">동반식당</option>
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
                                        	<label class="col-md-3 col-form-label text-md-right">주소검색</label>                                        
										    <div class = "col-md-7">
											     <input type="text" class="form-control"  id="address_display" name="address_name" placeholder = "주소 검색 버튼을 클릭하세요" required>
											     <input type = "button" class="addressBtn btn btn-primary " onclick="DaumPostcode()" value = "주소 검색" style="padding:7px 10px;margin:6px 2px;">
										    </div>
										   <div class="col-md-3"></div>
										   <div id = "map_wrap" class = "mt-3 col-md-7" style = "display:none; position:relative;">
										      <div id="lost_map"  style = "width : 500px; height: 400px; display:none"></div>
										      <div class="hAddr"><span id="centerAddr"></span> </div>
										      <span id = "lost_map_guide" class = "color_blue" style = "display:none;">*지도에서 위치를 클릭해서 주소를 입력해주세요</span><br>
										   </div>
										</div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">위도</label>
                                            <div class="col-md-7">
                                                <input type="text" id="lat" class="form-control" name="Y"  required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">경도</label>
                                            <div class="col-md-7">
                                            	<input type="text" id="lng" class="form-control" name="X"  required>
                                            	<input type="hidden" id="place_url" class="form-control" name="place_url" value="https://www.dingpet.shop/facilitymap/p001/mapinfo?site_id=">
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
                                                <div class="form-group uploadDiv">
									            <input type="file" name='uploadFile' multiple>
									        	</div>									        
									        	<div class='uploadResult'>
									          	<ul>									          
									          	</ul>
									        	</div>
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

	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e){
	    
	    e.preventDefault();
	    
	    console.log("submit clicked");
	    
	    var str = "";
	    
	    $(".uploadResult ul li").each(function(i, obj){
	      
	      var jobj = $(obj);
	      
	      console.dir(jobj);
	      
	      
	      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	      
	    });
	    
	    
	    formObj.append(str).submit();
	    
	  });

	  
	  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	  var maxSize = 5242880; //5MB
	  
	  function checkExtension(fileName, fileSize){
	    
	    if(fileSize >= maxSize){
	      alert("파일 사이즈 초과");
	      return false;
	    }
	    
	    if(regex.test(fileName)){
	      alert("해당 종류의 파일은 업로드할 수 없습니다.");
	      return false;
	    }
	    return true;
	  }	  
	  $("input[type='file']").change(function(e){

	    var formData = new FormData();
	    
	    var inputFile = $("input[name='uploadFile']");
	    
	    var files = inputFile[0].files;
	    
	    for(var i = 0; i < files.length; i++){

	      if(!checkExtension(files[i].name, files[i].size) ){
	        return false;
	      }
	      formData.append("uploadFile", files[i]);
	      
	    }
	    
	    $.ajax({
	      url: '/facilitymap/p001/upload/uploadAjaxAction',
	      processData: false, 
	      contentType: false,
	      data:formData,
	      type: 'POST',
	      dataType:'json',
	        success: function(result){
			  showUploadResult(result); //업로드 결과 처리 함수 

	      }
	    }); //$.ajax
	    
	  });  
	  
	  function showUploadResult(uploadResultArr){
		    
	    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
	    
	    var uploadUL = $(".uploadResult ul");
	    
	    var str ="";
	    
	    $(uploadResultArr).each(function(i, obj){
	    	if(obj.image){
				var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			
				
				str += "<li data-path='"+obj.uploadPath+"'";
				str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
				str +" ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' "
				str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/facilitymap/p001/upload/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str +"</li>";
			}else{
				var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
			    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");			      
				str += "<li "
				str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
				str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/resources/imges/attach.png'></a>";
				str += "</div>";
				str +"</li>";
			}

	    });
	    
	    uploadUL.append(str);
	  }

	  $(".uploadResult").on("click", "button", function(e){
		    
	    console.log("delete file");
	      
	    var targetFile = $(this).data("file");
	    var type = $(this).data("type");
	    
	    var targetLi = $(this).closest("li");
	    
	    $.ajax({
	      url: '/facilitymap/p001/upload/deleteFile',
	      data: {fileName: targetFile, type:type},
	      dataType:'text',
	      type: 'POST',
	        success: function(result){
	           alert(result);
	           
	           targetLi.remove();
	         }
	    }); //$.ajax
	   });


	  
	});

</script> 

<!-- 주소 검색용 우편번호 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78d603c9ceea19aeba68479415b917d4&libraries=services"></script>
<script src="${pageContext.request.contextPath}/resources/js/map_register.js" type="text/javascript"></script>
</body>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</html>