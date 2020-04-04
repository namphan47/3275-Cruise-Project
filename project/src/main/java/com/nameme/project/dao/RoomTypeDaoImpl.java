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

import com.nameme.project.model.*;


@Repository
public class RoomTypeDaoImpl implements RoomTypeDao {

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}


	//@Override
	public List<RoomTypeModel> findAll() {
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		String sql = "SELECT * FROM roomType";
		
        List<RoomTypeModel> result = namedParameterJdbcTemplate.query(sql, new Mapper());
        
        return result;
        
	}

	private static final class Mapper implements RowMapper<RoomTypeModel> {

		public RoomTypeModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			RoomTypeModel model = new RoomTypeModel();
			model.name = rs.getString("name");
			model.basePrice = rs.getDouble("basePrice");
			return model;
		}
	}

	public RoomTypeModel findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
