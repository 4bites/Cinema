package cinema

public enum SocietyType{
	ANONIMA('Anonima'),
	CIVIL('Civil'),
    COOPERATIVA('Cooperativa'),
	DE_HECHO('De Hecho'),
	FUNDACION('Fundacion'),
	MUNICIPAL('Municipal'),
	MUTUAL('Mutual'),
	NACIONAL('Nacional'),
	PROVINCIAL('Provincial'),
	SRL('S.R.L.'),
	SINDICATO('Sindicato')

	public String name
	public SocietyType(String name){
		this.name = name
	}  

	static String select(){
		values().collect{"['${it}','${it}']"}.join(",")
	}
}
