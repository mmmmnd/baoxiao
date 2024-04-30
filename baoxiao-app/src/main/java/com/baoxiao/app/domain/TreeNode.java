package com.baoxiao.app.domain;


import lombok.Data;

import java.util.List;

@Data
public class TreeNode{

    private Long id;

    private Long pid;

    private Integer sort;

    private List<?> children;
}

