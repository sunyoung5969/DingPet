// 경로 함수
function pathLine(){
// ------------------------ 중심 좌표 구하기 ------------------------------

	var latArr = new Array();	// 위도 담을 배열
	var litArr = new Array();	// 경도 담을 배열
	var minLat = '';			// 위도 중 제일 작은 값
	var maxLat = '';			// 위도 중 제일 큰 값
	var minLit = '';			// 경도 중 제일 작은 값
	var maxLit = '';			// 경도 중 제일 큰 값
	console.log($(".locationJSON").val().toString())
	var strJSON = $(".locationJSON").val();	// JSON 문자열 가져오기
	var jsonOb = '';
	
	var jsonparse = JSON.parse(strJSON);	// JSON문자열 파싱
	
	for(var i=0; i<jsonparse.count; i++){
		jsonOb = jsonparse['location_'+i];	// JSON안의 객체 가져오기
	
		latArr.push(jsonOb.lat);			// 위도들 배열에 담기
		litArr.push(jsonOb.lit);			// 경도들 배열에 담기
	}
	
	latArr.sort();		// 정렬
	litArr.sort();		// 정렬
	
	minLat = latArr[0];
	minLit = litArr[0];
	maxLat = latArr[latArr.length-1];
	maxLit = litArr[litArr.length-1];
	
	var centerLat = minLat + ((maxLat - minLat) / 2);	// 위도 중심좌표 구하기
	var centerLit = minLit + ((maxLit - minLit) / 2);	// 경도 중심좌표 구하기

// ---------------------------------------------------------------------

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
		center : new kakao.maps.LatLng(centerLat, centerLit), // 지도의 중심좌표
		level : 5
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
	var linePath = new Array();
	
	for(var i=0; i<jsonparse.count; i++){
		linePath.push(new kakao.maps.LatLng(jsonparse['location_'+i].lat, jsonparse['location_'+i].lit));
	}

	console.log(linePath)

	// 지도에 표시할 선을 생성합니다
	var polyline = new kakao.maps.Polyline({
		path : linePath, // 선을 구성하는 좌표배열 입니다
		strokeWeight : 5, // 선의 두께 입니다
		strokeColor : '#37c5be', // 선의 색깔입니다
		strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		strokeStyle : 'solid' // 선의 스타일입니다
	});

	// 지도에 선을 표시합니다
	polyline.setMap(map);
}