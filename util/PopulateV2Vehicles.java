import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import java.util.Properties;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.jsoup.parser.Parser;
import java.util.HashMap;
import java.util.LinkedList;
import java.io.IOException;

class PopulateV2Vehicles {


	public static void main(String args[]) {


	//load properties from disk
		Properties props = new Properties();
		FileInputStream fis = null;
		try {
			fis = new FileInputStream("utility.properties");
		} catch (IOException ioe) {
			System.out.println("Can't find utility.proprties in local directory.");
			System.out.println("Wrting out example file and terminating.");
			System.out.println("Modify this file and re-run.");

			try {
				props.setProperty("server", "fkpk1.c77v5riasird.us-west-2.rds.amazonaws.com");
				props.setProperty("port", "3306");
				props.setProperty("database", "fkpk");
				props.setProperty("db_username", "blah");
				props.setProperty("db_password", "blah");
				props.setProperty("soeapikey", "1234");

				props.store(new FileOutputStream("utility.properties"), null);
			} catch (IOException ioe2) {
				System.out.println("There was an error writing to the filesystem.");
			}
			System.exit(1);

		} 			
		try {
			props.load(fis);
		} catch (IOException ioe) {
			System.out.println("We've failed to load the properties file, despite it being, you know, there.");
			System.out.println("Not paid for this.  Aborting.");
			System.exit(1);
		}
		if (!props.containsKey("server") || !props.containsKey("database") || !props.containsKey("db_username") || !props.containsKey("db_password")) {
			System.out.println("Config file is incomplete.  Delete it to receive a working template.");
			System.exit(1);
		}
		String server = props.getProperty("server");
		String port = props.getProperty("port");
		String database = props.getProperty("database");
		String db_username = props.getProperty("db_username");
		String db_password = props.getProperty("db_password");
		String soeapikey = props.getProperty("soeapikey");



		Document doc = null;
		org.jsoup.Connection jcon = null;
		String querystring;

		Long startingTimestampNumber = ((System.currentTimeMillis()/1000L)-90L);
		String startingTimestamp = startingTimestampNumber.toString();

		//  http://census.soe.com/xml/get/ps2:v2/vehicle_faction?c:limit=1000&c:join=vehicle^show:image_id'image_path'image_set_id'type_id'name'description&c:lang=en

		if (soeapikey == null || soeapikey.equals("")) {
			querystring = "http://census.soe.com/xml/get/ps2:v2/vehicle_faction?c:limit=1000&c:join=vehicle^show:image_id'image_path'image_set_id'type_id'name'description&c:lang=en";
		} else {
			querystring = "http://census.soe.com/s:"+soeapikey+"/xml/get/ps2:v2/vehicle_faction?c:limit=1000&c:join=vehicle^show:image_id'image_path'image_set_id'type_id'name'description&c:lang=en";
		}
		System.out.println("running "+ querystring);
		try {
			jcon = Jsoup.connect(querystring);
			jcon.timeout(10000);
			jcon.parser(Parser.xmlParser());
			doc = jcon.get();
		} catch (IOException ioe) {
			System.out.println("***connection error to SOE***");
			System.out.println(ioe);
		}

				
		Elements weapons = doc.select("vehicle_faction_list > vehicle_faction");
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception ex) {
			System.out.println("SOMETHING BLEW THE FUCK UP WHILE LOADING THE DRIVER");
		}	
	
		java.sql.Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String insertString = "replace into fkpk.v2_vehicles (faction_id, vehicle_id, image_id, image_path, image_set_id, type_id, v_name, description) values (?,?,?,?,?,?,?,?)";
		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://"+server+"/"+database+"?"+"user="+db_username+"&password="+db_password);
			pstmt = conn.prepareStatement(insertString);
			//System.out.println(insertString);
			for (Element w : weapons) {
				//System.out.println(w);
				
				int factionId = Integer.parseInt(w.attr("faction_id"));
				int vehicleId = Integer.parseInt(w.attr("vehicle_id"));				
								
				Elements w2 = w.select("vehicle_faction > vehicle_id_join_vehicle");
				
				// System.out.println(w2);				

				int imageId = Integer.parseInt(w2.attr("image_id"));

				//System.out.println(imageId);				
				
				String imagePath = w2.attr("image_path");
				int imageSetId = Integer.parseInt(w2.attr("image_set_id"));
				
				int itemTypeId = Integer.parseInt(w2.attr("type_id"));
				
				String name = w.childNode(0).childNode(0).attr("en");
								
				//System.out.println(name);

				String description = w.childNode(0).childNode(1).attr("en");				

				//System.out.println(description);				

				pstmt.setInt(1,factionId);
				pstmt.setInt(2,vehicleId);
				pstmt.setInt(3,imageId);
				pstmt.setString(4,imagePath);
				pstmt.setInt(5,imageSetId);
				pstmt.setInt(6,itemTypeId);
				pstmt.setString(7,name);
				pstmt.setString(8,description);
				
				pstmt.executeUpdate();
			}
		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			System.exit(1);

		} finally {
			if (rs != null) {
       				try {
           					rs.close();
     					} catch (SQLException sqlEx) { } // ignore
				rs = null;
			}

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException sqlEx) { } // ignore
				pstmt = null;

			}
		}
	}
}

