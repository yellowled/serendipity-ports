    <head>
        <title>{$CONST.SERENDIPITY_ADMIN_SUITE}</title>
        <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
        <meta name="Powered-By" content="Serendipity v.{$head_version}" />
        <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" media="screen" />
        <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="s9y.css"}" media="screen" />
<!--[if IE 6]>
<style type="text/css">
.comment-form {ldelim}margin-bottom: -3px; {rdelim}
</style>
<![endif]-->

        <script type="text/javascript">
           window.onload = function() {ldelim}
             parent.document.getElementById('serendipity_iframe').style.height = document.getElementById('wrapper').offsetHeight
                                                                               + parseInt(document.getElementById('wrapper').style.marginTop)
                                                                               + parseInt(document.getElementById('wrapper').style.marginBottom)
                                                                               + 'px';
             parent.document.getElementById('serendipity_iframe').scrolling    = 'no';
             parent.document.getElementById('serendipity_iframe').style.border = 0;
           {rdelim}
        </script>
    </head>

    <body style="padding: 0px; margin: 0px;">
    <div id="container" style="padding: 0px; margin: 5px auto 5px auto; width: 98%;">
        <div id="wrapper" style="padding: 5px; margin: 0px;">
            <div id="pageWrapper">
                <div id="content">
                {$preview}
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    </body>
