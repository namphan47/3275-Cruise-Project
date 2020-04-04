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


	//@Override
	public List<BookingModel> findAll() {
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		String sql = "SELECT * FROM booking";
		
        List<BookingModel> result = namedParameterJdbcTemplate.query(sql, new BookingMapper());
        
        return result;
        
	}

	private static final class BookingMapper implements RowMapper<BookingModel> {

		public BookingModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			BookingModel bookingModel = new BookingModel();
			bookingModel.id = rs.getInt("bookingID");
			bookingModel.guestCount = rs.getInt("guestCount");
		//	bookingModel.customer = rs.Customer("customerID");
		//	bookingModel.id = rs.getInt("bookingID");
		//	bookingModel.id = rs.getInt("bookingID");
			return bookingModel;
		}
	}

}
