package com.baoxiao.app.enums;

public enum AuditTypeEnum {
    TYPE_0(0,"未审批"),
    TYPE_1(1,"同意"),
    TYPE_2(2,"驳回"),
    TYPE_3(0,"审批节点"),
    TYPE_4(1,"当前节点"),
    TYPE_5(2,"已审批节点")
    ;

    private final Integer key;

    private final String value;

    AuditTypeEnum(Integer key, String value) {
        this.key = key;
        this.value = value;
    }

    public Integer getKey() {
        return key;
    }

    public String getValue() {
        return value;
    }

    public static AuditTypeEnum getByCode(Integer code) {
        for (AuditTypeEnum optionTypeEnum : values()) {
            if (optionTypeEnum.getKey().equals(code)) {
                return optionTypeEnum;
            }
        }
        return null;
    }

}
