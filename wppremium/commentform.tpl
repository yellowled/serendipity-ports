<div id="serendipityCommentFormC" class="serendipityCommentForm">
    <div id="serendipity_replyform_0"></div>
    <a id="serendipity_CommentForm"></a>

    <form id="commentform" action="{$commentform_action}#feedback" method="post">
        <input type="hidden" name="serendipity[entry_id]" value="{$commentform_id}" />
        <p><input type="text" id="serendipity_commentform_name" name="serendipity[name]" value="{$commentform_name}" size="28" tabindex="1" class="textarea" />
           <label for="serendipity_commentform_name">{$CONST.NAME}</label></p>
        <p><input type="text" id="serendipity_commentform_email" name="serendipity[email]" value="{$commentform_email}" size="28" tabindex="2" class="textarea" />
           <label for="serendipity_commentform_email">{$CONST.EMAIL}</label></p>
        <p><input type="text" id="serendipity_commentform_url" name="serendipity[url]" value="{$commentform_url}" size="28" tabindex="3" class="textarea" />
           <label for="serendipity_commentform_url">{$CONST.HOMEPAGE}</label></p>
        <p>{$commentform_replyTo}
           <label for="serendipity_replyTo">{$CONST.IN_REPLY_TO}</label></p>
        <p><label for="serendipity_commentform_comment">{$CONST.COMMENT}</label><br />
           <textarea rows="10" cols="60" id="serendipity_commentform_comment" name="serendipity[comment]" tabindex="4" class="textarea">{$commentform_data}</textarea>
           <br />
           {serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}
        </p>

{if $is_commentform_showToolbar}
        <p><input id="checkbox_remember" type="checkbox" name="serendipity[remember]" {$commentform_remember} /><label for="checkbox_remember">{$CONST.REMEMBER_INFO}</label></p>
    {if $is_allowSubscriptions}
        <p><input id="checkbox_subscribe" type="checkbox" name="serendipity[subscribe]" {$commentform_subscribe} /><label for="checkbox_subscribe">{$CONST.SUBSCRIBE_TO_THIS_ENTRY}</label></p>
    {/if}
{/if}

{if $is_moderate_comments}
        <p class="serendipity_msg_important">{$CONST.COMMENTS_WILL_BE_MODERATED}</p>
{/if}
        <p><input type="submit" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" tabindex="5" class="Cbutton"/></p>
        <p><input type="submit" id="serendipity_preview" name="serendipity[preview]" value="{$CONST.PREVIEW}" tabindex="6" class="Cbutton" /></p>
    </form>
</div>
