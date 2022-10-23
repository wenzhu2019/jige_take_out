package com.itecho.jige.dto;

import com.itecho.jige.entity.Setmeal;
import com.itecho.jige.entity.SetmealDish;
import lombok.Data;
import java.util.List;

@Data
public class SetmealDto extends Setmeal {

    private List<SetmealDish> setmealDishes;

    private String categoryName;
}
