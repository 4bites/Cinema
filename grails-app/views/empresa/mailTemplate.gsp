<%@ page contentType="text/html"%>
                <table id="results" width="100%">
                    <thead>
                        <tr>
                            <td>Codigo</td>
							<td>Cuit</td>
							<td>Persona Física/Jurídica</td>
							<td>Fecha Ultima Reválida</td>	
                            <td>Status de reválida</td>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${empresas}" var="empresa">
						<tr>
                            <td>${empresa.empresa.codigo}</td><td>${empresa.empresa.personaFisica?empresa.empresa.personaFisica.cuit:empresa.empresa.personaJuridica.cuit}</td><td>${empresa.empresa.desc()}</td><td>${formatDate(date:empresa.empresa.fechaUltimaRevalida)}</td>
							<td>${empresa.revalida_status}</td>
						</tr>
                        </g:each>
                    </tbody>
                </table>

