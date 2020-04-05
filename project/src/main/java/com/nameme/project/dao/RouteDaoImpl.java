package com.nameme.project.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.nameme.project.model.CruiseModel;
import com.nameme.project.model.RouteModel;

@Repository
public class RouteDaoImpl implements RouteDao {

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}
	
	public List<RouteModel> findAll() {

		String sql = "SELECT * FROM route";

		List<RouteModel> result = namedParameterJdbcTemplate.query(sql, new Mapper());

		return result;

	}

	public RouteModel findById(int id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		String sql = "SELECT * FROM route WHERE routeID=:id";

		List<RouteModel> result = namedParameterJdbcTemplate.query(sql, params, new Mapper());

		return result.size() == 0 ? null : result.get(0);
	}

	private static final class Mapper implements RowMapper<RouteModel> {

		public RouteModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			RouteModel model = new RouteModel();
			model.id = rs.getInt("routeID");
			model.name = rs.getString("name");
			model.ship = rs.getString("ship");
			model.setStartDate(rs.getFloat("startDate"));
			model.setReturnDate(rs.getFloat("returnDate"));
			model.minPriceForTwo = rs.getDouble("minPriceForTwo");
			return model;
		}
	}
}
