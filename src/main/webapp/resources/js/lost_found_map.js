var currentX = 37.566821;
var currentY =  126.9786561;


//1.지도 생성
var mapContainer = document.getElementById('map'); // 지도를 표시할 div 

var mapOption = { 
        center: new kakao.maps.LatLng(37.566821, 126.9786561), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(currentX, currentY); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    

//2.현재 위치정보 읽어와서 지도 중심으로 설정, 현 위치에 마커 표시
$(function(){
	getLocation();
});

function getLocation(){
	if(navigator.geolocation){
		navigator.geolocation.getCurrentPosition(function(position){
			currentX = position.coords.latitude;
			currentY = position.coords.longitude;
			
			var coords = {currentX, currentY};
			$("#check").val(coords.currentX + " ," + coords.currentY);
			
			var currentLocation = new kakao.maps.LatLng(currentX, currentY); 
			map.setCenter(currentLocation);//현위치로 지도 중심 설정
			
			markerPosition  = new kakao.maps.LatLng(currentX, currentY); 
			marker = kakao.maps.Marker({
			    position: markerPosition
			});
			marker.setMap(map);
		}, function(error){
			if(error.code == 1){
				alert('위치정보 제공이 거부되었습니다.');
			}else{
				alert('위치 정보를 읽어올 수 없습니다.');
			}
		});
	}else{
		alert('위치 정보를 읽어올 수 없습니다.');
	}
}





//중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
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



