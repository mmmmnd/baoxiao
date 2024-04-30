package com.baoxiao.app.enums;

public enum OffsetLoanEnum {
    TYPE_0(0,"未冲"),
    TYPE_1(1,"已冲"),
    ;

    private final Integer key;

    private final String value;

    OffsetLoanEnum(Integer key, String value) {
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
