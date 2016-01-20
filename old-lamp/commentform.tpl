<div id="serendipityCommentFormC" class="serendipityCommentForm">
    <div id="serendipity_replyform_0"></div>
    <a id="serendipity_CommentForm"></a>
    <form id="commentform" action="{$commentform_action}#feedback" method="post">
        <input type="hidden" name="serendipity[entry_id]" value="{$commentform_id}" />
        <p><input type="text" id="author" name="serendipity[name]" value="{$commentform_name}" size="22" tabindex="1" />
           <label for="author"><small>{$CONST.NAME}</small></label></p>
        <p><input type="text" id="email" name="serendipity[email]" value="{$commentform_email}" size="22" tabindex="2" />
           <label for="email"><small>{$CONST.EMAIL}</small></label></p>
        <p><input type="text" id="url" name="serendipity[url]" value="{$commentform_url}" size="22" tabindex="3" />
           <label for="url"><small>{$CONST.HOMEPAGE}</small></label></p>
        <p>{$commentform_replyTo}
           <label for="serendipity_replyTo"><small>{$CONST.IN_REPLY_TO}</small></label></p>
        <p><textarea rows="10" cols="50" id="comment" name="serendipity[comment]" tabindex="4">{$commentform_data}</textarea><br />{serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}</p>

{if $is_commentform_showToolbar}
        <p><input id="checkbox_remember" type="checkbox" name="serendipity[remember]" {$commentform_remember} /><label for="checkbox_remember"><small>{$CONST.REMEMBER_INFO}</small></label>
    {if $is_allowSubscriptions}
           <br /><input id="checkbox_subscribe" type="checkbox" name="serendipity[subscribe]" {$commentform_subscribe} /><label for="checkbox_subscribe"><small>{$CONST.SUBSCRIBE_TO_THIS_ENTRY}</small></label>
    {/if}
        </p>
{/if}

{if $is_moderate_comments}
        <p class="serendipity_msg_important">{$CONST.COMMENTS_WILL_BE_MODERATED}</p>
{/if}
        <p><input type="submit" id="submit" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" /> <input type="submit" id="serendipity_preview" name="serendipity[preview]" value="{$CONST.PREVIEW}" /></p>
    </form>
</div>
