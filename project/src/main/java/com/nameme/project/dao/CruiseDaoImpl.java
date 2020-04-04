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
public class CruiseDaoImpl implements CruiseDao {

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	public List<CruiseModel> findAll() {

		String sql = "SELECT * FROM cruise";

		List<CruiseModel> result = namedParameterJdbcTemplate.query(sql, new Mapper());

		return result;

	}

	public CruiseModel findById(int id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		String sql = "SELECT * FROM cruise WHERE cruiseID=:id";

		List<CruiseModel> result = namedParameterJdbcTemplate.query(sql, params, new Mapper());

		return result.size() == 0 ? null : result.get(0);
	}

	private static final class Mapper implements RowMapper<CruiseModel> {

		public CruiseModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			CruiseModel cruiseModel = new CruiseModel();
			cruiseModel.id = rs.getInt("cruiseID");
			cruiseModel.name = rs.getString("name");
			String[] array = rs.getString("routeIDs").split(",");
			for (String s : array) {
				try {
					cruiseModel.routeIds.add(Integer.parseInt(s));
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			return cruiseModel;
		}
	}
}
