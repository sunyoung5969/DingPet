//유기견 발견장소에 필요한 카카오맵 API

  var mapContainer = document.getElementById('lost_map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.565151, 126.984621), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.565151, 126.984621),
        map: map
    });


    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
               // document.getElementById("address_display").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        
                        var map_wrap =  document.getElementById("map_wrap");
                        var lost_map_guide = document.getElementById("lost_map_guide");
                        // 지도를 보여준다.
                        
                        map_wrap.style.display = "block";
                        lost_map_guide.style.display = "block";
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
        
    }


//지도 내 이동시 행정구역 변동 표시, 지도 클릭 시 해당 위치에 마커 표시 	    

	    var infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	    var addrString = '';
	    // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	    searchAddrFromCoords(map.getCenter(), displayCenterInfo);

	    // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	        searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	            if (status === kakao.maps.services.Status.OK) {
	                var detailAddr ='<div>' + result[0].address.address_name + '</div>';
	                
	                var content = '<div class="bAddr">'+ detailAddr + '</div>';
	                
	               addrString =result[0].address.address_name;

	                // 마커를 클릭한 위치에 표시합니다 
	                marker.setDraggable(true); 
	                marker.setPosition(mouseEvent.latLng);
	                marker.setMap(map);
	                
	                // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	                infowindow.setContent(content);
	                infowindow.open(map, marker);
	                
	                //클릭 시 인풋 태그에 주소 변동 반영 
	                document.getElementById("address_display").value = addrString;
	                
	                //마커 좌표 가져옴
	                var position = marker.getPosition();
	                var y = position.getLat();
	                var x = position.getLng();
	                
	                //input hidden으로 리퀘스트 바디에 포함
	                document.getElementById("lat").value = y;
	                document.getElementById("lng").value = x;
	                
	            }   
	        });
	    });

	    // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	    kakao.maps.event.addListener(map, 'idle', function() {
	        searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	    });
	    
	    
	    function searchAddrFromCoords(coords, callback) {
	        // 좌표로 행정동 주소 정보를 요청합니다
	        geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	    }

	    function searchDetailAddrFromCoords(coords, callback) {
	        // 좌표로 법정동 상세 주소 정보를 요청합니다
	        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	    }

	    // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	    function displayCenterInfo(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            var infoDiv = document.getElementById('centerAddr');

	            for(var i = 0; i < result.length; i++) {
	                // 행정동의 region_type 값은 'H' 이므로
	                if (result[i].region_type === 'H') {
	                    infoDiv.innerHTML = result[i].address_name;
	                    break;
	                }
	            }
	        }    
	    }
	    
	    function mark(){
	    	
	    }
	    
	    
