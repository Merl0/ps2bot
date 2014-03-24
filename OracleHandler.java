import org.pircbotx.hooks.ListenerAdapter;
import org.pircbotx.PircBotX;
import org.pircbotx.hooks.events.MessageEvent;
import org.pircbotx.hooks.events.PrivateMessageEvent;
import org.pircbotx.User;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.SortedSet;
import java.util.TreeSet;
import java.util.Scanner;
import org.pircbotx.Colors;
import java.util.Properties;
import java.sql.SQLException;
import java.io.IOException;
import org.joda.time.DateTime;


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
		int vehicle_id;
		int faction_id;	
		int category_id;		
		String pasteTitle = "";
		String pasteBody = "";
		

		if (commandLower.startsWith("!oracle ")) {
			User user = event.getUser();
			//if (!pm.isAllowed("!oracle",event.getUser(),event.getChannel())) {
			//	event.respond("Sorry, you are not in the access list for consulting the oracle.");
			//	return;
			//}
			scanner = new Scanner(commandLower);
			String token = scanner.next();
			
			if (scanner.hasNext()) {
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
							event.respond("Delivering via PM.  If you are planning on running a lot of these, do so in the PM window.");
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
									event.respond("Delivering via PM. If you are planning on running a lot of these, do so in the PM window.");
									event.getBot().sendMessage(user, "Listing Weapons:");
									SortedSet<Integer> keys = new TreeSet<Integer>(hm.keySet());
									for (Integer key : keys) {
										String weapon = hm.get(key);
										event.getBot().sendMessage(user, key+":  "+weapon);
									}
								} else {
									event.respond("That's not a real type.  Not here.  Not in these parts.");
								}
								
							} else {
								event.respond("You need a type number. ex. !oracle list weapons 13");
							}
							
						} else if (token.equals("periods")) {
							ArrayList<TimePeriod> al = new ArrayList<TimePeriod>();
							try {
								al = Oracle.getPeriods(props);
							} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Check the logs, sparky.");
								System.out.println(ex);
								ex.printStackTrace();
								return;
							}
							event.respond("Delivering via PM.  If you are planning on running a lot of these, do so in the PM window.");
							event.getBot().sendMessage(user, "Listing Periods:");
							for (TimePeriod tp : al) {
								DateTime dt1 = new DateTime(tp.getStart()*1000L);
								DateTime dt2 = new DateTime(tp.getEnd()*1000L);
								event.getBot().sendMessage(user, "id: "+tp.getId()+" start: "+dt1.toString()+" end: "+dt2.toString()+" daily? "+tp.getIsDaily());
							}
							
						} else if (token.equals("vehicles")) {
							ArrayList<VehicleList> al = new ArrayList<VehicleList>();
							try {
								al = Oracle.getVehicles(props);
							} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Check the logs, sparky.");
								System.out.println(ex);
								ex.printStackTrace();
								return;
							}
							event.respond("Delivering via PM.  If you are planning on running a lot of these, do so in the PM window.");
							event.getBot().sendMessage(user, "Listing Vehicles:");
							for (VehicleList vl : al) {
								event.getBot().sendMessage(user, "Faction Id: "+vl.getFacId()+" Vehicle Id: "+vl.getVehId()+" Vehicle Name: "+vl.getVehName());
							}
			
						} else {
							event.respond("Didn't recognize that! try types, weapons, vehicles or periods");
						}

					} else {
						event.respond("What would you like to list? types, weapons, vehicles or periods");
					}
					
				
				//END OF 'LIST' HANDLING
				
				} else if (token.equals("ask")) {
					if (scanner.hasNext("weapon")) {
						scanner.next();
						if (scanner.hasNextInt()) {
							int id = scanner.nextInt();
							HashMap<String,String> hm=new HashMap<String,String>(); 
							try {
								if (scanner.hasNextInt()) {
									int period = scanner.nextInt();
									hm = Oracle.getKillAggregate(props,id,period);
								} else {
									hm = Oracle.getKillAggregate(props,id);
								}
							} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Here's the gritty:");
								event.respond(ex.getMessage());
								return;
							}
							if (hm.size()>0) {
								//event.respond("Prepare for Stats:");
								event.respond(hm.get("name")+" -  name: "+hm.get("w_name")+
											" -  kills: "+hm.get("kills")+" uniques: "+hm.get("uniques")+
											" kpu: "+hm.get("kpu")+" kpu_stddev: "+hm.get("kpu_stddev")+
											" avgbr: "+hm.get("avgbr")+
											" q1kpu: "+hm.get("q1kpu")+" q2kpu: "+hm.get("q2kpu")+
											" q3kpu: "+hm.get("q3kpu")+" q4kpu: "+hm.get("q4kpu")+
											" headshot: "+hm.get("headshot")+
											" v_deaths: "+hm.get("v_deaths")+" vKPU: "+hm.get("vKPU")+
											" a_deaths: "+hm.get("a_deaths")+" aKPU: "+hm.get("aKPU"));


							} else {
								event.respond("Was that a legit weapon id and period?  I didn't get anything back.");
							}
						} else {
							event.respond("Need a weapon id and optionally a period.");
						}
					
					} else {
						event.respond("What, like, just in general? Try !oracle ask <weapon/type> [period]");
					}
				

				// END OF ASK HANDLING

				
				} else if (token.equals("dump")) {
				// dumping routines - for weapons, weaponsfull, vehicles, faction kills etc....
			
					if (scanner.hasNext("weaponfull")) {
						// for dumping all the weapon rubbish about individual vehicles!			
						scanner.next();
						if (scanner.hasNextInt()) {
							int id = scanner.nextInt();
							try {
								ArrayList<KillAggregateRowFull> al = Oracle.getAllKillAggregatesFull(props, id);
								int rows = al.size();
								if (rows < 1) {
									event.respond("Was that a legit weapon id?  I didn't get anything back.");
								} else {
									int startPeriod = al.get(0).getPeriod();
									int endPeriod = al.get(rows-1).getPeriod();
									String name = al.get(0).getName();
									pasteTitle = id+" "+name+" periods "+startPeriod+"-"+endPeriod;
									pasteBody = new String(pasteTitle);
									pasteBody += "\r\n";
									pasteBody += "period, name, kills, uniques, kpu, kpu_stddev, avgbr, q1kpu, q2kpu, q3kpu, q4kpu, headshot, v_deaths, vKPU, a_deaths, aKPU, flashdeaths, flashKPU, sunddeaths, sundKPU, lightdeaths, lightKPU, magdeaths, magKPU, vandeaths, vanKPU, prowldeaths, prowlKPU, scythedeaths, scytheKPU, reaverdeaths, reaverKPU, mossydeaths, mossyKPU, libdeaths, libKPU,  galdeaths, galKPU, harasdeaths, harasKPU\r\n";
									for (KillAggregateRowFull karf : al) {
										pasteBody += karf.getPeriod()+","+
												karf.getWepName()+","+
												karf.getKills()+","+
												karf.getUniques()+","+
												karf.getKpu()+","+
												karf.getKpuStddev()+","+
												karf.getAvgbr()+","+
												karf.getQ1kpu()+","+
												karf.getQ2kpu()+","+
												karf.getQ3kpu()+","+
												karf.getQ4kpu()+","+
												karf.getHeadshot()+","+
												karf.getVdeaths()+","+
												karf.getVkpu()+","+
												karf.getAdeaths()+","+
												karf.getAkpu()+","+
												karf.getFlashdeaths()+","+
												karf.getFlashkpu()+","+
												karf.getSunddeaths()+","+
												karf.getSundkpu()+","+
												karf.getLightdeaths()+","+
												karf.getLightkpu()+","+
												karf.getMagdeaths()+","+
												karf.getMagkpu()+","+
												karf.getVandeaths()+","+
												karf.getVankpu()+","+
												karf.getProwldeaths()+","+
												karf.getProwlkpu()+","+
												karf.getScythedeaths()+","+
												karf.getScythekpu()+","+
												karf.getReaverdeaths()+","+
												karf.getReaverkpu()+","+
												karf.getMossydeaths()+","+
												karf.getMossykpu()+","+
												karf.getLibdeaths()+","+
												karf.getLibkpu()+","+
												karf.getGaldeaths()+","+
												karf.getGalkpu()+","+
												karf.getHarasdeaths()+","+
												karf.getHaraskpu()+"\r\n";
										}
									try {
										String url = PastebinHelper.postString(pasteTitle, pasteBody, props);
										event.respond("Your results: "+url);
										return;
									} catch (Exception e) {
										event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
										event.respond(e.getMessage());
										return;
									}

								}




							} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Get maradine.  Here's the gritty:");
								event.respond(ex.getMessage());
								return;
							}
						} else {
							event.respond("I need a weapon id - !oracle dump weaponfull <id>");
						}

					} else if (scanner.hasNext("weapon")) {
						// for dumping basic weapon stats 		
						scanner.next();
						if (scanner.hasNextInt()) {
							int id = scanner.nextInt();
							try {
								ArrayList<KillAggregateRow> al = Oracle.getAllKillAggregates(props, id);
								int rows = al.size();
								if (rows < 1) {
									event.respond("Was that a legit weapon id?  I didn't get anything back.");
								} else {
									int startPeriod = al.get(0).getPeriod();
									int endPeriod = al.get(rows-1).getPeriod();
									String name = al.get(0).getName();
									pasteTitle = id+" "+name+" periods "+startPeriod+"-"+endPeriod;
									pasteBody = new String(pasteTitle);
									pasteBody += "\r\n";
									pasteBody += "period, name, kills, uniques, kpu, kpu_stddev, avgbr, q1kpu, q2kpu, q3kpu, q4kpu, headshot, v_deaths, vKPU, a_deaths, aKPU\r\n";
									for (KillAggregateRow kar : al) {
										pasteBody += kar.getPeriod()+","+
												kar.getWepName()+","+
												kar.getKills()+","+
												kar.getUniques()+","+
												kar.getKpu()+","+
												kar.getKpuStddev()+","+
												kar.getAvgbr()+","+
												kar.getQ1kpu()+","+
												kar.getQ2kpu()+","+
												kar.getQ3kpu()+","+
												kar.getQ4kpu()+","+
												kar.getHeadshot()+","+
												kar.getVdeaths()+","+
												kar.getVkpu()+","+
												kar.getAdeaths()+","+
												kar.getAkpu()+"\r\n";
									}
									try {
										String url = PastebinHelper.postString(pasteTitle, pasteBody, props);
										event.respond("Your results: "+url);
										return;
									} catch (Exception e) {
										event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
										event.respond(e.getMessage());
										return;
									}

								}




							} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Get maradine.  Here's the gritty:");
								event.respond(ex.getMessage());
								return;
							}
						} else {
							event.respond("I need a weapon id - !oracle dump weapon <id>");
						}

					} else if (scanner.hasNext("faction")) {
						// for dumping faction kills
						try {
							ArrayList<FactionAggregateRow> al = Oracle.getAllFactionAggregates(props);
							int rows = al.size();
							System.out.println("rows:\r\n");
							System.out.println(rows);
							int startPeriod = al.get(0).getPeriod();
							int endPeriod = al.get(rows-1).getPeriod();
							System.out.println("start:\r\n");									
							System.out.println(startPeriod);							
							System.out.println("end:\r\n");	
							System.out.println(endPeriod);	

							pasteTitle = " Dumping faction kills for periods "+startPeriod+"-"+endPeriod;
							pasteBody = new String(pasteTitle);
							pasteBody += "\r\n";
							pasteBody += "period, VS_daily_kills, NC_daily_kills, TR_daily_kills\r\n";
									for (FactionAggregateRow far : al) {
										pasteBody += far.getPeriod()+","+
												far.getVS_daily_kills()+","+
												far.getNC_daily_kills()+","+
												far.getTR_daily_kills()+","+
												"\r\n";
									}
									
									try {
										String url = PastebinHelper.postString(pasteTitle, pasteBody, props);
										event.respond("Your results: "+url);
										return;
									} catch (Exception e) {
										event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
										event.respond(e.getMessage());
										return;
									}

								
							
						} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Get maradine.  Here's the gritty:");
								event.respond(ex.getMessage());
								return;
							}
					
					} else if (scanner.hasNext("vuniques")) {
						// for dumping vehicle uniques
						scanner.next();
						if (scanner.hasNextInt()) {
							faction_id = scanner.nextInt();
							try {
								if (scanner.hasNextInt()) {
									vehicle_id = scanner.nextInt();
								} else {
									vehicle_id = 1;
									event.respond("No vehicle id entered - dumping flash.  Maybe you need to !oracle list vehicles");
								}
							// } catch (SQLException ex) {
								// event.respond("Downstream SQL Exception.  Here's the gritty:");
								// event.respond(ex.getMessage());
								// return;
							// }
							} catch (Exception e) {
								event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
								event.respond(e.getMessage());
								return;
							}


						// if (scanner.hasNextInt()) {
							// faction_id = scanner.nextInt();
							// } else {
							//	faction_id = 1;
							// }		
							// if (scanner.hasNextInt()) {
							//	vehicle_id = scanner.nextInt();
							//	} else {
							//		vehicle_id = 1;
							//	}
								
								try {
									ArrayList<VehicleUniquesAggregateRow> al = Oracle.getAllVehicleUniquesAggregates(props, faction_id, vehicle_id);
									int rows = al.size();
									if (rows < 1) {
										event.respond("Was that a legit vehicle id and faction id?  I didn't get anything back.");
									} else {
										int startPeriod = al.get(0).getPeriod();
										int endPeriod = al.get(rows-1).getPeriod();
										// String name = al.get(0).getVehName();
										pasteTitle = "Vehicle: "+vehicle_id+"Faction: "+faction_id+" periods "+startPeriod+"-"+endPeriod;
										pasteBody = new String(pasteTitle); 
										pasteBody += "\r\n";
										pasteBody += "period, vehicle, faction, v_name, uniques\r\n";
										for (VehicleUniquesAggregateRow vuar : al) {
										pasteBody += vuar.getPeriod()+","+

												vuar.getVehicleId()+","+
												vuar.getFactionId()+","+
												vuar.getVName()+","+
												vuar.getUniques()+"\r\n";
										}
									} try {
										String url = PastebinHelper.postString(pasteTitle, pasteBody, props);
										event.respond("Your results: "+url);
										return;
									} catch (Exception e) {
										event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
										event.respond(e.getMessage());
										return;
										}
								
								} catch (SQLException ex) {
									event.respond("Downstream SQL Exception.  Get maradine.  Here's the gritty:");
									event.respond(ex.getMessage());
									return;

								}
							
						} else {
							event.respond("I need a vehicle id and faction id - !oracle dump vehicle <vehicle_id> <faction_id>.  Maybe you need to !oracle list vehicles");
						}
					
										
					// for dumping vehicle deaths
					} else if (scanner.hasNext("vehicle")) {
						scanner.next();
						if (scanner.hasNextInt()) {
							faction_id = scanner.nextInt();
							try {
								if (scanner.hasNextInt()) {
									vehicle_id = scanner.nextInt();
								} else {
									vehicle_id = 1;
									event.respond("No vehicle id entered - dumping flash.  Maybe you need to !oracle list vehicles");
								}
							} catch (Exception e) {
								event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
								event.respond(e.getMessage());
								return;
							}


						// if (scanner.hasNextInt()) {
						//	faction_id = scanner.nextInt();
						//	} else {
						//		faction_id = 1;
						//	}		
						//	if (scanner.hasNextInt()) {
						//		vehicle_id = scanner.nextInt();
						//		} else {
						//			vehicle_id = 1;
						//		}
								
							try {
								ArrayList<VehicleAggregateRow> al = Oracle.getAllVehicleAggregates(props, faction_id, vehicle_id);
								int rows = al.size();
								if (rows < 1) {
									event.respond("Was that a legit vehicle id and faction id?  I didn't get anything back.");
								} else {
									int startPeriod = al.get(0).getPeriod();
									int endPeriod = al.get(rows-1).getPeriod();
									// String name = al.get(0).getVehName();
									pasteTitle = "Faction: "+faction_id+" Vehicle: "+vehicle_id+" periods "+startPeriod+"-"+endPeriod;
									pasteBody = new String(pasteTitle); 
									pasteBody += "\r\n";
									pasteBody += "period, faction, vehicle, id, name, deaths, q1deaths, q2deaths, q3 deaths, q4deaths\r\n";
									for (VehicleAggregateRow var : al) {
										pasteBody += var.getPeriod()+","+
												var.getFactionId()+","+
												var.getVehicleId()+","+
												var.getItemId()+","+
												var.getName()+","+
												var.getDeaths()+","+
												var.getQ1Deaths()+","+	
												var.getQ2Deaths()+","+
												var.getQ3Deaths()+","+
												var.getQ4Deaths()+"\r\n";

									}
								} 
								try {
									String url = PastebinHelper.postString(pasteTitle, pasteBody, props);
									event.respond("Your results: "+url);
									return;
								} catch (Exception e) {
									event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
									event.respond(e.getMessage());
									return;
								}

								
							} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Get maradine.  Here's the gritty:");
								event.respond(ex.getMessage());
								return;
							}
						} else {
							event.respond("I need a faction id and vehicle id - !oracle dump vehicle <faction_id> <vehicle_id>. Maybe you need to !oracle list vehicles");
						}
					} else {
						event.respond("Right now I can only dump weapons, faction or vehicles - !oracle dump weapon <id> or !oracle dump faction or !oracle dump vehicle <faction_id> <vehicle_id>");
					}
			 
				
				// else if (token.equals("some other thing")) {
					//blah
				} else if (token.equals("report")) {
				// print report of weapon stats for all weapons of a particular weapon type - aggregated over the periods
					// scanner.next();
						if (scanner.hasNextInt()) {
							category_id = scanner.nextInt();
							try {
								ArrayList<ReportRow> al = Oracle.getReportRow(props, category_id);
								int rows = al.size();
								if (rows < 1) {
									event.respond("Was that a legit category id?  I didn't get anything back.");
								} else {
									// int startPeriod = al.get(0).getPeriod();
									// int endPeriod = al.get(rows-1).getPeriod();
									// String name = al.get(0).getName();
									pasteTitle = category_id+" category weapons report:";
									pasteBody = new String(pasteTitle);
									pasteBody += "\r\n";
									pasteBody += "item_id, name, sum_kills, avg_uniques, avg_kpu, avg_kpu_stddev, avg_avgbr, avg_q1kpu, avg_q2kpu, avg_q3kpu, avg_q4kpu, sum_headshot, sum_v_deaths, avg_vKPU, sum_a_deaths, avg_aKPU\r\n";
									for (ReportRow rar : al) {
										pasteBody += 	rar.getId()+","+
												rar.getWepName()+","+
												rar.getKills()+","+
												rar.getUniques()+","+
												rar.getKpu()+","+
												rar.getKpuStddev()+","+
												rar.getAvgbr()+","+
												rar.getQ1kpu()+","+
												rar.getQ2kpu()+","+
												rar.getQ3kpu()+","+
												rar.getQ4kpu()+","+
												rar.getHeadshot()+","+
												rar.getVdeaths()+","+
												rar.getVkpu()+","+
												rar.getAdeaths()+","+
												rar.getAkpu()+"\r\n";
									}
									try {
										String url = PastebinHelper.postString(pasteTitle, pasteBody, props);
										event.respond("Your results: "+url);
										return;
									} catch (Exception e) {
										event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
										event.respond(e.getMessage());
										return;
									}

								}


							} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Get maradine.  Here's the gritty:");
								event.respond(ex.getMessage());
								return;
							}








						} else {
							event.respond("I need a weapon category id - !oracle report <category_id>. Maybe you need to !oracle list types");
						}



 				} else if (token.equals("vehreport")) {
				// print report of vehicle deaths for particular faction / vehicle id - aggregated over the periods
					// scanner.next();
						if (scanner.hasNextInt()) {
							faction_id = scanner.nextInt();
							try {
								if (scanner.hasNextInt()) {
									vehicle_id = scanner.nextInt();
								} else {
									vehicle_id = 1;
									event.respond("No vehicle id entered - dumping flash.  Maybe you need to !oracle list vehicles");
								}
							} catch (Exception e) {
								event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
								event.respond(e.getMessage());
								return;
							}
					
					
							try {
								ArrayList<VehReportRow> al = Oracle.getVehReportRow(props, faction_id, vehicle_id);
								int rows = al.size();

								if (rows < 1) {
									event.respond("Was that a legit vehicle id and faction id?  I didn't get anything back.");
								} else {
									// int startPeriod = al.get(0).getPeriod();

									// int endPeriod = al.get(rows-1).getPeriod();
									
									pasteTitle = "Vehicle Death Report: Vehicle_ID: "+vehicle_id+" Faction: "+faction_id;

									pasteBody = new String(pasteTitle); 
									pasteBody += "\r\n";
									pasteBody += "faction, vehicle, id, name, sum_deaths, sum_q1deaths, sum_q2deaths, sum_q3 deaths, sum_q4deaths\r\n";

									for (VehReportRow vrar : al) {
										pasteBody += 	vrar.getFactionId()+","+
												vrar.getVehicleId()+","+
												vrar.getItemId()+","+
												vrar.getName()+","+
												vrar.getSumDeaths()+","+
												vrar.getSumQ1Deaths()+","+	
												vrar.getSumQ2Deaths()+","+
												vrar.getSumQ3Deaths()+","+
												vrar.getSumQ4Deaths()+"\r\n";


									}
								} 
								try {
									String url = PastebinHelper.postString(pasteTitle, pasteBody, props);

									event.respond("Your results: "+url);
									return;
								} catch (Exception e) {
									event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");

									event.respond(e.getMessage());
									return;
								}


								
							} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Get maradine.  Here's the gritty:");
								event.respond(ex.getMessage());

								return;
							}


						} else {
							event.respond("I need a faction id and vehicle id - !oracle dump vehicle <faction_id> <vehicle_id>. Maybe you need to !oracle list vehicles");
						}



 				} else {
					event.respond("I don't know how to do that.  'ask', 'list', 'dump', 'report' and 'vehreport' are helpful.");
				}

				
			} else {
				event.respond("Try !oracle <ask> or <list> or <dump> or <report> or <vehreport>.");
			} 		
		}	
		// else if (command.equals("!oracle")) {
			// event.respond("What?");
	}	
