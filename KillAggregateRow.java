class KillAggregateRow {
	private String w_name;		
	private int id;
	private int kills;
	private int uniques;
	private float kpu;
	private float kpu_stddev;
	private float avgbr;
	private float q1kpu;
	private float q2kpu;
	private float q3kpu;
	private float q4kpu;
	private int headshot;
	private int v_deaths;
	private float vkpu;
	private int a_deaths;
	private float akpu;
	private String name;
	private int period;
	

	public KillAggregateRow() {
		this.w_name="";		
		this.id=0;
		this.kills=0;
		this.uniques=0;
		this.kpu=0f;
		this.kpu_stddev=0f;
		this.avgbr=0f;
		this.q1kpu=0f;
		this.q2kpu=0f;
		this.q3kpu=0f;
		this.q4kpu=0f;
		this.headshot=0;
		this.v_deaths=0;
		this.vkpu=0f;
		this.a_deaths=0;
		this.akpu=0f;
		this.name="";
		this.period=0;
	}

	public KillAggregateRow(String s1, int s2, int s3, int s4, float s5, float s6, float s7, float s8, float s9, float s10, float s11, int s12, int s13, float s14, int s15, float s16, String s17, int s18) {
		this.w_name = s1;			
		this.id = s2;
		this.kills = s3;
		this.uniques = s4;
		this.kpu = s5;
		this.kpu_stddev = s6;		
		this.avgbr = s7;
		this.q1kpu = s8;
		this.q2kpu = s9;
		this.q3kpu = s10;
		this.q4kpu = s11;
		this.headshot = s12;
		this.v_deaths = s13;
		this.vkpu = s14;
		this.a_deaths = s15;
		this.akpu = s16;
		this.name = s17;
		this.period = s18;
	}

	public String getWepName() {
		return this.w_name;
	}
	public int getId() {
		return this.id;
	}
	public int getKills() {
		return this.kills;
	}
	public int getUniques() {
		return this.uniques;
	}
	public float getKpu() {
		return this.kpu;
	}
	public float getKpuStddev() {
		return this.kpu_stddev;
	}
	public float getAvgbr() {
		return this.avgbr;
	}
	public float getQ1kpu() {
		return this.q1kpu;
	}
	public float getQ2kpu() {
		return this.q2kpu;
	}
	public float getQ3kpu() {
		return this.q3kpu;
	}
	public float getQ4kpu() {
		return this.q4kpu;
	}
	public int getHeadshot() {
		return this.headshot;
	}
	public int getVdeaths() {
		return this.v_deaths;
	}
	public float getVkpu() {
		return this.vkpu;
	}
	public int getAdeaths() {
		return this.a_deaths;
	}
	public float getAkpu() {
		return this.akpu;
	}
	public String getName() {
		return this.name;
	}
	public int getPeriod() {
		return this.period;
	}
}

