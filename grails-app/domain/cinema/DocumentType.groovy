package cinema

public enum DocumentType{
	DNI('D.N.I'),
	CEDULA_IDENTIDAD('Cedula de Identidad'),
    PASAPORTE('Pasaporte'),
	LIBRETA_CIVICA('Libreta Civica'),
	LIBRETA_ENROLAMIENTO('Libreta de Enrolamiento')

	public String name
	public DocumentType(String name){
		this.name = name
	}  

   	public static list() {
    	[DNI, CEDULA_IDENTIDAD, PASAPORTE]
   	}
}
