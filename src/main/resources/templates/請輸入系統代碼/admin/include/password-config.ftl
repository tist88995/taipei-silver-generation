<#ftl output_format="HTML" />
<script>
$(function() {
    var banUsername = <#if passwordConfig.banUsername >true<#else>false</#if>;
    var username = "${(currentUser.userId)!Session.username}";
    var passwordLength = ${passwordConfig.passwordLength!8};
    var escapedIncludeChars = RegExp.escape("${passwordConfig.includeChars?no_esc}");
    var allowChars = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d"+escapedIncludeChars+"]{"+passwordLength+",}$";
    var reg = new RegExp(allowChars);
    $('[name="password"]').rules("add", {
        minlength: passwordLength,
        regex: allowChars,
        regexExclude: username,
        messages: {
            regexExclude: "不允許使用帳號當密碼"
        }
    });
    $('[name="passwordConfirm"]').rules("add", {
        minlength: passwordLength,
        regex: allowChars,
        regexExclude: username,
        equalTo: '[name="password"]'
    });

    if (banUsername) {
        $('[name="password"]').rules("add", {
            regexExclude: username,
            messages: {
                regexExclude: "不允許使用帳號當密碼"
            }
        });
        $('[name="passwordConfirm"]').rules("add", {
            regexExclude: username,
            messages: {
                regexExclude: "不允許使用帳號當密碼"
            }
        });
    }
});
</script>
