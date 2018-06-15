package com.zc.gener.common;

import com.zc.bean.TableColumns;
import com.zc.common.DateFormatUtils;
import com.zc.constant.GeneratorConstants;
import com.zc.constant.TemplateConstants;
import com.zc.auto.enums.DatePatternEnum;

import java.util.Calendar;
import java.util.List;

/**
 * DAO自动生成代码封装类<br/>
 *
 * 创建于2018-03-12<br/>
 *
 * @author 王振宇
 * @version 1.0
 */
public class DAOGenerator {

    /**
     * 生成DAO接口
     * @param tableColumns 表数据
     */
    public static void generateDAO(TableColumns tableColumns) {
        String beanName = GeneratorUtils.tableNameToClassName(tableColumns.getTableName(), "t");
        String packagePath = GeneratorUtils.createPackage(GeneratorConstants.DAO_PACKAGE);
        String fileContent = GeneratorUtils.readTemplate(GeneratorConstants.DAO_TEMPLATE);
        fileContent = fileContent.replace(TemplateConstants.CREATE_DATE,
                DateFormatUtils.format(Calendar.getInstance(), DatePatternEnum.DATE.getValue()))
                .replace(TemplateConstants.AUTHOR, GeneratorConstants.AUTHOR)
                .replace(TemplateConstants.BEAN_NAME, beanName);
        GeneratorUtils.writeFile(fileContent, packagePath, beanName + GeneratorConstants.DAO_JAVA_SUFFIX);
    }

    /**
     * 生成所有DAO接口
     * @param tableColumnsList 所有表数据
     */
    public static void generateDAOs(List<TableColumns> tableColumnsList) {
        for (TableColumns tableColumns : tableColumnsList) {
            generateDAO(tableColumns);
        }
    }

}
