<h1 class="btmspace">{$plugin_contactform_pagetitle}</a></h1>

<div class="cfpreface">{$plugin_contactform_preface}</div>

{if $is_contactform_sent}
<p class="serendipity_center serendipity_msg_notice">{$plugin_contactform_sent}</p>
{else}
    {if $is_contactform_error}
    <p class="serendipity_center serendipity_msg_important">{$plugin_contactform_error}</p>

    <!-- Needed for Captchas -->
    {foreach from=$comments_messagestack item="message"}
    <div class="serendipity_center serendipity_msg_important">{$message}</div>
    {/foreach}
    {/if}

    <!-- This whole commentform style, including field names is needed for Captchas. -->
    <!-- The spamblock plugin relies on the field names [name], [email], [url], [comment]! -->

<div class="serendipityCommentForm">
    <a id="serendipity_CommentForm"></a>

    <form id="serendipity_comment" action="{$commentform_action}#feedback" method="post">
    <div>
        <input type="hidden" name="serendipity[subpage]" value="{$commentform_sname}" />
        <input type="hidden" name="serendipity[commentform]" value="true" />
    </div>

    <p><input type="text" id="serendipity_commentform_name" name="serendipity[name]" value="{$commentform_name}" size="28" tabindex="1" class="textarea" />
       <label for="serendipity_commentform_name">{$CONST.NAME}</label></p>

    <p><input type="text" id="serendipity_commentform_email" name="serendipity[email]" value="{$commentform_email}" size="28" tabindex="2" class="textarea" />
       <label for="serendipity_commentform_email">{$CONST.EMAIL}</label></p>

    <p><input type="text" id="serendipity_commentform_url" name="serendipity[url]" value="{$commentform_url}" size="28" tabindex="3" class="textarea" />
       <label for="serendipity_commentform_url">{$CONST.HOMEPAGE}</label></p>

    <p><label for="serendipity_commentform_comment">{$plugin_contactform_message}</label><br />
       <textarea rows="10" cols="60" id="serendipity_commentform_comment" name="serendipity[comment]" tabindex="4" class="textarea">{$commentform_data}</textarea>
       <br /><!-- This is where the spamblock/Captcha plugin is called -->
       {serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}</p>

    <p><input type="submit" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" tabindex="5" class="Cbutton" /></p>
    </form>
</div>
{/if}
