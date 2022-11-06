package com.itecho.jige.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itecho.jige.common.R;
import com.itecho.jige.entity.JigeMemberCard;

/**
 * ClassName: JigeMemberCard
 * Description:
 *会员卡信息接口
 * @author liangwenzhu
 * @date 2022/10/31 23:45
 */
public interface JigeMemberCardService extends IService<JigeMemberCard> {

    public R<Page> getPage(int page,int pageSize,JigeMemberCard jigeMemberCard);
}
