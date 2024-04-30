package com.baoxiao.framework.web.exception;

import cn.dev33.satoken.exception.NotLoginException;
import cn.dev33.satoken.exception.NotPermissionException;
import cn.dev33.satoken.exception.NotRoleException;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.http.HttpStatus;
import com.baoxiao.common.core.domain.R;
import com.baoxiao.common.exception.DemoModeException;
import com.baoxiao.common.exception.ServiceException;
import com.baoxiao.common.utils.StreamUtils;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.MyBatisSystemException;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingPathVariableException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * 全局异常处理器
 *
 * @author Lion Li
 */
@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 权限码异常
     */
    @ExceptionHandler(NotPermissionException.class)
    public R<Void> handleNotPermissionException(NotPermissionException e, HttpServletRequest request) {
        String requestURI = request.getRequestURI();
        log.error("请求地址'{}',权限码校验失败'{}'", requestURI, e.getMessage());
        return R.fail(HttpStatus.HTTP_FORBIDDEN, "没有访问权限，请联系管理员授权");
    }

    /**
     * 角色权限异常
     */
    @ExceptionHandler(NotRoleException.class)
    public R<Void> handleNotRoleException(NotRoleException e, HttpServletRequest request) {
        String requestURI = request.getRequestURI();
        log.error("请求地址'{}',角色权限校验失败'{}'", requestURI, e.getMessage());
        return R.fail(HttpStatus.HTTP_FORBIDDEN, "没有访问权限，请联系管理员授权");
    }

    /**
     * 认证失败
     */
    @ExceptionHandler(NotLoginException.class)
    public R<Void> handleNotLoginException(NotLoginException e, HttpServletRequest request) {
        String requestURI = request.getRequestURI();
        log.error("请求地址'{}',认证失败'{}',无法访问系统资源", requestURI, e.getMessage());
        return R.fail(HttpStatus.HTTP_UNAUTHORIZED, "认证失败，无法访问系统资源");
    }

    /**
     * 请求方式不支持
     */
    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public R<Void> handleHttpRequestMethodNotSupported(HttpRequestMethodNotSupportedException e,
                                                                HttpServletRequest request) {
        String requestURI = request.getRequestURI();
        log.error("请求地址'{}',不支持'{}'请求", requestURI, e.getMethod());
        return R.fail(e.getMessage());
    }

    /**
     * 主键或UNIQUE索引，数据重复异常
     */
    @ExceptionHandler(DuplicateKeyException.class)
    public R<Void> handleDuplicateKeyException(DuplicateKeyException e, HttpServletRequest request) {
        String requestURI = request.getRequestURI();
        log.error("请求地址'{}',数据库中已存在记录'{}'", requestURI, e.getMessage());
        return R.fail("数据库中已存在该记录，请联系管理员确认");
    }

    /**
     * Mybatis系统异常 通用处理
     */
    @ExceptionHandler(MyBatisSystemException.class)
    public R<Void> handleCannotFindDataSourceException(MyBatisSystemException e, HttpServletRequest request) {
        String requestURI = request.getRequestURI();
        String message = e.getMessage();
        if (message.contains("CannotFindDataSourceException")) {
            log.error("请求地址'{}', 未找到数据源", requestURI);
            return R.fail("未找到数据源，请联系管理员确认");
        }
        log.error("请求地址'{}', Mybatis系统异常", requestURI, e);
        return R.fail(message);
    }

    /**
     * 业务异常
     */
    @ExceptionHandler(ServiceException.class)
    public R<Void> handleServiceException(ServiceException e, HttpServletRequest request) {
        log.error(e.getMessage(), e);
        Integer code = e.getCode();
        return ObjectUtil.isNotNull(code) ? R.fail(code, e.getMessage()) : R.fail(e.getMessage());
    }

    /**
     * 请求路径中缺少必需的路径变量
     */
    @ExceptionHandler(MissingPathVariableException.class)
    public R<Void> handleMissingPathVariableException(MissingPathVariableException e, HttpServletRequest request) {
        String requestURI = request.getRequestURI();
        log.error("请求路径中缺少必需的路径变量'{}',发生系统异常.", requestURI, e);
        return R.fail(String.format("请求路径中缺少必需的路径变量[%s]", e.getVariableName()));
    }

    /**
     * 请求参数类型不匹配
     */
    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    public R<Void> handleMethodArgumentTypeMismatchException(MethodArgumentTypeMismatchException e, HttpServletRequest request) {
        String requestURI = request.getRequestURI();
        log.error("请求参数类型不匹配'{}',发生系统异常.", requestURI, e);
        return R.fail(String.format("请求参数类型不匹配，参数[%s]要求类型为：'%s'，但输入值为：'%s'", e.getName(), e.getRequiredType().getName(), e.getValue()));
    }

    /**
     * 拦截未知的运行时异常
     */
    @ExceptionHandler(RuntimeException.class)
    public R<Void> handleRuntimeException(RuntimeException e, HttpServletRequest request) {
        String requestURI = request.getRequestURI();
        log.error("请求地址'{}',发生未知异常.", requestURI, e);
        return R.fail(e.getMessage());
    }

    /**
     * 系统异常
     */
    @ExceptionHandler(Exception.class)
    public R<Void> handleException(Exception e, HttpServletRequest request) {
        String requestURI = request.getRequestURI();
        log.error("请求地址'{}',发生系统异常.", requestURI, e);
        return R.fail(e.getMessage());
    }

    /**
     * 自定义验证异常
     */
    @ExceptionHandler(BindException.class)
    public R<Void> handleBindException(BindException e) {
        log.error(e.getMessage(), e);
        String message = StreamUtils.join(e.getAllErrors(), DefaultMessageSourceResolvable::getDefaultMessage, ", ");
        return R.fail(message);
    }

    /**
     * 自定义验证异常
     */
