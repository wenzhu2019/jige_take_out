package com.itecho.jige.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.time.LocalDateTime;
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
@ApiModel(value="JigeMemberCard对象", description="")
public class JigeMemberCard extends Model<JigeMemberCard> implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId
    @ApiModelProperty(value = "guid主键")
    private String id;

    @ApiModelProperty(value = "站点")
    private Integer siteId;

    @ApiModelProperty(value = "会员级别")
    private Integer memberLevel;

    @ApiModelProperty(value = "默认图片")
    private String cardImage;

    @ApiModelProperty(value = "会员卡金额")
    private Long cardAmount;

    @ApiModelProperty(value = "会员卡名称")
    private String cardName;

    @ApiModelProperty(value = "会员卡副标题")
    private String cardSubtitle;

    @ApiModelProperty(value = "有效时长单位，周，月，季，年")
    private Integer validTimeUnit;

    @ApiModelProperty(value = "有效时长(周期)，表示几周，几个月")
    private Integer validTime;

    @ApiModelProperty(value = "有效期开始日期")
    private LocalDateTime starttime;

    @ApiModelProperty(value = "有效期结束日期")
    private LocalDateTime endtime;

    @ApiModelProperty(value = "JSON备注")
    private String jsonRemark;

    @ApiModelProperty(value = "会员卡使用说明")
    private String cardExplain;

    @ApiModelProperty(value = "备注")
    private String remark;

    @ApiModelProperty(value = "状态")
    private Integer state;

    @ApiModelProperty(value = "添加日期")
    private LocalDateTime addtime;

    //@TableField(exist = false)实体类需要用到 数据库不做映射
    @TableField(exist = false)
    private int page;
    @TableField(exist = false)
    private int pageSize;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
