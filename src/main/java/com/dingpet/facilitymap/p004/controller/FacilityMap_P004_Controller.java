package com.dingpet.facilitymap.p004.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.facilitymap.p004.service.FacilityMap_P004_Service;

import lombok.AllArgsConstructor;

@RequestMapping("/facilitymap/p004/*")
@AllArgsConstructor
@Controller
public class FacilityMap_P004_Controller {

	private FacilityMap_P004_Service service;
}
