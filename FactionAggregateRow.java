class FactionAggregateRow {
	private int period;	
	private int VS_daily_kills;
	private int NC_daily_kills;
	private int TR_daily_kills;
	
	

	public FactionAggregateRow() {
		this.VS_daily_kills=0;
		this.NC_daily_kills=0;
		this.TR_daily_kills=0;
		this.period=0;
	}

	public FactionAggregateRow(int s1, int s2, int s3, int s4) {
		this.period = s1;		
		this.VS_daily_kills = s2;
		this.NC_daily_kills = s3;
		this.TR_daily_kills = s4;
	}

	public int getPeriod() {
		return this.period;
	}
	public int getVS_daily_kills() {
		return this.VS_daily_kills;
	}
	public int getNC_daily_kills() {
		return this.NC_daily_kills;
	}
	public int getTR_daily_kills() {
		return this.TR_daily_kills;
	}
}

