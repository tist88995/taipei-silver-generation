<#ftl output_format="HTML" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <#include "*/include/meta.ftl" />

</head>

<body class="body"
      style="padding:0; margin:0; display:block; background:#eeebeb; -webkit-text-size-adjust:none;"
      bgcolor="#eeebeb">
<table align="center" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td align="center" valign="top" style="background-color:#eeebeb" width="100%">
            <center>
                <table cellspacing="0" cellpadding="0" width="600" class="w320">
                    <tr>
                        <td align="center" valign="top">
                            <table cellspacing="0" cellpadding="0" class="force-full-width"
                                   style="background-color:#3bcdb0;">
                                <tr>
                                    <td style="background-color:#3bcdb0;">
                                        <table cellspacing="0" cellpadding="0"
                                               class="force-full-width">
                                            <tr>
                                                <td style="font-size:40px; font-weight: 600; color: #ffffff; text-align:center;"
                                                    class="mobile-spacing">
                                                    <div class="mobile-br">&nbsp;</div>
                                                    密碼重設
                                                    <br/>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <table cellspacing="0" cellpadding="0" class="force-full-width"
                                   bgcolor="#ffffff">
                                <tr>
                                    <td style="background-color:#ffffff; padding-top: 15px;">
                                        <center>
                                            <table style="margin:0 auto;" cellspacing="0"
                                                   cellpadding="0" class="force-width-80">
                                                <tr>
                                                    <td style="text-align:left;">
                                                        <br>
                                                        <strong>${main.name}您好:</strong>
                                                        <br> 密碼已修正為：${main.passwordConfirm}
                                                        <br>
                                                        <br>
                                                    </td>
                                                </tr>
                                            </table>

                                        </center>
                                        <#include "*/include/footer.ftl" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </center>
        </td>
    </tr>
</table>
</body>

</html>
