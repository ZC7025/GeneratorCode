package com.zc.gener.common;

import com.zc.bean.ColumnDetail;
import com.zc.bean.TableColumns;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * JDBC元数据工具类<br/>
 *
 * 创建于2018-03-12<br/>
 *
 * @author 王振宇
 * @version 1.0
 */
public class JDBCUtils {

    public static final String MYSQL_DRIVER = "com.mysql.jdbc.Driver";

    private Connection connection;

    /**
     * 连接数据库
     * @param driverClassName 驱动程序
     * @param url 连接url
     * @param username 用户名
     * @param password 密码
     */
    public void connect(String driverClassName, String url, String username, String password) {
        try {
            Class.forName(driverClassName);
            this.connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取所有表的表名和字段信息
     * @return 表的表名和字段信息组成的对象的List集合
     */
    public List<TableColumns> getTableColumns() {
        List<TableColumns> tableColumnsList = new ArrayList<>();
        try {
            DatabaseMetaData metaData = connection.getMetaData();
            ResultSet tableResultSet = metaData.getTables(null, null, null, new String[] {"TABLE"});
            while (tableResultSet.next()) {
                TableColumns tableColumns = new TableColumns();
                tableColumns.setTableName(tableResultSet.getString("TABLE_NAME"));
                ResultSet columnResultSet = metaData.getColumns(null, getSchema(), tableColumns.getTableName(), "%");
                List<ColumnDetail> columnDetails = new ArrayList<>();
                while (columnResultSet.next()) {
                    ColumnDetail columnDetail = new ColumnDetail();
                    columnDetail.setName(columnResultSet.getString("COLUMN_NAME"));
                    columnDetail.setType(columnResultSet.getInt("DATA_TYPE"));
                    columnDetail.setJdbcTypeName(columnResultSet.getString("TYPE_NAME"));
                    columnDetail.setJavaTypeName(getJavaType(columnDetail.getJdbcTypeName()));
                    columnDetail.setComment(columnResultSet.getString("REMARKS"));
                    columnDetails.add(columnDetail);
                }
                tableColumns.setColumns(columnDetails);
                tableColumnsList.add(tableColumns);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tableColumnsList;
    }

    /**
     * 获取所有表的表名称
     * @return 所有表的表名称组成的List集合
     */
    public List<String> getTableNames() {
        List<String> tableNames = new ArrayList<>();
        try {
            DatabaseMetaData metaData = connection.getMetaData();
            ResultSet tableResultSet = metaData.getTables(null, null, null, new String[] {"TABLE"});
            while (tableResultSet.next()) {
                tableNames.add(tableResultSet.getString("TABLE_NAME"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tableNames;
    }

    /**
     * 从指定的数据表获取所有的列
     * @param table 表名
     * @return 表的字段封装的信息
     */
    public List<ColumnDetail> getColumnsFromTable(String table) {
        List<ColumnDetail> columnDetails = new ArrayList<>();
        try {
            DatabaseMetaData metaData = connection.getMetaData();
            ResultSet rs = metaData.getColumns(null, getSchema(), table, "%");
            while (rs.next()) {
                ColumnDetail columnDetail = new ColumnDetail();
                columnDetail.setName(rs.getString("COLUMN_NAME"));
                columnDetail.setType(rs.getInt("DATA_TYPE"));
                columnDetail.setJdbcTypeName(rs.getString("TYPE_NAME"));
                columnDetail.setJavaTypeName(getJavaType(columnDetail.getJdbcTypeName()));
                columnDetail.setComment(rs.getString("REMARKS"));
                columnDetails.add(columnDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return columnDetails;
    }

    /**
     * 获取schema
     * @return schema
     */
    public String getSchema() {
        try {
            return connection.getMetaData().getUserName();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 获取字段对应的Java类型的名称
     * @param jdbcType
     * @return
     */
    public String getJavaType(String jdbcType) {
        switch(jdbcType){
            case "VARCHAR":
            case "VARCHAR2":
            case "CHAR":
            case "TEXT":
                return "String";
            case "NUMBER":
            case "DECIMAL":
                return "BigDecimal";
            case "INT":
            case "INTEGER":
                return "Integer";
            case "SMALLINT":
                return "Short";
            case "TINYINT":
                return "Byte";
            case "BIGINT":
                return "Long";
            case "DOUBLE":
                return "Double";
            case "FLOAT":
                return "Float";
            case "DATETIME":
            case "TIMESTAMP":
            case "DATE":
            case "TIME":
            case "YEAR":
                return "Date";
            default:
                return "String";
        }
    }

}
