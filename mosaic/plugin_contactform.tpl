<div id="contact" class="post wide">
    <h2 class="title">{$plugin_contactform_pagetitle}</h2>
            
    <div class="entry">
    <div id="contactpreface">{$plugin_contactform_preface}</div>

{if $is_contactform_sent}
    <div class="serendipity_center serendipity_msg_notice">{$plugin_contactform_sent}</div>
{else}
    {if $is_contactform_error}
    <div class="serendipity_center serendipity_msg_important">{$plugin_contactform_error}</div>

     <!-- Needed for Captchas -->
    {foreach from=$comments_messagestack item="message"}
    <div class="serendipity_center serendipity_msg_important">{$message}</div>
    {/foreach}
    {/if}

    <div class="serendipityCommentForm">
        <a id="serendipity_CommentForm"></a>
        <form id="serendipity_comment" action="{$commentform_action}#feedback" method="post">
        <div>
            <input type="hidden" name="serendipity[subpage]" value="{$commentform_sname}" />
            <input type="hidden" name="serendipity[commentform]" value="true" />
        </div>

            <p><input type="text" id="author" name="serendipity[name]" value="{$commentform_name}" size="22" tabindex="1" />
               <label for="author"><small>{$CONST.NAME}</small></label></p>
            <p><input type="text" id="email" name="serendipity[email]" value="{$commentform_email}" size="22" tabindex="2" />
               <label for"email"><small>{$CONST.EMAIL}</small></label></p>
            <p><input type="text" id="url" name="serendipity[url]" value="{$commentform_url}" size="22" tabindex="3" />
               <label for="url"><small>{$CONST.HOMEPAGE}</small></label></p>

            <p><textarea rows="10" cols="100%" id="comment" name="serendipity[comment]" tabindex="4">{$commentform_data}</textarea>
               <br />
               <!-- This is where the spamblock/Captcha plugin is called -->
               {serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}</p>

            <p><input type="submit" id="submit" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" tabindex="5" /></p>
        </form>
    </div>
    </div><!-- /.entry -->
{/if}
    <div class="bgbottom" style="height: 0;"></div>
</div><!-- /#contact -->