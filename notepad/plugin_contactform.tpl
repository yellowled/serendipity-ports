<div id="respond">
<div class="post">
<h4>{$plugin_contactform_pagetitle}</h4>
            
<div>{$plugin_contactform_preface}</div>

{if $is_contactform_sent}
<p class="serendipity_center serendipity_msg_notice">{$plugin_contactform_sent}</p>
{else}
    {if $is_contactform_error}
    <p class="serendipity_center serendipity_msg_important">{$plugin_contactform_error}</p>

    <!-- Needed for Captchas -->
    {foreach from=$comments_messagestack item="message"}
    <p class="serendipity_center serendipity_msg_important">{$message}</p>
    {/foreach}
    {/if}

    <!-- This whole commentform style, including field names is needed for Captchas. -->
    <!-- The spamblock plugin relies on the field names [name], [email], [url], [comment]! -->
</div>
<div class="form">
    <a id="serendipity_CommentForm"></a>
    <form id="commentform" action="{$commentform_action}#feedback" method="post">
    <div>
        <input type="hidden" name="serendipity[subpage]" value="{$commentform_sname}" />
        <input type="hidden" name="serendipity[commentform]" value="true" />
    </div>

    <div class="inputs">
        <div class="input">{$CONST.NAME}</div>
        <input type="text" id="author" name="serendipity[name]" value="{$commentform_name}" size="22" tabindex="1" />
        <div class="input">{$CONST.EMAIL}</div>
        <input type="text" id="email" name="serendipity[email]" value="{$commentform_email}" size="22" tabindex="2" />
        <div class="input">{$CONST.HOMEPAGE}</div>
        <input type="text" id="url" name="serendipity[url]" value="{$commentform_url}" size="22" tabindex="3" />
    </div>

    <div class="message">
        <div class="input">{$CONST.COMMENT}</div>
        <textarea rows="10" cols="100%" id="comment" name="serendipity[comment]" tabindex="4">{$commentform_data}</textarea>
    </div>

    <div class="clear"></div>

    <!-- This is where the spamblock/Captcha plugin is called -->
    {serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}

    <div class="submit">
        <input type="submit" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" />
    </div>
    </form>
</div>
{/if}
</div>