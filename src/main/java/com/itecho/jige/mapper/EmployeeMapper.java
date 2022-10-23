package com.itecho.jige.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.itecho.jige.entity.Employee;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeMapper extends BaseMapper<Employee>{
}
