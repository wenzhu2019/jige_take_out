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
@ApiModel(value="JigeMembercardUserCoupons对象", description="")
public class JigeMembercardUserCoupons extends Model<JigeMembercardUserCoupons> {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "主键")
    private String id;

    @ApiModelProperty(value = "会员卡id")
    private String mcardId;

    @ApiModelProperty(value = "优惠券id")
    private String couponId;

    @ApiModelProperty(value = "用户id")
    private String uid;

    @ApiModelProperty(value = "数量")
    private Integer count;

    @ApiModelProperty(value = "优惠券状态99未领取，100已领取，110已失效")
    private Integer status;

    @ApiModelProperty(value = "批次")
    private Integer batchnum;

    @ApiModelProperty(value = "有效天数")
    private Integer validDays;

    @ApiModelProperty(value = "领取时间")
    private Date gettime;

    @ApiModelProperty(value = "有效开始时间")
    private Date starttime;

    @ApiModelProperty(value = "有效结束时间")
    private Date endtime;

    @ApiModelProperty(value = "创建时间")
    private Date addtime;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
