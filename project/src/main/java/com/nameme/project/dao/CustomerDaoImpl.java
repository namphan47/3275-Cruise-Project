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
public class CustomerDaoImpl implements CustomerDao {

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	public List<CustomerModel> findAll() {
		String sql = "SELECT * FROM customer";
		List<CustomerModel> result = namedParameterJdbcTemplate.query(sql, new Mapper());
		return result;
	}

	public CustomerModel findById(int id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		String sql = "SELECT * FROM customer WHERE id=:id";

		List<CustomerModel> result = namedParameterJdbcTemplate.query(sql, params, new Mapper());

		return result.size() == 0 ? null : result.get(0);
	}

	public CustomerModel findByEmail(String email) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("email", email);
		String sql = "SELECT * FROM customer WHERE email = :email";

		List<CustomerModel> result = namedParameterJdbcTemplate.query(sql, params, new Mapper());

		return result.size() == 0 ? null : result.get(0);
	}

	public int create(String email, String password) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("email", email);
		params.put("password", password);
		String sql = "INSERT INTO CUSTOMER( \"EMAIL\", \"PASSWORD\" ) VALUES(:email,:password)";

		return namedParameterJdbcTemplate.update(sql, params);
	}

	private static final class Mapper implements RowMapper<CustomerModel> {

		public CustomerModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			CustomerModel model = new CustomerModel();
			model.id = rs.getInt("id");
			model.email = rs.getString("email");
			model.password = rs.getString("password");
			return model;
		}
	}
}
