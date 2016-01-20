<div id="serendipityCommentFormC" class="form">
    <div id="serendipity_replyform_0"></div>
    <a id="serendipity_CommentForm"></a>
    <form id="commentform" action="{$commentform_action}#feedback" method="post">
    <div>
        <input type="hidden" name="serendipity[entry_id]" value="{$commentform_id}" />
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
        <div class="input">{$CONST.IN_REPLY_TO}</div>
        {$commentform_replyTo}
        <div class="input">{$CONST.COMMENT}</div>
        <textarea rows="10" cols="100%" id="comment" name="serendipity[comment]" tabindex="4">{$commentform_data}</textarea>
    </div>

    <div class="clear"></div>

    {serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}

{if $is_commentform_showToolbar}
    <div>
        <input id="checkbox_remember" type="checkbox" name="serendipity[remember]" {$commentform_remember} /><label for="checkbox_remember">{$CONST.REMEMBER_INFO}</label>
    {if $is_allowSubscriptions}
        <br />
        <input id="checkbox_subscribe" type="checkbox" name="serendipity[subscribe]" {$commentform_subscribe} /><label for="checkbox_subscribe">{$CONST.SUBSCRIBE_TO_THIS_ENTRY}</label>
    {/if}
    </div>
{/if}

{if $is_moderate_comments}
    <p class="serendipity_msg_important">{$CONST.COMMENTS_WILL_BE_MODERATED}</p>
{/if}

    <div class="submit">
        <input type="submit" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" /> <input type="submit" id="serendipity_preview" name="serendipity[preview]" value="{$CONST.PREVIEW}" />
    </div>
    </form>
</div>
