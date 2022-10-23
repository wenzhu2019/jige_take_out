package com.itecho.jige.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itecho.jige.dto.MenuInfoDto;
import com.itecho.jige.entity.MenuInfo;
import org.springframework.stereotype.Service;

import java.util.List;

public interface MenuInfoService extends IService<MenuInfo> {

    List<MenuInfoDto> getmenuList(String userId);
}
