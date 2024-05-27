package com.baoxiao.web.controller.system;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baoxiao.common.core.controller.BaseController;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/jmreport")
public class sysJmreportController extends BaseController {

    @SaCheckPermission("system:jmreport:index")
    @GetMapping("/getReport")
    public String getReport(){
        return "/jmreport/list/";
    }
}
