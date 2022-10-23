package com.itecho.jige.controller;

import com.itecho.jige.common.R;
import com.itecho.jige.dto.MenuInfoDto;
import com.itecho.jige.service.MenuInfoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * ClassName: MenuInfoController
 * Description:
 *
 * @author liangwenzhu
 * @date 2022/10/23 13:55
 */
@Slf4j
@RestController
@RequestMapping("/menu")
public class MenuInfoController {
    @Autowired
    private MenuInfoService menuService;

    /**
     * @Author liangwenzhu
     * @Description //TODO
     * @Date 14:26 2022/10/23
     * @Param
     * @return
     * @return com.itecho.jige.common.R<java.util.List<com.itecho.jige.dto.MenuInfoDto>>
     **/
    @RequestMapping("/getMenuList")
    public R<List<MenuInfoDto>> getMenuList(){
        List<MenuInfoDto> menuInfoDtos = menuService.getmenuList("1");
        return R.success(menuInfoDtos);
    }
}
