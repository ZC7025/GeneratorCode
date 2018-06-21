package com.zc.auto.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.annotation.PostConstruct;

import com.zc.auto.dao.{beanName}DAO;
import com.zc.auto.dos.{beanName}DO;
import com.zc.auto.dto.{beanName}DTO;
import com.zc.auto.service.{beanName}Service;

import com.zc.auto.service.AbstractBaseService;


/**
 * {beanName}ServiceImpl服务接口实现类<br/>
 *
 * 创建于{createDate}<br/>
 *
 * @author {author}
 * @version 1.0
 */
@Service(value = "{beanNameLowerCase}Service")
public class {beanName}ServiceImpl extends AbstractBaseService implements {beanName}Service {

    private {beanName}DAO {beanNameLowerCase}DAO;

    @Autowired
    public void set{beanName}DAO({beanName}DAO {beanNameLowerCase}DAO) {
        super.setBaseDAO({beanNameLowerCase}DAO);
        this.{beanNameLowerCase}DAO = {beanNameLowerCase}DAO;
    }

    @PostConstruct
    public void init() {
        super.init({beanName}DO.class, {beanName}DTO.class);
    }
}
