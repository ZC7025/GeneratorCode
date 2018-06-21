package com.zc;

import com.zc.gener.common.CodeGenerator;
import com.zc.gener.common.JDBCUtils;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class AutoApplication {

	public static void main(String[] args) {
		CodeGenerator.generateCodes(JDBCUtils.MYSQL_DRIVER, "jdbc:mysql://localhost:3306/d_cash", "root", "123456");
//		SpringApplication.run(AutoApplication.class, args);
	}
}
