package com.pamf.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NameClassPair;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

public class DBUtil
{

    protected static Logger logger = Logger.getLogger(DBUtil.class);

    private static DBUtil dbUtil = null;

    private static Map<String, DataSource> dataSourceMap = null;

    private static String defaultDataSourceName = "local";

    private DBUtil()
    {
        dataSourceMap = new HashMap<String, DataSource>();
        try
        {
            Context initContext = new InitialContext();
            Context envContext = (Context)initContext.lookup("java:/comp/env");
            Context pamfContext = (Context)envContext.lookup("pamf");

            NamingEnumeration<NameClassPair> ds = envContext.list("pamf");
            while (ds.hasMore())
            {
                NameClassPair ncp = ds.nextElement();
                DataSource d = (DataSource)pamfContext.lookup(ncp.getName());
                dataSourceMap.put(ncp.getName(), d);
            }
        }
        catch (NamingException nE)
        {
            logger.error("Error creating datasource ", nE);
        }

    }

    public static DBUtil getInstance()
    {
        if (dbUtil == null)
        {
            dbUtil = new DBUtil();
        }
        return dbUtil;
    }

    public Connection getConnection()
    {
        Connection connection = null;
        try
        {
            connection = dataSourceMap.get(defaultDataSourceName).getConnection();
        }
        catch (SQLException sqlE)
        {
            logger.error("SQLException getting database connection ", sqlE);
        }
        return connection;
    }

    public Connection getConnection(String dataSourceName)
    {
        Connection connection = null;
        dataSourceName = (dataSourceName == null || dataSourceName.isEmpty()) ? defaultDataSourceName : dataSourceName;
        try
        {
            connection = dataSourceMap.get(dataSourceName).getConnection();
        }
        catch (SQLException sqlE)
        {
            logger.error("SQLException getting database connection ", sqlE);
        }
        return connection;

    }

    public static void closeConnection(Statement statement, ResultSet rs, Connection connection)
    {
        try
        {
            if (rs != null)
            {
                rs.close();
            }
            if (statement != null)
            {
                statement.close();
            }
            if (connection != null)
            {
                connection.close();
            }
        }
        catch (SQLException sqlE)
        {
            logger.error("Error occured while closing ResultSet/Statement/Connection ", sqlE);
        }
    }
}
