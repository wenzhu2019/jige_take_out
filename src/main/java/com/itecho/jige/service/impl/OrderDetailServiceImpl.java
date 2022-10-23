package com.itecho.jige.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itecho.jige.entity.OrderDetail;
import com.itecho.jige.mapper.OrderDetailMapper;
import com.itecho.jige.service.OrderDetailService;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailServiceImpl extends ServiceImpl<OrderDetailMapper, OrderDetail> implements OrderDetailService {

}