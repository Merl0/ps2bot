class VehicleList {

	private int faction_id;
	private int vehicle_id;
	private String v_name;
	

	public VehicleList(int faction_id, int vehicle_id, String v_name) {
		this.faction_id = faction_id;
		this.vehicle_id = vehicle_id;
		this.v_name=v_name;
		
	}

	public int getFacId() {
		return faction_id;
	}
	
	public int getVehId() {
		return vehicle_id;
	}
	
	
	public String getVehName() {
		return this.v_name;
	}
}
