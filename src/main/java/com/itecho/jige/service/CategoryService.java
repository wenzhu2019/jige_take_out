package com.itecho.jige.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itecho.jige.entity.Category;

public interface CategoryService extends IService<Category> {

    public void remove(Long id);

}
