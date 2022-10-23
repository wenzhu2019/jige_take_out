package com.itecho.jige.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itecho.jige.service.DishFlavorService;
import com.itecho.jige.entity.DishFlavor;
import com.itecho.jige.mapper.DishFlavorMapper;
import org.springframework.stereotype.Service;

@Service
public class DishFlavorServiceImpl extends ServiceImpl<DishFlavorMapper,DishFlavor> implements DishFlavorService {
}
