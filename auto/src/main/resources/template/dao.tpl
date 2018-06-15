package com.zc.auto.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.zc.auto.query.PageQuery;
import java.util.List;

/**
 * {beanName}DAO数据访问接口<br/>
 *
 * 创建于{createDate}<br/>
 *
 * @author {author}
 * @version 1.0
 */
@Repository
public interface {beanName}DAO extends BaseDAO {

    @Override
    List<Object> listPageByCondition(@Param("pager") PageQuery pageQuery, @Param("query") Object queryObj);

    @Override
    Long countByCondition(@Param("query") Object queryObj);
}