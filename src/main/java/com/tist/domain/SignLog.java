package com.tist.domain;

import com.tist.annotation.Logable;
import com.tist.bean.LogBean;
import com.tist.domain.enum_package.LogableOperation;
import com.tist.domain.enum_package.SignStatus;
import com.tist.domain.enum_package.SignType;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 登出入紀錄
 *
 * @author MingYe
 */
@Entity
@Table(name = "tist_sign_log")
@Data
@EqualsAndHashCode(callSuper = true, doNotUseGetters = true)
@ToString(callSuper = true, doNotUseGetters = true, of = "remoteIp")
@Logable(LogableOperation.QUERY)
public class SignLog extends AbstractLogEntity {

    private static final long serialVersionUID = 3592633046641956510L;

    /**
     * ip位址
     */
    @Column(name = "remote_ip_")
    private String remoteIp;

    /**
     * 被查詢者姓名
     */
    @Column(name = "user_id_")
    private String userId;

    /**
     * 被查詢者戶號
     */
    @Column(name = "name_")
    private String name;

    /**
     * 單位名稱
     */
    @Column(name = "department_name_")
    private String departmentName;

    /**
     * 登入/登出
     */
    @Column(name = "sign_type_")
    private SignType signType;

    /**
     * 登入狀態
     */
    @Column(name = "sign_status_")
    private SignStatus signStatus;

    @Override
    protected void customLogMsg(LogBean bean) {
        bean.setTableToString(this.toString()
                .replace("departmentName", "「單位名稱」")
                .replace("signStatus", "「登入狀態」")
                .replace("remoteIp", "「ip位址」")
                .replace("signType", "「登入狀態」")
                .replace("userId", "「被查詢者姓名」")
                .replace("name", "「被查詢者戶號」")
        );
    }
}
