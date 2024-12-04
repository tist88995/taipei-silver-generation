<#ftl output_format="HTML" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <#include "*/include/meta.ftl" />
    <script src="<@spring.url "/js/admin/role-rule.js" />"></script>
    <script>
        rulesJson = ${rulesJson?no_esc};
    </script>
</head>
<body class="hold-transition skin-blue sidebar-collapse sidebar-mini">
<div class="wrapper">
        <#include "*/include/nav-top.ftl" />
        <#include "*/include/nav-side.ftl" />
    <div class="content-wrapper" id="content">
            <@tist.breadCrumbs />
        <section class="content">
            <div class="con_main container">
                <div class="con-box">
                    <form action="<@spring.url "/admin/role/rule" />" method="POST">
                        <input type="hidden" name="${(_csrf.parameterName)!}"
                               value="${(_csrf.token)!}"/>
		                    <@spring.formHiddenInput path="role.id" />
                        <div class="panel panel-default">
                            <div class="panel-heading">
		                            <@tist.linkButton href="/admin/role/index" title="admin.button.return" />
                            </div>
                            <div class="panel-body">
                                <div id="ruleTree">
                                </div>
                                <button id="updateRule" type="button"
                                        class="btn btn-raised btn-info">
		                                <@spring.message "admin.button.edit" />
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
        <#include "*/include/footer.ftl" />
</div>
</body>
</html>
