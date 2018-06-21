package com.zc.auto.controller;

import org.dozer.Mapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.zc.auto.dto.{beanName}DTO;
import com.zc.auto.query.{beanName}Query;
import com.zc.auto.service.{beanName}Service;
import com.zc.auto.vo.{beanName}VO;

import com.zc.auto.common.DozerMapperUtils;
import com.zc.auto.common.StringUtils;
import com.zc.auto.common.ServerResponse;
import com.zc.auto.vo.PagerVO;
import com.zc.auto.dto.PagerDTO;
import com.zc.auto.exception.ServiceException;
import com.zc.auto.query.PageQuery;
import com.zc.auto.query.StatusQuery;
import com.zc.auto.enums.ResultEnum;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * {beanName}Controller控制器类<br/>
 *
 * 创建于{createDate}<br/>
 *
 * @author {author}
 * @version 1.0
 */
@Controller
@RequestMapping("/{moduleName}")
public class {beanName}Controller extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger({beanName}Controller.class);

    private {beanName}Service {beanNameLowerCase}Service;

    @PostMapping("save")
    @ResponseBody
    public ServerResponse save({beanName}VO {beanNameLowerCase}VO) {
        ServerResponse serverResponse = {beanNameLowerCase}Service.save(getBeanMapper().map({beanNameLowerCase}VO, {beanName}DTO.class));
        if(serverResponse.getCode() == ResultEnum.SUCCESS.getCode()) {
            logger.info("添加成功：{}", {beanNameLowerCase}VO.toString());
            return serverResponse;
        }
        logger.error("添加失败：{}", {beanNameLowerCase}VO.toString());
        return serverResponse;
    }

    @PostMapping("remove")
    @ResponseBody
    public ServerResponse remove({beanName}VO {beanNameLowerCase}VO) {
        ServerResponse serverResponse = {beanNameLowerCase}Service.remove(getBeanMapper().map({beanNameLowerCase}VO, {beanName}DTO.class));
        if(serverResponse.getCode() == ResultEnum.SUCCESS.getCode()) {
            logger.info("删除成功：{}", {beanNameLowerCase}VO.toString());
            return serverResponse;
        }
        logger.error("删除失败：{}", {beanNameLowerCase}VO.toString());
        return serverResponse;
    }

    @GetMapping("remove/{id}")
    @ResponseBody
    public ServerResponse removeById(@PathVariable("id") Long id) {
        ServerResponse serverResponse = {beanNameLowerCase}Service.removeById(id);
        if(serverResponse.getCode() == ResultEnum.SUCCESS.getCode()) {
            logger.info("删除成功：{}", id);
            return serverResponse;
        }
        logger.error("删除失败：{}", id);
        return serverResponse;
    }

    @PostMapping("batch-remove")
    @ResponseBody
    public ServerResponse removeByIds(String ids) {
        ServerResponse serverResponse = {beanNameLowerCase}Service.removeByIds(StringUtils.strToLongArray(ids, ","));
        if(serverResponse.getCode() == ResultEnum.SUCCESS.getCode()) {
            logger.info("删除成功：{}", ids);
            return serverResponse;
        }
        logger.error("删除失败：{}", ids);
        return serverResponse;
    }

    @PostMapping("update")
    @ResponseBody
    public ServerResponse update({beanName}VO {beanNameLowerCase}VO) {
        ServerResponse serverResponse = {beanNameLowerCase}Service.update(getBeanMapper().map({beanNameLowerCase}VO, {beanName}DTO.class));
        if(serverResponse.getCode() == ResultEnum.SUCCESS.getCode()) {
            logger.info("修改成功：{}", {beanNameLowerCase}VO.toString());
            return serverResponse;
        }
        logger.error("修改失败：{}", {beanNameLowerCase}VO.toString());
        return serverResponse;
    }

    @PostMapping("active")
    @ResponseBody
    public ServerResponse updateActiveStatus(StatusQuery statusQuery) {
        ServerResponse serverResponse = {beanNameLowerCase}Service.updateActiveStatus(statusQuery);
        if(serverResponse.getCode() == ResultEnum.SUCCESS.getCode()) {
            logger.info("修改成功：{}", statusQuery.toString());
            return serverResponse;
        }
        logger.error("修改失败：{}", statusQuery.toString());
        return serverResponse;
    }

    @RequestMapping("one/{id}")
    @ResponseBody
    public {beanName}VO getById(@PathVariable("id") Long id) {
        {beanName}VO {beanNameLowerCase}VO = new {beanName}VO();
        try {
            Object obj = {beanNameLowerCase}Service.getById(id);
            if (obj != null) {
                {beanNameLowerCase}VO = getBeanMapper().map(obj, {beanName}VO.class);
            }
        } catch (ServiceException e) {
            logger.error("返回单个对象JSON数据失败：{}", e.getMessage());
        }
        return {beanNameLowerCase}VO;
    }

    @GetMapping("all")
    @ResponseBody
    public List<{beanName}VO> listAll() {
        List<{beanName}VO> {beanNameLowerCase}VOList = new ArrayList<>();
        try {
            List<Object> objectList = {beanNameLowerCase}Service.listAll();
            {beanNameLowerCase}VOList =  DozerMapperUtils.map(getBeanMapper(), objectList, {beanName}VO.class);
        } catch (ServiceException e) {
            logger.error("返回所有对象JSON数据失败：{}", e.getMessage());
        }
        return {beanNameLowerCase}VOList;
    }

    @PostMapping("page")
    @ResponseBody
    public PagerVO listPage(Integer page, Integer limit) {
        PageQuery pageQuery = new PageQuery(page, limit);
        PagerVO pagerVO = new PagerVO();
        try {
            PagerDTO pagerDTO = {beanNameLowerCase}Service.listPage(pageQuery);
            Mapper mapper = getBeanMapper();
            pagerVO = mapper.map(pagerDTO, PagerVO.class);
            pagerVO.setRows(DozerMapperUtils.mapList(mapper, pagerDTO.getRows(), {beanName}VO.class));
        } catch (ServiceException e) {
            logger.error("返回分页对象JSON数据失败：{}", e.getMessage());
        }
        return pagerVO;
    }

    @PostMapping("page-cond")
    @ResponseBody
    public PagerVO listPageByCondition(Integer page, Integer limit, {beanName}Query {beanNameLowerCase}Query) {
        PageQuery pageQuery = new PageQuery(page, limit);
        PagerVO pagerVO = new PagerVO();
        try {
            PagerDTO pagerDTO = {beanNameLowerCase}Service.listPageByCondition(pageQuery, {beanNameLowerCase}Query);
            Mapper mapper = getBeanMapper();
            pagerVO = mapper.map(pagerDTO, PagerVO.class);
            pagerVO.setRows(DozerMapperUtils.mapList(mapper, pagerDTO.getRows(), {beanName}Query.class));
        } catch (ServiceException e) {
            logger.error("返回指定条件的分页对象JSON数据失败：{}", e.getMessage());
        }
        return pagerVO;
    }

    @Resource
    public void set{beanName}Service({beanName}Service {beanNameLowerCase}Service) {
        this.{beanNameLowerCase}Service = {beanNameLowerCase}Service;
    }
}