// }		 	





	
	public void onPrivateMessage(PrivateMessageEvent event) {
		String command = event.getMessage();
		String commandLower = command.toLowerCase();
		int vehicle_id;
		int faction_id;	
		int category_id;
		String pasteTitle = "";
		String pasteBody = "";	

		if (commandLower.startsWith("!oracle ")) {
			User user = event.getUser();
			//if (!pm.isAllowed("!oracle",event.getUser(),event.getChannel())) {
			//	event.respond("Sorry, you are not in the access list for consulting the oracle.");
			//	return;
			//}
			scanner = new Scanner(commandLower);
			String token = scanner.next();
			
			if (scanner.hasNext()) {
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
							event.respond("Delivering via PM.  If you are planning on running a lot of these, do so in the PM window.");
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
									event.respond("Delivering via PM. If you are planning on running a lot of these, do so in the PM window.");
									event.getBot().sendMessage(user, "Listing Weapons:");
									SortedSet<Integer> keys = new TreeSet<Integer>(hm.keySet());
									for (Integer key : keys) {
										String weapon = hm.get(key);
										event.getBot().sendMessage(user, key+":  "+weapon);
									}
								} else {
									event.respond("That's not a real type.  Not here.  Not in these parts.");
								}
								
							} else {
								event.respond("You need a type number. ex. !oracle list weapons 13");
							}
							
						} else if (token.equals("periods")) {
							ArrayList<TimePeriod> al = new ArrayList<TimePeriod>();
							try {
								al = Oracle.getPeriods(props);
							} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Check the logs, sparky.");
								System.out.println(ex);
								ex.printStackTrace();
								return;
							}
							event.respond("Delivering via PM.  If you are planning on running a lot of these, do so in the PM window.");
							event.getBot().sendMessage(user, "Listing Periods:");
							for (TimePeriod tp : al) {
								DateTime dt1 = new DateTime(tp.getStart()*1000L);
								DateTime dt2 = new DateTime(tp.getEnd()*1000L);
								event.getBot().sendMessage(user, "id: "+tp.getId()+" start: "+dt1.toString()+" end: "+dt2.toString()+" daily? "+tp.getIsDaily());
							}
							
						} else if (token.equals("vehicles")) {
							ArrayList<VehicleList> al = new ArrayList<VehicleList>();
							try {
								al = Oracle.getVehicles(props);
							} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Check the logs, sparky.");
								System.out.println(ex);
								ex.printStackTrace();
								return;
							}
							event.respond("Delivering via PM.  If you are planning on running a lot of these, do so in the PM window.");
							event.getBot().sendMessage(user, "Listing Vehicles:");
							for (VehicleList vl : al) {
								event.getBot().sendMessage(user, "Faction Id: "+vl.getFacId()+" Vehicle Id: "+vl.getVehId()+" Vehicle Name: "+vl.getVehName());
							}

						} else {
							event.respond("Didn't recognize that! try types, weapons, vehicles or periods");
						}

					} else {
						event.respond("What would you like to list? types, weapons, vehicles or periods");
					}
					
				
				
				//END OF 'LIST' HANDLING
				//
				//
				//
				} else if (token.equals("ask")) {
					if (scanner.hasNext("weapon")) {
						scanner.next();
						if (scanner.hasNextInt()) {
							int id = scanner.nextInt();
							HashMap<String,String> hm=new HashMap<String,String>(); 
							try {
								if (scanner.hasNextInt()) {
									int period = scanner.nextInt();
									hm = Oracle.getKillAggregate(props,id,period);
								} else {
									hm = Oracle.getKillAggregate(props,id);
								}
							} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Here's the gritty:");
								event.respond(ex.getMessage());
								return;
							}
							if (hm.size()>0) {
								//event.respond("Prepare for Stats:");
								event.respond(hm.get("name")+" -  name: "+hm.get("w_name")+
											" -  kills: "+hm.get("kills")+" uniques: "+hm.get("uniques")+
											" kpu: "+hm.get("kpu")+" kpu_stddev: "+hm.get("kpu_stddev")+
											" avgbr: "+hm.get("avgbr")+
											" q1kpu: "+hm.get("q1kpu")+" q2kpu: "+hm.get("q2kpu")+
											" q3kpu: "+hm.get("q3kpu")+" q4kpu: "+hm.get("q4kpu")+
											" headshot: "+hm.get("headshot")+
											" v_deaths: "+hm.get("v_deaths")+" vKPU: "+hm.get("vKPU")+
											" a_deaths: "+hm.get("a_deaths")+" aKPU: "+hm.get("aKPU"));


							} else {
								event.respond("Was that a legit weapon id and period?  I didn't get anything back.");
							}
						} else {
							event.respond("Need a weapon id and optionally a period.");
						}
					
					} else if (scanner.hasNext("type")) {
						//blah
					} else {
						event.respond("What, like, just in general? Try !oracle ask <weapon/type> [period]");
					}
				
				
				} else if (token.equals("dump")) {
				// dumping routines - for weapons, weaponsfull, vehicles, faction kills etc....
			
					if (scanner.hasNext("weaponfull")) {
						// for dumping all the weapon rubbish about individual vehicles!			
						scanner.next();
						if (scanner.hasNextInt()) {
							int id = scanner.nextInt();
							try {
								ArrayList<KillAggregateRowFull> al = Oracle.getAllKillAggregatesFull(props, id);
								int rows = al.size();
								if (rows < 1) {
									event.respond("Was that a legit weapon id?  I didn't get anything back.");
								} else {
									int startPeriod = al.get(0).getPeriod();
									int endPeriod = al.get(rows-1).getPeriod();
									String name = al.get(0).getName();
									pasteTitle = id+" "+name+" periods "+startPeriod+"-"+endPeriod;
									pasteBody = new String(pasteTitle);
									pasteBody += "\r\n";
									pasteBody += "period, name, kills, uniques, kpu, kpu_stddev, avgbr, q1kpu, q2kpu, q3kpu, q4kpu, headshot, v_deaths, vKPU, a_deaths, aKPU, flashdeaths, flashKPU, sunddeaths, sundKPU, lightdeaths, lightKPU, magdeaths, magKPU, vandeaths, vanKPU, prowldeaths, prowlKPU, scythedeaths, scytheKPU, reaverdeaths, reaverKPU, mossydeaths, mossyKPU, libdeaths, libKPU,  galdeaths, galKPU, harasdeaths, harasKPU\r\n";
									for (KillAggregateRowFull karf : al) {
										pasteBody += karf.getPeriod()+","+
												karf.getWepName()+","+
												karf.getKills()+","+
												karf.getUniques()+","+
												karf.getKpu()+","+
												karf.getKpuStddev()+","+
												karf.getAvgbr()+","+
												karf.getQ1kpu()+","+
												karf.getQ2kpu()+","+
												karf.getQ3kpu()+","+
												karf.getQ4kpu()+","+
												karf.getHeadshot()+","+
												karf.getVdeaths()+","+
												karf.getVkpu()+","+
												karf.getAdeaths()+","+
												karf.getAkpu()+","+
												karf.getFlashdeaths()+","+
												karf.getFlashkpu()+","+
												karf.getSunddeaths()+","+
												karf.getSundkpu()+","+
												karf.getLightdeaths()+","+
												karf.getLightkpu()+","+
												karf.getMagdeaths()+","+
												karf.getMagkpu()+","+
												karf.getVandeaths()+","+
												karf.getVankpu()+","+
												karf.getProwldeaths()+","+
												karf.getProwlkpu()+","+
												karf.getScythedeaths()+","+
												karf.getScythekpu()+","+
												karf.getReaverdeaths()+","+
												karf.getReaverkpu()+","+
												karf.getMossydeaths()+","+
												karf.getMossykpu()+","+
												karf.getLibdeaths()+","+
												karf.getLibkpu()+","+
												karf.getGaldeaths()+","+
												karf.getGalkpu()+","+
												karf.getHarasdeaths()+","+
												karf.getHaraskpu()+"\r\n";
									}
									try {
										String url = PastebinHelper.postString(pasteTitle, pasteBody, props);
										event.respond("Your results: "+url);
										return;
									} catch (Exception e) {
										event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
										event.respond(e.getMessage());
										return;
									}

								}

							} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Get maradine.  Here's the gritty:");
								event.respond(ex.getMessage());
								return;
							}
						} else {
							event.respond("I need a weapon id - !oracle dump weaponfull <id>");
						}

					} else if (scanner.hasNext("weapon")) {
						// for dumping basic weapon stats 		
						scanner.next();
						if (scanner.hasNextInt()) {
							int id = scanner.nextInt();
							try {
								ArrayList<KillAggregateRow> al = Oracle.getAllKillAggregates(props, id);
								int rows = al.size();
								if (rows < 1) {
									event.respond("Was that a legit weapon id?  I didn't get anything back.");
								} else {
									int startPeriod = al.get(0).getPeriod();
									int endPeriod = al.get(rows-1).getPeriod();
									String name = al.get(0).getName();
									pasteTitle = id+" "+name+" periods "+startPeriod+"-"+endPeriod;
									pasteBody = new String(pasteTitle);
									pasteBody += "\r\n";
									pasteBody += "period, name, kills, uniques, kpu, kpu_stddev, avgbr, q1kpu, q2kpu, q3kpu, q4kpu, headshot, v_deaths, vKPU, a_deaths, aKPU\r\n";
									for (KillAggregateRow kar : al) {
										pasteBody += kar.getPeriod()+","+
												kar.getWepName()+","+
												kar.getKills()+","+
												kar.getUniques()+","+
												kar.getKpu()+","+
												kar.getKpuStddev()+","+
												kar.getAvgbr()+","+
												kar.getQ1kpu()+","+
												kar.getQ2kpu()+","+
												kar.getQ3kpu()+","+
												kar.getQ4kpu()+","+
												kar.getHeadshot()+","+
												kar.getVdeaths()+","+
												kar.getVkpu()+","+
												kar.getAdeaths()+","+
												kar.getAkpu()+"\r\n";
									}
									try {
										String url = PastebinHelper.postString(pasteTitle, pasteBody, props);
										event.respond("Your results: "+url);
										return;
									} catch (Exception e) {
										event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
										event.respond(e.getMessage());
										return;
									}

								}




							} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Get maradine.  Here's the gritty:");
								event.respond(ex.getMessage());
								return;
							}
						} else {
							event.respond("I need a weapon id - !oracle dump weapon <id>");
						}

					} else if (scanner.hasNext("faction")) {
						// for dumping faction kills
						try {
							ArrayList<FactionAggregateRow> al = Oracle.getAllFactionAggregates(props);
							int rows = al.size();
							System.out.println("rows:\r\n");
							System.out.println(rows);
							int startPeriod = al.get(0).getPeriod();
							int endPeriod = al.get(rows-1).getPeriod();
							System.out.println("start:\r\n");									
							System.out.println(startPeriod);							
							System.out.println("end:\r\n");	
							System.out.println(endPeriod);	

							pasteTitle = " Dumping faction kills for periods "+startPeriod+"-"+endPeriod;
							pasteBody = new String(pasteTitle);
							pasteBody += "\r\n";
							pasteBody += "period, VS_daily_kills, NC_daily_kills, TR_daily_kills\r\n";
								for (FactionAggregateRow far : al) {
									pasteBody += far.getPeriod()+","+
											far.getVS_daily_kills()+","+
											far.getNC_daily_kills()+","+
											far.getTR_daily_kills()+","+
											"\r\n";
								}
									
								try {
									String url = PastebinHelper.postString(pasteTitle, pasteBody, props);
									event.respond("Your results: "+url);
									return;
								} catch (Exception e) {
									event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
									event.respond(e.getMessage());
									return;
								}

								
							
						} catch (SQLException ex) {
							event.respond("Downstream SQL Exception.  Get maradine.  Here's the gritty:");
							event.respond(ex.getMessage());
							return;
						}
					
					} else if (scanner.hasNext("vuniques")) {
						// for dumping vehicle uniques
						scanner.next();
						if (scanner.hasNextInt()) {
							faction_id = scanner.nextInt();
							try {
								if (scanner.hasNextInt()) {
									vehicle_id = scanner.nextInt();
								} else {
									vehicle_id = 1;
									event.respond("No vehicle id entered - dumping flash.  Maybe you need to !oracle list vehicles");
								}
							// } catch (SQLException ex) {
								// event.respond("Downstream SQL Exception.  Here's the gritty:");
								// event.respond(ex.getMessage());
								// return;
							// }
							} catch (Exception e) {
								event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
								event.respond(e.getMessage());
								return;
							}


						// if (scanner.hasNextInt()) {
							// faction_id = scanner.nextInt();
							// } else {
							//	faction_id = 1;
							// }		
							// if (scanner.hasNextInt()) {
							//	vehicle_id = scanner.nextInt();
							//	} else {
							//		vehicle_id = 1;
							//	}
								
								try {
									ArrayList<VehicleUniquesAggregateRow> al = Oracle.getAllVehicleUniquesAggregates(props, faction_id, vehicle_id);
									int rows = al.size();
									if (rows < 1) {
										event.respond("Was that a legit vehicle id and faction id?  I didn't get anything back.");
									} else {
										int startPeriod = al.get(0).getPeriod();
										int endPeriod = al.get(rows-1).getPeriod();
										// String name = al.get(0).getVehName();
										pasteTitle = "Vehicle: "+vehicle_id+"Faction: "+faction_id+" periods "+startPeriod+"-"+endPeriod;
										pasteBody = new String(pasteTitle); 
										pasteBody += "\r\n";
										pasteBody += "period, vehicle, faction, v_name, uniques\r\n";
										for (VehicleUniquesAggregateRow vuar : al) {
										pasteBody += vuar.getPeriod()+","+
												vuar.getVehicleId()+","+
												vuar.getFactionId()+","+
												vuar.getVName()+","+
												vuar.getUniques()+"\r\n";
										}
									} try {
										String url = PastebinHelper.postString(pasteTitle, pasteBody, props);
										event.respond("Your results: "+url);
										return;
									} catch (Exception e) {
										event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
										event.respond(e.getMessage());
										return;
										}
								
								} catch (SQLException ex) {
									event.respond("Downstream SQL Exception.  Get maradine.  Here's the gritty:");
									event.respond(ex.getMessage());
									return;

								}
							
						} else {
							event.respond("I need a vehicle id and faction id - !oracle dump vehicle <vehicle_id> <faction_id>.  Maybe you need to !oracle list vehicles");
						}
					
										
					// for dumping vehicle deaths
					} else if (scanner.hasNext("vehicle")) {
						scanner.next();
						if (scanner.hasNextInt()) {
							faction_id = scanner.nextInt();
							try {
								if (scanner.hasNextInt()) {
									vehicle_id = scanner.nextInt();
								} else {
									vehicle_id = 1;
									event.respond("No vehicle id entered - dumping flash.  Maybe you need to !oracle list vehicles");
								}
							} catch (Exception e) {
								event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
								event.respond(e.getMessage());
								return;
							}


						// if (scanner.hasNextInt()) {
						//	faction_id = scanner.nextInt();
						//	} else {
						//		faction_id = 1;
						//	}		
						//	if (scanner.hasNextInt()) {
						//		vehicle_id = scanner.nextInt();
						//		} else {
						//			vehicle_id = 1;
						//		}
								
							try {
								ArrayList<VehicleAggregateRow> al = Oracle.getAllVehicleAggregates(props, faction_id, vehicle_id);
								int rows = al.size();
								if (rows < 1) {
									event.respond("Was that a legit vehicle id and faction id?  I didn't get anything back.");
								} else {
									int startPeriod = al.get(0).getPeriod();
									int endPeriod = al.get(rows-1).getPeriod();
									// String name = al.get(0).getVehName();
									pasteTitle = "Faction: "+faction_id+" Vehicle: "+vehicle_id+" periods "+startPeriod+"-"+endPeriod;
									pasteBody = new String(pasteTitle); 
									pasteBody += "\r\n";
									pasteBody += "period, faction, vehicle, id, name, deaths, q1deaths, q2deaths, q3 deaths, q4deaths\r\n";
									for (VehicleAggregateRow var : al) {
										pasteBody += var.getPeriod()+","+
												var.getFactionId()+","+
												var.getVehicleId()+","+
												var.getItemId()+","+
												var.getName()+","+
												var.getDeaths()+","+
												var.getQ1Deaths()+","+	
												var.getQ2Deaths()+","+
												var.getQ3Deaths()+","+
												var.getQ4Deaths()+"\r\n";

									}
								} 
								try {
									String url = PastebinHelper.postString(pasteTitle, pasteBody, props);
									event.respond("Your results: "+url);
									return;
								} catch (Exception e) {
									event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
									event.respond(e.getMessage());
									return;
								}

								
							} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Get maradine.  Here's the gritty:");
								event.respond(ex.getMessage());
								return;
							}
						} else {
							event.respond("I need a faction id and vehicle id - !oracle dump vehicle <faction_id> <vehicle_id>. Maybe you need to !oracle list vehicles");
						}
					} else {
						event.respond("Right now I can only dump weapons, faction or vehicles - !oracle dump weapon <id> or !oracle dump faction or !oracle dump vehicle <faction_id> <vehicle_id>");
					}
			 
				
				// else if (token.equals("some other thing")) {
					//blah
				
				} else if (token.equals("report")) {
				// print report of weapon stats for all weapons of a particular weapon type - aggregated over the periods
					// scanner.next();
						if (scanner.hasNextInt()) {
							category_id = scanner.nextInt();
							try {
								ArrayList<ReportRow> al = Oracle.getReportRow(props, category_id);
								int rows = al.size();
								if (rows < 1) {
									event.respond("Was that a legit category id?  I didn't get anything back.");
								} else {
									// int startPeriod = al.get(0).getPeriod();
									// int endPeriod = al.get(rows-1).getPeriod();
									// String name = al.get(0).getName();
									pasteTitle = category_id+" category weapons report:";
									pasteBody = new String(pasteTitle);
									pasteBody += "\r\n";
									pasteBody += "item_id, name, sum_kills, avg_uniques, avg_kpu, avg_kpu_stddev, avg_avgbr, avg_q1kpu, avg_q2kpu, avg_q3kpu, avg_q4kpu, sum_headshot, sum_v_deaths, avg_vKPU, sum_a_deaths, avg_aKPU\r\n";
									for (ReportRow rar : al) {
										pasteBody += 	rar.getId()+","+
												rar.getWepName()+","+
												rar.getKills()+","+
												rar.getUniques()+","+
												rar.getKpu()+","+
												rar.getKpuStddev()+","+
												rar.getAvgbr()+","+
												rar.getQ1kpu()+","+
												rar.getQ2kpu()+","+
												rar.getQ3kpu()+","+
												rar.getQ4kpu()+","+
												rar.getHeadshot()+","+
												rar.getVdeaths()+","+
												rar.getVkpu()+","+
												rar.getAdeaths()+","+
												rar.getAkpu()+"\r\n";
									}
									try {
										String url = PastebinHelper.postString(pasteTitle, pasteBody, props);
										event.respond("Your results: "+url);
										return;
									} catch (Exception e) {
										event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
										event.respond(e.getMessage());
										return;
									}

								}


							} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Get maradine.  Here's the gritty:");
								event.respond(ex.getMessage());
								return;
							}








						} else {
							event.respond("I need a weapon category id - !oracle report <category_id>. Maybe you need to !oracle list types");
						}



 				} else if (token.equals("vehreport")) {
				// print report of vehicle deaths for particular faction / vehicle id - aggregated over the periods
					// scanner.next();
						if (scanner.hasNextInt()) {
							faction_id = scanner.nextInt();
							try {
								if (scanner.hasNextInt()) {
									vehicle_id = scanner.nextInt();
								} else {
									vehicle_id = 1;
									event.respond("No vehicle id entered - dumping flash.  Maybe you need to !oracle list vehicles");
								}
							} catch (Exception e) {
								event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
								event.respond(e.getMessage());
								return;
							}
					
					
							try {
								ArrayList<VehReportRow> al = Oracle.getVehReportRow(props, faction_id, vehicle_id);
								int rows = al.size();
								if (rows < 1) {
									event.respond("Was that a legit vehicle id and faction id?  I didn't get anything back.");
								} else {
									// int startPeriod = al.get(0).getPeriod();
									// int endPeriod = al.get(rows-1).getPeriod();
									
									pasteTitle = "Vehicle Death Report: Vehicle_ID: "+vehicle_id+" Faction: "+faction_id;
									pasteBody = new String(pasteTitle); 
									pasteBody += "\r\n";
									pasteBody += "faction, vehicle, id, name, sum_deaths, sum_q1deaths, sum_q2deaths, sum_q3 deaths, sum_q4deaths\r\n";
									for (VehReportRow vrar : al) {
										pasteBody += 	vrar.getFactionId()+","+
												vrar.getVehicleId()+","+
												vrar.getItemId()+","+
												vrar.getName()+","+
												vrar.getSumDeaths()+","+
												vrar.getSumQ1Deaths()+","+	
												vrar.getSumQ2Deaths()+","+
												vrar.getSumQ3Deaths()+","+
												vrar.getSumQ4Deaths()+"\r\n";

									}
								} 
								try {
									String url = PastebinHelper.postString(pasteTitle, pasteBody, props);
									event.respond("Your results: "+url);
									return;
								} catch (Exception e) {
									event.respond("Downstream IO Exception.  Get maradine.  Here's the gritty:");
									event.respond(e.getMessage());
									return;
								}

								
							} catch (SQLException ex) {
								event.respond("Downstream SQL Exception.  Get maradine.  Here's the gritty:");
								event.respond(ex.getMessage());
								return;
							}


						} else {
							event.respond("I need a faction id and vehicle id - !oracle dump vehicle <faction_id> <vehicle_id>. Maybe you need to !oracle list vehicles");
						}



 				} else {
					event.respond("I don't know how to do that.  'ask', 'list', 'dump', 'report' and 'vehreport' are helpful.");
				}

				
			} else {
				event.respond("Try !oracle <ask> or <list> or <dump> or <report> or <vehreport>.");
			} 		
		}	
		// else if (command.equals("!oracle")) {
			// event.respond("What?");
	}	
	
 	
}


