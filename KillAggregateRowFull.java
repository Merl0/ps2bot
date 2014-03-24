class KillAggregateRowFull {
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
	private int flashdeaths;
	private float flashkpu;
	private int sunddeaths;
	private float sundkpu;
	private int lightdeaths;
	private float lightkpu;
	private int magdeaths;
	private float magkpu;
	private int vandeaths;
	private float vankpu;
	private int prowldeaths;
	private float prowlkpu;	
	private int scythedeaths;
	private float scythekpu;
	private int reaverdeaths;
	private float reaverkpu;
	private int mossydeaths;
	private float mossykpu;
	private int libdeaths;
	private float libkpu;
	private int galdeaths;
	private float galkpu;
	private int harasdeaths;
	private float haraskpu;
	private String name;
	private int period;
	

	public KillAggregateRowFull() {
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
		this.flashdeaths=0;
		this.flashkpu=0f;
		this.sunddeaths=0;
		this.sundkpu=0f;
		this.lightdeaths=0;
		this.lightkpu=0f;
		this.magdeaths=0;
		this.magkpu=0f;
		this.vandeaths=0;
		this.vankpu=0f;
		this.prowldeaths=0;
		this.prowlkpu=0f;
		this.scythedeaths=0;
		this.scythekpu=0f;
		this.reaverdeaths=0;
		this.reaverkpu=0f;
		this.mossydeaths=0;
		this.mossykpu=0f;
		this.libdeaths=0;
		this.libkpu=0f;
		this.galdeaths=0;
		this.galkpu=0f;
		this.harasdeaths=0;
		this.haraskpu=0f;
		this.name="";
		this.period=0;
		
	}

	public KillAggregateRowFull(String s1,int s2, int s3, int s4, float s5, float s6, float s7, float s8, float s9, float s10, float s11, int s12, int s13, float s14, int s15, float s16, int s17, float s18, int s19, float s20, int s21, float s22, int s23, float s24, int s25, float s26, int s27, float s28, int s29, float s30, int s31, float s32, int s33, float s34, int s35, float s36, int s37, float s38, int s39, float s40, String s41, int s42) {
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
		this.flashdeaths = s17;
		this.flashkpu = s18;
		this.sunddeaths = s19;
		this.sundkpu = s20;
		this.lightdeaths = s21;
		this.lightkpu = s22;
		this.magdeaths = s23;
		this.magkpu = s24;
		this.vandeaths = s25;
		this.vankpu = s26;
		this.prowldeaths = s27;
		this.prowlkpu = s28;
		this.scythedeaths = s29;
		this.scythekpu = s30;
		this.reaverdeaths = s31;
		this.reaverkpu = s32;
		this.mossydeaths = s33;
		this.mossykpu = s34;
		this.libdeaths = s35;
		this.libkpu = s36;
		this.galdeaths = s37;
		this.galkpu = s38;
		this.harasdeaths = s39;
		this.haraskpu = s40;
		this.name = s41;
		this.period = s42;
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
	public int getFlashdeaths() {
		return this.flashdeaths;
	}
	public float getFlashkpu() {
		return this.flashkpu;
	}
	public int getSunddeaths() {
		return this.sunddeaths;
	}
	public float getSundkpu() {
		return this.sundkpu;
	}
	public int getLightdeaths() {
		return this.lightdeaths;
	}
	public float getLightkpu() {
		return this.lightkpu;
	}
	public int getMagdeaths() {
		return this.magdeaths;
	}
	public float getMagkpu() {
		return this.magkpu;
	}
	public int getVandeaths() {
		return this.vandeaths;
	}
	public float getVankpu() {
		return this.vankpu;
	}
	public int getProwldeaths() {
		return this.prowldeaths;
	}
	public float getProwlkpu() {
		return this.prowlkpu;
	}
	public int getScythedeaths() {
		return this.scythedeaths;
	}
	public float getScythekpu() {
		return this.scythekpu;
	}
	public int getReaverdeaths() {
		return this.reaverdeaths;
	}
	public float getReaverkpu() {
		return this.reaverkpu;
	}
	public int getMossydeaths() {
		return this.mossydeaths;
	}
	public float getMossykpu() {
		return this.mossykpu;
	}
	public int getLibdeaths() {
		return this.libdeaths;
	}
	public float getLibkpu() {
		return this.libkpu;
	}
	public int getGaldeaths() {
		return this.galdeaths;
	}
	public float getGalkpu() {
		return this.galkpu;
	}
	public int getHarasdeaths() {
		return this.harasdeaths;
	}
	public float getHaraskpu() {
		return this.haraskpu;
	}
	public String getName() {
		return this.name;
	}
	public int getPeriod() {
		return this.period;
	}
}

