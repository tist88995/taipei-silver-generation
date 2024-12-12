<#ftl output_format="HTML" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-Hant-TW">
<head>
    <#include "*/include/meta.ftl" />
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <#include "*/include/nav-top.ftl" />
    <#include "*/include/nav-side.ftl" />
    <div class="content-wrapper">
        <@tist.breadCrumbs />
        <section class="content">
            <div class="con_main container">
                <form action="<@spring.url "/admin/sign-log" />" method="POST">
                    <input type="hidden" name="${(_csrf.parameterName)!}" value="${(_csrf.token)!}"/>
                    <div class="con-box">
                        <@tist.crudButtons prefix="/admin/sign-log" actions=["search"]/>
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h3 class="panel-title"><@spring.message "admin.index.data-filter" /></h3>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-md-2">
                                        帳號
                                    </label>
                                    <div class="col-md-4">
                                        <@tist.text path="queryContext.conditions[like-userId]" />
                                    </div>
                                    <label class="col-md-2">
                                        姓名
                                    </label>
                                    <div class="col-md-4">
                                        <@tist.text path="queryContext.conditions[like-name]" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">
                                        起始查詢日期
                                    </label>
                                    <div class="col-md-4">
                                        <@tist.dateText path="queryContext.conditions[after-createTime]" />
                                    </div>
                                    <label class="col-md-2">
                                        終止查詢日期
                                    </label>
                                    <div class="col-md-4">
                                        <@tist.dateText path="queryContext.conditions[before-createTime]" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">
                                        登入出狀態
                                    </label>
                                    <div class="col-md-4">
                                        <@tist.singleSelect path="queryContext.conditions[signType]" options={"":"全部"}+signTypes />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <#if (page?? && page.totalElements> 0 ) >
                        <!-- 查詢結果區 -->
                        <div class="table-box">
                            <table class="table table-bordered table-hover" summary="">
                                <caption class="text-center">&nbsp;</caption>
                                <thead>
                                <tr>
                                    <th>單位名稱</th>
                                    <th>帳號</th>
                                    <th>姓名</th>
                                    <th>IP</th>
                                    <th>登入/登出</th>
                                    <th>狀態</th>
                                    <th>時間</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list page.content as item>
                                    <tr>
                                        <td>${(item.departmentName)!""}</td>
                                        <td>${(item.userId)!""}</td>
                                        <td>${(item.name)!""}</td>
                                        <td>${(item.remoteIp)!""}</td>
                                        <td>${(item.signType)!""}</td>
                                        <td>${(item.signStatus)!""}</td>
                                        <td>${(item.createTime)!""}</td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                            <@tist.pagination page=page />
                        </div>
                    <#else>
                        <@tist.noResult />
                    </#if>
                </form>
            </div>
        </section>
    </div>
    <#include "*/include/footer.ftl" />
</div>
</body>
</html>