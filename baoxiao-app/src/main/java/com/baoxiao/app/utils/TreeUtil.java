package com.baoxiao.app.utils;

import com.baoxiao.app.domain.TreeNode;
import lombok.experimental.UtilityClass;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@UtilityClass
public class TreeUtil {

    public static <T extends TreeNode> List<T> getTreeMenu(List<T> list, Long pid) {
        List<T> listTree = findChild(list, pid);

        listTree.forEach(tree -> {
            List<T> vo = getTreeMenu(list, tree.getId());
            tree.setChildren(vo.isEmpty() ? null : vo);
        });

        return listTree;
    }

    private static <T extends TreeNode> List<T> findChild(List<T> listChild, Long id) {
        return listChild.stream()
            .filter(child -> id.equals(child.getPid()))
            .sorted(Comparator.comparing(TreeNode::getSort, Comparator.nullsLast(Integer::compareTo)).reversed())
            .collect(Collectors.toList());
    }

}
