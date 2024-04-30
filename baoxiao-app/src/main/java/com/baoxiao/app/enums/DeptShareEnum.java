package com.baoxiao.app.enums;

public enum DeptShareEnum {
    TYPE_0(0,"末分"),
    TYPE_1(1,"已分"),
    ;

    private final Integer key;

    private final String value;

    DeptShareEnum(Integer key, String value) {
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
