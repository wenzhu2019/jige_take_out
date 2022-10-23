package com.itecho.jige.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itecho.jige.dto.MenuInfoDto;
import com.itecho.jige.entity.MenuInfo;
import com.itecho.jige.mapper.MenuInfoMapper;
import com.itecho.jige.service.MenuInfoService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * ClassName: MenuInfoServiceImpl
 * Description:
 *
 * @author liangwenzhu
 * @date 2022/10/23 3:59
 */
@Slf4j
@Service
public class MenuInfoServiceImpl extends ServiceImpl<MenuInfoMapper, MenuInfo> implements MenuInfoService {
    @Autowired
    private MenuInfoService menuService;
    @Override
    public List<MenuInfoDto> getmenuList(String userId) {
        QueryWrapper<MenuInfo> wrapper=new QueryWrapper<>();
        //取出一级菜单
        wrapper.eq("parent_menu","0");
        List<MenuInfoDto> menuInfoDtoList=new ArrayList<>();
        List<MenuInfo> menuInfoList = menuService.list(wrapper);
        for (MenuInfo menu:menuInfoList){
            System.out.println(menu);
            MenuInfoDto menuInfoDto2=new MenuInfoDto();
            menuInfoDto2.setMenuid(menu.getMenuid());
            menuInfoDto2.setMenuName(menu.getMenuName());
            //获取二级菜单
            wrapper.clear();
            wrapper.eq("parent_menu",menu.getMenuid());
            List<MenuInfo> nextMenuList = menuService.list(wrapper);
            List<MenuInfoDto> menuInfoDtoList3=new ArrayList<>();
            for (MenuInfo finMenu:nextMenuList
            ) {
                wrapper.clear();
                MenuInfoDto menuInfoDto3=new MenuInfoDto();
                //获取三级菜单
                wrapper.eq("parent_menu",finMenu.getMenuid());
                List<MenuInfo> finalMenuList = menuService.list(wrapper);
                menuInfoDto3.setMenuid(finMenu.getMenuid());
                menuInfoDto3.setMenuName(finMenu.getMenuName());
                menuInfoDto3.setNextMenu(finalMenuList);
                menuInfoDtoList3.add(menuInfoDto3);
            }
            menuInfoDto2.setNextMenuDto(menuInfoDtoList3);
            menuInfoDtoList.add(menuInfoDto2);
        }
        for (MenuInfoDto mdto:menuInfoDtoList
        ) {
            log.info(mdto.toString());
        }

        return menuInfoDtoList;
    }
}
