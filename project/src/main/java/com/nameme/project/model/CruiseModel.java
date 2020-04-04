package com.nameme.project.model;

import java.util.ArrayList;
import java.util.List;

public class CruiseModel {
	public int id;
	public String name;
	public List<Integer> routeIds = new ArrayList<Integer>();
	public List<RouteModel> routes = new ArrayList<RouteModel>();
	
	public double minPrice = 0;

	public void filterRoutes(List<RouteModel> list) {
		routes = new ArrayList<RouteModel>();
		for (RouteModel r : list) {
			if (routeIds.contains(r.id)) {
				routes.add(r);
				if(minPrice == 0 || r.minPriceForTwo < minPrice) {
					minPrice = r.minPriceForTwo;
				}
			}
		}
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public List<RouteModel> getRoutes() {
		return routes;
	}

	public double getMinPrice() {
		return minPrice;
	}
	
}
