class VehicleAggregateRow {
	private int period;	
	private int faction_id;		
	private int vehicle_id;
	private int item_id;	
	private String name;	
	private int deaths;
	private int q1deaths;
	private int q2deaths;
	private int q3deaths;
	private int q4deaths;
	
	

	public VehicleAggregateRow() {
		this.period=0;		
		this.faction_id=0;
		this.vehicle_id=0;		
		this.item_id=0;
		this.name="";		
		this.deaths=0;
		this.q1deaths=0;
		this.q2deaths=0;
		this.q3deaths=0;
		this.q4deaths=0;
	
	}

	public VehicleAggregateRow(int s1, int s2, int s3, int s4, String s5, int s6, int s7, int s8, int s9, int s10) {
		this.period = s1;
		this.faction_id = s2;
		this.vehicle_id = s3;
		this.item_id = s4;
		this.name = s5;
		this.deaths = s6;
		this.q1deaths = s7;
		this.q2deaths = s8;
		this.q3deaths = s9;
		this.q4deaths = s10;
	}

	public int getPeriod() {
		return this.period;
	}
	public int getFactionId() {
		return this.faction_id;
	}	
	public int getVehicleId() {
		return this.vehicle_id;
	}	
	public int getItemId() {
		return this.item_id;
	}
	public String getName() {
		return this.name;
	}
	public int getDeaths() {
		return this.deaths;
	}
	public int getQ1Deaths() {
		return this.q1deaths;
	}
	public int getQ2Deaths() {
		return this.q2deaths;
	}
	public int getQ3Deaths() {
		return this.q3deaths;
	}
	public int getQ4Deaths() {
		return this.q4deaths;
	}
}

