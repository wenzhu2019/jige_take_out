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
@ApiModel(value="JigeMembercardUser对象", description="")
public class JigeMembercardUser extends Model<JigeMembercardUser> {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "guid主键")
    private String id;

    @ApiModelProperty(value = "关联会员卡ID")
    private String mcardId;

    @ApiModelProperty(value = "会员卡编号")
    private String cardNum;

    @ApiModelProperty(value = "用户ID")
    private String userId;

    @ApiModelProperty(value = "有效期开始日期")
    private Date starttime;

    @ApiModelProperty(value = "有效期结束日期")
    private Date endtime;

    @ApiModelProperty(value = "关联订单id")
    private String refOrderId;

    @ApiModelProperty(value = "关联订单号")
    private String refOrderCode;

    @ApiModelProperty(value = "JSON备注")
    private String jsonRemark;

    @ApiModelProperty(value = "会员卡状态")
    private Integer status;

    @ApiModelProperty(value = "添加日期")
    private Date addtime;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
