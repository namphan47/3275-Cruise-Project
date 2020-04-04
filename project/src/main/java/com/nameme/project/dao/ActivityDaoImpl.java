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

import com.nameme.project.model.ActivityModel;


@Repository
public class ActivityDaoImpl implements ActivityDao {

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}


	//@Override
	public List<ActivityModel> findAll() {
		
		//Map<String, Object> params = new HashMap<String, Object>();
		
		String sql = "SELECT * FROM onBoardActivity";
		
        List<ActivityModel> result = namedParameterJdbcTemplate.query(sql, new ActivityMapper());
        
        return result;
        
	}

	private static final class ActivityMapper implements RowMapper<ActivityModel> {

		public ActivityModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			ActivityModel activityModel = new ActivityModel();
			activityModel.guestCount = rs.getInt("guestCount");
			activityModel.imageSrc = rs.getString("imageSrc");
			activityModel.description = rs.getString("description");
			activityModel.name = rs.getString("activityName");
			activityModel.activityId = rs.getInt("activityID");
			activityModel.price = rs.getDouble("price");
			
			return activityModel;
		}
	}

}
