{assign var="orreply" value=$CONST.OR_REPLY}
{assign var="orsubmit" value=$CONST.OR_SUBMIT}
<div id="serendipityCommentFormC" class="serendipityCommentForm">
    <div id="serendipity_replyform_0"></div>
    <a id="serendipity_CommentForm"></a>
    <form id="commentform" action="{$commentform_action}#feedback" method="post">
        <div>
            <input type="hidden" name="serendipity[entry_id]" value="{$commentform_id}" />
        </div>
        <div class="left-sidebar">
            <h3>{$orreply}</h3>

            <p><input type="text" id="serendipity_commentform_name" name="serendipity[name]" value="{$commentform_name}" size="22" class="field" tabindex="1" />
               <label for="serendipity_commentform_name"><small>{$CONST.NAME}</small></label></p>
            <p><input type="text" id="serendipity_commentform_email" name="serendipity[email]" value="{$commentform_email}" size="22" class="field" tabindex="2" />
               <label for="serendipity_commentform_email"><small>{$CONST.EMAIL}</small></label></p>
            <p><input type="text" id="serendipity_commentform_url" name="serendipity[url]" value="{$commentform_url}" size="22" class="field" tabindex="3" />
               <label for="serendipity_commentform_url"><small>{$CONST.HOMEPAGE}</small></label></p>
          {if $is_commentform_showToolbar}
            <p><input id="checkbox_remember" type="checkbox" name="serendipity[remember]" {$commentform_remember} class="field" /> <label for="checkbox_remember"><small>{$CONST.REMEMBER_INFO}</small></label></p>
          {/if}
            <p><input type="submit" name="serendipity[submit]" value="{$orsubmit}" tabindex="5" /></p>
            <p><input type="submit" id="serendipity_preview" name="serendipity[preview]" value="{$CONST.PREVIEW}" tabindex="6" /></p>
        </div>
        <div class="form-content comment-form">
            <textarea rows="5" cols="56" id="serendipity_commentform_comment" name="serendipity[comment]" tabindex="4">{$commentform_data}</textarea>
            <p><label for="serendipity_replyTo">{$CONST.IN_REPLY_TO}</label>
               {$commentform_replyTo}</p>
        {if $is_commentform_showToolbar}
          {if $is_allowSubscriptions}
            <input id="checkbox_subscribe" type="checkbox" name="serendipity[subscribe]" {$commentform_subscribe} /><label for="checkbox_subscribe">{$CONST.SUBSCRIBE_TO_THIS_ENTRY}</label>
          {/if}
        {/if}
        {if $is_moderate_comments}
        <p class="serendipity_msg_important">{$CONST.COMMENTS_WILL_BE_MODERATED}</p>
        {/if}
            {serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}
        </div>
        <div class="clear"></div>
    </form>
</div>
