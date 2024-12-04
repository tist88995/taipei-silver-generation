<#ftl output_format="HTML" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <#include "*/include/meta.ftl" />
    <script src="<@spring.url "/js/admin/country-code.js" />"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
    <div class="wrapper">
        <#include "*/include/nav-top.ftl" />
        <#include "*/include/nav-side.ftl" />
        <div class="content-wrapper">
            <@tist.breadCrumbs />
            <section class="content">
                <div class="con_main container">
                    <form action="<@spring.url "/admin/country-code" />" method="POST">
                        <input type="hidden" name="${(_csrf.parameterName)!}" value="${(_csrf.token)!}" />
                        <div class="con-box">
		                    <@tist.crudButtons prefix="/admin/country-code" actions=[ "add", "search", "export", "import"] />
		                    <div class="panel panel-success">
		                        <div class="panel-heading">
		                            <h3 class="panel-title"><@spring.message "admin.index.data-filter" /></h3>
		                        </div>
		                        <div class="panel-body">
		                            <div class="form-group">
		                                <label class="col-md-2">
		                                    <@spring.message "country.code" />
		                                </label>
		                                <div class="col-md-4">
		                                    <@tist.text path="queryContext.conditions[like-code]" />
		                                </div>
		                                <label class="col-md-2">
		                                    <@spring.message "country.name" />
		                                </label>
		                                <div class="col-md-4">
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
                                            <@spring.message "country.parent.name" />
                                        </th>
                                        <th>
                                            <@spring.message "country.code" />
                                            <@spring.formHiddenInput path="queryContext.sorts[code]" />
                                        </th>
                                        <th>
                                            <@spring.message "country.name" />
                                            <@spring.formHiddenInput path="queryContext.sorts[name]" />
                                        </th>
                                        <th>
                                            <@spring.message "admin.index.sort" />
                                            <@spring.formHiddenInput path="queryContext.sorts[sort]" />
                                        </th>
                                        <th>
                                            <@spring.message "admin.config.disabled" />
                                            <@spring.formHiddenInput path="queryContext.sorts[disabled]" />
                                        </th>
                                        <th>
                                            <@spring.message "admin.index.function" />
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                <#list page.content as item>
                                    <tr>
                                        <td>${(item.parent.name)!}</td>
                                        <td>${(item.code)!}</td>
                                        <td>${(item.name)!}</td>
                                        <td>${(item.sort)!}</td>
                                        <td>${(item.disabledDescription)!}</td>
                                        <td class="col-md-3">
                                            <@tist.baseRowButtons updateUrl="/admin/country-code/update/${item.id}" deleteUrl="/admin/country-code/delete/${item.id}" />
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