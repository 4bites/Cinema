
<%@ page import="cinema.Pago" %>
<%@ page import="cinema.PagoRegistry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pago.label', default: 'Pagos')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.${pagoInstance?.id?'edit':'create'}.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${pagoInstance}">
            <div class="errors">
                <g:renderErrors bean="${pagoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="file"><g:message code="pago.file.label" default="File" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pagoInstance, field: 'file', 'errors')}">
                                   <input type="file" name="file" value="${pagoInstance?.file}"/>
									${pagoInstance?.file} 
                                </td>
                            </tr>
                        
							<g:if test="${pagoRegs?.size() > 0}">
                        	<tr>
								<td colspan=2>
									<table cellpadding="0" cellspacing="0" border="0" id="pagoRegs">
    								<thead>
       									<tr>
								        	<th>Fila</th>
									      	<th>Errores</th>
								       </tr>
								    </thead>
								    <tbody>
										<g:each in="${pagoRegs}" var="reg">
											<tr>
												<td>${reg.fila}</td>
												<td>
													 <ul>
													   <g:eachError var="err" bean="${reg}">
													       	<li>
																${message(code:err.code)==err.code?message(error:err):message(code:err.code)}
															</li> 
														</g:eachError>
													</ul>
												</td>
											</tr>
										</g:each>			
									</tbody>
									</table>
								</td>
							</tr>
							</g:if>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.save.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
