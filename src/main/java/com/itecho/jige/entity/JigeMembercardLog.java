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
@ApiModel(value="JigeMembercardLog对象", description="")
public class JigeMembercardLog extends Model<JigeMembercardLog> {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "guid主键")
    private String id;

    @ApiModelProperty(value = "来源任务ID 如：用户会员卡ID   ")
    private String taskId;

    @ApiModelProperty(value = "关联用户ID")
    private String userId;

    @ApiModelProperty(value = "来源类型 如 产品，优惠券")
    private Integer refType;

    @ApiModelProperty(value = "来源ID")
    private String refId;

    @ApiModelProperty(value = "领取数量")
    private Integer getCount;

    @ApiModelProperty(value = "备注")
    private String remark;

    @ApiModelProperty(value = "添加日期")
    private Date addtime;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
