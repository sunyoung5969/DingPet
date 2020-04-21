<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!doctype html>
<html lang="ko">
  <head>
    <title>DingPet.</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
    <link href="/resources/images/favicon.png" rel="icon" type="image/png" >
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700, 900|Vollkorn:400i" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    
    <!--css 추가-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    
    <!--탭 메뉴 -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="https://assets.mypetlife.co.kr/map/wp-content/themes/listify/css/style.min.css">
  	
  	<Style>
        .DayOfTheWeek_li{
         display: inline-block;
         padding: 5px;
      }
         
      .Calendar {
      
         width: 80%;
      
      }
      
      .imgbtn{
         padding-bottom: 8px;
      }
      
      .CalendarMonth_small{
         padding: 10px 30px 10px 30px;
         margin: 0px;
         display: inline-block;
      }
      
      .CalendarDayDiv--td { 
      
         padding: 5px;
      
      }
      
      .CalendarDayDiv{
         border: 0px;
         width: 100%;
         background-color: white;
         color: #87CEEB;      
      }
      
      .CalendarDayDiv--closed{
         border: 0px;
         width: 100%;
         background-color: white;
         color: gray;
      
      }      
      
      .DayOfTheWeek_li{
         display: inline-block;
         padding: 5px 21.3px 5px 21.3px;
         font-size: 17px;
      }
      
      .DayOfTheWeek_ui{
      
         width: 100%;
         padding: 0px;
         margin: 0px;
      }
      
      .service_h2-reservation{
          font-weight: 600;
          font-size: 17px;
          letter-spacing: -0.2px;
          line-height: 25px;
          color: rgb(57, 60, 71);
          margin-top: 15px;
          display: inline-block;
          
      }
      
      .service_warp{
         width:100%;
      }
      
      .service_txth1, .service_txth2{
         margin-bottom: 0px;
      }
      
      .service_ico{
         position: relative;
         left: 12%;
      }
            
      .profile-reservation, .price-reservation, .schedule-reservation{
           display: inline-block;
        }
        
      .dogtype{
         display: inline-block;
         position: relative;
         top: 15px;
         width: 28%;
      }
      
      
      .price_type{
         position: relative;
         display: inline-block;
         left: 9%;
         top: -20px;
         padding: 0px;
         width: 90%;
      }
      
      .kg{
         margin:0px;
         font-size: 10px;
      }
      
      .type_text{
         display: inline-block;
         font-size: 15px;
         padding: 10px 10px 10px 10px;
         margin: 0px;
         width: 100%;
      }
      .price-reservation-container{
         display: inline-block;
         width: 36%;
         min-width: 380px;
         min-height: 380px;
         position:relative;
      }
      
      .priceDiv{
         display: inline-block;
          position: relative;
          left: 8%;
      }
      
      .priceDiv-reservation{
         display: inline-block;
          position: absolute;
          padding: 10px;
      }
      
      .price_text{
         display: inline-block;
         position: relative;
          left: 10%;
         font-size: 15px;
         padding: 0px;
         margin: 0px;
      }
      
      .price{
         display: inline-block;
         width: 55%;
      }
      
      .price-reservation{
          display: inline-block;
          width: 65%;
          position: relative;
          left: -6%;
      }
      
      .number{
         display: inline-block;
         position:relative;
         width: 18%;
         left: 6%;
         font-size: 15px;
      }
      
      .number-reservation{
          display: inline-block;
          position: relative;
          width: 18%;
          left: 3%;
          font-size: 15px;
      }
      
      .num, .num-small, .num-medium, .num-large{
         display: inline-block;
         margin:0px;
      }
      
      .justify-content-center{
         padding-top: 25px;
      }
      
      .paws{
         margin: 0px;
      }
      
      .heading-section h2{
         
         padding:0px;
         font-size: 23px;
      }
      
      .licenseDiv{
         display: inline-flex;
         padding-left: 20px;
         padding-right: 20px;
      }
      
      .license_txth1{
         margin-bottom: 0px;
         padding: 4px 10px 4px 20px;
         font-weight: 600;
      }
      
      .license_txth2{
         margin-bottom: 0px;
         padding: 0px 10px 5px 20px;
      }
      
      .reservationDiv{
      	 width:100%;
      	 padding: 0 15%;
         display: none;
         position: absolute;
         background-color: white;
         z-index: 100;
         border-top: lightgoldenrodyellow solid 2px;
         border-bottom: lightgoldenrodyellow solid 2px;
      }
      
      .profile-reservation{
         width: 27%;
         min-width: 380px;
         min-height: 380px;
         position: relative;
         top: 0;
      }
      .profile-reservationDiv {
      	position: absolute;
      }
      .profileIMGDiv-reservation{
         display: inline;
         padding: 25px;
      }
      
      .profileIMG-reservation{
         border-radius: 50% !important;
         max-width: 25%;
      }
        
        .profile_h6Div-reservation{
           display: inline-block;
           padding: 20px;
           width: 60%;
           text-align: left;
        }
        
        .profile_h6-reservation{
           margin: 0px;
        }
        
        .service_swap-reservation{
           width: 100%;
        }
        
        .service_list-reservation{
           padding:10px;
        }
        /*
        .service_h2-reservation{
           margin:0px;
            font-weight: 600;
          font-size: 14px;
          letter-spacing: -0.2px;
          line-height: 25px;
          color: rgb(57, 60, 71);
        }
        */
        .service_ico-reservation{
           display: flex;
          flex-direction: row;
          align-items: center;
          width: 158px;
          height: 69px;
          margin-left: 20px;
        }
        
        .service_txtbox-reservation{
          margin-left: 10px;
          width: 115px;
          min-width: 115px;
        }
        
        .price_type-reservation{
          position: relative;
          display: inline-block;
          /* left: 9%; */
          top: 0;
          padding: 10px 0	;
          width: 100%;
        }

        .schedule-reservation{
           position: static;
        }
        
        .Calendar-reservation{
        	position: absolute;
        	top:0;
        	width:23%;
        }
        .APMDiv{
        	display:flex;
        }
        .btn-reservation{
        	padding-top: 5%;
        	padding-bottom: 5%;
    		padding-left: 30%;
        }
        
      .dateTime{
          display: none;
          position: absolute;
          width: 100%;
          background-color: white;
          top: 42px;
        }
        
        .time-setting{
          font-size: 20px;
          margin: 0px;
          padding: 10px;
        }
        
        .time-btn{
          width: 100%;
          height: 44px;
          padding: 0px;
          background-color: white;
          border: gainsboro solid 1px;
        }
        .time-text{
           margin: 0px;
           color: #87CEEB;
        }
        
        .APM{
         width: 49.5%;
         height: 40px;
          background-color: white;
          border: gainsboro solid 1px;
        }
        
        .time{
           text-align: center;
           padding: 0px;
        }
      
      .backbtn {
      	position: absolute;
	    bottom: -25px;
	    display: inline-block;
	    left: 50%;
      }
      
      .reservtext{
         margin: 0px;
      }
      
      
     </Style>
 
  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" id="home-section">
  

  <div id="overlayer"></div>
  <div class="loader">
    <div class="spinner-border text-primary" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>


  <div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
   
    
    <header class="site-navbar js-sticky-header site-navbar-target" role="banner" >

      <div class="container">
        <div class="row align-items-center">
          
          <div class="col-6 col-xl-2">
            <h1 class="mb-0 site-logo"><a href="/" class="h2 mb-0"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo"><span class="text-primary">.</span> </a></h1>
          </div>

          <div class="col-12 col-md-10 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right" role="navigation">

              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                <li><a href="/" class="nav-link">Home</a></li>
                <li class="has-children">
                  <a href="#about-section" class="nav-link">반려견 찾기</a>
                  <ul class="dropdown">
                    <li><a href="/lostpets/p001/list" class="nav-link">유기견 보호</a></li>
                    <li><a href="#" class="nav-link">유기견 찾기</a></li>
                    <li class="has-children">
                      <a href="#">More Links</a>
                      <ul class="dropdown">
                        <li><a href="#">Menu One</a></li>
                        <li><a href="#">Menu Two</a></li>
                        <li><a href="#">Menu Three</a></li>
                      </ul>
                    </li>
                  </ul>
                </li>
                
                <li class="has-children">
                  <a href="#trainers-section" class="nav-link">펫시터</a>
                  <ul class="dropdown">
                    <li><a href="${pageContext.request.contextPath}/petsitting/p001/profilelist" class="nav-link">펫시터 소개</a></li>
                    <li><a href="#" class="nav-link">예약 바로가기</a></li>
                    <li class="has-children">
                      <a href="#">More Links</a>
                      <ul class="dropdown">
                        <li><a href="#">Menu One</a></li>
                        <li><a href="#">Menu Two</a></li>
                        <li><a href="#">Menu Three</a></li>
                      </ul>
                    </li>
                  </ul>  
                </li>
                <li class="has-children">
                  <a href="#services-section" class="nav-link">동반시설지도</a>
                  <ul class="dropdown">
                    <li><a href="/facilitymap/p001/facilityMap" class="nav-link">시설지도</a></li>
                    <li><a href="/facilitymap/p003/facilityregister" class="nav-link">시설지도 등록_f</a></li>
                    <li><a href="/facilitymap/p003/facilityinfo" class="nav-link">시설지도 보기_f</a></li>
                    <li><a href="/facilitymap/p003/register" class="nav-link">시설test</a></li>
                    <li><a href="/facilitymap/p003/infopage" class="nav-link">시설인포test</a></li>
                    <li class="has-children">
                      <a href="#">More Links</a>
                      <ul class="dropdown">
                        <li><a href="#">Menu One</a></li>
                        <li><a href="#">Menu Two</a></li>
                        <li><a href="#">Menu Three</a></li>
                      </ul>
                    </li>
                  </ul> 
                </li>
                <li><a href="#" class="nav-link">자주하는 질문</a></li>
                <li>
                	<div>
				    	<a href="/customers/p001/signin" class="nav-link btn btn-primary"" style="color: #fff !important; line-height: 1rem;">로그인</a>
				    </div>
                </li>
              </ul>
            </nav>
          </div>


          <div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle float-right"><span class="icon-menu h3"></span></a></div>

        </div>
      </div>
      
    </header>