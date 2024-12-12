package com.tist.jpa.dialect;

import org.hibernate.type.StringType;

import java.sql.Types;

public class MsSqlServerDbDialect extends MsSqlServerDialect{
    public MsSqlServerDbDialect(){
        super();
        registerHibernateType(Types.NVARCHAR, StringType.class.getName());
    }
}
