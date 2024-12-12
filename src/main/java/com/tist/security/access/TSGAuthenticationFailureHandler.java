package com.tist.security.access;

import com.tist.domain.SignLog;
import com.tist.domain.User;
import com.tist.domain.enum_package.SignStatus;
import com.tist.domain.enum_package.SignType;
import com.tist.service.SignLogService;
import com.tist.service.UserService;
import org.springframework.context.annotation.Primary;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

@Component("com.tist.security.access.TSGAuthenticationFailureHandler")
@Primary
public class TSGAuthenticationFailureHandler extends CustomAuthenticationFailureHandler {

    @Resource
    private SignLogService signLogService;
    @Resource
    private UserService userService;

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        setLoginLog(request);
        super.onAuthenticationFailure(request, response, exception);
    }

    private void setLoginLog(HttpServletRequest request) {
        User user = userService.findByUserId(request.getParameter("username"));
        if (Objects.nonNull(user)) {
            SignLog log = new SignLog();
            log.setName(user.getName());
            log.setDepartmentName(user.getDepartment().getName());
            log.setUserId(user.getUserId());
            log.setRemoteIp(request.getRemoteAddr());
            log.setSignType(SignType.登入);
            log.setSignStatus(SignStatus.失敗);
            signLogService.save(log);
        }
    }
}
