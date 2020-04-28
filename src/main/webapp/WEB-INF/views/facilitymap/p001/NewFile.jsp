<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


	.filebox{
		display: inline-block;
	}
	
	.filebox label {
	  display: inline-block;
	  padding: .5em .75em;
	  width:150px;
	  height: 240px;
	  color: #fff;
	  font-size: inherit;
	  line-height: normal;
	  vertical-align: middle;
	  background-color: graytext;
	  cursor: pointer;
	  border: 1px solid #4ca;
	  border-radius: .25em;
	  -webkit-transition: background-color 0.2s;
	  transition: background-color 0.2s;
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
		position: absolute;
		display: inline-block;
		left: 210px;
	}
	
	.wkrurwmd{
		display: inline-block;
	}
	
	.form-control{
		width: 450px;
	}
	
	.serviceimg {
	
		width: 50px;
	
	}
	
	.img-text{
		background-color: gray;
		position: relative;
		width: fit-content;
		top:-140px;
		left: 20%;
	}
	

</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<body>
	<div class="filebox">
			<label for="profilePic"><img id="preview" style="width: 150px; height: 240px" src="">
				<div class="img-text"><p>사 진 등 록</p></div>
			</label>
			<input type="file" name="profilePic" id="profilePic" accept="image/*">
			
			<script>
			    var upload = document.querySelector('#profilePic');
			 	
			    upload.addEventListener('change',function (e) {
			        var get_file = e.target.files;
			        console.log(get_file)
			        
			        //FileReader 객체 생성
			        var reader = new FileReader();
			        
			        // reader 시작시 함수 구현
			        reader.onload = function(aImg){
			        	console.log(1);
				        $("#preview").attr("src", aImg.target.result)
			        }
			        reader.readAsDataURL(e.target.files[0])
			    })
			</script>
		</div>
</body>
</html>