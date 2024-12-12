<#ftl output_format="HTML" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-Hant-TW">
<head>
    <#include "*/include/meta.ftl" />
    <script src="<@spring.url "/js/admin/sys-config.js" />"></script>
    <script>
        configsJson = ${configsJson?no_esc};
    </script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <#include "*/include/nav-top.ftl" />
    <#include "*/include/nav-side.ftl" />
    <div class="content-wrapper">
        <@tist.breadCrumbs />
        <section class="content">
            <div class="con_main container">
                <div class="con-box">
                    <@tist.crudButtons prefix="/admin/sys-config" actions=["import"] />
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div id="sysConfigTree"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <#include "*/include/footer.ftl" />
</div>
<div class="modal fade-scale" id="configModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">編輯</h4>
            </div>
            <div class="modal-body con_main">
                <form class="form-horizontal">
                    <input type="hidden" name="id"/>
                    <input type="hidden" name="sort"/>
                    <div class="form-group">
                        <label class="col-sm-3 required">參數編號</label>
                        <div class="col-sm-9">
                            <input type="text" name="no" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 required">參數名稱</label>
                        <div class="col-sm-9">
                            <input type="text" name="name" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3">停用</label>
                        <div class="col-sm-9">
                            <div class="radioBtn">
                                <input type="radio" id="disabled_true" name="disabled" value="true"/>
                                <label for="disabled_true" class="radio-inline">是</label>
                                <input type="radio" id="disabled_false" name="disabled" value="false"/>
                                <label for="disabled_false" class="radio-inline">否</label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 required">關聯代碼1</label>
                        <div class="col-sm-9">
                            <input type="text" name="code1" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 required">關聯代碼2</label>
                        <div class="col-sm-9">
                            <input type="text" name="code2" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 required">關聯代碼3</label>
                        <div class="col-sm-9">
                            <input type="text" name="code3" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3">備註</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" name="note" rows="3"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" id="updateSysConfig" class="btn btn-primary">
                    <@spring.message "admin.button.edit" />
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    <@spring.message "admin.button.cancel" />
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>