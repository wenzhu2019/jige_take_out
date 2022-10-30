package com.itecho.jige.utils;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.itecho.jige.entity.Employee;
import com.itecho.jige.service.EmployeeService;
import org.apache.catalina.valves.rewrite.InternalRewriteMap;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * ClassName: AccountGenerator
 * Description:
 *获取时间戳生成账号工具类
 * @author liangwenzhu
 * @date 2022/10/30 23:21
 */
public class AccountGenerator {

    @Autowired
    private static EmployeeService employeeService;
    public static String toHex(){
        return Integer.toHexString((int)new Date().getTime());
    }
    public static String account(){
        Employee employee=new Employee();
        QueryWrapper<Employee> queryWrapper=new QueryWrapper<>();
        queryWrapper.select("select max(employee_id) as employee_id");
        employee= employeeService.getOne(queryWrapper);
        return "";
    }


}
