package com.itecho.jige.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itecho.jige.entity.User;
import com.itecho.jige.mapper.UserMapper;
import com.itecho.jige.service.UserService;
import org.springframework.stereotype.Service;
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper,User> implements UserService{
}
