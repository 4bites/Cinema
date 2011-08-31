<%@ page contentType="text/html"%>
                <table id="results" width="100%">
                    <thead>
                        <tr>
                            <td>Codigo</td>
							<td>Persona Física/Jurídica</td>
							<td>Fecha Ultima Reválida</td>	
                            <td>Status de reválida</td>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${empresas}" var="empresa">
                            <td>${empresa.empresa.codigo}</td><td>${empresa.empresa.desc()}</td><td>${formatDate(date:empresa.empresa.fechaUltimaRevalida)}</td>
							<td>${empresa.revalida_status}</td>
                        </g:each>
                    </tbody>
                </table>

