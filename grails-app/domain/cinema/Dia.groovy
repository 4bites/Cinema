package cinema

enum Dia {
    LUNES('Lunes'),
    MARTES('Martes'),
    MIERCOLES('Miercoles'),
    JUEVES('Jueves'),
    VIENES('Viernes'),
    SABADO('Sabado'),
    DOMINGO('Domingo')
    final String value
    
    public Dia(String value){
        this.value = value
    }

    public String value(){
        value
    }
    
    String getKey() { name() }

	static def byId = { dia ->
		valueOf(dia)
	}
    
} 
