import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import org.pircbotx.PircBotX;
import org.pircbotx.hooks.ListenerAdapter;
import org.pircbotx.hooks.events.MessageEvent;

public class StatCollectionBot extends ListenerAdapter {
	
	public static void main(String[] args) throws Exception {
		
		//instantiate underlying bot
		PircBotX bot = new PircBotX();

		//load properties from disk
		Properties props = new Properties();
		FileInputStream fis = null;
		try {
			fis = new FileInputStream("statcollectionbot.properties");
		} catch (IOException ioe) {
			System.out.println("Can't find ps2bot.proprties in local directory.");
			System.out.println("Wrting out example file and terminating.");
			System.out.println("Modify this file and re-run.");
			
			try {
				props.setProperty("irc_server", "irc.slashnet.org");
				props.setProperty("irc_channel", "#planetside2");
				props.setProperty("botnick", "statbot");
				props.setProperty("nickpass", "");
				props.setProperty("ownernick", "");
				props.setProperty("channelpass", "");
				props.setProperty("soeapikey", "");
				props.setProperty("db_server", "");
				props.setProperty("db_port", "");
				props.setProperty("database", "");
				props.setProperty("db_username", "");
				props.setProperty("db_password", "");
				props.setProperty("memcached_server", "");
		
				props.store(new FileOutputStream("statcollectionbot.properties"), null);
			} catch (IOException ioe2) {
				System.out.println("There was an error writing to the filesystem.");
			}
			System.exit(1);

		} 			
		props.load(fis);
		if (!props.containsKey("irc_server") || !props.containsKey("irc_channel") || !props.containsKey("botnick")) {
			System.out.println("Config file is incomplete.  Delete it to receive a working template.");
			System.exit(1);
		}
		String ircServer = props.getProperty("irc_server");
		String ircChannel = props.getProperty("irc_channel");
		String botnick = props.getProperty("botnick");
		String ownernick = props.getProperty("ownernick");
		
		//seed the permissions manager
		PermissionsManager pm = PermissionsManager.initInstance(ownernick);
		
		//add misc listeners
		bot.getListenerManager().addListener(new PermissionsHandler());

		//connect
		bot.setVerbose(true);
		bot.setName(botnick);
		bot.setMessageDelay(500L);
		bot.connect(ircServer);
		
		//identify with nickserv if so enabled
		String nickpass = props.getProperty("nickpass");
		if (nickpass != null) {
			if (!nickpass.isEmpty()) {
				bot.identify(nickpass);
			}
		}

		//join channel, passing key if needed
		String channelpass = props.getProperty("channelpass");
		if (channelpass==null || channelpass.equals("")) {
			bot.joinChannel(ircChannel);
		} else {
			bot.joinChannel(ircChannel, channelpass);
		}
		
		//pause to let channel join complete.  If we failed, exit.	
		Thread.sleep(5000);
		if (!bot.channelExists(ircChannel)) {
			System.out.println("*** Bot failed to connect to channel \""+ircChannel+"\".  Either the key is wrong, or the server is experiencing unusual load.");
			bot.shutdown(true);
		}

		//set up kill engine
		KillCollectionEngine kce = new KillCollectionEngine(bot, props);
		Thread kct = new Thread(kce, "kct");
		kct.start();

		//link kill handler
		bot.getListenerManager().addListener(new KillCollectionHandler(kce, kct, props));
		
		//set up vehicle deaths engine
		VehicleCollectionEngine vce = new VehicleCollectionEngine(bot, props);
		Thread vct = new Thread(vce, "vct");
		vct.start();

		//link vehicle death handler
		bot.getListenerManager().addListener(new VehicleCollectionHandler(vce, vct, props));

		//set up playtime engine
		PlaytimeCollectionEngine pce = new PlaytimeCollectionEngine(bot, props);
		Thread pct = new Thread(pce, "pct");
		pct.start();

		//link playtime handler
		bot.getListenerManager().addListener(new PlaytimeCollectionHandler(pce, pct, props));

		//set up maintenance engine
		MaintenanceEngine me = new MaintenanceEngine(bot, props);
		Thread met = new Thread(me, "kct");
		met.start();

		//link maintenance handler
		bot.getListenerManager().addListener(new MaintenanceHandler(me, met, props));

		//link Oracle
		//bot.getListenerManager().addListener(new OracleHandler(props));

		//link general command handler
		bot.getListenerManager().addListener(new GeneralHandler(bot));
		bot.getListenerManager().addListener(new SpeechHandler(bot,ircChannel));



		//DISABLED
		//set up twitter listener
		//bot.getListenerManager().addListener(new TwitterListener(bot, channel, props));
	}
}

