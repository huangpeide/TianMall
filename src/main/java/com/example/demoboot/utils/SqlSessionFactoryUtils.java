package com.example.demoboot.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;

public class SqlSessionFactoryUtils {
    private static SqlSessionFactory sqlSessionFactory;
    private static SqlSessionFactoryUtils instace;

    public SqlSessionFactory getSqlSessionFactory() {
        if (sqlSessionFactory == null) {
            SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
            try {
                sqlSessionFactory = ssfb.build(Resources.getResourceAsStream("testmybatis_config.xml"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return sqlSessionFactory;
    }

    public static SqlSessionFactoryUtils getInstace() {
        if (instace == null) {
            instace = new SqlSessionFactoryUtils();
        }
        return instace;
    }

    private SqlSessionFactoryUtils() {
    }
}
