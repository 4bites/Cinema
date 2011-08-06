Hello ${user.firstname} ${user.name}
Please confirm reset password till <g:formatDate format="yyyy-MM-dd HH:mm" date="${user.expiredDate}"/>
by following the link below
    ${confirmationUrl}
