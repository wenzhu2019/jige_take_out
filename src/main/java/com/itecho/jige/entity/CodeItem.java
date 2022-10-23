package com.itecho.jige.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.util.Date;
import java.io.Serializable;
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
@ApiModel(value="CodeItem对象", description="")
public class CodeItem extends Model<CodeItem> {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "代码")
    private String code;

    @ApiModelProperty(value = "代码名称")
    private String codeName;

    @ApiModelProperty(value = "代码值")
    private String item;

    @ApiModelProperty(value = "代码中文")
    private String itemName;

    @ApiModelProperty(value = "是否使用标志(1可用 2不可用)")
    private Integer isuser;

    @ApiModelProperty(value = "描述")
    private String description;

    @ApiModelProperty(value = "录入日期")
    private Date inputdate;

    @ApiModelProperty(value = "录入人")
    private String inputuser;

    @ApiModelProperty(value = "修改时间")
    private Date updateDt;

    @ApiModelProperty(value = "修改人")
    private String updateUser;


    @Override
    protected Serializable pkVal() {
        return null;
    }

}
