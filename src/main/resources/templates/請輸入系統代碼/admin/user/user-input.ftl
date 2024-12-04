<#ftl output_format="HTML" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <#include "*/include/meta.ftl" />
    <#include "*/include/password-config.ftl" />
    <script src="<@spring.url "/js/admin/user.js" />"></script>
    <script>
        departIds = ["${(departIds![""])?join("\",\"")?no_esc}"];
        lockDepartment = ${lockDepartment!"false"};
        showPlaceholder = <#if authorityHelper.manager>true<#else>false</#if>;
        rolesJson = ${rolesJson?no_esc};

        $(function () {
            $("#userId").rules("add", {required: true, rangelength: [4, 16]});
            $("#passwordConfirm").rules("add", {equalTo: "#password"});
        });
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
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <@tist.linkButton href="/admin/user/index" title="admin.button.return" />
                        </div>
                        <div class="panel-body">
                            <#if (user.id)??>
                                <#assign action="/admin/user/update" />
                            <#else>
                                <#assign action="/admin/user/add" />
                            </#if>
                            <form id="form1" action="<@spring.url action />" method="post"
                                  class="tist-validate">
                                <input type="hidden" name="${(_csrf.parameterName)!}"
                                       value="${(_csrf.token)!}"/>
                                <@spring.formHiddenInput path="user.id" />
                                <@spring.formHiddenInput path="user.department.id" />
                                <div class="form-group">
                                    <label class="col-md-2 required">
                                        <@spring.message "department.name" />
                                    </label>
                                    <div id="departContainer" class="col-md-10">

                                    </div>
                                    <#if (lockDepartment!"false") == "true">${user.department.name!}</#if>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 required">
                                        <@spring.message "user.userid" />
                                    </label>
                                    <div class="col-md-10">
                                        <@tist.text path="user.userId" attributes='required' />
                                    </div>
                                </div>
                                <div class="form-group col-md-12 id-exist">
                                    <label class="col-md-2"></label>
                                    <div class=" col-md-10" style="color: red"><strong>帳號已存在，請確認</strong></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 required">
                                        <@spring.message "user.name" />
                                    </label>
                                    <div class="col-md-10">
                                        <@tist.text path="user.name" attributes='required' />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">
                                        <@spring.message "user.password" />
                                    </label>
                                    <div class="col-md-10">
                                        <@tist.password path="user.password" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">
                                        <@spring.message "user.password-confirm" />
                                    </label>
                                    <div class="col-md-10">
                                        <@tist.password path="user.passwordConfirm" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">
                                        <@spring.message "user.mobile" />
                                    </label>
                                    <div class="col-md-10">
                                        <@tist.text path="user.mobile" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">
                                        <@spring.message "user.email" />
                                    </label>
                                    <div class="col-md-10">
                                        <@tist.text path="user.email" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">
                                        <@spring.message "role.name" />
                                    </label>
                                    <div id="roleTree" class="col-md-10">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">
                                        <@spring.message "admin.config.disabled" />
                                    </label>
                                    <div class="col-md-10">
                                        <@tist.checkboxs path="user.disabled" options=disables />
                                    </div>
                                </div>
                                <#if (user.id)??>
                                    <button type="submit" class="btn btn-raised btn-info">
                                        <@spring.message "admin.button.edit" />
                                    </button>
                                <#else>
                                    <button type="submit" class="btn btn-raised btn-info">
                                        <@spring.message "admin.button.add" />
                                    </button>
                                </#if>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <#include "*/include/footer.ftl" />
</div>
</body>
</html>
