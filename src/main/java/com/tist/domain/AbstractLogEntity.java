package com.tist.domain;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.tist.bean.LogBean;
import com.tist.domain.interface_package.LogableEntity;
import com.tist.util.JsonUtils;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

@Slf4j
@Data
@MappedSuperclass
public class AbstractLogEntity extends AbstractEntity implements LogableEntity {

    private static final long serialVersionUID = -2624897576454503239L;

    @Override
    public String toLog() {
        String logMsg = "";
        LogBean bean = columnFill();
        customLogMsg(bean);
        baseLogMsg(bean);
        try {
            logMsg = JsonUtils.stringify(bean);
        } catch (JsonProcessingException e) {
            log.error(e.getLocalizedMessage());
        }

        return logMsg;
    }

    protected void customLogMsg(LogBean bean) {
    }

    private void baseLogMsg(LogBean bean) {
        bean.setTableToString(bean.getTableToString()
                .replace("programNameLog", "「功能名稱」")
                .replace("userAccountLog", "「使用者帳號」")
                .replace("userNameLog", "「使用者姓名」")
                .replace("userIdLog", "「使用者帳號」")
                .replace("ipLog", "「IP」"));
    }

    private LogBean columnFill() {
        LogBean bean = new LogBean();
        bean.setIp(this.ipLog);
        bean.setProgramName(this.programNameLog);
        bean.setUserName(this.userNameLog);
        bean.setUserId(this.userAccountLog);
        bean.setTableToString(this.toString());
        return bean;
    }

    /**
     * 使用者姓名
     */
    @Transient
    private String userNameLog;

    /**
     * 使用者帳號
     */
    @Transient
    private String userAccountLog;

    /**
     * IP
     */
    @Transient
    private String ipLog;

    /**
     * 功能名稱
     */
    @Transient
    private String programNameLog;
}
