package com.varxyz.wgt.shop.service;

import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.varxyz.wgt.data.DataSourceConfig;
import com.varxyz.wgt.shop.dao.ShopDao;
import com.varxyz.wgt.shop.domain.Menu;
import com.varxyz.wgt.shop.domain.Shop;

public class ShopServiceImpl implements ShopService {
	
	AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DataSourceConfig.class);
	ShopDao dao = context.getBean("shopDao", ShopDao.class);

	@Override
	public List<Shop> findAllByShopName(String shopName) {
		return dao.findAllByShopName(shopName);
	}

	@Override
	public boolean addShop(Shop shop) {
		return dao.addShop(shop);
	}

	@Override
	public boolean addMenu(Menu menu) {
		return dao.addMenu(menu);
	}

	@Override
	public Shop findShopByBnsNum(String bnsNum) {
		return dao.findShopByBnsNum(bnsNum);
	}

	@Override
	public List<Menu> findShopMenuByBnsNum(String bnsNum) {
		return dao.findShopMenuByBnsNum(bnsNum);
	}

}
