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


@Repository
public class CruiseDaoImpl implements CruiseDao {

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}


	//@Override
	public List<CruiseModel> findAll() {
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		String sql = "SELECT * FROM cruise";
		
        List<CruiseModel> result = namedParameterJdbcTemplate.query(sql, new CruiseMapper());
        
        return result;
        
	}

	private static final class CruiseMapper implements RowMapper<CruiseModel> {

		public CruiseModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			CruiseModel cruiseModel = new CruiseModel();
			cruiseModel.id = rs.getInt("cruiseID");
			cruiseModel.name = rs.getString("name");
			cruiseModel.routeId = rs.getInt("routeID");
			return cruiseModel;
		}
	}

}
