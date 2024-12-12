package com.tist.security.access;

import com.tist.domain.SignLog;
import com.tist.domain.enum_package.SignStatus;
import com.tist.domain.enum_package.SignType;
import com.tist.security.SecurityContext;
import com.tist.service.SignLogService;
import org.springframework.context.annotation.Primary;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component("com.tist.security.access.TSGAuthenticationSuccessHandler")
@Primary
public class TSGAuthenticationSuccessHandler extends CustomAuthenticationSuccessHandler {

    @Resource
    private SignLogService signLogService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
        setLoginLog(request);
        super.onAuthenticationSuccess(request, response, auth);
    }

    private void setLoginLog(HttpServletRequest request) {
        SignLog log = new SignLog();
        log.setName(SecurityContext.getUsername());
        log.setDepartmentName(SecurityContext.getUser().getDepartment().getName());
        log.setUserId(SecurityContext.getUserId());
        log.setRemoteIp(request.getRemoteAddr());
        log.setSignType(SignType.登入);
        log.setSignStatus(SignStatus.成功);
        signLogService.save(log);
    }
}