//    @ExceptionHandler(ConstraintViolationException.class)
//    public R<Void> constraintViolationException(ConstraintViolationException e) {
//        log.error(e.getMessage(), e);
//        String message = StreamUtils.join(e.getConstraintViolations(), ConstraintViolation::getMessage, ", ");
//        return R.fail(message);
//    }

    /**
     * 自定义验证异常
     */
//    @ExceptionHandler(MethodArgumentNotValidException.class)
//    public R<Void> handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
//        log.error(e.getMessage(), e);
//        String message = e.getBindingResult().getFieldError().getDefaultMessage();
//        return R.fail(message);
//    }

    /**
     * 演示模式异常
     */
    @ExceptionHandler(DemoModeException.class)
    public R<Void> handleDemoModeException(DemoModeException e) {
        return R.fail("演示模式，不允许操作");
    }

    /**
     * 校验单个数据错误
     */
    @ExceptionHandler(ConstraintViolationException.class)
    @ResponseBody
    public R<Void> handleConstraintViolationException(ConstraintViolationException e) {
        log.error("handle Constraint Violation Exception", e);

        return handleParamResponse(e.getConstraintViolations());
    }

    /**
     * 自定义验证异常
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseBody
    public R<Void> handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        log.error("Method Argument NotValid Exception", e);

        return handleDTOResponse(e.getBindingResult());
    }

    /*开发时使用*/
    @ExceptionHandler(HttpMessageNotReadableException.class)
    @ResponseBody
    public R<Void> handleInvalidFormatException(HttpMessageNotReadableException e) {
        log.error("handle Invalid Format Exception", e);

        return handleInvalidFormat(e.getCause());
    }

    /**
     * 校验DTO数据错误
     *
     * @param bindingResult 错误数组
     * @return 返回响应类型
     */
    private R<Void> handleDTOResponse(BindingResult bindingResult) {
        ArrayList<String> list = new ArrayList<>();

        if (bindingResult.hasErrors()) {
            /*获取错误的数组*/
            List<ObjectError> errors = bindingResult.getAllErrors();

            for (ObjectError error : errors) {
                list.add(error.getDefaultMessage());
            }
        }

        if (list.size() == 0) {
            return R.fail(HttpStatus.HTTP_INTERNAL_ERROR,"参数错误");
        }

        return R.fail(HttpStatus.HTTP_INTERNAL_ERROR, list.toString());
    }

    /**
     * 校验单个数据错误
     *
     * @param constraintViolations 错误数组
     * @return 返回响应类型
     */
    private R<Void> handleParamResponse(Set<ConstraintViolation<?>> constraintViolations) {
        ArrayList<String> list = new ArrayList<>();

        if (constraintViolations.size() > 0) {
            for (ConstraintViolation<?> ConstraintViolation : constraintViolations) {
                list.add(ConstraintViolation.getMessage());
            }
        }

        if (list.size() == 0) {
            return R.fail(HttpStatus.HTTP_INTERNAL_ERROR,"参数错误");
        }

        return R.fail(HttpStatus.HTTP_INTERNAL_ERROR, list.toString());
    }

    /**
     * 参数格式错误(开发时使用)
     *
     * @param cause 错误对象
     * @return 返回枚举错误类型
     */
    private R<Void> handleInvalidFormat(Throwable cause) {
        return R.fail(HttpStatus.HTTP_INTERNAL_ERROR, cause.getMessage());
    }
}
