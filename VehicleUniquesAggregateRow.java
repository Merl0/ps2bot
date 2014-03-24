class VehicleUniquesAggregateRow {
	private int period;	
	private int faction_id;		
	private int veh_id;	
	private String v_name;	
	private int uniques;
	
	

	public VehicleUniquesAggregateRow() {
		this.period=0;		
		this.faction_id=0;
		this.veh_id=0;		
		this.v_name="";		
		this.uniques=0;
	}

	public VehicleUniquesAggregateRow(int s1, int s2, int s3, String s4, int s5) {
		this.period = s1;		
		this.faction_id = s2;
		this.veh_id = s3;
		this.v_name = s4;
		this.uniques = s5;
	}

	public int getPeriod() {
		return this.period;
	}
	public int getFactionId() {
		return this.faction_id;
	}	
	public int getVehicleId() {
		return this.veh_id;
	}	
	public String getVName() {
		return this.v_name;
	}
	public int getUniques() {
		return this.uniques;
	}
}

