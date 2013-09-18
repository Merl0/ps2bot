import org.pircbotx.hooks.ListenerAdapter;
import org.pircbotx.PircBotX;
import org.pircbotx.hooks.events.MessageEvent;
import org.pircbotx.User;
import java.util.HashMap;
import java.util.SortedSet;
import java.util.TreeSet;
import java.util.Scanner;
import org.pircbotx.Colors;
import java.util.Properties;
import java.sql.SQLException;
import java.io.IOException;

public class OracleHandler extends ListenerAdapter {


	private PermissionsManager pm;
	private Scanner scanner;
	private String soeapikey;
	private Properties props;

	public OracleHandler(Properties props) {
		super();
		this.pm = PermissionsManager.getInstance();
		this.soeapikey = props.getProperty("soeapikey");
		System.out.println("OracleHandler Initialized.");
		this.props = props;
	}

	public void onMessage(MessageEvent event) {
		String command = event.getMessage();
		String commandLower = command.toLowerCase();
		
		if (commandLower.startsWith("!oracle ")) {
			User user = event.getUser();
			if (!pm.isAllowed("!oracle",event.getUser(),event.getChannel())) {
				event.respond("Sorry, you are not in the access list for consulting the oracle.");
				return;
			}
			scanner = new Scanner(commandLower);
			String token = scanner.next();
			
			if (scanner.hasNext()){
				token = scanner.next();
				
				if (token.equals("list")) {
					if (scanner.hasNext()) {
						token = scanner.next();
						
						if (token.equals("types")) {
							HashMap<Integer,String> hm;
							try {
								hm = Oracle.getTypes(props);
							} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Check the logs, sparky.");
								System.out.println(ex);
								ex.printStackTrace();
								return;
							}
							event.getBot().sendMessage(user, "Listing Types:");
							SortedSet<Integer> keys = new TreeSet<Integer>(hm.keySet());
							for (Integer key : keys) {
								String type = hm.get(key);
								event.getBot().sendMessage(user, key+":  "+type);
							}
						
						} else if (token.equals("weapons")) {
							if (scanner.hasNextInt()) {
								int type = scanner.nextInt();
								HashMap<Integer,String> hm;
								try {
									hm = Oracle.getWeapons(props,type);
								} catch (SQLException ex) {
									event.respond("Downstream SQL Exception.  Check the logs, sparky.");
									System.out.println(ex);
									ex.printStackTrace();
									return;
								}
								if (hm.size() > 0) {
									event.getBot().sendMessage(user, "Listing Weapons:");
									SortedSet<Integer> keys = new TreeSet<Integer>(hm.keySet());
									for (Integer key : keys) {
										String weapon = hm.get(key);
										event.getBot().sendMessage(user, key+":  "+weapon);
									}
								} else {
									event.respond("That's not a real type.  Not here.  Not in these parts.");
								}
								//
							} else {
								event.respond("You need a type number. ex. !oracle list weapons 13");
							}
							
						}

					} else {
						event.respond("What would you like to list? types, weapons, or windows");
					}
				
				} else if (token.equals("some other thing")) {
					//blah
				}

				
			}
		}
		
		if (command.equals("!oracle")) {
	
			event.respond("What?");
		}
	}
}

