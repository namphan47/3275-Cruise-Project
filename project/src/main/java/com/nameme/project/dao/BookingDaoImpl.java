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

import com.nameme.project.model.BookingModel;

@Repository
public class BookingDaoImpl implements BookingDao {

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	public List<BookingModel> findAll() {

		Map<String, Object> params = new HashMap<String, Object>();

		String sql = "SELECT * FROM booking";

		List<BookingModel> result = namedParameterJdbcTemplate.query(sql, new BookingMapper());

		return result;

	}

	public int create(int id, int guestCount, int customerID, int routeID, int roomNumber) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("guestCount", guestCount);
		params.put("customerID", customerID);
		params.put("routeID", routeID);
		params.put("roomNumber", roomNumber);
		String sql = "INSERT INTO booking VALUES(:id,:guestCount,:customerID,:routeID,:roomNumber, 0)";

		return namedParameterJdbcTemplate.update(sql, params);
	}

	public int updateTotal(int id, double total) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("total", total);
		String sql = "UPDATE booking SET total = :total WHERE bookingID = :id";

		return namedParameterJdbcTemplate.update(sql, params);
	}

	private static final class BookingMapper implements RowMapper<BookingModel> {

		public BookingModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			BookingModel bookingModel = new BookingModel();
			bookingModel.id = rs.getInt("bookingID");
			bookingModel.guestCount = rs.getInt("guestCount");
			bookingModel.customerID = rs.getInt("customerID");
			bookingModel.routeID = rs.getInt("routeID");
			bookingModel.roomNumber = rs.getInt("roomNumber");
			return bookingModel;
		}
	}

}
