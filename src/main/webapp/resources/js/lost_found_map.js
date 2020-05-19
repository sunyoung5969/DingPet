//1.지도 생성
var mapContainer = document.getElementById('map'); // 지도를 표시할 div 

var mapOption = { 
        center: new kakao.maps.LatLng(37.570572, 126.985249), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


//@@@ end of 1 @@@

//2.현재 위치정보 읽어와서 지도 중심으로 설정, 현 위치에 마커 표시

function getLocation(){
	if(navigator.geolocation){
		navigator.geolocation.getCurrentPosition(function(position){
			currentX = position.coords.latitude;
			currentY = position.coords.longitude;
			
			var coords = {currentX, currentY};
			$("#check").val(coords.currentX + " ," + coords.currentY);
			
			var currentLocation = new kakao.maps.LatLng(currentX, currentY),
			message = "<div style='padding:5px; text-align:center; border:none;'>현재 위치</div>";
			
			removeMarker();
			displayMarker(currentLocation);
			var bounds = map.getBounds();
			 var boundsStr = bounds.toString();
			 
		}, function(error){
			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667)
			if(error.code == 1){
				alert('위치정보 제공이 거부되었습니다.');
				 displayMarker(locPosition, message);
			}else{
				alert('위치 정보를 읽어올 수 없습니다.');
				displayMarker(locPosition, message);
			}
		});
	}else{
		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = '위치 정보를 읽어올 수 없습니다.'
        displayMarker(locPosition, message);
	}
}

//지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = false;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    //infowindow.open(map, marker);
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    
//@@@ end of 2 @@@

/*
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
 * */

//3. 지도 상단에 현재 지도상 위치 주소 표시
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

//@@@ end of 3 @@@


//4. 마커 여러개 표시
var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
markers = [], // 마커를 담을 배열입니다
currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

//장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map); 

// 지도에 idle 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
	
	var bounds = map.getBounds();
	var maxX = bounds.ia;
	var maxY = bounds.ja;
	var minX = bounds.da;
	var minY = bounds.ka;
	
	var args = {
			maxX:maxX,
			maxY:maxY,
			minX:minX,
			minY:minY
	}
	
    if (!currCategory) {
    	//@@아무것도 선택하지 않으면 전체 보여주고 싶은데 모르겠네
    	//ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
    	//return;
    
    }else if(currCategory == 'lost'){
    	$.getJSON('/lostpets/p002/map/lost' + '.json', args, function(result, status){
    		var pagination = { 
					totalCount: 45,
					hasNextPage: true,
					hasPrevPage: false,
					first: 1,
					current: 1,
					last: 3,
					perPage: 15
					};
    		placesSearchCB(result, 'OK', pagination);
    		useMapBounds : true;
    		console.log(status + ' lost 불러오기 성공함');
    	});
    	
    }else if(currCategory == 'find'){
    	$.getJSON('/lostpets/p002/map/find' + '.json', args, function(result, status){
    		var pagination = { 
					totalCount: 45,
					hasNextPage: true,
					hasPrevPage: false,
					first: 1,
					current: 1,
					last: 3,
					perPage: 15
					};
    		placesSearchCB(result, 'OK', pagination);
    		useMapBounds : true;
    		console.log(status + ' find 불러오기 성공함');
    	});
    	
    }else{
    	
    }
    
    // 커스텀 오버레이를 숨깁니다 
    //placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    //removeMarker();
    
    //ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
    	document.getElementById('zero').style.display = 'block';
    } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
    }
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');
    
    for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);
    		
            // 마우스 오버 시 정보 표시 이벤트
            (function(marker, place) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
      
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = '/resources/images/bg/sprite1.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(60, 60),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(60, 190), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (order*65)) // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
           // offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });
    
    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
	
	var spanText = place.category == 'lost' ? '발견 일자' : '실종 일자';
	
    var content = '<div class="placeinfo" style="cursor:normal;"title="제목을 클릭하면 게시글로 이동합니다."><div class="p-3">'
   content += '<a style="cursor:pointer;" href="/lostpets/p001/view?board_id=' + place.board_id + '" target="_blank">';
   content += '<div style="width:90%; position:relative" class="text_overflow"><span class = "my-2"><strong>' + place.title +'</strong></span></div></a>';
   content += '<i class="fas fa-times pl-2" onclick="closeInfo()" style="width:10%;"></i>'; 
   content += '	<p class = "pl-2"><span class="tag">견종</span><span>' + place.dog_breed + '</span></p>';
   content += '<p class = "pl-2"><span class="tag">성별</span><span>' + place.dog_sex + '</span></p>';
   content += '<p class = "pl-2"> <span class="tag">' + spanText + '</span><span>' + place.found_date + '</span></p>';
   content += '</div></div><div class="after"></div>';
   
   
    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}

function closeInfo(){
	placeOverlay.setMap(null);
};


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if(className === 'onLost'){
    	currCategory = '';
    	changeCategoryClass();
    	removeMarker();
    }else if(className === 'onFind'){
    	currCategory = '';
    	changeCategoryClass();
    	removeMarker();
    }else{
    	currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
    
    /*
    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }*/
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }
    
    if(el){
    	if(el.id == "lost"){
    		el.className = 'onLost';
    	}else if(el.id =="find"){
    		el.className = 'onFind';
    	}
    }
    
/*
    if (el) {
        el.className = 'on';
    }*/ 
} 
var modal = $("#modal");
var window = $(window);

	$(".mapBtn").click(function(){
		modal.css("display", "block");
		map.relayout();
	});

	//닫기 버튼 누르면 닫기
	$("#closeBtn").click(function(){
		modal.css("display", "none");
	});
	
	//모달 바깥 영역 클릭시 닫기
	window.onclick = function(event) {
		if (event.target.id == "modal") {
			modal.css("display", "none");
		}
	}

