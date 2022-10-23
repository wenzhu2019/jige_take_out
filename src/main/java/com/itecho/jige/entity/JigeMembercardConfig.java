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
@ApiModel(value="JigeMembercardConfig对象", description="")
public class JigeMembercardConfig extends Model<JigeMembercardConfig> {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "guid主键")
    private String id;

    @ApiModelProperty(value = "关联会员卡ID")
    private String mcardId;

    @ApiModelProperty(value = "关联类型")
    private Integer refType;

    @ApiModelProperty(value = "关联ID")
    private String refId;

    @ApiModelProperty(value = "图片地址")
    private String imgUrl;

    @ApiModelProperty(value = "数量")
    private Integer count;

    @ApiModelProperty(value = "间隔天数")
    private Integer timeInterval;

    @ApiModelProperty(value = "有效天数")
    private Integer validTime;

    @ApiModelProperty(value = "JSON备注")
    private String jsonRemark;

    @ApiModelProperty(value = "状态")
    private Boolean state;

    @ApiModelProperty(value = "添加时间")
    private Date addtime;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
