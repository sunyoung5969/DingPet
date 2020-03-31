package com.dingpet.facilitymap.p005.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.facilitymap.p005.service.FacilityMap_P005_Service;

import lombok.AllArgsConstructor;

@RequestMapping("/facilitymap/p005/*")
@AllArgsConstructor
@Controller
public class FacilityMap_P005_Controller {

	private FacilityMap_P005_Service service;
}
