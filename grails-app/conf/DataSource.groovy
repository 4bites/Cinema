dataSource {
	pooled = true
	driverClassName = "org.hsqldb.jdbcDriver"
	username = "sa"
	password = ""
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			
			/*
			dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			url = "jdbc:hsqldb:mem:devDB"
			*/
			
			dbCreate = "update" // one of 'create', 'create-drop','update'
			//url = "jdbc:hsqldb:file:devDb"
            url = "jdbc:mysql://localhost/cinema"
            driverClassName = "com.mysql.jdbc.Driver"
            dialect = org.hibernate.dialect.MySQL5InnoDBDialect
            username = "root"
            password = "nicolas"
			

		}
	}
	test {
		dataSource {
            dbCreate = "create" // one of 'create', 'create-drop','update'
//          url = "jdbc:hsqldb:file:devDb"
            url = "jdbc:mysql://localhost/cinematest"
            driverClassName = "com.mysql.jdbc.Driver"
            dialect = org.hibernate.dialect.MySQL5InnoDBDialect
            username = "root"
            password = "nicolas"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			//url = "jdbc:hsqldb:file:prodDb;shutdown=true"
			url = "jdbc:mysql://ec2-50-17-107-213.compute-1.amazonaws.com/prodDb"
			driverClassName = "com.mysql.jdbc.Driver"
			dialect = org.hibernate.dialect.MySQL5InnoDBDialect
    		username = "app"
    		password = "nicolas"
//			"ec2-50-17-107-213.compute-1.amazonaws.com"
		}
	}
}
