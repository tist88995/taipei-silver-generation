<#ftl output_format="HTML" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <#include "*/include/meta.ftl" />
    <script src="<@spring.url "/js/admin/role.js" />"></script>
    <script>
    rolesJson = ${rolesJson?no_esc};
    </script>
</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
    <div class="wrapper">
        <#include "*/include/nav-top.ftl" />
        <#include "*/include/nav-side.ftl" />
        <div class="content-wrapper">
            <@tist.breadCrumbs />
            <section class="content">
                <div class="con_main container">
                <form action="<@spring.url "/admin/role" />" method="POST">
                    <input type="hidden" name="${(_csrf.parameterName)!}" value="${(_csrf.token)!}" />
                    <div class="con-box">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div id="roleTree">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </section>
        
            <div class="modal fade-scale" id="roleModal" tabindex="-1" role="dialog" aria-labelledby="roleLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="roleLabel"><@spring.message "role.edit.title" /></h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal">
                                <input type="hidden" name="id" />
                                <input type="hidden" name="sort" />
                                <div class="form-group">
                                    <label class="col-sm-3">
                                        <@spring.message "role.no" />
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" name="no" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3">
                                        <@spring.message "role.name" />
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" name="name" class="form-control" />
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" id="updateRole" class="btn btn-raised btn-primary">
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
        <#include "*/include/footer.ftl" />
    </div>
</body>

</html>
