package com.itecho.jige.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.util.Date;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author wzliang
 * @since 2022-10-20
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="MenuInfo对象", description="")
public class MenuInfo extends Model<MenuInfo> implements Serializable{

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "菜单编号")
    private Integer menuid;

    @ApiModelProperty(value = "菜单名称")
    private String menuName;

    @JsonIgnore
    @ApiModelProperty(value = "是否使用")
    private Integer isuse;
    @JsonIgnore
    @ApiModelProperty(value = "菜单类型")
    private Integer menuType;
    @JsonIgnore
    private String attribute1;
    @JsonIgnore
    private String attribute2;
    @JsonIgnore
    private String attribute3;

    @ApiModelProperty(value = "描述")
    private String description;
    @JsonIgnore
    @ApiModelProperty(value = "录入时间")
    private Date inputDt;
    @JsonIgnore
    @ApiModelProperty(value = "录入用户")
    private String inputuser;
    @ApiModelProperty(value = "上级菜单")
    private String parentMenu;
    @ApiModelProperty(value = "菜单地址")
    private String url;


    @Override
    protected Serializable pkVal() {
        return this.menuid;
    }

}
