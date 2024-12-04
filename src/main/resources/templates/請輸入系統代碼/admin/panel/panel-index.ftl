<#ftl output_format="HTML" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <#include "*/include/meta.ftl" />
</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
<div class="wrapper">
    <#include "*/include/nav-top.ftl" />
    <#include "*/include/nav-side.ftl" />
    <div class="content-wrapper">
        <@tist.breadCrumbs />
        <section class="content">
            <div class="con_main container">
                <div class="con-box">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <!--<a href="#">
		                                <@tist.currentMenuName />
		                            </a>-->
                        </li>
                    </ul>
                    <#if isManager>
                        <div class="con_main col-md-12">
                            <div class="form-group col-md-12">
                                <label class="col-md-2">
                                    偵錯模式
                                </label>
                                <div class="col-md-10">
                                    <input type="checkbox" id="toggle-debug" <#if Session.debug?exists>checked</#if>>
                                    <label for="toggle-debug" class="checkbox-inline">是</label>

                                </div>
                            </div>

                            <div class="form-group col-md-12">
                                <label class="col-md-2">
                                    更新系統參數
                                </label>
                                <div class="col-md-10">
                                    <button class=".btn" type="button" id="refresh-sys-cache">更新</button>
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label class="col-md-2">
                                    下載catalina.out
                                </label>
                                <div class="col-md-10">
                                    <#if catalina>
                                        目前catalina.out檔案大小 : ${size}Bytes
                                        <button class=".btn" type="button" id="download-log">下載</button>
                                    <#else>
                                        未設定tist.admin.catalina
                                    </#if>
                                </div>
                            </div>
                        </div>

                    <#else >
                        <div class="con_main col-md-12">
                            <div class="form-group col-md-12">
                                <label class="col-md-12">
                                    僅系統管理者可使用
                                </label>
                            </div>
                        </div>
                    </#if>
                </div>
            </div>
        </section>
    </div>
    <#include "*/include/footer.ftl" />
</div>
</body>
<script>
    $(function () {
        $('#toggle-debug').click(function () {
            com.tist.util.Ajax.get(
                com.tist.BASE_URL + '/admin/panel/toggle-debug?debug=' + $(this).is(":checked"),
                function (data) {
                    com.tist.util.AlertDialog.confirm('', data.message);
                });
        });
        $('#refresh-sys-cache').click(function () {
            com.tist.util.Ajax.get(
                com.tist.BASE_URL + '/admin/panel/refresh-sys-cache',
                function (data) {
                    com.tist.util.AlertDialog.confirm('', data.message);
                });
        });
    });
</script>
</html>