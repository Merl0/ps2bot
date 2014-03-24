import java.util.HashMap;
import java.util.ArrayList;
import java.io.IOException;
import java.util.Properties;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Types;
import java.sql.Connection;


public class Oracle {

	private static Connection getConnection(Properties props) throws SQLException {

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception ex) {
			System.out.println("Exception instantiating driver.");
			System.out.println(ex);
			throw new SQLException("Failed to load up the drivers.");
		}
		String dbServer = props.getProperty("db_server");
		String database = props.getProperty("database");
		String dbUsername = props.getProperty("db_username");
		String dbPassword = props.getProperty("db_password");
                Connection conn = DriverManager.getConnection("jdbc:mysql://"+dbServer+"/"+database+"?user="+dbUsername+"&password="+dbPassword);
		return conn;
	}

	public static ArrayList<VehicleList> getVehicles(Properties props) throws SQLException {
		//Returns an arraylist faction/vehicle/name group for all vehicles
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		
		try {
			conn = getConnection(props);
			String sqlString = "SELECT faction_id, vehicle_id, v_name FROM fkpk.v2_vehicles where vehicle_id between 1 and 12 ORDER BY faction_id ASC;";
			stmt = conn.prepareStatement(sqlString);
			rs = stmt.executeQuery();
			ArrayList<VehicleList> al = new ArrayList<VehicleList>();
			while (rs.next()) {
				int faction_id = rs.getInt(1);
				int vehicle_id = rs.getInt(2);
				String v_name = rs.getString(3);
				VehicleList vl = new VehicleList(faction_id, vehicle_id, v_name);
				al.add(vl);
			}
			return al;

		} catch (SQLException ex) {

                        System.out.println("SQLException: " + ex.getMessage());
                        System.out.println("SQLState: " + ex.getSQLState());
                        System.out.println("VendorError: " + ex.getErrorCode());
			throw ex;
                } finally {
                        if (rs != null) {
                                try {
					rs.close();
                                } catch (SQLException sqlEx) { } // ignore
                                rs = null;
                        }

                        if (stmt != null) {
                                try {
                                        stmt.close();
                                } catch (SQLException sqlEx) { } // ignore
                                stmt = null;

                        }
                        if (conn != null) {
                                try {
                                        conn.close();
                                } catch (SQLException sqlEx) { } // ignore
                                conn = null;

                        }
		}
	}	

	public static ArrayList<TimePeriod> getPeriods(Properties props) throws SQLException {
		//Returns a hashmap for all periods
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		
		try {
			conn = getConnection(props);
			String sqlString = "SELECT * FROM fkpk.v2_time_periods ORDER BY end_time DESC;";
			stmt = conn.prepareStatement(sqlString);
			rs = stmt.executeQuery();
			ArrayList<TimePeriod> al = new ArrayList<TimePeriod>();
			while (rs.next()) {
				int id = rs.getInt(1);
				int start = rs.getInt(2);
				int end = rs.getInt(3);
				boolean isDaily = rs.getBoolean(4);
				TimePeriod tp = new TimePeriod(id, start, end, isDaily);
				al.add(tp);
			}
			return al;

		} catch (SQLException ex) {

                        System.out.println("SQLException: " + ex.getMessage());
                        System.out.println("SQLState: " + ex.getSQLState());
                        System.out.println("VendorError: " + ex.getErrorCode());
			throw ex;
                } finally {
                        if (rs != null) {
                                try {
					rs.close();
                                } catch (SQLException sqlEx) { } // ignore
                                rs = null;
                        }

                        if (stmt != null) {
                                try {
                                        stmt.close();
                                } catch (SQLException sqlEx) { } // ignore
                                stmt = null;

                        }
                        if (conn != null) {
                                try {
                                        conn.close();
                                } catch (SQLException sqlEx) { } // ignore
                                conn = null;

                        }
		}
	}
	
	public static HashMap<Integer, String> getTypes(Properties props) throws SQLException {
		//Returns a hashmap id/name pairs for all weapon types (categories in SOE API parlance; this is where we swap their nomenclature)
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		
		try {
			conn = getConnection(props);
			String sqlString = "SELECT * FROM fkpk.v2_weapon_categories;";
			stmt = conn.prepareStatement(sqlString);
			rs = stmt.executeQuery();
			HashMap<Integer, String> hm = new HashMap<Integer, String>();
			while (rs.next()) {
				hm.put(rs.getInt(1), rs.getString(2));
			}
			return hm;

		} catch (SQLException ex) {

                        System.out.println("SQLException: " + ex.getMessage());
                        System.out.println("SQLState: " + ex.getSQLState());
                        System.out.println("VendorError: " + ex.getErrorCode());
			throw ex;
                } finally {
                        if (rs != null) {
                                try {
					rs.close();
                                } catch (SQLException sqlEx) { } // ignore
                                rs = null;
                        }

                        if (stmt != null) {
                                try {
                                        stmt.close();
                                } catch (SQLException sqlEx) { } // ignore
                                stmt = null;

                        }
                        if (conn != null) {
                                try {
                                        conn.close();
                                } catch (SQLException sqlEx) { } // ignore
                                conn = null;

                        }
		}
	}

	public static HashMap<Integer, String> getWeapons(Properties props, int type) throws SQLException {
		//Returns a hashmap of id/name pairs of weapons for the provided category.
		//If the provided type id doesn't map to anything, the hashmap will be empty.  Handled upstream.
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		
		try {
			conn = getConnection(props);
			String sqlString = "SELECT id, name FROM fkpk.v2_weapons WHERE item_category_id = ?;";
			stmt = conn.prepareStatement(sqlString);
			stmt.setInt(1, type);
			rs = stmt.executeQuery();
			
			HashMap<Integer, String> hm = new HashMap<Integer, String>();
			while (rs.next()) {
				hm.put(rs.getInt(1), rs.getString(2));
			}
			return hm;

		} catch (SQLException ex) {

                        System.out.println("SQLException: " + ex.getMessage());
                        System.out.println("SQLState: " + ex.getSQLState());
                        System.out.println("VendorError: " + ex.getErrorCode());
			throw ex;
                } finally {
                        if (rs != null) {
                                try {
					rs.close();
                                } catch (SQLException sqlEx) { } // ignore
                                rs = null;
                        }

                        if (stmt != null) {
                                try {
                                        stmt.close();
                                } catch (SQLException sqlEx) { } // ignore
                                stmt = null;

                        }
                        if (conn != null) {
                                try {
                                        conn.close();
                                } catch (SQLException sqlEx) { } // ignore
                                conn = null;

                        }
		}
	}
	
	
	
	public static HashMap<String, String> getKillAggregate(Properties props, int id) throws SQLException {
		//figure out most revent daily and then run more granular call;

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		
		try {
			conn = getConnection(props);
			String sqlString = "SELECT id "+
						"FROM fkpk.v2_time_periods "+
						"WHERE is_daily = 1 "+
						"ORDER BY end_time DESC "+
						"LIMIT 1;";
			stmt = conn.prepareStatement(sqlString);
			rs = stmt.executeQuery();
			rs.next();
			int period = rs.getInt(1);
			return getKillAggregate(props, id, period);
		} catch (SQLException ex) {

                        System.out.println("SQLException: " + ex.getMessage());
                        System.out.println("SQLState: " + ex.getSQLState());
                        System.out.println("VendorError: " + ex.getErrorCode());
			throw ex;
                } finally {
                        if (rs != null) {
                                try {
					rs.close();
                                } catch (SQLException sqlEx) { } // ignore
                                rs = null;
                        }

                        if (stmt != null) {
                                try {
                                        stmt.close();
                                } catch (SQLException sqlEx) { } // ignore
                                stmt = null;

                        }
                        if (conn != null) {
                                try {
                                        conn.close();
                                } catch (SQLException sqlEx) { } // ignore
                                conn = null;

                        }
		}
	}
	
	public static HashMap<String, String> getKillAggregate(Properties props, int id, int period) throws SQLException {
	// get weapon for period specified
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		
		try {
			conn = getConnection(props);
			String sqlString = "SELECT a.w_name, a.kills, a.uniques, round(a.kpu,2), round(a.kpu_stddev,2), round(a.avgbr,2), "+
						"round(a.q1kpu,2), round(a.q2kpu,2), round(a.q3kpu,2), round(a.q4kpu,2), a.headshot, a.v_deaths, "+
						"round(a.vKPU,2), a.a_deaths, round(a.aKPU,2), b.name "+
						"FROM fkpk.v2_kills_vKPU_aggregates as a, fkpk.v2_weapons as b "+
						"WHERE item_id = ? "+
						"AND period = ? "+
						"AND a.item_id = b.id;";
			stmt = conn.prepareStatement(sqlString);
			stmt.setInt(1, id);
			stmt.setInt(2, period);
			rs = stmt.executeQuery();
			
			HashMap<String, String> hm = new HashMap<String, String>();
			while (rs.next()) {
				hm.put("w_name", String.valueOf(rs.getString(1)));
				hm.put("id", String.valueOf(id));
				hm.put("kills", String.valueOf(rs.getInt(2)));
				hm.put("uniques", String.valueOf(rs.getInt(3)));
				hm.put("kpu", String.valueOf(rs.getFloat(4)));
				hm.put("kpu_stddev", String.valueOf(rs.getFloat(5)));
				hm.put("avgbr", String.valueOf(rs.getFloat(6)));
				hm.put("q1kpu", String.valueOf(rs.getFloat(7)));
				hm.put("q2kpu", String.valueOf(rs.getFloat(8)));
				hm.put("q3kpu", String.valueOf(rs.getFloat(9)));
				hm.put("q4kpu", String.valueOf(rs.getFloat(10)));
				hm.put("headshot", String.valueOf(rs.getInt(11)));
				hm.put("v_deaths", String.valueOf(rs.getInt(12)));
				hm.put("vKPU", String.valueOf(rs.getFloat(13)));
				hm.put("a_deaths", String.valueOf(rs.getInt(14)));
				hm.put("aKPU", String.valueOf(rs.getFloat(15)));
				hm.put("name", String.valueOf(rs.getString(16)));
			}
			return hm;
			

		} catch (SQLException ex) {

                        System.out.println("SQLException: " + ex.getMessage());
                        System.out.println("SQLState: " + ex.getSQLState());
                        System.out.println("VendorError: " + ex.getErrorCode());
			throw ex;
                } finally {
                        if (rs != null) {
                                try {
					rs.close();
                                } catch (SQLException sqlEx) { } // ignore
                                rs = null;
                        }

                        if (stmt != null) {
                                try {
                                        stmt.close();
                                } catch (SQLException sqlEx) { } // ignore
                                stmt = null;

                        }
                        if (conn != null) {
                                try {
                                        conn.close();
                                } catch (SQLException sqlEx) { } // ignore
                                conn = null;

                        }
		}
	}

	public static ArrayList<KillAggregateRow> getAllKillAggregates(Properties props, int id) throws SQLException {
		//get every period for a weapon

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		ArrayList<KillAggregateRow> al = new ArrayList<KillAggregateRow>();
		
		try {
			conn = getConnection(props);
			String sqlString = "SELECT a.w_name, a.kills, a.uniques, round(a.kpu,2), round(a.kpu_stddev,2), round(a.avgbr,2), "+
						"round(a.q1kpu,2), round(a.q2kpu,2), round(a.q3kpu,2), round(a.q4kpu,2), a.headshot, a.v_deaths, "+
						"round(a.vKPU,2), a.a_deaths, round(a.aKPU,2), b.name, a.period "+
						"FROM fkpk.v2_kills_vKPU_aggregates as a, fkpk.v2_weapons as b "+
						"WHERE item_id = ? "+
						"AND a.item_id = b.id "+
						"ORDER BY a.period ASC;";
			
			stmt = conn.prepareStatement(sqlString);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				KillAggregateRow kar = new KillAggregateRow(rs.getString(1), id, rs.getInt(2), rs.getInt(3), rs.getFloat(4), rs.getFloat(5), rs.getFloat(6), rs.getFloat(7), rs.getFloat(8), rs.getFloat(9), rs.getFloat(10), rs.getInt(11), rs.getInt(12), rs.getFloat(13), rs.getInt(14), rs.getFloat(15), rs.getString(16), rs.getInt(17));
				al.add(kar);
			}
			
			return al;
		} catch (SQLException ex) {

                        System.out.println("SQLException: " + ex.getMessage());
                        System.out.println("SQLState: " + ex.getSQLState());
                        System.out.println("VendorError: " + ex.getErrorCode());
			throw ex;
                } finally {
                        if (rs != null) {
                                try {
					rs.close();
                                } catch (SQLException sqlEx) { } // ignore
                                rs = null;
                        }

                        if (stmt != null) {
                                try {
                                        stmt.close();
                                } catch (SQLException sqlEx) { } // ignore
                                stmt = null;

                        }
                        if (conn != null) {
                                try {
                                        conn.close();
                                } catch (SQLException sqlEx) { } // ignore
                                conn = null;

                        }
		}
	}
	
	public static ArrayList<KillAggregateRowFull> getAllKillAggregatesFull(Properties props, int id) throws SQLException {
		// FULL DUMP - GRAB ALL THE VEHICLE DEATH RUBBISH		
		//get every period for a weapon

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		ArrayList<KillAggregateRowFull> al = new ArrayList<KillAggregateRowFull>();
		
		try {
			conn = getConnection(props);
			String sqlString = "SELECT a.w_name, a.kills, a.uniques, round(a.kpu,2), round(a.kpu_stddev,2), round(a.avgbr,2), "+
						"round(a.q1kpu,2), round(a.q2kpu,2), round(a.q3kpu,2), round(a.q4kpu,2), a.headshot, "+
						"a.v_deaths, round(a.vKPU,2), a.a_deaths, round(a.aKPU,2), "+ 
						"a.flashdeaths, round(a.flashKPU,2), a.sunddeaths, round(a.sundKPU,2), a.lightdeaths, round(a.lightKPU,2), "+ 
						"a.magdeaths, round(a.magKPU,2), a.vandeaths, round(a.vanKPU,2), a.prowldeaths, round(a.prowlKPU,2), "+ 
						"a.scythedeaths, round(a.scytheKPU,2), a.reaverdeaths, round(a.reaverKPU,2), a.mossydeaths, round(a.mossyKPU,2), "+
						"a.libdeaths, round(a.libKPU,2), a.galdeaths, round(a.galKPU,2), a.harasdeaths, round(a.harasKPU,2), "+ 
						"b.name, a.period "+
						"FROM fkpk.v2_kills_vKPU_aggregates as a, fkpk.v2_weapons as b "+
						"WHERE item_id = ? "+
						"AND a.item_id = b.id "+
						"ORDER BY a.period ASC;";
			
			stmt = conn.prepareStatement(sqlString);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				KillAggregateRowFull karf = new KillAggregateRowFull(rs.getString(1), id, rs.getInt(2), rs.getInt(3), rs.getFloat(4), 
										rs.getFloat(5), rs.getFloat(6), rs.getFloat(7), rs.getFloat(8), 
										rs.getFloat(9), rs.getFloat(10), rs.getInt(11), 
										rs.getInt(12), rs.getFloat(13), rs.getInt(14), rs.getFloat(15),
										rs.getInt(16), rs.getFloat(17), rs.getInt(18), rs.getFloat(19),
										rs.getInt(20), rs.getFloat(21), rs.getInt(22), rs.getFloat(23),
										rs.getInt(24), rs.getFloat(25), rs.getInt(26), rs.getFloat(27),
										rs.getInt(28), rs.getFloat(29), rs.getInt(30), rs.getFloat(31),
										rs.getInt(32), rs.getFloat(33), rs.getInt(34), rs.getFloat(35),
										rs.getInt(36), rs.getFloat(37), rs.getInt(38), rs.getFloat(39),
										rs.getString(40), rs.getInt(41));
				al.add(karf);
			}
			
			return al;
		} catch (SQLException ex) {

                        System.out.println("SQLException: " + ex.getMessage());
                        System.out.println("SQLState: " + ex.getSQLState());
                        System.out.println("VendorError: " + ex.getErrorCode());
			throw ex;
                } finally {
                        if (rs != null) {
                                try {
					rs.close();
                                } catch (SQLException sqlEx) { } // ignore
                                rs = null;
                        }

                        if (stmt != null) {
                                try {
                                        stmt.close();
                                } catch (SQLException sqlEx) { } // ignore
                                stmt = null;

                        }
                        if (conn != null) {
                                try {
                                        conn.close();
                                } catch (SQLException sqlEx) { } // ignore
                                conn = null;

                        }
		}
	}

	
	public static ArrayList<FactionAggregateRow> getAllFactionAggregates(Properties props) throws SQLException {
		//get every period for faction kills

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		ArrayList<FactionAggregateRow> al = new ArrayList<FactionAggregateRow>();
		
		try {
			conn = getConnection(props);
			String sqlString = "SELECT a.period, a.VS_daily_kills, a.NC_daily_kills, a.TR_daily_kills "+
						"FROM fkpk.v2_faction_aggregates as a "+
						"ORDER BY a.period ASC;";
			System.out.println(sqlString);			
			stmt = conn.prepareStatement(sqlString);
			//stmt.setInt(4, period);			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				FactionAggregateRow far = new FactionAggregateRow(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4));
				al.add(far);
			}
			
			return al;
		} catch (SQLException ex) {

                        System.out.println("SQLException: " + ex.getMessage());
                        System.out.println("SQLState: " + ex.getSQLState());
                        System.out.println("VendorError: " + ex.getErrorCode());
			throw ex;
                } finally {
                        if (rs != null) {
                                try {
					rs.close();
                                } catch (SQLException sqlEx) { } // ignore
                                rs = null;
                        }

                        if (stmt != null) {
                                try {
                                        stmt.close();
                                } catch (SQLException sqlEx) { } // ignore
                                stmt = null;

                        }
                        if (conn != null) {
                                try {
                                        conn.close();
                                } catch (SQLException sqlEx) { } // ignore
                                conn = null;

                        }
		}
	}
	
	public static ArrayList<VehicleAggregateRow> getAllVehicleAggregates(Properties props, int faction_id, int vehicle_id) throws SQLException {
		//get every period for vehicle deaths

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		ArrayList<VehicleAggregateRow> al = new ArrayList<VehicleAggregateRow>();
		
		try {
			conn = getConnection(props);
			String sqlString = "SELECT a.period, a.faction_id, a.vehicle_id, a.item_id, a.name, a.deaths, "+
						"a.q1deaths, a.q2deaths, a.q3deaths, a.q4deaths "+ 
						"FROM fkpk.v2_vehicle_aggregates as a "+
						"WHERE faction_id = ? "+
						"AND vehicle_id = ? "+
						"ORDER BY a.period ASC;";
			stmt = conn.prepareStatement(sqlString);
			stmt.setInt(1, faction_id);
			stmt.setInt(2, vehicle_id);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				VehicleAggregateRow var = new VehicleAggregateRow(rs.getInt(1), faction_id, vehicle_id, rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10));
				al.add(var);
			}
			
			return al;
		} catch (SQLException ex) {

                        System.out.println("SQLException: " + ex.getMessage());
                        System.out.println("SQLState: " + ex.getSQLState());
                        System.out.println("VendorError: " + ex.getErrorCode());
			throw ex;
                } finally {
                        if (rs != null) {
                                try {
					rs.close();
                                } catch (SQLException sqlEx) { } // ignore
                                rs = null;
                        }

                        if (stmt != null) {
                                try {
                                        stmt.close();
                                } catch (SQLException sqlEx) { } // ignore
                                stmt = null;

                        }

                        if (conn != null) {
                                try {
                                        conn.close();
                                } catch (SQLException sqlEx) { } // ignore
                                conn = null;

                        }
		}
	}
	
	public static ArrayList<VehicleUniquesAggregateRow> getAllVehicleUniquesAggregates(Properties props, int faction_id, int veh_id) throws SQLException {
		// get every period for vehicle uniques

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		ArrayList<VehicleUniquesAggregateRow> al = new ArrayList<VehicleUniquesAggregateRow>();
		
		try {
			conn = getConnection(props);
			String sqlString = "SELECT a.period, a.faction_id, a.vehicle_id, a.name, a.uniques "+
						"FROM fkpk.v2_vehicle_uniques as a "+
						"WHERE faction_id = ? "+
						"AND vehicle_id = ? "+
						"ORDER BY a.period ASC;";
			stmt = conn.prepareStatement(sqlString);
			stmt.setInt(1, faction_id);
			stmt.setInt(2, veh_id);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				VehicleUniquesAggregateRow vuar = new VehicleUniquesAggregateRow(rs.getInt(1), faction_id, veh_id, rs.getString(4), rs.getInt(5));
				al.add(vuar);
			}
			
			return al;
		} catch (SQLException ex) {

                        System.out.println("SQLException: " + ex.getMessage());
                        System.out.println("SQLState: " + ex.getSQLState());
                        System.out.println("VendorError: " + ex.getErrorCode());
			throw ex;
                } finally {
                        if (rs != null) {
                                try {
					rs.close();
                                } catch (SQLException sqlEx) { } // ignore
                                rs = null;
                        }

                        if (stmt != null) {
                                try {
                                        stmt.close();
                                } catch (SQLException sqlEx) { } // ignore
                                stmt = null;

                        }
                        if (conn != null) {
                                try {
                                        conn.close();
                                } catch (SQLException sqlEx) { } // ignore
                                conn = null;

                        }
		}
	}
	
	public static ArrayList<ReportRow> getReportRow(Properties props, int category_id) throws SQLException {
		//get every row for category 

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		ArrayList<ReportRow> al = new ArrayList<ReportRow>();
		
		try {
			conn = getConnection(props);
			String sqlString = "SELECT item_category_id, item_id, w_name, sum_kills, avg_uniques, round(avg_kpu,2), "+
						"round(avg_kpu_stddev,2), round(avg_avgbr,2), round(avg_q1kpu,2), round(avg_q2kpu,2), "+
						"round(avg_q3kpu,2), round(avg_q4kpu,2), sum_headshot, sum_v_deaths, "+
						"round(avg_vKPU,2), sum_a_deaths, round(avg_aKPU,2) "+
						"FROM fkpk.v2_report "+
						"WHERE item_category_id = ? "+
						"ORDER BY item_id ASC;";
			
			stmt = conn.prepareStatement(sqlString);
			stmt.setInt(1, category_id);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				ReportRow rar = new ReportRow(category_id, rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getFloat(5), rs.getFloat(6), rs.getFloat(7), rs.getFloat(8), rs.getFloat(9), rs.getFloat(10), rs.getFloat(11), rs.getFloat(12), rs.getInt(13), rs.getInt(14), rs.getFloat(15), rs.getInt(16), rs.getFloat(17));
			al.add(rar);
			}
			
			return al;
		} catch (SQLException ex) {

                        System.out.println("SQLException: " + ex.getMessage());
                        System.out.println("SQLState: " + ex.getSQLState());
                        System.out.println("VendorError: " + ex.getErrorCode());
			throw ex;
                } finally {
                        if (rs != null) {
                                try {
					rs.close();
                                } catch (SQLException sqlEx) { } // ignore
                                rs = null;
                        }

                        if (stmt != null) {
                                try {
                                        stmt.close();
                                } catch (SQLException sqlEx) { } // ignore
                                stmt = null;

                        }
                        if (conn != null) {
                                try {
                                        conn.close();
                                } catch (SQLException sqlEx) { } // ignore
                                conn = null;

                        }
		}
	}

	public static ArrayList<VehReportRow> getVehReportRow(Properties props, int faction_id, int vehicle_id) throws SQLException {
		//get every row summary for vehicle deaths

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		ArrayList<VehReportRow> al = new ArrayList<VehReportRow>();
		
		try {
			conn = getConnection(props);
			String sqlString = "SELECT faction_id, vehicle_id, item_id, name, sum_deaths, "+
						"sum_q1deaths, sum_q2deaths, sum_q3deaths, sum_q4deaths "+
						"FROM fkpk.v2_veh_report "+						
						"WHERE faction_id = ? "+
						"AND vehicle_id = ?;";
			
			stmt = conn.prepareStatement(sqlString);
			stmt.setInt(1, faction_id);
			stmt.setInt(2, vehicle_id);
			rs = stmt.executeQuery();
			
			
			while (rs.next()) {
				VehReportRow vrar = new VehReportRow(faction_id, vehicle_id, rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9));
			al.add(vrar);
			}
			
			return al;
		} catch (SQLException ex) {

                        System.out.println("SQLException: " + ex.getMessage());
                        System.out.println("SQLState: " + ex.getSQLState());
                        System.out.println("VendorError: " + ex.getErrorCode());
			throw ex;
                } finally {
                        if (rs != null) {
                                try {
					rs.close();
                                } catch (SQLException sqlEx) { } // ignore
                                rs = null;
                        }

                        if (stmt != null) {
                                try {
                                        stmt.close();
                                } catch (SQLException sqlEx) { } // ignore
                                stmt = null;

                        }
                        if (conn != null) {
                                try {
                                        conn.close();
                                } catch (SQLException sqlEx) { } // ignore
                                conn = null;

                        }
		}
	}


}


