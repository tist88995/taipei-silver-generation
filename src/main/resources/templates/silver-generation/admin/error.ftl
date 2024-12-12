<#ftl output_format="HTML">
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-Hant-TW">
<head>
    <#include "*/include/meta.ftl" />
</head>
<body>
<div id="wrapper">
    <#include "*/include/nav-top.ftl" />
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="panel panel-danger">
                <div class="panel-heading"><@spring.message "admin.error.panel-title" /></div>
                <div class="panel-body">
                    <p class="text-danger"><@spring.message "admin.error.panel-body" /></p>
                    <#if debug >
                        <p class="text-danger">URL:${url}</p>
                        <p class="text-danger">Exception:${exception.message}</p>
                        <div class="text-danger">
                            <#list exception.stackTrace as trace>
                                ${trace}
                            </#list>
                        </div>
                    </#if>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "*/include/footer.ftl" />
</body>
</html>
