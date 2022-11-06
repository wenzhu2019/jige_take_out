package com.itecho.jige.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itecho.jige.common.R;
import com.itecho.jige.entity.Employee;
import com.itecho.jige.entity.JigeMemberCard;
import com.itecho.jige.entity.User;
import com.itecho.jige.service.JigeMemberCardService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.time.Duration;
import java.time.LocalDateTime;

/**
 * ClassName: MemberCardController
 * Description:
 *
 * @author liangwenzhu
 * @date 2022/11/6 0:47
 */
@Slf4j
@RestController
@RequestMapping("/membercard")
public class JigeMemberCardController {
    @Autowired
    private JigeMemberCardService service;

    @PostMapping("/page")
    public R<Page> page(HttpServletRequest request,@RequestBody JigeMemberCard jigeMemberCard ){

        //分页信息封装到实体类中 但是不做数据库字段映射 方便传参 直接封到实体类中
        int page =jigeMemberCard.getPage();
        int pageSize =jigeMemberCard.getPageSize();
        log.info("page ={},pageSize={}",page,pageSize);
        //分页构造器
        Page pageInfo=new Page<>(page,pageSize);
        //条件构造器

        LambdaQueryWrapper<JigeMemberCard> queryWrapper=new LambdaQueryWrapper<>();
        //设置条件
        //会员卡结束日期是否大于当前日期
        Duration duration = Duration.between(LocalDateTime.now(),jigeMemberCard.getEndtime());
        long days = duration.toDays();
        //链式 根据传入条件查询 指定会员（为空查全部）会员等级大于0 有效期内的会员卡
        queryWrapper.like(StringUtils.isNotEmpty(jigeMemberCard.getCardName()),JigeMemberCard::getCardName,jigeMemberCard.getCardName())
                .eq(jigeMemberCard.getMemberLevel()!=null &&jigeMemberCard.getMemberLevel()>0,JigeMemberCard::getMemberLevel,jigeMemberCard.getMemberLevel())
                .ge(days>0,JigeMemberCard::getEndtime,jigeMemberCard.getEndtime());

        service.page(pageInfo,queryWrapper);
        return R.success(pageInfo);
    }
}
