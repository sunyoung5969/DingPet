package com.dingpet.petsitting.p002.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.dingpet.petsitting.p002.vo.KakaoPayApprovalVO;
import com.dingpet.petsitting.p002.vo.KakaoPayCancelVO;
import com.dingpet.petsitting.p002.vo.KakaoPayReadyVO;
import com.dingpet.petsitting.p002.vo.PetSitting_P002_VO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class KakaoPay {
		
	private static final String HOST = "https://kapi.kakao.com";

	private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    private KakaoPayCancelVO kakaoPayCancelVO;
    

	public String kakaoPayReady(PetSitting_P002_VO reserved_info) {

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "b4064e8fcc9c7b07fa3ca3d1b1c628d2");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");							// 가맹점 코드
		params.add("partner_order_id", reserved_info.getOrder_ID());// 주문 번호 YYYYMMDDHH
		params.add("partner_user_id", reserved_info.getMember_ID());// 회원 아이디
		params.add("item_name", "펫시터 예약");						// 상품명
		params.add("quantity", "1"); 								// 수량
		params.add("total_amount", reserved_info.getTotal_amount()); // 총 금액
		params.add("tax_free_amount", "0"); // 비과세 금액
		
		//params.add("approval_url", "http://localhost:8080/petsitting/p002/kakaoPaySuccess"); // 결제 성공 시 리다이렉트
		//params.add("cancel_url", "http://localhost:8080/petsitting/p002/kakaoPayCancel"); // 결제 취소 시 리다이렉트
		//params.add("fail_url", "http://localhost:8080/kakaoPaySuccessFail"); // 결제 실패 시 리다이렉트
		
		params.add("approval_url", "https://www.dingpet.shop/petsitting/p002/kakaoPaySuccess"); // 결제 성공 시 리다이렉트
		params.add("cancel_url", "https://www.dingpet.shop/petsitting/p002/kakaoPayCancel"); // 결제 취소 시 리다이렉트
		params.add("fail_url", "https://www.dingpet.shop/kakaoPaySuccessFail"); // 결제 실패 시 리다이렉트
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
					KakaoPayReadyVO.class);

			log.info("" + kakaoPayReadyVO);
			log.info("getNext_redirect_pc_url : " + kakaoPayReadyVO.getNext_redirect_pc_url());


			return kakaoPayReadyVO.getNext_redirect_pc_url();

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "/pay";
	}

	public KakaoPayApprovalVO kakaoPayInfo(String pg_token, PetSitting_P002_VO reserved_info) {

		log.info("KakaoPayInfoVO............................................");
		log.info("reserved_info : " + reserved_info);
		log.info("kakaoPayReadyVO.getTid() : "+kakaoPayReadyVO.getTid());

		log.info("-----------------------------");
						
		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "b4064e8fcc9c7b07fa3ca3d1b1c628d2");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", kakaoPayReadyVO.getTid());
		params.add("partner_order_id", reserved_info.getOrder_ID());
		params.add("partner_user_id", reserved_info.getMember_ID());
		params.add("pg_token", pg_token);
		params.add("total_amount", reserved_info.getTotal_amount());

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
			log.info("" + kakaoPayApprovalVO);

			return kakaoPayApprovalVO;

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
	
	public KakaoPayCancelVO kakaoPayCancel(PetSitting_P002_VO reserved_info) {

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "b4064e8fcc9c7b07fa3ca3d1b1c628d2");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");			// 가맹점 코드
		params.add("tid", reserved_info.getTid());						// 주문 번호 YYYYMMDDHH
		params.add("cancel_amount", reserved_info.getTotal_amount());	// 총 금액
		params.add("cancel_tax_free_amount", "0"); // 비과세 금액
		
		params.add("approval_url", "http://localhost:8080/petsitting/p002/kakaoPaySuccess"); // 결제 성공 시 리다이렉트
		params.add("cancel_url", "http://localhost:8080/petsitting/p002/kakaoPayCancel"); // 결제 취소 시 리다이렉트
		params.add("fail_url", "http://localhost:8080/kakaoPaySuccessFail"); // 결제 실패 시 리다이렉트
		
		//params.add("approval_url", "https://www.dingpet.shop/petsitting/p002/kakaoPaySuccess"); // 결제 성공 시 리다이렉트
		//params.add("cancel_url", "https://www.dingpet.shop/petsitting/p002/kakaoPayCancel"); // 결제 취소 시 리다이렉트
		//params.add("fail_url", "https://www.dingpet.shop/kakaoPaySuccessFail"); // 결제 실패 시 리다이렉트
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoPayCancelVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/cancel"), body,
					KakaoPayCancelVO.class);

			log.info("" + kakaoPayCancelVO);

			return kakaoPayCancelVO;

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
	
}
