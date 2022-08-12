package com.varxyz.wgt.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.varxyz.wgt.shop.domain.Shop;
import com.varxyz.wgt.shop.service.ShopService;
import com.varxyz.wgt.shop.service.ShopServiceImpl;

@Controller
public class UpdateShopController {
	
	ShopService service = new ShopServiceImpl();
	
	@GetMapping("shop/updateShop")
	public String updateShopGo(Model model, Shop shop) {
		model.addAttribute("shop", shop);
		return "shop/view/updateMyShop";
	}
	
	@PostMapping("shop/updateShop")
	public String updateShopForm(@RequestParam("shop_img") MultipartFile file, HttpServletRequest request) {
		Shop shop = new Shop();
		shop.setBusinessNumber(request.getParameter("businessNumber"));
		shop.setShopName(request.getParameter("shopName"));
		shop.setShopTel(request.getParameter("shopTel"));
		shop.setShopAddress(request.getParameter("shopAddress"));
		shop.setShopHours(request.getParameter("shopHours"));
		shop.setShopTables(request.getParameter("shopTables"));
		shop.setShopMaxPeoples(request.getParameter("shopMaxPeoples"));
		shop.setShopImg(request.getParameter("shop_img"));
		
		String fileRealName = file.getOriginalFilename(); // 실제 파일 명을 알수있는 메소드
		long size = file.getSize(); // 파일 사이즈
		
		// 사용자가 이미지를 업로드 하지 않았을 경우 예외 처리
		if (fileRealName == null || fileRealName.length() == 0) {
			shop.setShopImg(request.getParameter("shopImg"));
			service.updateShop(shop, request.getParameter("shopImg"));
			
			return "shop/view/updateMyShop";
			
		}
		
		System.out.println("파일명 : " + fileRealName);
		System.out.println("용량 크기(byte) : " + size);
		//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
		
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		
		// resources에 shop_image 폴더 절대 경로 입력 String uploadFolder = "";  
		String uploadFolder = "C:\\Hbackend\\Where-are-you-going-today\\wgt\\src\\main\\webapp\\resources\\shop\\shop_Img";
		
		/*
		  파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
		  업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있다. 
		  타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
		  고유한 랜던 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
		 */
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];
		System.out.println("생성된 고유 문자열 : " + uniqueName );
		shop.setShopImg(uniqueName);
		System.out.println("확장자명 : " + fileExtension);
		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
		File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // 적용 후
		
		try {
			file.transferTo(saveFile); // 실제 파일 저장메소드(filewriter 작업을 손쉽게 한방에 처리해준다.
		}catch (IllegalStateException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		service.updateShop(shop, request.getParameter("shopImg"));
		
		return "shop/view/updateMyShop";
	}
}
