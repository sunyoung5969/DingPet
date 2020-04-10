<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/header.jsp"%>


<!--====  str of contents  ====-->
    <section class="section testimonial pt-7">
        <div class="row">
          <div class="col-lg-8 col-lg-offset-2 mgcenter">
            <div class="cotainer">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">임시보호 조회</div>
                            <div class="card-body pd40">
                                
                                 <div class="form-group row">
                                        <label class="col-md-4 col-form-label text-md-right">글 번호</label>
                                        <div class="col-md-6">
                                            <input id="tempshelters-title" class="form-control" name="board_id" readonly = "readonly"
                                            value = "${board.board_id }">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-4 col-form-label text-md-right">제목</label>
                                        <div class="col-md-6">
                                            <input type="text" id="tempshelters-title" class="form-control" name="title" readonly = "readonly"
                                            value = "${board.title}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-4 col-form-label text-md-right">카테고리</label>
                                        <div class="col-md-6">
                                            <input type="text" id="tempshelters-title" class="form-control" name="category" readonly = "readonly"
                                            value = "${board.category}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-4 col-form-label text-md-right">회원ID</label>
                                        <div class="col-md-6">
                                            <input type="text" id="tempshelters-title" class="form-control" name="member_id" readonly = "readonly"
                                            value = "${board.member_id}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-4 col-form-label text-md-right">개ID</label>
                                        <div class="col-md-6">
                                            <input type="text" id="tempshelters-title" class="form-control" name="dog_id" readonly = "readonly"
                                            value = "${board.dog_id }">
                                        </div>
                                    </div>
        
                                    <div class="form-group row">
                                        <label class="col-md-4 col-form-label text-md-right">발견일시</label>
                                        <div class="col-md-6">
                                            <input type="date" id="date_of_discovery" class="form-control" name="found_date" readonly = "readonly"
                                            value = "${board.found_date }">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-4 col-form-label text-md-right">발견장소</label>
                                        <div class="col-md-6">
                                            <input type="text" id="place_of_discovery" class="form-control" name="found_location" readonly = "readonly"
                                            value = "${board.found_location}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-4 col-form-label text-md-right">견종</label>
                                        <div class="col-md-6">
                                            <input type="text" id="dog_breed" class="form-control" name="dog_breed" readonly = "readonly"
                                            value = "${board.dog_breed }">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-4 col-form-label text-md-right">성별</label>
                                        <div class="col-md-6">
                                            <input type="text" id="dog_sex" class="form-control" name="dog_sex" readonly = "readonly"
                                            value = "${board.dog_sex }">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-4 col-form-label text-md-right">특이사항</label>
                                        <div class="col-md-6">
                                            <input type="text" id="email" class="form-control" name="dog_note" readonly = "readonly"
                                            value = "${board.dog_note }">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-4 col-form-label text-md-right">내용</label>
                                        <div class="col-md-6">
                                            <textarea id="form_message" name="content" class="form-control" rows="4"  readonly = "readonly"><c:out value = "${board.content}"/></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-4 col-form-label text-md-right">사진1</label>
                                        <div class="col-md-6">
                                            <input type="file" name="photo_front" id="profile_pt" onchange="previewImage(this,'View_area')" >
                                            <div id='View_area' class="img_up"></div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-4 col-form-label text-md-right">사진2</label>
                                        <div class="col-md-6">
                                            <input type="file" name="photo_front" id="profile_pt" onchange="previewImage(this,'View_area')">
                                            <div id='View_area' class="img_up"></div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-4 col-form-label text-md-right">사진3</label>
                                        <div class="col-md-6">
                                            <input type="file" name="photo_front" id="profile_pt" onchange="previewImage(this,'View_area')">
                                            <div id='View_area' class="img_up"></div>
                                        </div>
                                    </div>
                                       
                                    <div class="text-center pd40">
                                        <button data-oper = "list"  class="btn btn-primary" onclick = "location.href = '/lostpets/p001/list'">
                                           	 목록으로</button>
                                        <button data-oper = "modify"  class="btn btn-primary" 
                                        onclick = "location.href ='/lostpets/p001/modify?board_id=<c:out value = "${board.board_id }"/>'">
                                           	내 글 관리</button>
                                    </div>
                          </div>
                            
                        </div>
                    </div>
                </div>
            </div>
          </div>
        </div>
    </section>
    <!--====  end of contents  ====-->
    
    

<%@include file="../../includes/footer.jsp"%>
