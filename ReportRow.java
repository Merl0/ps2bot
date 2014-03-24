class ReportRow {
	private int category_id;
	private int id;
	private String w_name;		
	private int sum_kills;
	private float avg_uniques;
	private float avg_kpu;
	private float avg_kpu_stddev;
	private float avg_avgbr;
	private float avg_q1kpu;
	private float avg_q2kpu;
	private float avg_q3kpu;
	private float avg_q4kpu;
	private int sum_headshot;
	private int sum_v_deaths;
	private float avg_vkpu;
	private int sum_a_deaths;
	private float avg_akpu;
	

	public ReportRow() {
		this.category_id=0;		
		this.id=0;		
		this.w_name="";		
		this.sum_kills=0;
		this.avg_uniques=0f;
		this.avg_kpu=0f;
		this.avg_kpu_stddev=0f;
		this.avg_avgbr=0f;
		this.avg_q1kpu=0f;
		this.avg_q2kpu=0f;
		this.avg_q3kpu=0f;
		this.avg_q4kpu=0f;
		this.sum_headshot=0;
		this.sum_v_deaths=0;
		this.avg_vkpu=0f;
		this.sum_a_deaths=0;
		this.avg_akpu=0f;
	}

	public ReportRow(int s1, int s2, String s3, int s4, float s5, float s6, float s7, float s8, float s9, float s10, float s11, float s12, int s13, int s14, float s15, int s16, float s17) {
		this.category_id = s1;
		this.id = s2;
		this.w_name = s3;			
		this.sum_kills = s4;
		this.avg_uniques = s5;
		this.avg_kpu = s6;
		this.avg_kpu_stddev = s7;		
		this.avg_avgbr = s8;
		this.avg_q1kpu = s9;
		this.avg_q2kpu = s10;
		this.avg_q3kpu = s11;
		this.avg_q4kpu = s12;
		this.sum_headshot = s13;
		this.sum_v_deaths = s14;
		this.avg_vkpu = s15;
		this.sum_a_deaths = s16;
		this.avg_akpu = s17;
	}

	public int getCatId() {
		return this.category_id;
	}	
	public int getId() {
		return this.id;
	}
	public String getWepName() {
		return this.w_name;
	}
	public int getKills() {
		return this.sum_kills;
	}
	public float getUniques() {
		return this.avg_uniques;
	}
	public float getKpu() {
		return this.avg_kpu;
	}
	public float getKpuStddev() {
		return this.avg_kpu_stddev;
	}
	public float getAvgbr() {
		return this.avg_avgbr;
	}
	public float getQ1kpu() {
		return this.avg_q1kpu;
	}
	public float getQ2kpu() {
		return this.avg_q2kpu;
	}
	public float getQ3kpu() {
		return this.avg_q3kpu;
	}
	public float getQ4kpu() {
		return this.avg_q4kpu;
	}
	public int getHeadshot() {
		return this.sum_headshot;
	}
	public int getVdeaths() {
		return this.sum_v_deaths;
	}
	public float getVkpu() {
		return this.avg_vkpu;
	}
	public int getAdeaths() {
		return this.sum_a_deaths;
	}
	public float getAkpu() {
		return this.avg_akpu;
	}
}

