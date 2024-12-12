package com.tist.security.listener;

import com.tist.domain.SignLog;
import com.tist.domain.User;
import com.tist.domain.enum_package.SignStatus;
import com.tist.domain.enum_package.SignType;
import com.tist.security.domain.UserDetails;
import com.tist.security.service.impl.MgovAuthenticationDetailsImpl;
import com.tist.service.SignLogService;
import org.springframework.context.event.EventListener;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.event.LogoutSuccessEvent;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Objects;

@Component
public class LogoutEventListener {

    @Resource
    private SignLogService signLogService;

    @EventListener
    public void handleLogoutSuccess(LogoutSuccessEvent event) {
        setLoginLog(event);
    }

    private void setLoginLog(LogoutSuccessEvent event) {
        UserDetails userDetails = (UserDetails) ((UsernamePasswordAuthenticationToken) event.getSource()).getPrincipal();
        String remoteAddress = ((MgovAuthenticationDetailsImpl) ((UsernamePasswordAuthenticationToken) event.getSource()).getDetails()).getRemoteAddress();
        User user = userDetails.getUser();
        if (Objects.nonNull(user)) {
            SignLog log = new SignLog();
            log.setName(user.getName());
            log.setDepartmentName(user.getDepartment().getName());
            log.setUserId(user.getUserId());
            log.setRemoteIp(remoteAddress);
            log.setSignType(SignType.登出);
            log.setSignStatus(SignStatus.成功);
            signLogService.save(log);
        }
    }
}
