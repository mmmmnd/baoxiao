package com.baoxiao.app.enums;

public enum OrderStatusEnum {
    status_0(0,""),
    status_1(1,"冲借款"),
    status_2(2,"部门分摊"),
    status_3(3,"已提交"),
    status_4(4,"正在审批"),
    status_5(5,"审批完毕"),
    status_6(6,"审批驳回"),

    ;

    private final Integer key;

    private final String value;

    OrderStatusEnum(Integer key, String value) {
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
