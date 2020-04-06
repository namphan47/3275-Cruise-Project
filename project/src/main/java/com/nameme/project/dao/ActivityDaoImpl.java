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
public class ActivityDaoImpl implements ActivityDao {

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	public List<OnBoardActivityModel> findAllOnboard() {

		String sql = "SELECT * FROM onBoardActivity";

		List<OnBoardActivityModel> result = namedParameterJdbcTemplate.query(sql, new ActivityOnBoardMapper());

		return result;

	}

//	public List<ActivityModel> findAll() {
//
//		String sql = "SELECT * FROM activity";
//
//		List<OnBoardActivityModel> result = namedParameterJdbcTemplate.query(sql, new ActivityOnBoardMapper());
//
//		return result;
//
//	}

	public int createActivity(int guestCount, int bookingID, double totalAmount) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("guestCount", guestCount);
		params.put("bookingID", bookingID);
		params.put("totalAmount", totalAmount);
		String sql = "INSERT INTO activity(  \"GUESTCOUNT\", \"BOOKINGID\", \"TOTALAMOUNT\" ) VALUES(:guestCount,:bookingID,:totalAmount)";

		return namedParameterJdbcTemplate.update(sql, params);
	}

	private static final class ActivityMapper implements RowMapper<ActivityModel> {

		public ActivityModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			ActivityModel activityModel = new ActivityModel();
			activityModel.id = rs.getInt("id");
			activityModel.bookingID = rs.getInt("bookingID");
			activityModel.guestCount = rs.getInt("guestCount");
			activityModel.totalAmount = rs.getDouble("totalAmount");

			return activityModel;
		}
	}

	private static final class ActivityOnBoardMapper implements RowMapper<OnBoardActivityModel> {

		public OnBoardActivityModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			OnBoardActivityModel activityModel = new OnBoardActivityModel();
			activityModel.guestCount = rs.getInt("guestCount");
			activityModel.imageSrc = rs.getString("imageSrc");
			activityModel.description = rs.getString("description");
			activityModel.name = rs.getString("activityName");
			activityModel.activityId = rs.getInt("activityID");
			activityModel.price = rs.getDouble("price");

			return activityModel;
		}
	}

	public List<ActivityModel> findAllByBookingId(int bookingId) {
		String sql = "SELECT * FROM activity WHERE bookingID = "+bookingId;

		List<ActivityModel> result = namedParameterJdbcTemplate.query(sql, new ActivityMapper());

		return result;
	}

}
