<div id="serendipityCommentFormC" class="serendipityCommentForm">
    <div id="serendipity_replyform_0"></div>
    <a id="serendipity_CommentForm"></a>
    <div class="Form">
        <div class="FormTop"></div>

        <form id="commentform" action="{$commentform_action}#feedback" method="post">
        <input type="hidden" name="serendipity[entry_id]" value="{$commentform_id}" />

        <p><label for="author"><small>{$CONST.NAME}</small>
           <input type="text" id="author" name="serendipity[name]" value="{$commentform_name}" class="TextField" style="width: 400px;" />
            </label></p>

        <p><label for="email"><small>{$CONST.EMAIL}</small>
           <input type="text" id="email" name="serendipity[email]" value="{$commentform_email}" class="TextField" style="width: 400px;" />
           </label></p>

        <p><label for="url"><small>{$CONST.HOMEPAGE}</small>
           <input type="text" id="url" name="serendipity[url]" value="{$commentform_url}" class="TextField" style="width: 400px;" />
           </label></p>

        <p><label for="serendipity_replyTo"><small>{$CONST.IN_REPLY_TO}</small>
           {$commentform_replyTo}
           </label></p>
           
        <p><label for="comment"><small>{$CONST.COMMENT}</small>
           <textarea rows="10" cols="10" id="comment" name="serendipity[comment]" class="TextArea" style="width: 400px;">{$commentform_data}</textarea>
           <br />{serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}
           </label></p>

{if $is_commentform_showToolbar}
        <p class="checkbox"><input id="checkbox_remember" type="checkbox" name="serendipity[remember]" {$commentform_remember} /><label for="checkbox_remember">{$CONST.REMEMBER_INFO}</label></p>
    {if $is_allowSubscriptions}
        <p class="checkbox"><input id="checkbox_subscribe" type="checkbox" name="serendipity[subscribe]" {$commentform_subscribe} /><label for="checkbox_subscribe">{$CONST.SUBSCRIBE_TO_THIS_ENTRY}</label></p>
    {/if}
{/if}

{if $is_moderate_comments}
        <p class="serendipity_msg_important">{$CONST.COMMENTS_WILL_BE_MODERATED}</p>
{/if}
        <p><input type="submit" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" />
           <input type="submit" id="serendipity_preview" name="serendipity[preview]" value="{$CONST.PREVIEW}" /></p>
        </form>
    </div>
</div>
