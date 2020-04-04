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
public class RoomDaoImpl implements RoomDao {

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}


	//@Override
	public List<RoomModel> findAll() {
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		String sql = "SELECT * FROM room";
		
        List<RoomModel> result = namedParameterJdbcTemplate.query(sql, new Mapper());
        
        return result;
        
	}


	public RoomModel findById(int id) {
		// TODO Auto-generated method stub
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		String sql = "SELECT * FROM room WHERE roomNumber=:id";

		List<RoomModel> result = namedParameterJdbcTemplate.query(sql, params, new Mapper());

		return result.size() == 0 ? null : result.get(0);
	}

	private static final class Mapper implements RowMapper<RoomModel> {

		public RoomModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			RoomModel model = new RoomModel();
			model.roomNumber = rs.getInt("roomNumber");
			return model;
		}
	}

}
