package com.itecho.jige.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itecho.jige.common.R;
import com.itecho.jige.entity.Orders;
import com.itecho.jige.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 订单
 */
@Slf4j
@RestController
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Value("${jige.page}")
    private int page;
    @Value("${jige.pageSize}")
    private int pageSize;

    /**
     * 用户下单
     * @param orders
     * @return
     */
    @PostMapping("/submit")
    public R<String> submit(@RequestBody Orders orders){
        log.info("订单数据：{}",orders);
        orderService.submit(orders);
        return R.success("下单成功");
    }
    @RequestMapping("/page")
    public R<Page> page(){
        //分页构造器 设置分页信息
        Page<Orders> orderPage=new Page<>(page,pageSize);
        //条件构造器
        LambdaQueryWrapper<Orders> queryWrapper=new LambdaQueryWrapper<>();
        //设置条件和排序
        queryWrapper.orderByAsc(Orders::getCheckoutTime);
        //分页查询
        orderService.page(orderPage,queryWrapper);
        return R.success(orderPage);
    }
}