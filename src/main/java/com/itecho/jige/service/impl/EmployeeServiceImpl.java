package com.itecho.jige.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itecho.jige.entity.Employee;
import com.itecho.jige.mapper.EmployeeMapper;
import com.itecho.jige.service.EmployeeService;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper,Employee> implements EmployeeService{
}
