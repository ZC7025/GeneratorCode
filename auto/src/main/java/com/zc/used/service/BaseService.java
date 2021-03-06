package com.zc.used.service;

import com.zc.auto.dto.PagerDTO;
import com.zc.auto.query.PageQuery;
import com.zc.auto.query.StatusQuery;

import java.io.Serializable;
import java.util.List;

/**
 * Service接口，定义了常用的Service方法，实现业务逻辑操作并调用DAO<br />
 * 由Controller调用Service时，需要传递DTO对象进行，并返回DTO对象到Controller<br />
 * 创建于2017-08-24
 *
 * @author 王振宇
 * @version 1.0
 */
public interface BaseService {

    /**
     * 添加数据到数据库中
     * @param dataTransferObj DTO数据传输对象
     */
    void save(Object dataTransferObj);

    /**
     * 根据DTO实体类从数据库中删除数据
     * @param dataTransferObj DTO数据传输对象
     */
    void remove(Object dataTransferObj);

    /**
     * 根据主键从数据库中删除数据
     * @param id 主键ID
     */
    void removeById(Serializable id);

    /**
     * 根据多个主键批量删除数据
     * @param ids 多个主键组成的数组
     */
    void removeByIds(Serializable[] ids);

    /**
     * 根据对象更新数据库中的数据
     * @param dataTransferObj DTO数据传输对象
     */
    void update(Object dataTransferObj);

    /**
     * 根据StatusQuery查询对象更新is_active状态值
     * @param statusQuery 状态查询对象，包括id和status
     */
    void updateActiveStatus(StatusQuery statusQuery);

    /**
     * 根据主键id查找数据
     * @param id 主键字段值
     * @return DTO数据传输对象
     */
    Object getById(Serializable id);

    /**
     * 查找所有记录数据
     * @return DTO数据传输对象组成的List列表
     */
    List<Object> listAll();

    /**
     * 根据PageQuery分页查询对象分页查找记录数据
     * @param pageQuery 分页查询对象
     * @return 分页数据DTO对象所组成的List列表
     */
    PagerDTO listPage(PageQuery pageQuery);

    /**
     * 根据分页查询对象和条件查询对象查找数据
     * @param pageQuery 分页查询对象
     * @param queryObj 条件查询对象
     * @return 按照条件的分页数据DTO对象所组成的List列表
     */
    PagerDTO listPageByCondition(PageQuery pageQuery, Object queryObj);

}
