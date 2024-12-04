<#ftl output_format="HTML">
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <#include "*/include/meta.ftl" />
    <#include "*/include/password-config.ftl" />
</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
    <div class="wrapper">
        <#include "*/include/nav-top.ftl" />
        <#include "*/include/nav-side.ftl" />
        <div class="content-wrapper">
            <@tist.breadCrumbs />
            <section class="content">
                <div class="con_main container">
                    <form id="form1" action="<@spring.url "/admin/profile/update" />" method="post" class="tist-validate">
                        <input type="hidden" name="${(_csrf.parameterName)!}" value="${(_csrf.token)!}" />
                        <div class="con-box">
		                    <div class="panel panel-success">
		                        <div class="panel-body">
		                            <@spring.formHiddenInput path="user.id" />
		                            <@spring.formHiddenInput path="user.department.id" />
		                            <div class="form-group col-md-12 no-margin">
		                                <label class="col-md-2"><@spring.message "department.name" /></label>
		                                <div class="col-md-10">
		                                    ${user.department.name}
		                                </div>
		                            </div>
		                            <div class="form-group col-md-12 no-margin">
		                                <label class="col-md-2"><@spring.message "user.userid" /></label>
		                                <div class="col-md-10">
		                                    ${user.userId}
		                                </div>
		                            </div>
		                            <div class="form-group col-md-12 no-margin">
		                                <label class="col-md-2"><@spring.message "user.name" /></label>
		                                <div class="col-md-10">
		                                    <@tist.text path="user.name" attributes='required'/>
		                                </div>
		                            </div>
		                            <div class="form-group col-md-12 no-margin">
		                                <label class="col-md-2"><@spring.message "user.password" /></label>
		                                <div class="col-md-10">
		                                    <@tist.password path="user.password" />
		                                </div>
		                            </div>
		                            <div class="form-group col-md-12 no-margin">
		                                <label class="col-md-2"><@spring.message "user.password-confirm" /></label>
		                                <div class="col-md-10">
		                                    <@tist.password path="user.passwordConfirm" />
		                                </div>
		                            </div>
		                            <div class="form-group col-md-12 no-margin">
		                                <label class="col-md-2"><@spring.message "user.mobile" /></label>
		                                <div class="col-md-10">
		                                    <@tist.text path="user.mobile"/>
		                                </div>
		                            </div>
		                            <div class="form-group col-md-12 no-margin">
		                                <label class="col-md-2"><@spring.message "user.email" /></label>
		                                <div class="col-md-10">
		                                    <@tist.text path="user.email" attributes="required" />
		                                </div>
		                            </div>
		                            <div class="form-group col-md-12 no-margin">
		                                <label class="col-md-2">&nbsp;</label>
		                                <div class="col-md-10">
		                                    <button type="submit" class="btn btn-info"><@spring.message "admin.button.edit" /></button>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
                    </form>
                </div>
            </section>
        </div>
        <#include "*/include/footer.ftl" />
    </div>
</body>
</html>
