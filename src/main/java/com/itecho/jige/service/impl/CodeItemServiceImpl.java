package com.itecho.jige.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itecho.jige.entity.CodeItem;
import com.itecho.jige.mapper.CodeItemMapper;
import com.itecho.jige.service.CodeItemService;
import org.springframework.stereotype.Service;

/**
 * ClassName: CodeItemServiceImpl
 * Description:码值映射功能实现
 *
 * @author liangwenzhu
 * @date 2022/11/25 0:55
 */
@Service
public class CodeItemServiceImpl extends ServiceImpl<CodeItemMapper, CodeItem> implements CodeItemService {

}
