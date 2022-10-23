package com.itecho.jige.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.itecho.jige.entity.Orders;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper extends BaseMapper<Orders> {

}