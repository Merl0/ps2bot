import org.pircbotx.hooks.ListenerAdapter;
import org.pircbotx.hooks.events.MessageEvent;
import org.pircbotx.User;
import java.util.HashMap;
import java.util.Scanner;
import org.pircbotx.Colors;
import java.util.Properties;
import java.sql.SQLException;
import java.io.IOException;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.ExecutionException;



public class VehicleCollectionHandler extends ListenerAdapter {


	private PermissionsManager pm;
	private Scanner scanner;
	private VehicleCollectionEngine vce;
	private Thread vceThread;
	private String soeapikey;
	private Properties props;

	public VehicleCollectionHandler(VehicleCollectionEngine vce, Thread vceThread, Properties props) {
		super();
		this.vce = vce;
		this.vceThread = vceThread;
		this.pm = PermissionsManager.getInstance();
		this.soeapikey = props.getProperty("soeapikey");
		System.out.println("VehicleCollectionHandler Initialized.");
		this.props = props;
	}

	public void onMessage(MessageEvent event) {
		String rawcommand = event.getMessage();
		String command = rawcommand.toLowerCase();
		
		if (command.startsWith("!vehicles ")) {
			User user = event.getUser();
			if (!pm.isAllowed("!stats",event.getUser(),event.getChannel())) {
				event.respond("Sorry, you are not in the access list for kill colleciton handling.");
				return;
			}
			scanner = new Scanner(command);
			String token = scanner.next();
			
			if (scanner.hasNext()){
				token = scanner.next().toLowerCase();
				switch (token) {
					//
					case "on": vce.vehTurnOn();
					event.respond("Vehicle deaths automatic stat puller turned ON.");
					break;
					//
					case "off": vce.vehTurnOff();
					event.respond("Vehicle deaths automatic stat puller turned OFF.");
					break;
					//
					
					/*
					} catch (IllegalArgumentException e) {
						event.respond("Bad or missing memcached server proprty.");
						event.respond(e.getMessage());
						e.printStackTrace();
					
					} catch (IOException e) {
						event.respond("Unhandled IO Exception.  Fix it, asshole:");
						event.respond(e.getMessage());
						e.printStackTrace();
					
					} catch (SQLException e) {
						event.respond("Unhandled SQL Exception.  Fix it, asshole:");
						event.respond(e.getMessage());
						e.printStackTrace();
					
					} catch (TimeoutException e) {
						event.respond("Memcached connection timed out during operation.  Fix it, asshole:");
						event.respond(e.getMessage());
						e.printStackTrace();
					
					} catch (InterruptedException e) {
						event.respond("Unhandled Interrupted Exception.  Fix it, asshole:");
						event.respond(e.getMessage());
						e.printStackTrace();
					
					} catch (ExecutionException e) {
						event.respond("Unhandled Execution Exception.  Fix it, asshole:");
						event.respond(e.getMessage());
						e.printStackTrace();
					}
					
					*/
					
					//}catch (Exception e) {
					//	event.respond("Unhandled Exception.  Fix it, asshole:");
					//	event.respond(e.getMessage());
					//	e.printStackTrace();
					//}
					//
					//break;
					default: event.respond("I'm not sure what you asked me.  Valid commands are BLAH BLHA BLAH");
					break;

				}
			}
		}
		
		if (command.equals("!status")) {
	
			boolean vehOnSwitch = vce.vehIsOn();
			long interval = vce.getInterval();
			int iSeconds = (int)interval / 1000;
			if (vehOnSwitch) {
				event.respond("Vehicle Collection Engine is running. "+vce.getRowsProcessed()+" kills processed. Current interval at "+iSeconds+" seconds.  ~"+(850/(iSeconds+5))+"kps.");
			} else {
				event.respond("Vehicle Collection Engine is idle.");
			}
		}
	}
}


