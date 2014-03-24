class VehReportRow {
	private int faction_id;		
	private int vehicle_id;
	private int item_id;	
	private String name;	
	private int sum_deaths;
	private int sum_q1deaths;
	private int sum_q2deaths;
	private int sum_q3deaths;
	private int sum_q4deaths;
	

	public VehReportRow() {
		this.faction_id=0;
		this.vehicle_id=0;		
		this.item_id=0;
		this.name="";		
		this.sum_deaths=0;
		this.sum_q1deaths=0;
		this.sum_q2deaths=0;
		this.sum_q3deaths=0;
		this.sum_q4deaths=0;
	}

	public VehReportRow(int s1, int s2, int s3, String s4, int s5, int s6, int s7, int s8, int s9) {
		this.faction_id = s1;
		this.vehicle_id = s2;
		this.item_id = s3;
		this.name = s4;
		this.sum_deaths = s5;
		this.sum_q1deaths = s6;
		this.sum_q2deaths = s7;
		this.sum_q3deaths = s8;
		this.sum_q4deaths = s9;
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
	public int getSumDeaths() {
		return this.sum_deaths;
	}
	public int getSumQ1Deaths() {
		return this.sum_q1deaths;
	}
	public int getSumQ2Deaths() {
		return this.sum_q2deaths;
	}
	public int getSumQ3Deaths() {
		return this.sum_q3deaths;
	}
	public int getSumQ4Deaths() {
		return this.sum_q4deaths;
	}
}

