<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!-- TODO  实际使用时把com.zc.auto替换成自己用的包-->
<mapper namespace="com.zc.auto.dao.{beanName}DAO">

    <insert id="save" parameterType="com.zc.auto.dos.{beanName}DO">
        insert into {tableName}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            {insertColumns}
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            {insertValues}
        </trim>
    </insert>

    <delete id="remove" parameterType="com.zc.auto.dos.{beanName}DO">
        delete from {tableName} where id = #{id}
    </delete>

    <delete id="removeById" parameterType="long">
        delete from {tableName} where id = #{id}
    </delete>

    <delete id="removeByIds">
        delete from {tableName} where id in
        <foreach item="id" collection="array" separator="," open="(" close=")">
            #{id}
        </foreach>
    </delete>

    <update id="update" parameterType="com.zc.auto.dos.{beanName}DO">
        update {tableName}
        <set>
            {setClause}
        </set>
        where id = #{id}
    </update>

    <update id="updateActiveStatus" parameterType="StatusQuery">
        update {tableName} set is_active = #{status} where id = #{id}
    </update>

    <sql id="select_columns">
        {selectColumns}
    </sql>

    <select id="getById" parameterType="long" resultType="com.zc.auto.dos.{beanName}DO">
        select
        <include refid="select_columns"/>
        from {tableName} where id = #{id}
    </select>

    <select id="listAll" resultType="com.zc.auto.dos.{beanName}DO">
        select
        <include refid="select_columns"/>
        from {tableName}
        order by update_time desc, create_time desc
    </select>

    <select id="listPage" parameterType="PageQuery" resultType="com.zc.auto.dos.{beanName}DO">
        select
        <include refid="select_columns"/>
        from {tableName}
        order by update_time desc, create_time desc
        limit #{pager.beginIndex}, #{pager.pageSize}
    </select>

    <select id="count" resultType="long">
        select count(*) from {tableName}
    </select>

    <sql id="where_clause">
        {whereClause}
    </sql>

    <select id="listPageByCondition" resultType="com.zc.auto.query.{beanName}Query">
        select
        <include refid="select_columns"/>
        from {tableName}
        <where>
            <include refid="where_clause"/>
        </where>
        order by created_time desc
        limit #{pager.beginIndex}, #{pager.pageSize}
    </select>

    <select id="countByCondition" parameterType="com.zc.auto.query.{beanName}Query" resultType="long">
        select count(*) from {tableName}
        <where>
            <include refid="where_clause"/>
        </where>
    </select>

</mapper>