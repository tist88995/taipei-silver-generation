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
                <form role="form" action="<@spring.url "/admin/sys-config/import" />" method="POST"
                      enctype="multipart/form-data" class="tist-validate">
                    <input type="hidden" name="${(_csrf.parameterName)!}" value="${(_csrf.token)!}"/>
                    <div class="con-box">
                        <button type="submit" class="btn btn-info">
                            <@spring.message "admin.button.start-import" />
                        </button>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <tr>
                                            <th colspan="4">
                                                <@spring.message "admin.form.import-file" />
                                            </th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <@tist.singleFile path="file" attributes="required" />
                                            </td>
                                        </tr>
                                    </table>
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
