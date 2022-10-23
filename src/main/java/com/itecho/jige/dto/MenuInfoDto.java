package com.itecho.jige.dto;

import com.itecho.jige.entity.MenuInfo;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class MenuInfoDto extends MenuInfo {
    //三级菜单
    private List<MenuInfo> nextMenu;
    //二级菜单
    private List<MenuInfoDto> nextMenuDto;
}
