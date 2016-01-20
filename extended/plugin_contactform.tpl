<h2 class="serendipity_commentsTitle firsttitle">{$plugin_contactform_pagetitle}</h2>
            
<div id="contactformpreface">{$plugin_contactform_preface}</div>

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
    <dl>
       <dt class="serendipity_commentsLabel">
           <label for="serendipity_commentform_name">{$CONST.NAME}</label>
       </dt>
       <dd class="serendipity_commentsValue">
           <input type="text" id="serendipity_commentform_name" name="serendipity[name]" value="{$commentform_name}" size="40" />
       </dd>
       <dt class="serendipity_commentsLabel">
           <label for="serendipity_commentform_email">{$CONST.EMAIL}</label>
       </dt>
       <dd class="serendipity_commentsValue">
           <input type="text" id="serendipity_commentform_email" name="serendipity[email]" value="{$commentform_email}" size="40" />
       </dd>
       <dt class="serendipity_commentsLabel">
           <label for="serendipity_commentform_url">{$CONST.HOMEPAGE}</label>
       </dt>
       <dd class="serendipity_commentsValue"><input type="text" id="serendipity_commentform_url" name="serendipity[url]" value="{$commentform_url}" size="40" />
       </dd>
       <dt class="serendipity_commentsLabel">
           <label for="serendipity_commentform_comment">{$plugin_contactform_message}</label>
       </dt>
       <dd class="serendipity_commentsValue">
           <textarea rows="10" cols="40" id="serendipity_commentform_comment" name="serendipity[comment]">{$commentform_data}</textarea><br />{serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}
       </dd>
       <dt>&#160;</dt>
       <dd>
           <input type="submit" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" />
       </dd>
    </dl>
    </form>
</div>
{/if}
