package com.itecho.jige.controller;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.TableFieldInfo;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import com.itecho.jige.common.R;
import com.itecho.jige.entity.CodeItem;
import com.itecho.jige.mapper.CodeItemMapper;
import com.itecho.jige.service.CodeItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiConsumer;
import java.util.function.Consumer;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * ClassName: CodeItemContronller
 * Description:
 *
 * @author liangwenzhu
 * @date 2022/11/25 0:59
 */
@Slf4j
@RestController
@RequestMapping("/Code")
public class CodeItemContronller {
    @Autowired
    CodeItemService service;
    @Autowired
    CodeItemMapper mapper;
    /**
     * @Author liangwenzhu
     * @Description 下拉框、多选框等码值映射 通过get请求传入所需码值
     * @Date 1:35 2022/11/25
     * @Param
     * @param code
     * @return
     * @return com.itecho.jige.common.R<java.util.List<com.itecho.jige.entity.CodeItem>>
     **/
    @GetMapping("/{code}")
    public R<List> code(@PathVariable String code){

        //码值获取
        CodeItem c=new CodeItem();
        c.setCode(code);
        //状态为有效的码值
        c.setIsuser(1);
       LambdaQueryWrapper<CodeItem> codeWrapper=new LambdaQueryWrapper<>();
        codeWrapper.eq(CodeItem::getCode, code);
        List<CodeItem> codeItems = service.list(codeWrapper);
        Map<String, String> codeMap = codeItems.stream().collect(Collectors.toMap(CodeItem::getItem, CodeItem::getItemName));
        return R.success(codeItems);
    }
}
