<#ftl output_format="HTML" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-Hant-TW">
<head>
    <#include "*/include/meta.ftl" />
    <script src="<@spring.url "/js/admin/program.js" />"></script>
    <script>
        programsJson = ${programsJson?no_esc};
        requestMapsJson = ${requestMapsJson?no_esc};
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
                <form action="<@spring.url "/admin/program" />" method="POST">
                    <input type="hidden" name="${(_csrf.parameterName)!}" value="${(_csrf.token)!}"/>
                    <div class="con-box">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div id="programTree">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <div class="modal fade-scale" id="programModal" tabindex="-1" role="dialog" aria-labelledby="programLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" id="programLabel"><@spring.message "program.edit.title" /></h4>
                    </div>
                    <div class="modal-body">
                        <form id="form1" class="form-horizontal tist-validate">
                            <input type="hidden" name="id"/>
                            <input type="hidden" name="sort"/>
                            <input type="hidden" name="icon" value="desktop"/>
                            <div class="form-group">
                                <label class="col-sm-3">
                                    <@spring.message "program.icon" />
                                </label>
                                <div class="col-sm-9">
                                    <div class="btn-group">
                                        <button type="button"
                                                class="btn btn-raised btn-primary btn-lg iconpicker-component"><i
                                                    class="fa fa-fw fa-desktop"></i></button>
                                        <button type="button"
                                                class="icp icp-dd btn btn-raised btn-primary btn-lg dropdown-toggle"
                                                data-selected="fa-desktop" data-toggle="dropdown">
                                            <span class="caret"></span>
                                            <span class="sr-only">Toggle Dropdown</span>
                                        </button>
                                        <div class="dropdown-menu"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3">
                                    <@spring.message "program.large-icon" />
                                </label>
                                <div class="col-sm-9">
                                    <input type="text" name="largeIcon" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3">
                                    <@spring.message "program.name" />
                                </label>
                                <div class="col-sm-9">
                                    <input type="text" name="name" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3">
                                    <@spring.message "program.link" />
                                </label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <div class="radio input-group-addon">
                                            <label>
                                                <input id="radioUrl" type="radio" name="urlType" value="0">
                                                <@spring.message "program.url" />
                                            </label>
                                        </div>
                                        <input type="text" id="program-url" name="url" class="form-control"/>
                                    </div>
                                    <div class="input-group">
                                        <div class="radio input-group-addon">
                                            <label>
                                                <input id="radioController" type="radio" name="urlType" value="1">
                                                <@spring.message "program.controller" />
                                            </label>
                                        </div>
                                        <select name="controller" class="form-control">
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3">
                                    是否隱藏
                                </label>
                                <div class="col-sm-9">
                                    <div class="radioBtn">
                                        <input type="radio" name="invisible" id="invisible_1" value="true"/>
                                        <label for="invisible_1" class="radio-inline">是</label>
                                        <input type="radio" name="invisible" id="invisible_2" value="false"/>
                                        <label for="invisible_2" class="radio-inline">否</label>
                                    </div>
                                </div>
                            </div>
                            <div id="actionContainer" class="form-group hide">
                                <label class="col-sm-3">
                                    <@spring.message "program.action" />
                                </label>
                                <div class="col-sm-9">
                                </div>
                            </div>
                        </form>
                        <div class="modal-footer">
                            <button type="submit" id="updateProgram" class="btn btn-raised btn-primary">
                                <@spring.message "admin.button.edit" />
                            </button>
                            <button type="button" class="btn btn-raised btn-default" data-dismiss="modal">
                                <@spring.message "admin.button.cancel" />
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <#include "*/include/footer.ftl" />
</div>
</body>
</html>
