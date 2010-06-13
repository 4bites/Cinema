package cinema

class PersonaFisica {
    String nombre
    String apellido
    String cuit
    String tipoDocumento
    Integer numeroDocumento
    String sexo
    String domicilio
    String codigoPostal
    String provincia
    String localidad
    String telefono
    String email
    String condicionIVA
    static hasMany = [personasJuridicas:PersonaJuridica]

    static constraints = {
        cuit(unique:true, blank:false)
        nombre(blank:false)
        apellido(blank:false)
        tipoDocumento(nullable:false)
        numeroDocumento(nullable:false)
        sexo(nullable:false)
        domicilio(nullable:false)
        codigoPostal(nullable:false)
        provincia(nullable:false)
        localidad(nullable:false)
        telefono(nullable:false)
        email(email:true)
        condicionIVA(nullable:false)
    }
}
