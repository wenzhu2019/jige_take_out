package com.itecho.jige.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itecho.jige.common.R;
import com.itecho.jige.entity.JigeMemberCard;
import com.itecho.jige.mapper.JigeMemberCardMapper;
import com.itecho.jige.service.JigeMemberCardService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.LocalDateTime;

/**
 * ClassName: JigeMemberCard
 * Description:
 *
 * @author liangwenzhu
 * @date 2022/10/31 23:47
 */
@Service
public class JigeMemberCardServiceImpl extends ServiceImpl<JigeMemberCardMapper, JigeMemberCard> implements JigeMemberCardService {

    @Autowired
    private JigeMemberCardMapper mapper;
    @Override
    public R<Page> getPage(int page,int pageSize,JigeMemberCard jigeMemberCard) {
        //分页构造器
        Page pageInfo=new Page<>(page,pageSize);
        //条件构造器
        LambdaQueryWrapper<JigeMemberCard> queryWrapper=new LambdaQueryWrapper<>();
        //设置条件
        //会员卡结束日期是否大于
        Duration duration = Duration.between(LocalDateTime.now(),jigeMemberCard.getEndtime());
        long days = duration.toDays();
        queryWrapper.like(StringUtils.isNotEmpty(jigeMemberCard.getCardName()),JigeMemberCard::getCardName,jigeMemberCard.getCardName())
                .eq(jigeMemberCard.getMemberLevel()>0,JigeMemberCard::getMemberLevel,jigeMemberCard.getMemberLevel())
                .ge(days>0,JigeMemberCard::getEndtime,jigeMemberCard.getEndtime());

        //.page(pageInfo,queryWrapper);


        return R.success(pageInfo);
    }
}
