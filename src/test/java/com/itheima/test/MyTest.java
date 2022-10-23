package com.itheima.test;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.itecho.jige.JigeApplication;
import com.itecho.jige.dto.MenuInfoDto;
import com.itecho.jige.entity.Dish;
import com.itecho.jige.entity.MenuInfo;
import com.itecho.jige.entity.User;
import com.itecho.jige.mapper.DishMapper;
import com.itecho.jige.mapper.MenuInfoMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest(classes = JigeApplication.class)
public class MyTest {


    @Autowired
    private DishMapper mapper;
    @Autowired
    private MenuInfoMapper menumapper;
    @Test
    void test1(){
        UpdateWrapper<User> updateWrapper=new UpdateWrapper<>();
        updateWrapper.set("age",10).set("name","张三").eq("idnumber","451651");
        List<Dish> dishes = mapper.selectList(null);
        for (Dish dish:dishes){
            System.out.println(dish);
        }

    }
    @Test
    void test2(){
        QueryWrapper<MenuInfo> wrapper=new QueryWrapper<>();
        JSONObject menuList=new JSONObject();
        //取出一级菜单
        wrapper.eq("parent_menu","0");
        List<MenuInfoDto> menuInfoDtoList=new ArrayList<>();
        List<MenuInfo> menuInfoList = menumapper.selectList(wrapper);
        MenuInfoDto menuInfoDto=new MenuInfoDto();
        for (MenuInfo menu:menuInfoList){
            System.out.println(menu);
            MenuInfoDto menuInfoDto2=new MenuInfoDto();
            menuInfoDto2.setMenuid(menu.getMenuid());
            menuInfoDto2.setMenuName(menu.getMenuName());
            //获取二级菜单
            wrapper.clear();
            wrapper.eq("parent_menu",menu.getMenuid());
            List<MenuInfo> nextMenuList = menumapper.selectList(wrapper);
            List<MenuInfoDto> menuInfoDtoList3=new ArrayList<>();
            for (MenuInfo finMenu:nextMenuList
                 ) {
                wrapper.clear();
                MenuInfoDto menuInfoDto3=new MenuInfoDto();
                //获取三级菜单
                wrapper.eq("parent_menu",finMenu.getMenuid());
                List<MenuInfo> finalMenuList = menumapper.selectList(wrapper);
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
        
        menuList.put("menuList",menuInfoDtoList);
        log.info(menuList.toString());
    }
}
