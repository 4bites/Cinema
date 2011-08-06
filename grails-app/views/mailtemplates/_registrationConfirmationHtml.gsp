<%@ page contentType="text/html"%>
Hello ${user.firstname} ${user.name}<p>
Please confirm registration till <g:formatDate format="yyyy-MM-dd HH:mm" date="${user.expiredDate}"/>
by following this <a href="${confirmationUrl}">link</a>.
