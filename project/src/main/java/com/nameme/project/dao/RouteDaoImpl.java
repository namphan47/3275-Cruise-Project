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


	//@Override
	public List<RouteModel> findAll() {
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		String sql = "SELECT * FROM route";
		
        List<RouteModel> result = namedParameterJdbcTemplate.query(sql, new Mapper());
        
        return result;
        
	}

	private static final class Mapper implements RowMapper<RouteModel> {

		public RouteModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			RouteModel model = new RouteModel();
			model.id = rs.getInt("routeID");
			model.name = rs.getString("name");
			model.ship = rs.getString("ship");
			model.startDate = rs.getFloat("startDate");
			model.returnDate = rs.getFloat("returnDate");
			model.video = rs.getString("video");
			model.minPriceForTwo = rs.getDouble("minPriceForTwo");
			return model;
		}
	}

	public RouteModel findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
