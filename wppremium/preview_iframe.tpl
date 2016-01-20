    <head>
        <title>{$CONST.SERENDIPITY_ADMIN_SUITE}</title>
        <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
        <meta name="Powered-By" content="Serendipity v.{$head_version}" />
        <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
    {if $template_option.wppcolset == 'black'}
        <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="style-black.css"}" />
    {elseif $template_option.wppcolset == 'brown'}
        <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="style-brown.css"}" />
    {elseif $template_option.wppcolset == 'red'}
        <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="style-red.css"}" />
    {else}
        <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="style-red.css"}" />
    {/if}
        <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="s9y.css"}" />
        <script type="text/javascript" src="{$serendipityHTTPPath}templates/{$template}/taber.js"></script>
        <script type="text/javascript" src="{$serendipityHTTPPath}templates/{$template}/hover.js"></script>
        <script type="text/javascript">
           window.onload = function() {ldelim}
             parent.document.getElementById('serendipity_iframe').style.height = document.getElementById('content').offsetHeight
                                                                               + parseInt(document.getElementById('content').style.marginTop)
                                                                               + parseInt(document.getElementById('content').style.marginBottom)
                                                                               + 'px';
             parent.document.getElementById('serendipity_iframe').scrolling    = 'no';
             parent.document.getElementById('serendipity_iframe').style.border = 0;
           {rdelim}
        </script>
    </head>

    <body style="padding: 0px; margin: 0px;">
        <div id="container" style="padding: 0px; margin: 5px auto 5px auto; width: 98%;">
            <div id="content" style="padding: 5px; margin: 0px;">
            {$preview}
            </div>
        </div>
    </body>
