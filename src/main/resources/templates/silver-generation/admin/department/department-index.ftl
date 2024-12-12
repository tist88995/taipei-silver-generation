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
                <form action="<@spring.url "/admin/department " />" method="POST">
                    <input type="hidden" name="${(_csrf.parameterName)!}" value="${(_csrf.token)!}"/>
                    <div class="con-box">
                        <@tist.crudButtons prefix="/admin/department" actions=[ "add", "search", "export"] />
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h3 class="panel-title"><@spring.message "admin.index.data-filter" /></h3>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-md-2">
                                        <@spring.message "department.name" />
                                    </label>
                                    <div class="col-md-10">
                                        <@tist.text path="queryContext.conditions[like-name]" />
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
                                    <th>
                                        <@spring.message "department.no" />
                                        <@spring.formHiddenInput path="queryContext.sorts[no]" />
                                    </th>
                                    <th>
                                        <@spring.message "department.name" />
                                        <@spring.formHiddenInput path="queryContext.sorts[name]" />
                                    </th>
                                    <th>
                                        <@spring.message "department.type" />
                                    </th>
                                    <th>
                                        <@spring.message "admin.index.function" />
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list page.content as item>
                                    <tr>
                                        <td>${item.no}</td>
                                        <td>${item.name}</td>
                                        <td>${item.typeDescription}</td>
                                        <td class="col-md-3">
                                            <@tist.baseRowButtons updateUrl="/admin/department/update/${item.id}" deleteUrl="/admin/department/delete/${item.id}" />
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                            <@tist.pagination page=page />
                        </div>
                    <#else />
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