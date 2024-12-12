package com.tist.web.admin;

import com.tist.annotation.EncodableResource;
import com.tist.bean.QueryContext;
import com.tist.constant.UrlPattern;
import com.tist.domain.SignLog;
import com.tist.domain.enum_package.SignType;
import com.tist.service.SignLogService;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 登入紀錄
 *
 * @author MingYe
 */
@Controller("com.tist.web.admin.SignLogController")
@RequestMapping("/admin/sign-log")
public class SignLogController {

    private static final String VIEW_INDEX = "/admin/sign-log/sign-log-index";

    @Resource
    private SignLogService signLogService;

    @EncodableResource(SignType.class)
    private Map<String, SignType> signTypes;

    @ModelAttribute("signTypes")
    public Map<String, SignType> getSignStatus() {
        return signTypes;
    }

    @RequestMapping({UrlPattern.EMPTY, UrlPattern.INDEX})
    public String index(@ModelAttribute("queryContext") QueryContext queryContext, Model model) {
        if (null == queryContext) {
            queryContext = new QueryContext();
        }
        queryContext.getSorts().put("createTime", "desc");
        Page<SignLog> page = signLogService.queryAll(queryContext);
        model.addAttribute("page", page);
        return VIEW_INDEX;
    }

}
