package com.nameme.project.model;

import java.util.ArrayList;
import java.util.List;

public class CruiseModel {
	public int id;
	public String name;
	public int routeId;
	public List<RouteModel> routes = new ArrayList<RouteModel>();
}
