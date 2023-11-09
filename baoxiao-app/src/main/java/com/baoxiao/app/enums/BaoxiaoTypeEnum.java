package com.baoxiao.app.enums;

public enum BaoxiaoTypeEnum {
    TYPE_0(0,"普通类型"),
    TYPE_1(1,"好活"),
    TYPE_2(2,"合作单位报销"),
    TYPE_3(3,"合作单位转账"),
    TYPE_4(4,"雇主责任险"),
    TYPE_5(5,"内部资金调拨"),
    TYPE_6(6,"社保"),
    TYPE_7(7,"生育津贴返还"),
    TYPE_8(8,"工会费"),
    TYPE_9(9,"内部转账"),
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
}
