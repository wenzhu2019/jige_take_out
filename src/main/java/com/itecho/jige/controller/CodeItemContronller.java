package com.itecho.jige.controller;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import com.itecho.jige.common.R;
import com.itecho.jige.entity.CodeItem;
import com.itecho.jige.service.CodeItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

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
    public R<List<CodeItem>> code(@PathVariable String code){

        //码值获取
        CodeItem c=new CodeItem();
        c.setCode(code);
        //状态为有效的码值
        c.setIsuser(1);
        LambdaQueryWrapper<CodeItem> codeWrapper=new LambdaQueryWrapper<>();
        codeWrapper.eq(CodeItem::getCode, code);
        List<CodeItem> codeItems = service.list(codeWrapper);
        return R.success(codeItems);
    }
}
