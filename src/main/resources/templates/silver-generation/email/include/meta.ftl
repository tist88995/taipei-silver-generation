<#ftl output_format="HTML" />
<#global htmlEscape=true />
<#setting url_escaping_charset="UTF-8" />
<#import "/spring.ftl" as spring />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<style type="text/css">
img {
    max-width: 600px;
    outline: none;
    text-decoration: none;
    -ms-interpolation-mode: bicubic;
}

a img {
    border: none;
}

table {
    border-collapse: collapse !important;
}

#outlook a {
    padding: 0;
}

.ReadMsgBody {
    width: 100%;
}

.ExternalClass {
    width: 100%;
}

.backgroundTable {
    margin: 0 auto;
    padding: 0;
    width: 100%;
}

table td {
    border-collapse: collapse;
}

.ExternalClass * {
    line-height: 115%;
}

td {
    font-family: 微軟正黑體, Arial, sans-serif;
    color: #6f6f6f;
}

body {
    -webkit-font-smoothing: antialiased;
    -webkit-text-size-adjust: none;
    width: 100%;
    height: 100%;
    color: #6f6f6f;
    font-weight: 400;
    font-size: 18px;
}

h1 {
    margin: 10px 0;
}

a {
    color: #27aa90;
    text-decoration: none;
}

.force-full-width {
    width: 100% !important;
}

.force-width-80 {
    width: 80% !important;
}

.body-padding {
    padding: 0 75px;
}

.mobile-align {
    text-align: right;
}
</style>
<style type="text/css" media="screen">
@media screen {
    * {
        font-family: 微軟正黑體, 'Source Sans Pro', 'Helvetica Neue', 'Arial', 'sans-serif' !important;
    }
    .w280 {
        width: 280px !important;
    }
}
</style>
<style type="text/css" media="only screen and (max-width: 480px)">
/* Mobile styles */

@media only screen and (max-width: 480px) {
    table[class*="w320"] {
        width: 320px !important;
    }
    td[class*="w320"] {
        width: 280px !important;
        padding-left: 20px !important;
        padding-right: 20px !important;
    }
    img[class*="w320"] {
        width: 250px !important;
        height: 67px !important;
    }
    td[class*="mobile-spacing"] {
        padding-top: 10px !important;
        padding-bottom: 10px !important;
    }
    *[class*="mobile-hide"] {
        display: none !important;
    }
    *[class*="mobile-br"] {
        font-size: 12px !important;
    }
    td[class*="mobile-w20"] {
        width: 20px !important;
    }
    img[class*="mobile-w20"] {
        width: 20px !important;
    }
    td[class*="mobile-center"] {
        text-align: center !important;
    }
    table[class*="w100p"] {
        width: 100% !important;
    }
    td[class*="activate-now"] {
        padding-right: 0 !important;
        padding-top: 20px !important;
    }
    td[class*="mobile-block"] {
        display: block !important;
    }
    td[class*="mobile-align"] {
        text-align: left !important;
    }
}
</style>
