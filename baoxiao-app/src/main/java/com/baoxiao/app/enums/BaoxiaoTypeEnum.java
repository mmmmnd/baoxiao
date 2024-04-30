package com.baoxiao.app.enums;

public enum BaoxiaoTypeEnum {

    TYPE_0(0,"报销单"),
    TYPE_1(1,"差旅费报销单"),
    TYPE_2(2,"借款"),
    TYPE_3(3,"保证金"),
    TYPE_4(4,"调整单据"),
    TYPE_5(5,"付款申请"),
    ;

    private final Integer key;

    private final String value;

    BaoxiaoTypeEnum(Integer key, String value) {
        this.key = key;
        this.value = value;
    }

    public Integer getKey() {
        return key;
    }

    public String getValue() {
        return value;
    }

    public static BaoxiaoTypeEnum fromKey(Integer key) {
        for (BaoxiaoTypeEnum type : BaoxiaoTypeEnum.values()) {
            if (type.key.equals(key)){
                return type;
            }
        }

        throw new IllegalArgumentException("Invalid BaoxiaoTypeEnum key: " + key);
    }

}
